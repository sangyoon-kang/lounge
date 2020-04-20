package com.tagosolution.service.impl;


import org.springframework.stereotype.Service;

import com.tagoplus.model.common.SearchVO;
import com.tagosolution.service.model.BaseCMomeyVO;


/**
 * Point Service
 * @author G.Tenger
 *
 */
@Service("configPointService")
public class ConfigPointServiceImpl extends BaseServiceImpl {


	/**
	 * Point Delete
	 * @param search
	 * @throws Exception
	 */
	public void deletePoint(SearchVO search) throws Exception {
		// SOON...
	}
	
	/**
	 * Point Merge
	 * @param vo
	 * @throws Exception
	 */
	public void mergePoint(BaseCMomeyVO vo) throws Exception {
		super.getDAO().insert("baseCMomey.merge", vo);
	}
	
	
}
