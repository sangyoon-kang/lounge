package com.tagosolution.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tagosolution.service.model.CommContentsVO;
import com.tagosolution.service.model.GroupVO;
import com.tagosolution.service.model.search.PageSearchVO;
import com.tagosolution.service.model.search.CommContentsSearchVO;


/**
 * 페이지관리 서비스
 * @author G.Tenger
 *
 */
@Service("commContentService")
public class CommContentsServiceImpl extends BaseServiceImpl {
	
	/**
	 * Policy List
	 * @param search
	 * @param bm
	 * @return
	 * @throws Exception
	 */
	public List<CommContentsVO> getList(CommContentsSearchVO search) throws Exception {
		List<CommContentsVO>list = (List<CommContentsVO>) super.getDAO().selectBySearch("policies.selectlastversion", search);
		return list;
	}
	
	/**
	 * Policy Detail
	 * @param search
	 * @param bm
	 * @return
	 * @throws Exception
	 */
	public List<CommContentsVO> getSiblings (CommContentsVO vo) throws Exception {
		
		List<CommContentsVO> sameName = (List<CommContentsVO>) super.getDAO().selectList("policies.selectSameName", vo);
		return sameName;
	}

	/**
	 * Policy Delete
	 * @param search
	 * @throws Exception
	 */
	public void deleteCommContent(CommContentsSearchVO search) throws Exception {
		super.getDAO().delete("policies.deleteByKey", search.getIdx());
	}
	
	/**
	 * Policy Merge
	 * @param vo
	 * @throws Exception
	 */
	public void insertCommContent(CommContentsSearchVO search, CommContentsVO vo) throws Exception {
		Integer isChanged = super.getDAO().getCountBySearch("policies.checkIsChanged", search);
		if(isChanged == 0){
			super.getDAO().update("policies.updateVersion", vo);
	 		vo.setiDx(null);
	 	}
	 	super.getDAO().insert("policies.merge", vo);
	}
	
	
}
