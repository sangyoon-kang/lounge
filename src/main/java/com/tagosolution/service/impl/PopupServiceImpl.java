package com.tagosolution.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tagoplus.service.PopupService;
import com.tagosolution.service.model.PopupVO;
import com.tagosolution.service.model.search.PopupSearchVO;

/**
 * 팝업관리 서비스
 * @author kky
 *
 */
@Service("popupService")
public class PopupServiceImpl  extends BaseServiceImpl implements PopupService {
	private static final Logger logger = LoggerFactory.getLogger(PopupServiceImpl.class);
	
	/**
	 * 팝업 등록 수정
	 * @param vo
	 * @throws Exception
	 */
	public void insertPopup(PopupVO vo) throws Exception {
		super.getDAO().insert("popup.merge", vo);
	}
	
	/**
	 * 팝업 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deletePopup(PopupSearchVO search) throws Exception {
		super.getDAO().delete("popup.deleteByKey", search.getPseq());
	}
	
}
