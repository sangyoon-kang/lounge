package com.tagosolution.controller.front;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.PrivateKey;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.google.api.client.json.Json;
import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.model.common.StringPair;
import com.tagoplus.service.ConfigBean;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.GoogleAPIAuth;
import com.tagoplus.util.RSAUtil;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.Util;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.LoginServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.impl.SiteApiServiceImpl;
import com.tagosolution.service.impl.SiteServiceImpl;
import com.tagosolution.service.ipin.Ipin;
import com.tagosolution.service.ipin.IpinImpl;
import com.tagosolution.service.ipin.IpinMember;
import com.tagosolution.service.model.BankVO;
import com.tagosolution.service.model.CommContentsVO;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.MemberCompanyVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.MemberLineVO;
import com.tagosolution.service.model.MemberSettingVO;
import com.tagosolution.service.model.NaverVO;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.AdminLoginSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.util.ListUtil;

/**
 * The type Login controller.
 */
@Controller
public class LoginController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private String _RSA_KEY_ATTR = "_RSA_PK_FRONT";

	@Autowired
	GeneralDAOImpl _gDao;

	@Autowired
	@Qualifier("configBean")
	private ConfigBean configBean;

	@Resource
	MemberServiceImpl _memberService;

	@Resource
	LoginServiceImpl _loginService;

	@Resource
	IpinImpl _ipinService;

	@Resource
	private SiteServiceImpl _siteService;

	@Resource
	private SiteApiServiceImpl _siteServiceApi;


	/**
	 * Login string.
	 *
	 * @param search  the search
	 * @param result  the result
	 * @param model   the model
	 * @param request the request
	 * @return the string
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/login")
	public String login(SearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		super.setPageSubTitle("로그인", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		try {
			RSAUtil rsa = new RSAUtil();
			rsa.generateRSA(request, model, _RSA_KEY_ATTR);
			MemberSettingVO set = (MemberSettingVO) _gDao.selectOne("memberSetting.selectBySns",  super.getSiteSession().getSiteSeq());
			model.addAttribute("set", set);
		}
		catch (Exception e) {
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}

		model.addAttribute("search", search);
		return "/front/member/login";
	}


	/**
	 * 로그인 처리
	 * 	- RSA 암호화 처리
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/request_secure_login")
	public String requestSecureLogin(AdminLoginSearchVO search, BindingResult result, Model model, HttpServletRequest request) {

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		try {
			PrivateKey privateKey = (PrivateKey)request.getSession().getAttribute(_RSA_KEY_ATTR);
			request.getSession().removeAttribute(_RSA_KEY_ATTR);
			RSAUtil rsa = new RSAUtil();

			String userId = rsa.decryptRsa(privateKey, search.getSecureId());
			String userPassword = rsa.decryptRsa(privateKey, search.getSecurePwd());

			boolean hasAccount =  false;
			MemberInfoVO memVo= (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", userId);
			if (memVo != null) {
				if (memVo.getUserPwd().equals(Encrypt.SHA256Hash(userPassword))) {
					hasAccount = true;
				}
			}

			if (hasAccount) {
				super.getSession().setAttribute(super.getConfig().getSessionNameForUser(), memVo);
				_loginService.insertLoginUserCounter(memVo);

				if(!StringUtil.isEmpty(memVo.getBirthDt())) {
					if (search.getRedirectURL() != null && !search.getRedirectURL().isEmpty()) {
						String returnUrl = search.getRedirectURL().replaceAll("&amp;", "&");
						return "redirect:" + returnUrl;
					}
					return "redirect:" + super.getConfig().getFrontMain();
				}else{
					AlertModel am = new AlertModel();
					am.setMessage("고객님은 계좌실명인증이 필요합니다.\\n회원정보 변경페이지로 이동합니다.\\n\\n계좌실명인증 완료 후 거래를 진행 해주시기 바랍니다.");
					am.setScript("location.href = '"+ "/request_modify.do?id="+memVo.getUserId() +"&pageType=bank';");

					model.addAttribute("alert", am);
					return super.getConfig().getViewAlert();
				}
			}
			else {
				AlertModel am = new AlertModel();
				am.setMessage("아이디나 비밀번호가 올바르지 않습니다.");
				if(search.getRedirectURL() != null && !search.getRedirectURL().isEmpty()){
					am.setScript("location.href = '"+ request.getHeader("referer") +"';");
				}else{
					am.setScript(("$.Nav('go', '"+super.getConfig().getFrontLoginURL()+"', null);"));
				}

				model.addAttribute("alert", am);
				return super.getConfig().getViewAlert();

			}

		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
	}

	@RequestMapping(value = "/request_sns_login/{sns_type}")
	public String requestSnsApiLogin(MemberSearchVO search, @PathVariable("sns_type") String sns_type, BindingResult result, Model model, HttpServletRequest request, HttpServletResponse response) {

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		try {
			MemberInfoVO mem = new MemberInfoVO();
			String accessToken = request.getParameter("access_token");
			switch(sns_type){
				case "fb" :
					mem = _memberService.getFbProfileInfo(accessToken);
					break;
				case "google" :
					mem = GoogleAPIAuth.getGoogleProfileInfo(accessToken);
					break;
				case "kakao" :
					mem = _memberService.getKakaoProfileInfo(accessToken);
					break;
				case "naver" :
					mem = _memberService.getNaverProfileInfo(accessToken);
					break;
				default:
					break;

			}
			boolean snsFirstLogin = false;
			MemberInfoVO memVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", mem.getUserId());
			if (memVo == null) {
				mem.setSnsYn(true);
				mem.setPassword("");
				mem.setSnsType(sns_type);
				snsFirstLogin = true;
				_memberService.insertMemberInfo(search, mem);
			}else{
				memVo.setSnsYn(true);
				memVo.setSnsType(sns_type);
			}
			//MemberSettingVO Memsett = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByUrls", super.getSiteSession().getSiteSeq());
			super.getSession().setAttribute(super.getConfig().getSessionNameForUser(), (memVo != null) ? memVo : mem);
			return "redirect:" + (snsFirstLogin ? "/request_modify.do" : super.getConfig().getFrontMain());
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
	}

	/**
	 * 로그아웃
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpServletRequest request) throws Exception {
		MemberSettingVO Memsett = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByUrls", super.getSiteSession().getSiteSeq());
		String LogoutURL = (Memsett.getMemLogoutUrl() == null || (Memsett.getMemLogoutUrl() != null && Memsett.getMemLogoutUrl().isEmpty())) ? super.getConfig().getFrontMain() : Memsett.getMemLogoutUrl();
		super.getSession().invalidate();
		return "redirect:" + LogoutURL;
	}

	@RequestMapping(value="/join")
	public String getAgreePage(MemberSearchVO search,HttpServletRequest request, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		String[] list = ListUtil.listContentsType().keySet().toArray(new String[ListUtil.listContentsType().size()]);
		search.setListContentsType(list);
		List<CommContentsVO> term = (List<CommContentsVO>) _gDao.selectList("policies.selectMemberRule", search);
		String recomm_code = request.getParameter("recomm_code") == null ? "":request.getParameter("recomm_code");
		recomm_code = URLEncoder.encode(recomm_code ,"utf-8");
		List<StringPair> emaildomains = configBean.getEmails();
		// 개발테스트.. 유효성검사 패스
		recomm_code = URLDecoder.decode(URLDecoder.decode(recomm_code ,"utf-8"), "utf-8");

		// 추천인 검색용 리스트
		List<Map> recommendList = (List<Map>) _gDao.selectList("memberInfo.selectRecommendList", null);

		//TODO 개발계 구성시에는 아래 주석 블록처리 필요
		// 유효성 안맞는게 있으면 step1으로 리다이렉트
		Ipin checkplus = new Ipin();
		checkplus = _ipinService.getDatas2();
		model.addAttribute("checkplus", checkplus);

		MemberInfoVO memVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByIdTrim", recomm_code.replaceAll("(\r\n|\r|\n|\n\r|\\p{Z}|\\t)", ""));
		if(memVo != null)
		model.addAttribute("recommUserId", memVo.getNickname());
		else
		model.addAttribute("recommUserId", "");

		List<FixedCodeVO> bankList =(List<FixedCodeVO>)_gDao.selectList("fixedCode.selectByBank", null);
		logger.debug("회원정보 입력 세팅");
		model.addAttribute("bankList", bankList);
		model.addAttribute("emaildomains", emaildomains);
		model.addAttribute("search", search);
		model.addAttribute("recomm_code", recomm_code);
		model.addAttribute("term", term);
		model.addAttribute("recommendList", recommendList);

		return "/front/member/register";
	}

	private MemberSearchVO getAgreePagePrivate(String enc_data) throws Exception {
		MemberSearchVO search = new MemberSearchVO();
		Ipin ipin1 = _ipinService.getDatas2();
		// 아이핀 회원정보 가져옴
		IpinMember ipinMember = _ipinService.getDataMemberCheckPlus(enc_data, ipin1);

		// 정보가있다면?
		if(ipinMember.getiRtn()>=0){

			search.setUserName(ipinMember.getsName());
			search.setPhone(ipinMember.getsMobileNo());

			// 미성년자 체크로직 추가  tyrus-k added
			String birthDate  = ipinMember.getsBirthDate();

			//String birthDate  = "20200429";

			if(getAge(birthDate.substring(0,4) , birthDate.substring(4,6) , birthDate.substring(6,8)) >= 19){
				search.setAdult(true);
			}else{
				search.setAdult(false);
			}

			search.setBirthDate(ipinMember.getsBirthDate().substring(2));
			search.setGender(ipinMember.getsGenderCode());

			String retVal = ipinMember.getsName() + ":" + ipinMember.getsMobileNo();
			logger.error("USERINFO ::: " + retVal);
		}
		logger.debug("회원정보 입력 세팅");
		return search;
	}
	
	@RequestMapping(value="/join_proc.do")
	public String memberProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();

		try {
			//String ipinDi = _ipinService.getIpinDiCheckplus(search.getIpinEncdata());
			int myAccountCount =  (Integer) _gDao.selectOne("memberInfo.selectByPhone", search.getPhone());
			am.setMessage("처리 되었습니다.");
			if(myAccountCount == 0)
				_memberService.insertMemberInfo( search, vo);
			else
				am.setMessage("이미 등록되어 있습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생하였습니다. \\n" + e.getMessage());
			am.setScript("$.Nav('go', '/');");
		}

		//수정시
		am.setScript("$.Nav('go', '/login');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * Nice Checkplus Return Callback
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ipin/checkPlusProc")
	public String checkPlusProc(HttpServletRequest request, ModelMap model) throws Exception {
		logger.debug("--------------- /ipin/checkPlusProc ---------------");
		 		
		Ipin ipin = new Ipin();
		ipin.setsResponseData(StringUtil.requestReplace(request.getParameter("EncodeData"), "encodeData"));
		ipin.setsReservedParam1(StringUtil.requestReplace(request.getParameter("param_r1"), ""));
		ipin.setsReservedParam2(StringUtil.requestReplace(request.getParameter("param_r2"), ""));
		ipin.setsReservedParam3(StringUtil.requestReplace(request.getParameter("param_r3"), ""));

		String ipinDi = _ipinService.getIpinDiCheckplus(ipin.getsResponseData());
		//String duplicationId = cetFrontMemberService.userIdByIpinDi(ipinDi);
		MemberSearchVO search = getAgreePagePrivate(ipin.getsResponseData());
		Integer myAccountCount =  (Integer) _gDao.selectOne("memberInfo.selectByPhone", search.getPhone());
		model.addAttribute("myAccountCount", myAccountCount);
				 
	    if (ipin.getsResponseData() != null && !"".equals(ipin.getsResponseData()) && myAccountCount>0){
	    	model.addAttribute("resultFlag", "dupl");
	    	logger.debug("dupl");
	    }else if (ipin.getsResponseData() != null && !"".equals(ipin.getsResponseData())){
	    	model.addAttribute("resultFlag", "true");
	    	logger.debug("true");
	    }else{
	    	model.addAttribute("resultFlag", "false");
	    	logger.debug("false");
	    }
	    search.setIpinEncdata(ipin.getsResponseData());
	    search.setCertType("checkplus");
	    model.addAttribute("search",search);	   
		return "/front/member/ipinProcess";
	}
	

	/**
	 * 마이페이지 - 비밀번호 수정 ui
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/pwd_change")
	public String pwdChange (MemberSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		String token = (request.getParameter("id") != null) ? request.getParameter("id"): "";		
		try{
			AlertModel am = new AlertModel();
			if(!isValidToken(token, search)){
				am.setMessage("Expired token");
				am.setScript("$.Nav('go', '"+super.getConfig().getFrontLoginURL()+"');");
				model.addAttribute("alert", am);
				return super.getConfig().getViewAlert();
			}
		} catch(Exception e){
			logger.debug(e.getMessage(), e);
		}
		model.addAttribute("search", search);
		return "/front/mypage/pwd_change";
	}
	
	private Boolean isValidToken(String token, MemberSearchVO search) throws Exception {
		try{
			Algorithm algorithm = Algorithm.HMAC256(Util.SECRET_TOKEN);
		    JWTVerifier verifier = JWT.require(algorithm)
		            .build();
		    DecodedJWT jwt = verifier.verify(token);
	         String userId = jwt.getClaim("userId").asString();
	         MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", userId);
	         if(vo == null)
	        	 return false;
	         else 
	        	 search.setId(vo.getUserId());
		}catch(JWTVerificationException exception){
			logger.debug(exception.getMessage(), exception);
			return false;
		}
		return true;
	}
	
	/**
	 * 마이페이지 - 비밀번호 수정 - 처린
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/pwd_change_proc.do")
	public String pwdChangeProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
				
		try {
			
			MemberInfoVO mVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());
			
			if (mVo.getUserPwd().equals(Encrypt.SHA256Hash(search.getBeforePwd()))) {
				vo.setUserPwd(Encrypt.SHA256Hash(vo.getPassword()));
				vo.setMemberSeq(mVo.getMemberSeq());
				_memberService.updateUserPwd(search, vo);
				am.setMessage("처리 되었습니다.");
			} else {
				am.setMessage("기존 비밀번호가 틀렸습니다.");
			}
			
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}

		am.setScript("$.Nav('go', './login');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 로그인 페이지
	 * 	- RSA 암호화 처리
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/auth")
	public String authModify(SearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		super.setPageSubTitle("로그인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			RSAUtil rsa = new RSAUtil();
			rsa.generateRSA(request, model, _RSA_KEY_ATTR);
		}
		catch (Exception e) {
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		
		model.addAttribute("search", search);
		return "/front/mypage/auth_modify";
	}
	
	/**
	 * 로그인 처리
	 * 	- RSA 암호화 처리
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/request_modify.do")
	public String requestLoginModify(AdminLoginSearchVO search, BindingResult result, Model model, HttpServletRequest request) {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		try {			
			boolean hasAccount =  false;
			MemberInfoVO memVo= (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", super.getUserSession().getUserId());
			if (memVo != null) {
				String userPassword = search.getSecurePwd();
				if (userPassword != null && memVo.getUserPwd().equals(Encrypt.SHA256Hash(userPassword))) {
					hasAccount = true;
				}else
					hasAccount = super.getUserSession().getSnsYn();
			}
			
			if (hasAccount || search.getPageType().equals("bank")) {
				
				//MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());
				Byte bt = 1;
				MemberSettingVO configVO = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", (super.getSiteSession() != null ) ? super.getSiteSession().getSiteSeq() : bt);

				List<FixedCodeVO> bankList =(List<FixedCodeVO>)_gDao.selectList("fixedCode.selectByBank", null);
				List<StringPair> emaildomains = configBean.getEmails();
				model.addAttribute("emaildomains", emaildomains);
				model.addAttribute("vo", memVo);
		 		model.addAttribute("configVO", configVO);
				model.addAttribute("search", search);
				model.addAttribute("bankList", bankList);
				return "/front/mypage/modify_member";
			}
			else {
				return "/front/mypage/auth_modify";
				
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "/front/mypage/auth_modify";
		}
	}

	public int getAge(String birthYear, String birthMonth, String birthDay)
	{
		Calendar current = Calendar.getInstance();
		int currentYear  = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH) + 1;
		int currentDay   = current.get(Calendar.DAY_OF_MONTH);

		int age = currentYear - Integer.parseInt(birthYear);
		// 생일 안 지난 경우 -1
		if (Integer.parseInt(birthMonth) * 100 + Integer.parseInt(birthDay) > currentMonth * 100 + currentDay)
			age--;

		return age;
	}
	
	
}
