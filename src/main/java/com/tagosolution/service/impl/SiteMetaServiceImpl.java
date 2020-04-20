package com.tagosolution.service.impl;

import org.springframework.stereotype.Service;

import com.tagosolution.service.model.SiteMetaVO;


/**
 * 
 * @author Munkhtulga
 *
 */
@Service("siteMetaService")
public class SiteMetaServiceImpl  extends BaseServiceImpl {

	
	/**
	 * get one record at ts_site_meta by requestURI
	 * @param pathInfo
	 * @return
	 * @throws Exception
	 */
	public SiteMetaVO getDetail(String pathInfo) throws Exception {
		SiteMetaVO vo = (SiteMetaVO) super.getDAO().selectOne("siteMeta.selectOneByURI", pathInfo);
		if (vo == null)
			vo = (SiteMetaVO) super.getDAO().selectOne("siteMeta.selectOneByURI", super.getConfig().getFrontMain());
		
		return vo;
	}
	
	/**
	 * 사이트의 메타태그	
	 * 	- insert
	 * @param vo
	 * @return
	 */
	public void insertSiteMeta(SiteMetaVO vo) throws Exception {	
		
		super.getDAO().insert("siteMeta.insert", vo);		
		
	}


	
	
	/**
	 * 사이트의 메타태그	
	 * 	- delete
	 * @param vo
	 * @return
	 */
	public void deleteSiteMeta(SiteMetaVO vo) throws Exception {	
		
		super.getDAO().delete("siteMeta.delete", vo);		
		
	}
}
