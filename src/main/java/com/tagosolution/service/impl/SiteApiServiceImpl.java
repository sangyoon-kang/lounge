package com.tagosolution.service.impl;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.Encrypt;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.SiteVO;


/**
 * API Service
 * @author G.Tenger
 *
 */
@Service("siteApiService")
public class SiteApiServiceImpl extends BaseServiceImpl {


	/**
	 * API Delete
	 * @param search
	 * @throws Exception
	 */
	public void deleteApi(SearchVO search) throws Exception {
		// SOON...
	}
	
	/**
	 * API Merge
	 * @param vo
	 * @throws Exception
	 */
	public void mergeApi(SiteApiVO vo) throws Exception {
		super.getDAO().insert("siteApi.merge", vo);
	}
	
	public SiteApiVO getCurrentSiteInfoApi(Byte siteSeq) throws Exception {
		SiteApiVO siteVO = (SiteApiVO) getDAO().selectOne("siteApi.selectByKey", siteSeq);
		return siteVO; 
	}
	
	
}
