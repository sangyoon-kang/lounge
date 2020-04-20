package com.tagosolution.controller.admin;

import java.security.PrivateKey;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.RSAUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.MenuAuthoSettingVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.AdminLoginSearchVO;
import com.tagosolution.service.model.search.MenuSettingSearchVO;

@Controller(value = "adminLoginController")
@RequestMapping(value = "#{globals['url.admin.root']}/login")
public class LoginController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	private String _RSA_KEY_ATTR = "_RSA_PK_ADMIN";
	
	@Autowired
	UploadFile _upload;
	
	@Autowired
	GeneralDAOImpl _gDao;

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
	@RequestMapping(value = "/mgr_login")
	public String adminLogin(SiteVO site, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		super.setPageSubTitle("관리자 로그인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			RSAUtil rsa = new RSAUtil();
			rsa.generateRSA(request, model, _RSA_KEY_ATTR);
			
			if (request.getLocalAddr().equals("127.0.0.1")) {
				model.addAttribute("testId", "tago");
				model.addAttribute("testPwd", "1234");
			}
		}
		catch (Exception e) {
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getAdminLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		
		return super.getConfig().getAdminRoot() + "/login/mgr_login";
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
		//super.setPageSubTitle("관리자 로그인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			PrivateKey privateKey = (PrivateKey)request.getSession().getAttribute(_RSA_KEY_ATTR);
			request.getSession().removeAttribute(_RSA_KEY_ATTR);
			RSAUtil rsa = new RSAUtil();
			
			String userId = rsa.decryptRsa(privateKey, search.getSecureId());
			String userPassword = rsa.decryptRsa(privateKey, search.getSecurePwd());
			
			AdminVO adminVO = null;
			//1. superuser 확인
			boolean hasAccount =  false;
			if (super.getSiteSession().getSuId().equals(userId) && super.getSiteSession().getSuPwd().equals(Encrypt.SHA256Hash(userPassword))) {
				hasAccount = true;
				adminVO = new AdminVO();
				adminVO.setAdminId(userId);
				adminVO.setAdminName(userId);
				adminVO.setNickname("슈퍼유저");
				adminVO.setUserType("superuser");
				adminVO.setAuthGroupIdx(1);
			}
			
			//2. 디자이너 확인
			if (!hasAccount) {
				if (super.getSiteSession().getDsId().equals(userId) && super.getSiteSession().getDsPwd().equals(Encrypt.SHA256Hash(userPassword))) {
					hasAccount = true;
					adminVO = new AdminVO();
					adminVO.setAdminId(userId);
					adminVO.setAdminName(userId);
					adminVO.setNickname("디자이너");
					adminVO.setUserType("designer");
					adminVO.setAuthGroupIdx(1);
				}
			}
			 
			//3. 관리자 확인
			if (!hasAccount) {
				adminVO = (AdminVO)_gDao.selectByKey("admin.selectByKey", userId);
				if (adminVO != null) {
					if (adminVO.getAdminPwd().equals(Encrypt.SHA256Hash(userPassword))) {
						hasAccount = true;
						//adminVO.setUserType("admin");
						//adminVO.setGradeLevel((short) 1);
						MenuSettingSearchVO menusearch = new MenuSettingSearchVO();
						Short[] level = new Short[]{1,2,3};
						menusearch.setMenuLevels(level);
						menusearch.setAdminId(adminVO.getAdminId());
						List<MenuAuthoSettingVO> menuAuth = (List<MenuAuthoSettingVO>) _gDao.selectList("menuAutho.selectForAdminPermission", menusearch);
						adminVO.setAdminAuth(menuAuth);
					}
				}
			}
			
			if (hasAccount) {				
				super.getSession().setAttribute(super.getConfig().getSessionNameForAdmin(), adminVO);
				return "redirect:" + super.getConfig().getAdminMainURL();
			}
			else {
				AlertModel am = new AlertModel("아이디나 비밀번호가 올바르지 않습니다.", super.getConfig().getAdminLoginURL(), null);
				model.addAttribute("alert", am);
				return super.getConfig().getViewAlert();
				
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getAdminLoginURL(), null);
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
		super.getSession().invalidate();		
		return "redirect:" + super.getConfig().getAdminLoginURL();
	}
}
