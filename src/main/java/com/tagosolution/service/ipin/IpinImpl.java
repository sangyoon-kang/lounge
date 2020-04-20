package com.tagosolution.service.ipin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.tagoplus.util.StringUtil;
import com.tagosolution.service.impl.BaseServiceImpl;
import com.tagosolution.service.model.GoodsVO;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.util.ListUtil;

import NiceID.Check.CPClient;

@Service("ipinService")
public class IpinImpl extends BaseServiceImpl {
	
	//안심본인인증 (휴대폰, 공인인증서)
	public Ipin getDatas2() throws SQLException{
		Ipin ipin = new Ipin();
		//ipin.setsSiteCode("G9585");
		//ipin.setsSitePw("JBPJCMTHH8ZH");
		//ipin.setsSiteCode("BQ871");
		//ipin.setsSitePw("XCzZfyZdXQ2q");

		String returnPath = super.getConfig().getHost();
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		
		SiteVO scvo = (SiteVO) getDAO().selectOne("site.selectByServerName", request.getServerName());  
		SiteApiVO ccvo = (SiteApiVO) getDAO().selectOne("siteApi.selectByKey", scvo.getSiteSeq());
		ipin.setsSiteCode(ccvo.getIpinID());
		ipin.setsSitePw(ccvo.getIpinPW());
		
		ipin.setsReturnURL(returnPath + "/ipin/checkPlusProc");

		CPClient niceCheck = new CPClient();
		
		String sRequestNumber = niceCheck.getRequestNO(ipin.getsSiteCode());
		
		ipin.setsCPRequest(sRequestNumber);
		
		String sRtnMsg = "";
		String popgubun = "N";	//Y : 취소버튼 있음 / N : 취소버튼 없음
		String customize = "";	//없으면 기본 웹페이지 / Mobile : 모바일페이지
		String sAuthType = "M";	//없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서

		request.getSession().setAttribute("CPREQUEST", ipin.getsCPRequest());
		
		//session.put("CPREQUEST", ipin.getsCPRequest());

		String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
							"8:SITECODE" + ipin.getsSiteCode().getBytes().length + ":" + ipin.getsSiteCode() +
							"9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
							"7:RTN_URL" + ipin.getsReturnURL().getBytes().length + ":" + ipin.getsReturnURL() +
							"7:ERR_URL" + ipin.getsReturnURL().getBytes().length + ":" + ipin.getsReturnURL() +
							"11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
							"9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;

		int iReturn = niceCheck.fnEncode(ipin.getsSiteCode(), ipin.getsSitePw(), sPlainData);
		
		ipin.setiRtn(iReturn);

		if(iReturn == 0){
			ipin.setsEncDataCheckPlus(niceCheck.getCipherData());
			sRtnMsg = "정상 처리되었습니다.";
		}else if(iReturn == -1){
			sRtnMsg = "암호화 시스템 에러입니다.";
		}else if(iReturn == -2){
			sRtnMsg = "암호화 처리오류입니다.";
		}else if(iReturn == -3){
			sRtnMsg = "암호화 데이터 오류입니다.";
		}else if(iReturn == -9){
			sRtnMsg = "입력 데이터 오류입니다.";
		}else{
			sRtnMsg = "알수 없는 에러 입니다. iReturn : " + iReturn;
		}
		
		ipin.setsRtnMsg(sRtnMsg);
		
		return ipin;
	}
	
	public IpinMember getDataMemberCheckPlus(String encdata, Ipin ipin) throws SQLException{
		IpinMember ipinMember = new IpinMember();
		
		String sRtnMsg = "";
		String sSiteCode = ipin.getsSiteCode();
		String sSitePw   = ipin.getsSitePw();
	    String sResponseData = StringUtil.requestReplace(encdata, "encodeData");
		
		CPClient niceCheck = new CPClient();
		
		int iRtn = niceCheck.fnDecode(sSiteCode, sSitePw, sResponseData);

	    if(iRtn == 0){
	        String sPlainData = niceCheck.getPlainData();
	        
	        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
	        
	        ipinMember.setsName((String)mapresult.get("NAME"));
	        ipinMember.setsGenderCode((String)mapresult.get("GENDER"));
	        ipinMember.setsDupInfo((String)mapresult.get("DI"));
	        ipinMember.setsBirthDate((String)mapresult.get("BIRTHDATE"));
	        ipinMember.setsMobileNo((String)mapresult.get("MOBILE_NO"));
	    }else if(iRtn == -1){
	    	sRtnMsg = "복호화 시스템 에러입니다.";
	    }else if(iRtn == -4){
	    	sRtnMsg = "복호화 처리오류입니다.";
	    }else if(iRtn == -5){
	    	sRtnMsg = "복호화 해쉬 오류입니다.";
	    }else if(iRtn == -6){
	    	sRtnMsg = "복호화 데이터 오류입니다.";
	    }else if(iRtn == -9){
	    	sRtnMsg = "입력 데이터 오류입니다.";
	    }else if(iRtn == -12){
	    	sRtnMsg = "사이트 패스워드 오류입니다.";
	    }else{
	    	sRtnMsg = "알수 없는 에러 입니다. iReturn : " + iRtn;
	    }
	    
	    ipinMember.setsRtnMsg(sRtnMsg);
		ipinMember.setiRtn(iRtn);
		
		return ipinMember;
	}
	
	public String getIpinDiCheckplus(String encdata) throws Exception{

		
		String ipinFindId = null;
	    String sResponseData = StringUtil.requestReplace(encdata, "encodeData");
		
		Ipin ipin = new Ipin();
		ipin = getDatas2();
		
		CPClient niceCheck = new CPClient();
		
		String ipin_di = "";
		String sSiteCode = ipin.getsSiteCode();
		String sSitePw = ipin.getsSitePw();
		
		int iReturn = niceCheck.fnDecode(sSiteCode, sSitePw, sResponseData);

		if(iReturn == 0){
			String sPlainData  = niceCheck.getPlainData();
			java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
			
			ipin_di = (String)mapresult.get("DI");
		}
		return ipin_di;
	}
}
