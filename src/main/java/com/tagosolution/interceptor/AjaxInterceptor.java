package com.tagosolution.interceptor;

import java.net.InetAddress;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tagoplus.util.Encrypt;
import com.tagoplus.util.StringUtil;
import com.tagosolution.service.GlobalProperty;
import com.tagosolution.service.model.AdminVO;

public class AjaxInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxInterceptor.class);
	
	public static final String AJAX_AUTHORIZED = "_attr_ajax_authorized";
	@Resource
	private GlobalProperty _globalProperty;
	
	private GlobalProperty getConfig() {
		return this._globalProperty;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		InetAddress inet= InetAddress.getLocalHost();
		//logger.debug(">>>>>>>>>>>> " + inet.getHostAddress() + " : " + request.getRemoteAddr());
		if (request.getRequestURI().indexOf("_bigdb") > -1 && (request.getRemoteAddr().indexOf("222.239.249.139") > -1 || request.getRemoteAddr().indexOf("0:0:0:0:0:0:0:1") > -1 || request.getRemoteAddr().indexOf("112.160.125.253") > -1 || request.getRemoteAddr().indexOf("202.179.2.138") > -1)){
			//response.sendRedirect(rUrl);
			request.setAttribute(AJAX_AUTHORIZED, true);
			return true;
		}
		request.setAttribute(AJAX_AUTHORIZED, false);
		
		if (request.getRemoteAddr().equals("127.0.0.1") || inet.getHostAddress().equals(request.getRemoteAddr())) {
			request.setAttribute(AJAX_AUTHORIZED, true);
		}
		
		if (!(boolean) request.getAttribute(AJAX_AUTHORIZED)) {
			
			String sApiId = StringUtil.getString(request.getHeader("apiId"));
			String sApiKey = StringUtil.getString(request.getHeader("apiKey"));
			
			String sDecrypted = Encrypt.decryptAES(sApiKey);
			// logger.debug("sDecrypted : {}, {}", sApiKey, sDecrypted);
			
			if (!StringUtil.isEmpty(sApiId) && sApiId.equals(sDecrypted)) {
				request.setAttribute(AJAX_AUTHORIZED, true);
			}
		}
		
		if (request.getRequestURI().indexOf("mgr") == 1){
			try {
				String rUrl = request.getRequestURI();
				
				AdminVO admin = (AdminVO) request.getSession().getAttribute(getConfig().getSessionNameForAdmin());
				
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
		
		return super.preHandle(request, response, handler);
	}
}
