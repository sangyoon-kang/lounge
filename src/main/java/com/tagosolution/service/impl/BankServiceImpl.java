package com.tagosolution.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tagoplus.model.common.SearchVO;
import com.tagosolution.service.model.BankVO;
import com.tagosolution.service.model.CommContentsVO;
import com.tagosolution.service.model.GroupVO;
import com.tagosolution.service.model.search.PageSearchVO;
import com.tagosolution.service.model.search.PopupSearchVO;
import com.tagosolution.service.model.search.CommContentsSearchVO;


/**
 * 페이지관리 서비스
 * @author G.Tenger
 *
 */
@Service("bankService")
public class BankServiceImpl extends BaseServiceImpl {

	/**
	 * Bank Delete
	 * @param search
	 * @throws Exception
	 */
	public void deleteBank(SearchVO search) throws Exception {
		super.getDAO().delete("bank.deleteByKey", search.getBankSeq());
	}

	/**
	 * Bank Save
	 * @param search
	 * @throws Exception
	 */
	public void insertBank(BankVO vo) throws Exception {
		super.getDAO().insert("bank.merge", vo);	
	}	
}
