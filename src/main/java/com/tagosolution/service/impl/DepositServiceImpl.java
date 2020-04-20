package com.tagosolution.service.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tagosolution.service.model.CommonMdlVO;
import com.tagosolution.service.model.MoneyVO;


/**
 * fx deposit and withdraw
 * @author sky
 *
 */
@Service("depService")
public class DepositServiceImpl extends BaseServiceImpl {
	
	private static final Logger logger =  LoggerFactory.getLogger(DepositServiceImpl.class);
	
	/**
	 * Save Deposit Or Withdraw
	 * @param vo
	 * @throws Exception
	 */
	public void saveMoney(MoneyVO vo) throws Exception {
		super.getDAO().insert("money.merge", vo);
	}

	public void insertDeposit(MoneyVO vo) throws Exception {
		super.getDAO().insert("money.insertDeposit", vo);
	}

	public void insertWithdraw(MoneyVO vo) {
		super.getDAO().insert("money.insertWithdraw", vo);
	}
	public void updateBigdb(MoneyVO vo) {
		super.getDAO().update("money.updateDepositBigdb", vo);
	}
	
	public void insertDepositRequest(CommonMdlVO vo) throws Exception {
		super.getDAO().insert("money.insertDepositRequest", vo);
	}
}
