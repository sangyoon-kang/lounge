package com.tagosolution.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tagosolution.service.model.CashVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PaymentSearchVO;

@Service("cashService")
public class CashServiceImpl extends BaseServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(CashServiceImpl.class);
	
	/**
	 * cash total
	 */
	public CashVO selectCashTotal(PaymentSearchVO search) throws Exception {
		return (CashVO) super.getDAO().selectOne("cash.selectCashTotal", search);
	}
	
	/**
	 * cash list
	 * @param search
	 * @return
	 * @throws Exception
	 */
	public List<CashVO> selectCashList(PaymentSearchVO search) throws Exception {
		return (List<CashVO>) super.getDAO().selectBySearch("cash.selectCashList", search);
	}
	
	/**
	 * cash list admin ppt slide 16
	 * @param search
	 * @return
	 * @throws Exception
	 */
	public List<CashVO> selectCash16List(PaymentSearchVO search) throws Exception {
		List<CashVO> list = (List<CashVO>) super.getDAO().selectList("cash.selectCash16List", search);
		for(CashVO vo : list){
			PaymentSearchVO search1 = new PaymentSearchVO();
			search1.setUserId(search.getUserId());
			search1.setStartDate(search.getStartDate());
			search1.setEndDate(search.getEndDate());
			search1.setSellUserId(search.getSellUserId());
			search1.setListUserId(vo.getUserId());
			search1.setGlevel(vo.getGradeLevel());
			Long sCommission = (Long) super.getDAO().selectByKey("cash.selectCash16Sub", search1);
			Long taxCommision = (Long) super.getDAO().selectByKey("cash.selectCash16SubTax", search1);
			vo.setCommission(sCommission);
			vo.setTaxCommission(taxCommision);
		}
		return list;
	}
	
	/**
	 * cash list
	 * @param search
	 * @return
	 * @throws Exception
	 */
	public List<CashVO> selectCash17List(PaymentSearchVO search) throws Exception {
		return (List<CashVO>) super.getDAO().selectList("cash.selecMemCashList", search);
	}
	
	/**
	 * cash total ms_shop
	 */
	public CashVO selectForUser(PaymentSearchVO search) throws Exception {
		return (CashVO) super.getDAO().selectOne("cash.selectByCurDay", search);
	}
	
	/**
	 * list for user
	 * @param search
	 * @return
	 * @throws Exception
	 */
	public List<CashVO> selectUserLine(PaymentSearchVO search) throws Exception {
		//return (List<CashVO>) super.getDAO().selectList("cash.selectListForUser", search);
		MemberInfoVO mo = (MemberInfoVO) super.getDAO().selectOne("memberInfo.selectById", (search.getSellUserId() != null && !search.getSellUserId().isEmpty()) ? search.getSellUserId() : search.getUserId());
		if(mo != null) search.setGlevel(mo.getGradeLevel());
		if(search.getSellUserId() == null || (search.getSellUserId() != null && search.getSellUserId().isEmpty())) search.setSellUserId(search.getUserId());
		List<CashVO> list = (List<CashVO>) super.getDAO().selectList("cash.selectCash16List", search);
		for(CashVO vo : list){
			PaymentSearchVO search1 = new PaymentSearchVO();
			search1.setUserId(search.getUserId());
			search1.setStartDate(search.getStartDate());
			search1.setEndDate(search.getEndDate());
			search1.setSellUserId(search.getSellUserId());
			search1.setListUserId(vo.getUserId());
			search1.setGlevel(vo.getGradeLevel());
			Long sCommission = (Long) super.getDAO().selectByKey("cash.selectCash16Sub", search1);
			Long taxCommision = (Long) super.getDAO().selectByKey("cash.selectCash16SubTax", search1);
			vo.setCommission(sCommission);
			vo.setTaxCommission(taxCommision);
		}
		return list;
	}
	
	/**
	 * ms shop 
	 * @param search
	 * @return
	 * @throws Exception
	 */
	public List<CashVO> selectMemPopList(PaymentSearchVO search) throws Exception {
		return (List<CashVO>) super.getDAO().selectList("cash.selectMemPopList", search);
	}
}
