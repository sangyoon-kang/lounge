package com.tagosolution.service.impl;

import org.springframework.stereotype.Service;

import com.tagosolution.service.model.GroupVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.search.PageSearchVO;


/**
 * 페이지관리 서비스
 * @author kky
 *
 */
@Service("pageService")
public class PageServiceImpl extends BaseServiceImpl {
	/**
	 * 페이지그룹관리 - 그룹삭제, 그룹에 속한 페이지 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deletePageGroup(PageSearchVO search) throws Exception {
		super.getDAO().delete("group.deleteByKey", search.getGseq());
		super.getDAO().delete("page.deleteByGroup", search.getGseq());
	}
	
	/**
	 * 페이지그룹관리 - 등록,수정
	 * @param vo
	 * @throws Exception
	 */
	public void insertPageGroup(GroupVO vo) throws Exception {
		super.getDAO().insert("group.merge", vo);
	}
	
	/**
	 * 페이지관리 - 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deletePage(PageSearchVO search) throws Exception {
		super.getDAO().delete("page.deleteByKey", search.getPseq());
	}
	
	/**
	 * 페이지관리 - 등록,수정
	 * @param vo
	 * @throws Exception
	 */
	public void insertPage(PageVO vo) throws Exception {
		super.getDAO().insert("page.merge", vo);
	}
	
	
	
}
