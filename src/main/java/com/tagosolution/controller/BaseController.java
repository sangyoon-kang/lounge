package com.tagosolution.controller;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.tagoplus.controller.ParentController;
import com.tagoplus.model.JsonResult;
import com.tagosolution.interceptor.AjaxInterceptor;
import com.tagosolution.service.GlobalProperty;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.SiteVO;

/**
 * 부모 controller : 컨트롤러 상속용 부모 컨트롤러
 * 
 * @author wimy
 *
 */
@Controller
public class BaseController extends ParentController {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	private HttpSession session;
	
	@Resource(name="globalProperty")
	private GlobalProperty configBean; 
	
	@Override
	public GlobalProperty getConfig()
	{
		return this.configBean;
	}
	
	public HttpSession getSession() {
		return this.session;
	}
	
	/**
	 * 관리자 세션 - 관리자 모델로 형변환하여 사용
	 * 			- 관리자 모델이 정의되면 해당 모델 클래스로 변환해서 사용하는 것을 추천
	 * @return
	 */
	@Override
	public AdminVO getAdminSession() {
		return (AdminVO) this.getSession().getAttribute(this.getConfig().getSessionNameForAdmin());
	}
	
	/**
	 * 사용자 세션 - 사용자 모델로 형변환하여 사용
	 * 			- 사용자 모델이 정의되면 해당 모델 클래스로 변환해서 사용하는 것을 추천
	 * @return
	 */
	@Override
	public MemberInfoVO getUserSession() {
		 return (MemberInfoVO) this.getSession().getAttribute(this.getConfig().getSessionNameForUser());
	}
	
	/**
	 * 세션에 저장된 사이트 정보를 가져옵니다.
	 * 	- 사이트 정보 저장 루틴 : AuthencticInterceptor 참조  
	 * @return
	 */
	public SiteVO getSiteSession() {
		return (SiteVO) this.getSession().getAttribute(this.getConfig().getSessionNameForSite());
	}
	public SiteVO getSiteNameU() {
		return (SiteVO) this.getSession().getAttribute(this.getConfig().get_sSiteNameU());
	}
	public SiteVO getSiteNameL() {
		return (SiteVO) this.getSession().getAttribute(this.getConfig().get_sSiteNameL());
	}
	
	/**
	 * REST API 결과 리턴용 객체
	 *  - 인증 방식의 REST_API를 사용할 경우 적용
	 * @param request
	 * @param data
	 * @return
	 */
	public JsonResult getJsonResult(HttpServletRequest request, Object data) {
		JsonResult jr = new JsonResult();
		boolean isAuthorized = request.getAttribute(AjaxInterceptor.AJAX_AUTHORIZED) != null ? (boolean) request.getAttribute(AjaxInterceptor.AJAX_AUTHORIZED) : false;
		
		jr.setSuccess(isAuthorized);
		
		if (!isAuthorized) {
			jr.setCode("-1");
			jr.setMessage("API 사용이 인증되지 않았습니다.");
			jr.setData(null);
		}
		else {
			jr.setData(data);
		}
		
		return jr;
	}
}
