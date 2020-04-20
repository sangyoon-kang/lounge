package com.tagoplus.service;


import javax.servlet.http.HttpServletRequest;

import com.tagoplus.model.GeneralModel;

/**
 * 사이트 정보 인터페이스 : 예제용
 * @author wimy
 *
 */
public interface SiteService {
	
	public GeneralModel getCurrentSiteInfo(HttpServletRequest request) throws Exception;
	

}
