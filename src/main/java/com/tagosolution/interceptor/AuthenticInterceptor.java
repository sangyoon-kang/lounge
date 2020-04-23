package com.tagosolution.interceptor;

import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.gson.Gson;

import java.util.Calendar;

import com.tagoplus.util.Encrypt;
import com.tagoplus.util.StringUtil;
import com.tagosolution.service.GlobalProperty;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.SiteApiServiceImpl;
import com.tagosolution.service.impl.SiteServiceImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.SiteVO;

/**
 * 관리자 - 인터셉터
 *  - 현재 도메인에 대한 사이트 정보 한 건을 세션에 저장
 *  - 세션 내 라이선스 키 확인
 * @author wimy
 *
 */
public class AuthenticInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthenticInterceptor.class);
	
	@Resource
	private GlobalProperty _globalProperty;
	
	private GlobalProperty getConfig() {
		return this._globalProperty;
	}
	
	
	@Resource
	private SiteServiceImpl _siteService;
	
	@Resource
	private SiteApiServiceImpl _siteServiceApi;
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//현재 action url
		//주의 : jsp:include를 사용할 경우 requestURI는 실제 매핑된 jsp가 나옴
		// 사용 : 관리자 gnb, lnb
		if (request.getRequestURI().indexOf(".jsp") < 0) {
			request.setAttribute("reqURI", request.getRequestURI());
			//logger.debug(">>>>>> interceptor's request.getRequestURI() : {}", request.getRequestURI());
		}
		
//		// 사이트 정보 확인 - 사이트 기본 정보 자동 등록 (슈퍼유저 계정 포함)
//		SiteVO site = _siteService.getCurrentSiteInfo(request);
//		if (site.isNew()) {
//			response.sendRedirect(getConfig().getAdminRoot() + "/common/siteInfoCreate");
//			return false;
//		}
		
		//변경 : 등록되지 않은 사이트 정보로 들어올 경우 사용 불가 처리
		SiteVO site = _siteService.getCurrentSiteInfo(request);
		SiteApiVO siteApi = _siteServiceApi.getCurrentSiteInfoApi(site.getSiteSeq());
		
		if (site != null) {
			if (request.getSession().getAttribute(this.getConfig().getSessionNameForSite()) == null)
				request.getSession().setAttribute(this.getConfig().getSessionNameForSite(), site);
		}
		else {
			response.sendRedirect("/cannotUseSite.jsp");
			return false;
		}
		
		if (siteApi != null) {
			if (request.getSession().getAttribute(this.getConfig().getSessionNameForSiteApi()) == null)
				request.getSession().setAttribute(this.getConfig().getSessionNameForSiteApi(), siteApi);
		}
		else {
			response.sendRedirect("/cannotUseSite.jsp");
			return false;
		}
		
		//not인증 14일 이후 관리자 기능 제한
		if (request.getSession().getAttribute(getConfig().getSessionNameForSite()) != null) {
			site = (SiteVO) request.getSession().getAttribute(getConfig().getSessionNameForSite());
			//TODO 관리자 라이센스 체크
//			if (!site.isCertified()) {
//				long interval = StringUtil.compareTwoDate(new Date(), site.getInstallDate());
//				if (interval >= 14) {
//					logger.warn(" 사이트 관리자 이용불가 도메인 : {}, 설치일 : {}", site.getSiteDomain(), site.getInstallDate());
//					response.sendRedirect(getConfig().getAdminRoot() + "/common/cannotUseAdmin");
//					return false;
//				}
//			}
		}
		else {
			response.sendRedirect(getConfig().getAdminRoot() + "/common/error/503?str=" + URLEncoder.encode("사이트정보가 없습니다. 프로그램을 사용할 수 없습니다.", Charset.defaultCharset().displayName()));
			return false;
		}
		
		//TODO : 관리자 접근권한 IP check
		
		try {
			String rUrl = request.getRequestURI();
			
			AdminVO admin = (AdminVO) request.getSession().getAttribute(getConfig().getSessionNameForAdmin());
			if (request.getRequestURI().indexOf("_bigdb") > -1 && (request.getRemoteAddr().indexOf("222.239.249.139") > -1 || request.getRemoteAddr().indexOf("0:0:0:0:0:0:0:1") > -1 || request.getRemoteAddr().indexOf("112.160.125.253") > -1 || request.getRemoteAddr().indexOf("202.179.2.138") > -1)){
				//response.sendRedirect(rUrl);
				return true;
			}
			//관리자 URL이며, 로그인 관련 URL이 아닐 경우
			if (rUrl.indexOf(getConfig().getAdminRoot()) == 0 && rUrl.indexOf("/login/") < 0) {
				if (admin == null) {
					response.sendRedirect(getConfig().getAdminLoginURL());
					return false;
				}
			}
			
			//관리자 로그인 URL이며 세션이 있을 경우 
			if (rUrl.indexOf(getConfig().getAdminLoginURL()) > -1) {
				if (admin != null) {
					response.sendRedirect(getConfig().getAdminMainURL());
					return false;
				}
			}
			
			return true;
		}
		catch (Exception e) {
			// e.printStackTrace();
			logger.error(this.getClass().getName() + " 인터셉터 오류 : {}", e.getMessage(), e);
			throw e;
		}
	}
}
