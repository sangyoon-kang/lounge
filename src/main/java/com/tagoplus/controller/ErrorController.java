package com.tagoplus.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.service.ConfigBean;
import com.tagoplus.util.StringUtil;

/**
 * 공통 에러 컨트롤러
 * @author wimy
 */
@Controller
@RequestMapping("/common/error")
public class ErrorController {
	
	private static final Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
	@Autowired
	@Qualifier("configBean")
	private ConfigBean configBean;
	
	@Autowired
	private ServletContext servletContext;
	
	private ConfigBean getConfig() {
		return this.configBean;
	}
	
	private ServletContext getServletContext() {
		return this.servletContext;
	}
	
	@RequestMapping("/{name}")
	public String throwable(@PathVariable String name, String str, Model model, HttpServletRequest request) {
		
		//if (request.getAttribute("javax.servlet.error.request_uri").toString().contains("/favicon.ico"))
		//	return null;
		
		String sMsgEng = "Error";
		String sMsg = "오류가 발생했습니다.";
		
		
		//액션URL에 확장자가 있을 경우 제거
		String sName = name;
		if (name.indexOf(".") > -1)
			sName = name.replaceAll("\\.[\\w]*", "");
		
		switch (sName) {
			case "throw":
				sMsgEng = "Throwable";
				sMsg = "예외가 발생했습니다.";
				break;
				
			case "400":
				sMsgEng = "Bad Request";
				sMsg = "잘못된 요청입니다.";
				break;
				
			case "403":
				sMsgEng = "Forbidden";
				sMsg = "접근할 수 없는 요청입니다.";
				break;
				
			case "404":
				sMsgEng = "Not Found";
				sMsg = "잘못된 요청입니다.";
				break;
				
			case "405":
				sMsgEng = "Method Not Allowed";
				sMsg = "요청된 메서드는 허용되지 않습니다.";
				break;
				
			case "500":
				sMsgEng = "Internal Server Error";
				sMsg = "프로그램 오류가 있습니다.";
				break;

			case "503":
				sMsgEng = "Service Temporarily Unavailable";
				sMsg = "서버를 일시적으로 사용할 수 없습니다.";
				break;
				
			case "exception":
			default :
				name = "exception";
				sMsgEng = "Exception";
				sMsg = "예외가 발생했습니다.";
				break;
		}
		
		if (!StringUtil.isEmpty(str))
			sMsg = str;
		
		if (request.getAttribute("javax.servlet.error.request_uri") != null && !((String)request.getAttribute("javax.servlet.error.request_uri")).contains("favicon.ico"))
			logger.error("status_code : {}\r\nexception_type : {}\r\nmessage : {},\r\nrequest_uri : {}\r\nexception : {}\r\nservlet_name : {}" 
				, request.getAttribute("javax.servlet.error.status_code")
				, request.getAttribute("javax.servlet.error.exception_type")
				, request.getAttribute("javax.servlet.error.message")
				, request.getAttribute("javax.servlet.error.request_uri")
				, request.getAttribute("javax.servlet.error.exception")
				, request.getAttribute("javax.servlet.error.servlet_name")
			);
		
		model.addAttribute("messageEng", sMsgEng);
		model.addAttribute("message", sMsg);
		return getConfig().getViewError();
	}
	
}
