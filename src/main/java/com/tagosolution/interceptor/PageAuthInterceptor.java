package com.tagosolution.interceptor;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tagosolution.service.GlobalProperty;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.MenuAuthoSettingVO;

/**
 * 관리자 - 페이지 접근 권한 인터셉터
 * @author wimy
 *
 */
public class PageAuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(PageAuthInterceptor.class);
	
	@Resource
	private GlobalProperty _globalProperty;
	
	private GlobalProperty getConfig() {
		return this._globalProperty;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		try {
			String rUrl = request.getRequestURI();
			String status= (request.getParameter("status") != null) ? request.getParameter("status") : "";
			String params = (request.getQueryString() != null) ? request.getQueryString() : "";
			if (request.getRequestURI().indexOf("_bigdb") > -1 && (request.getRemoteAddr().indexOf("222.239.249.139") > -1 || request.getRemoteAddr().indexOf("0:0:0:0:0:0:0:1") > -1 || request.getRemoteAddr().indexOf("112.160.125.253") > -1 || request.getRemoteAddr().indexOf("202.179.2.138") > -1)){
				//response.sendRedirect(rUrl);
				return true;
			}
			//관리자
			if (rUrl.indexOf(this.getConfig().getAdminRoot()) >= 0) {
				//로그인 여부는 AuthenticInterceptor에 있음
				AdminVO admin = (AdminVO) request.getSession().getAttribute(getConfig().getSessionNameForAdmin());
				
				//TODO : superuser:슈퍼유저, designer:디자이너, admin:일반관리자 페이지 접근 권한 처리
				//일반관리자 계정이고 환경설정 URL일 때 권한 없음
				if (admin.getUserType().toLowerCase().equals("admin") && rUrl.indexOf("/config") >= 0) {
					response.sendRedirect(getConfig().getAdminRoot() + "/common/noAuth");
					return false;
				}
				//Menu Privellege
				
				Pattern pattern = Pattern.compile("(\\w+)=?([^&]+)?");
				Matcher matcher = pattern.matcher(params);
				if (admin.getUserType().toLowerCase().equals("admin") && (!rUrl.equals(this.getConfig().getAdminRoot()) && rUrl.indexOf(this.getConfig().getAdminRoot()+"/index") == -1)){
					Boolean hasPrivilege = false;
					for(MenuAuthoSettingVO menu : admin.getAdminAuth()){
						
						if(!menu.getAuthoList().isEmpty() && rUrl.contains(menu.getAuthoList())){
							hasPrivilege = true;
							break;
						}
						if(!menu.getAuthoView().isEmpty() && rUrl.contains(menu.getAuthoView())){
							while (matcher.find()) {
							    if(matcher.group(2) != null && !matcher.group(2).equalsIgnoreCase("0")){
							    	hasPrivilege = true;
							    	break;
							    }
							}
							Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
						  	for (Map.Entry<String, String> entry : pathVariables.entrySet()) {
						        if(entry.getValue() != null && !entry.getValue().equalsIgnoreCase("0")){
						        	hasPrivilege = true;
						        	break;
						        }
						    }
							if(!menu.getAuthoModify().isEmpty() || !menu.getAuthoWrite().isEmpty())
								hasPrivilege = true;
							break;
						}
						String param = "";
						if(menu.getPrefixPath() != null && (menu.getPrefixPath().split(",").length > 1 && rUrl.contains(menu.getPrefixPath().split(",")[0]) ||  menu.getFolderPath().split("/").length > 1 && rUrl.contains(menu.getFolderPath().split("/")[1]))){
							param = (menu.getPrefixPath() != null && (menu.getPrefixPath().split(",").length > 1 &&  menu.getPrefixPath().split(",")[1] != null) && request.getParameter(""+ menu.getPrefixPath().split(",")[1] +"") != null) ? request.getParameter(""+ menu.getPrefixPath().split(",")[1] +"") : "";
						}
						if(!menu.getAuthoModify().isEmpty() && rUrl.contains(menu.getAuthoModify()) && (!param.isEmpty() && !param.equalsIgnoreCase("0"))){
							hasPrivilege = true;
							break;
						}else if(!menu.getAuthoWrite().isEmpty() && rUrl.contains(menu.getAuthoWrite()) && (param.isEmpty() || param.equalsIgnoreCase("0"))){
							hasPrivilege = true;
							break;
						}else if(!menu.getAuthoDelete().isEmpty() && rUrl.contains(menu.getAuthoDelete()) && (status.equalsIgnoreCase("d"))){
							hasPrivilege = true;
							break;
						}
						if(rUrl.contains("api") || rUrl.contains("ajax") || rUrl.contains("excel") || rUrl.contains("_popup") || rUrl.contains("group") || rUrl.contains("category") || rUrl.contains("getFormInfo") || rUrl.contains("toCategory") || rUrl.contains("comment_stat") || rUrl.contains("send") || rUrl.contains("lot") || rUrl.contains("refresh") || rUrl.contains("detail") || rUrl.contains("pop") || rUrl.contains("_bigdb")){
							hasPrivilege = true;
							break;
						}
					}
					if(!hasPrivilege){
						response.sendRedirect(getConfig().getAdminRoot() + "/common/noAuth");
						return false;
					}
				}
				if(rUrl.equalsIgnoreCase(this.getConfig().getAdminRoot())){
					response.sendRedirect(getConfig().getAdminMainURL());
					return false;
				}
			}
			return true;
		}
		catch(Exception e) {
			logger.error(this.getClass().getName() + " 인터셉터 오류 : {}", e.getMessage(), e);
			throw e;
		}
	}
}
