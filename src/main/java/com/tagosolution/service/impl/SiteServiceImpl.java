package com.tagosolution.service.impl;

import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.service.SiteService;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.GenType;
import com.tagoplus.util.StringUtil;
import com.tagosolution.interceptor.AuthenticInterceptor;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.SiteMetaVO;
import com.tagosolution.service.model.SiteVO;

/**
 * 사이트 정보 서비스 
 * 		- 인터페이스 내 메서드 두 개 : 예제 참고용
 * @author wimy
 *
 */
@Service("siteService")
public class SiteServiceImpl extends BaseServiceImpl implements SiteService {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteServiceImpl.class);
	
	/**
	 * 현재 사이트 url 기준 사이트 정보 한 건 가져오기
	 * - 현재 사이트 정보가 없을 경우 server 기준으로 한 건 등록
	 * - SiteVO.isNew() == true일 경우 신규 사이트 정보 등록된 상태 => 인터셉터에서 신규 사이트 정보 등록 처리 안내 페이지로 이동
	 */
	@Override
	public SiteVO getCurrentSiteInfo(HttpServletRequest request) throws Exception {
		
		//프론트 URL일 경우 세션에 담긴 정보 그대로 사용
		//TODO : 프론트 개발 후  테스트 필요
		if (request.getSession().getAttribute(super.getConfig().getSessionNameForSite()) != null && request.getContextPath().indexOf(super.getConfig().getAdminRoot()) < 0)
			return (SiteVO) request.getSession().getAttribute(super.getConfig().getSessionNameForSite());
		
		SiteVO siteVO = (SiteVO) getDAO().selectOne("site.selectByServerName", request.getServerName());
		//사이트 정보 한 건 저장 판단
		if (siteVO == null) {
			
//			//String sNewPassword = StringUtil.getRandomValue(GenType.Number, 4);
//			String sNewPassword = "1234";
//			String sSuId = "superuser";
//			
//			SiteVO vo = new SiteVO();
//			//사이트 정보 기본 정보 자동 등록
//			vo.setSiteDomain(request.getServerName());
//			vo.setSiteName("[임시등록]" + vo.getSiteDomain());
//			vo.setSiteCertKey("");
//			vo.setSuId(sSuId);
//			vo.setSuPwd(Encrypt.SHA256Hash(sNewPassword));
//			int iAffectedRows = getDAO().insert("site.insertDefault", (SiteVO)vo);
//			logger.warn(">>>>>>>> A new server registered. : {}, site_seq : {}, affectedRows : {}", request.getServerName(), vo.getSiteSeq(), iAffectedRows);
//			
//			siteVO = new SiteVO();
//			siteVO.setNew(true);
//			siteVO.setSuId(vo.getSuId());
//			siteVO.setSuPwd(sNewPassword);
//			siteVO.setSiteDomain(vo.getSiteDomain());
//			siteVO.setSiteName(vo.getSiteName());
//
//			logger.info(">>>>> Site Information sessioned.");
		}
		else {
			//Short level = 1;
			//if (siteVO.getUseMenusVO().isEmpty())
			//	siteVO.setUseMenusVO((List<MenuSettingVO>) getDAO().selectList("menuSetting.selectByKey", level));
				//siteVO.setUseMenusVO( (List<FixedCodeVO>)getDAO().selectList("fixedCode.selectByArray", siteVO) );
			
			if (siteVO.getSiteCertKey().equals(Encrypt.SHA256HashHex(request.getServerName())))
				siteVO.setCertified(true);
			
			request.getSession().setAttribute(getConfig().getSessionNameForSite(), siteVO);
		}
		
		
		
		return siteVO; 
	}
	
	/**
	 * 사이트 정보 업데이트
	 *  - 업데이트 후 세션 정보 업데이트
	 * @param vo
	 * @param request
	 * @throws Exception
	 */
	public void update(SiteVO vo, HttpServletRequest request) throws Exception {
		vo.setModDate(new Date());
		getDAO().update("site.updateByKeySelective", vo);
		
		//TODO : 세선 업데이트 정상 작동 안함
		SiteVO siteVO = (SiteVO) getDAO().selectOne("site.selectByKey", vo.getSiteSeq());
		//request.getSession().invalidate();
		siteVO.setCertified(true);
		request.getSession().removeAttribute(getConfig().getSessionNameForSite());
		request.getSession().setAttribute(getConfig().getSessionNameForSite(), siteVO);
	}
}
