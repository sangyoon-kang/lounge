package com.tagosolution.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.types.User;
import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.service.MemberService;
import com.tagoplus.util.CookieUtil;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.MailUtil;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.MemberLineVO;
import com.tagosolution.service.model.NaverVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.ipin.IpinImpl;
import com.tagosolution.service.model.BaseCMomeyVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.MailTmplVO;
import com.tagosolution.service.model.MemberCMomeyVO;
import com.tagosolution.service.model.MemberCompanyVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PaymentSearchVO;
import com.tagosolution.service.model.sns.KakaoAccountVO;
import com.tagosolution.service.model.sns.KakaoVO;

@Service("memberService")
public class MemberServiceImpl extends BaseServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	MailUtil _mailUtil;

	@Autowired
	UploadFile _upload;

	@Resource
	IpinImpl _ipinService;

	public boolean login(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// TODO : 샘플
		// 쿠키 처리 예제
		// - 프론트 리디렉션URL 적용 필요

		String sRedirectUrl = null;
		if (!StringUtils.isEmpty(CookieUtil.getCookie(request, super.getConfig().getCookieRedirect())))
			sRedirectUrl = CookieUtil.getCookie(request, super.getConfig().getCookieRedirect());
		CookieUtil.removeCookie(response, super.getConfig().getCookieRedirect(), null);

		return false;
	}

	/**
	 * 회원정보 - 등록, 수정
	 * 
	 * @param search
	 * @param vo
	 * @throws Exception
	 */
	public void insertMemberInfo(MemberSearchVO search, MemberInfoVO vo) throws Exception {
		try {
			// 관리자를 제외한 제일 낮은 등급 부여(높은 숫자(레벨))
			short level = (short) super.getDAO().selectByKey("memberGrade.selectMaxLevel", null);
			short lhigh = (short) super.getDAO().selectByKey("memberGrade.selectMinLevel", null);
			MemberInfoVO head = (MemberInfoVO) super.getDAO().selectByKey("memberInfo.selectByLevel", lhigh);

			// 관리자(level = 1) 가 아닌 등급만 부여
			if (level > 1 && vo.getGradeLevel() == null) {
				vo.setGradeLevel(level);
			}
			// vo.setGradeLevel((short)0);
			MemberInfoVO vo2 = (MemberInfoVO) super.getDAO().selectByKey("memberInfo.selectByKey", search.getMseq());

			if (vo2 != null) {
				if (vo2.getIcon() != null && (vo.getIconfile() != null && vo.getIconfile().getSize() > 0)) {
					File oldIFile = new File(
							super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + vo2.getIcon()));
					if (oldIFile.exists())
						oldIFile.delete();
				}
				if (vo2.getPhoto() != null && (vo.getPhotofile() != null && vo.getPhotofile().getSize() > 0)) {
					File oldPFile = new File(
							super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + vo2.getPhoto()));
					if (oldPFile.exists())
						oldPFile.delete();
				}
			}

			if (vo.getIconfile() != null || vo.getPhotofile() != null || vo.getEtc1File() != null
					|| vo.getEtc2File() != null || vo.getEtc3File() != null || vo.getEtc4File() != null
					|| vo.getEtc5File() != null) {
				List<MultipartFile> files = new ArrayList<MultipartFile>();
				if (vo.getIconfile() != null)
					files.add(vo.getIconfile());
				if (vo.getPhotofile() != null)
					files.add(vo.getPhotofile());
				if (vo.getEtc1File() != null)
					files.add(vo.getEtc1File());
				if (vo.getEtc2File() != null)
					files.add(vo.getEtc2File());
				if (vo.getEtc3File() != null)
					files.add(vo.getEtc3File());
				if (vo.getEtc4File() != null)
					files.add(vo.getEtc4File());
				if (vo.getEtc5File() != null)
					files.add(vo.getEtc5File());

				List<BaseFileVO> bfs = _upload.saveFiles(files, null, getConfig().getUploadPathImage() + "/member");
				// logger.debug("파일 : {}", new Gson().toJson(bfs));
				for (BaseFileVO b : bfs) {
					if (b.getSize() == 0)
						continue;
					if (StringUtil.isEmpty(b.getServerSubPath())) {
						if (vo.getIconfile() != null && vo.getIconfile().getSize() > 0)
							vo.setIcon("/" + b.getPhysicalName());
						if (vo.getPhotofile() != null && vo.getPhotofile().getSize() > 0)
							vo.setPhoto("/" + b.getPhysicalName());
						if (vo.getEtc1File() != null && vo.getEtc1File().getSize() > 0)
							vo.setAdditionalItem1("/" + b.getPhysicalName());
						if (vo.getEtc2File() != null && vo.getEtc2File().getSize() > 0)
							vo.setAdditionalItem2("/" + b.getPhysicalName());
						if (vo.getEtc3File() != null && vo.getEtc3File().getSize() > 0)
							vo.setAdditionalItem3("/" + b.getPhysicalName());
						if (vo.getEtc4File() != null && vo.getEtc4File().getSize() > 0)
							vo.setAdditionalItem4("/" + b.getPhysicalName());
						if (vo.getEtc5File() != null && vo.getEtc5File().getSize() > 0)
							vo.setAdditionalItem5("/" + b.getPhysicalName());
					} else {
						if (vo.getIconfile() != null && vo.getIconfile().getSize() > 0)
							vo.setIcon(b.getServerSubPath() + "/" + b.getPhysicalName());
						if (vo.getPhotofile() != null && vo.getPhotofile().getSize() > 0)
							vo.setPhoto(b.getServerSubPath() + "/" + b.getPhysicalName());
						if (vo.getEtc1File() != null && vo.getEtc1File().getSize() > 0)
							vo.setAdditionalItem1(b.getServerSubPath() + "/" + b.getPhysicalName());
						if (vo.getEtc2File() != null && vo.getEtc2File().getSize() > 0)
							vo.setAdditionalItem2(b.getServerSubPath() + "/" + b.getPhysicalName());
						if (vo.getEtc3File() != null && vo.getEtc3File().getSize() > 0)
							vo.setAdditionalItem3(b.getServerSubPath() + "/" + b.getPhysicalName());
						if (vo.getEtc4File() != null && vo.getEtc4File().getSize() > 0)
							vo.setAdditionalItem4(b.getServerSubPath() + "/" + b.getPhysicalName());
						if (vo.getEtc5File() != null && vo.getEtc5File().getSize() > 0)
							vo.setAdditionalItem5(b.getServerSubPath() + "/" + b.getPhysicalName());
					}
				}
			}
			if((vo.getRecommUserId() == null && vo.getGradeLevel() != lhigh) || (vo.getRecommUserId().isEmpty() && vo.getGradeLevel() != lhigh) ){
				vo.setRecommUserId(head.getUserId());
			}
			if (search.getMseq() == 0 && StringUtil.isEmpty(search.getBeforePwd())) {
				vo.setUserPwd(Encrypt.SHA256Hash(vo.getUserPwd()));
				//MemberCMomeyVO cmomey = new MemberCMomeyVO();

				SiteVO site = (SiteVO) this.getSession().getAttribute(super.getConfig().getSessionNameForSite());

				// 아이핀 회원정보 가져옴
				logger.debug("getIpinDi");
				String ipinDi = "";
				if ("checkplus".equals(search.getCertType())) {
					ipinDi = _ipinService.getIpinDiCheckplus(search.getIpinEncdata());
				}
				logger.debug("ipin_di : " + ipinDi);
				vo.setIpinDi(ipinDi);

				vo.setBirthDt(search.getBirthDate()); // 생년월일 저장

				super.getDAO().insert("memberInfo.merge", vo);

				/*if (site.getPointYn().equals("Y")) {
					BaseCMomeyVO cmoney = (BaseCMomeyVO) super.getDAO().selectByKey("baseCMomey.selectByKey",
							site.getSiteSeq());
					if (cmoney != null) {
						cmomey.setcMoney(cmoney.getJoinCMomey());
						cmomey.setUserId(vo.getUserID());
						cmomey.setSummary("JOIN");
						super.getDAO().insert("memberCmomey.merge", cmomey);
					}
				}*/
			} else {
				vo.setMemberSeq(search.getMseq());

				if (!StringUtil.isEmpty(vo.getUserPwd())) {
					vo.setUserPwd(Encrypt.SHA256Hash(vo.getUserPwd()));
				}
				// super.getDAO().insert("memberInfo.merge", vo);
				super.getDAO().insert("memberInfo.updateByKeySelective", vo);

			}
			if(vo.getGradeLevel() != lhigh){
				super.getDAO().insert("memberLine.deleteByPrimaryKey", vo);
				super.getDAO().insert("memberLine.merge", vo);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			logger.error("IPIN~~~~~~. \\n" + e.getMessage());
		}
	}

	/**
	 * 회원정보 - 삭제
	 * 
	 * @param search
	 * @throws Exception
	 */
	public void deleteMemberInfo(MemberSearchVO search) throws Exception {
		for (int i : search.getChkseq()) {
			super.getDAO().update("memberInfo.updateWithdrawal", i);
			MemberInfoVO vo = (MemberInfoVO) super.getDAO().selectByKey("memberInfo.selectByKey", i);
			super.getDAO().update("memberCompany.updateByKey", vo.getUserId());
		}
	}

	/**
	 * 탈퇴회원 - 삭제
	 * 
	 * @param search
	 * @throws Exception
	 */
	public void deleteWithdrawal(MemberSearchVO search) throws Exception {
		super.getDAO().delete("memberInfo.deleteByKey", search.getMseq());
	}

	/**
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteOwner(MemberInfoVO vo) throws Exception {
		super.getDAO().update("memberInfo.updateByKeyWithdrawal", vo);
		super.getDAO().update("memberCompany.updateByKey", vo.getUserId());

	}

	/**
	 * 이메일설정 - 등록, 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertMail(MailTmplVO vo) throws Exception {
		super.getDAO().insert("memberMail.merge", vo);
	}

	/**
	 * 이메일설정 - 삭제
	 */
	public void deleteMail(MemberSearchVO search) throws Exception {
		super.getDAO().delete("memberMail.deleteByKey", search.getEmseq());
	}

	/**
	 * 약관 - 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	// public void insertTerms(TermsVO vo) throws Exception {
	// super.getDAO().insert("terms.merge", vo);
	// }

	/**
	 * 회원관리 - 이메일발송
	 * 
	 * @param search
	 * @throws Exception
	 */
	public void insertSendMail(MemberSearchVO search) throws Exception {
		try {
			String[] arr = new String[search.getChkseq().size()];
			for (int i = 0; i < search.getChkseq().size(); i++) {
				String sEmail = (String) super.getDAO().selectByKey("memberInfo.selectForEmail",
						search.getChkseq().get(i));
				arr[i] = sEmail;
			}
			String sSubject = search.getSubject();
			String sBody = search.getBody();
			this._mailUtil.send(arr, sSubject, sBody);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	public void sendTestMailer(MemberSearchVO search) throws Exception {
		try {
			String[] arr = search.getEmails().split(",");
			String sSubject = search.getSubject();
			String sBody = search.getBody();
			this._mailUtil.send(arr, sSubject, sBody);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	public void updateByDeposit(Integer moneySeq) throws Exception {
		super.getDAO().update("memberInfo.updateByDeposit", moneySeq);
	}

	// tyrus-k added
	public void updateByDepositUndo(Integer moneySeq) throws Exception {
		super.getDAO().update("memberInfo.updateByDepositUndo", moneySeq);
	}
	
	public void updateByWithdraw(Integer moneySeq) throws Exception {
		super.getDAO().update("memberInfo.updateByWithdraw", moneySeq);
	}
	
	public void updateByDepositCancel(Integer moneySeq) throws Exception {
		super.getDAO().update("memberInfo.updateByDepositCancel", moneySeq);
	}

	// tyrus-k added
	public void updateByDepositCancelUndo(Integer moneySeq) throws Exception {
		super.getDAO().update("memberInfo.updateByDepositCancelUndo", moneySeq);
	}

	public void updateUserPwd(MemberSearchVO search, MemberInfoVO vo) throws Exception {
		super.getDAO().insert("memberInfo.updateByKeySelective", vo);
	}
	
	public int selectBelongUsers(PaymentSearchVO search) throws Exception {
		return (int) super.getDAO().selectOne("memberInfo.selectBelongUsers", search);
	}
	
	public MemberInfoVO getFbProfileInfo(String accesstoken) {
		MemberInfoVO obj_User_Profile= new MemberInfoVO();
		try {
			FacebookClient facebookClient = new DefaultFacebookClient(accesstoken, Version.VERSION_2_6);
			User user = facebookClient.fetchObject("me", User.class, Parameter.with("fields", "id,name,email,birthday,hometown"));
			obj_User_Profile.setUserName(user.getName());
			obj_User_Profile.setEmail(user.getEmail());
			obj_User_Profile.setUserId(user.getId());
			obj_User_Profile.setBirthDt(user.getBirthday());
			obj_User_Profile.setAddr1(user.getHometownName());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return obj_User_Profile;
	}
	
	public MemberInfoVO getNaverProfileInfo(String accessToken){
		MemberInfoVO obj_User_Profile= new MemberInfoVO();
        String header = "Bearer " + accessToken; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JsonObject json = new JsonParser().parse(response.toString()).getAsJsonObject();
            NaverVO vo = new Gson().fromJson(json.getAsJsonObject("response"), NaverVO.class);
            obj_User_Profile.setUserId(vo.getId());
            obj_User_Profile.setEmail(vo.getEmail());
            obj_User_Profile.setUserName(vo.getName());
            obj_User_Profile.setBirthDt(vo.getBirthday());
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return obj_User_Profile;
	}
	
	
	public MemberInfoVO getKakaoProfileInfo(String accessToken){
		MemberInfoVO obj_User_Profile= new MemberInfoVO();
        String header = "Bearer " + accessToken; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://kapi.kakao.com/v2/user/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JsonObject json = new JsonParser().parse(response.toString()).getAsJsonObject();
            KakaoVO vo = new Gson().fromJson(json, KakaoVO.class);
            KakaoAccountVO acc = vo.getKakao_account();
            obj_User_Profile.setUserId(vo.getId());
            obj_User_Profile.setEmail(acc.getEmail());
            if(acc.getProfile() != null)
            	obj_User_Profile.setUserName(acc.getProfile().get("nickname"));
            if(acc.getBirthday() != null)
            	obj_User_Profile.setBirthDt(acc.getBirthday());
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return obj_User_Profile;
	}
	
}
