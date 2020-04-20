package com.tagoplus.util;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 쿠키 유틸리티
 * @author wimy
 *
 */
public class CookieUtil {
	
	/**
	 * 쿠키 추가 
	 * 	주의 : url encoding 포함
	 * @param res
	 * @param name
	 * @param value : 
	 * @param path
	 * @throws Exception
	 */
	public static void addCookie(HttpServletResponse res, String name, String value, String path) throws Exception {
		addCookie(res, name, value, -1, path, null);
	}
	
	public static void addCookie(HttpServletResponse res, String name, String value, String path, String domain) throws Exception {
		addCookie(res, name, value, -1, path, domain);
	}
	
	public static void addCookie(HttpServletResponse res, String name, String value, int expireSec) throws Exception {
		addCookie(res, name, value, expireSec, null, null);
	}
	
	/**
	 * 
	 * @param res response
	 * @param name 쿠키 이름
	 * @param value 값
	 * @param expireSec 단위 - 초
	 * @param path null - /
	 * @param domain null 도메인 들어가지 않음
	 * @throws Exception
	 */
	public static void addCookie(HttpServletResponse res, String name, String value, int expireSec, String path, String domain) throws Exception {
		Cookie ck = new Cookie(name, URLEncoder.encode(value, Charset.defaultCharset().displayName()));
		if (expireSec != -1)
			ck.setMaxAge(expireSec);
		
		if (path == null)
			ck.setPath("/");
		else if (path != null)
			ck.setPath(path);
		
		if (domain != null)
			ck.setDomain(domain);
		
		res.addCookie(ck);
	}
	
	/**
	 * 쿠키 가져오기
	 *  - 주의 : url decoding 포함됨
	 * @param req
	 * @param name
	 * @return
	 * @throws Exception 
	 */
	public static String getCookie(HttpServletRequest req, String name) throws Exception {
		String value = null;
		
		Cookie[] cooks = req.getCookies();
		if (cooks != null) {
			for (int i = 0; i < cooks.length; i++)
				if (cooks[i].getName().equals(name)) {
					value = URLDecoder.decode(cooks[i].getValue(), Charset.defaultCharset().displayName());
					break;
				}
		}
		
		return value;
	}
	
	public static void removeCookie(HttpServletResponse res, String name, String path) {
		Cookie ck = new Cookie(name, null);
		ck.setMaxAge(0);
		
		if (path == null)
			ck.setPath("/");
		else if (path != null)
			ck.setPath(path);
		
		res.addCookie(ck);
	}
	
}
