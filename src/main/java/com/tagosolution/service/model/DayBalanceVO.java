package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.math.BigDecimal;
import java.util.Date;

public class DayBalanceVO implements GeneralModel {
	
	/**
	 * Created By k
	 */
	private static final long serialVersionUID = 1L;
	
    private Long orderSeq;

    private String userId;

    private Long sumCash;

    private Long balance;

    private String stDate;

	public Long getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(Long orderSeq) {
		this.orderSeq = orderSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getSumCash() {
		return sumCash;
	}

	public void setSumCash(Long sumCash) {
		this.sumCash = sumCash;
	}

	public Long getBalance() {
		return balance;
	}

	public void setBalance(Long balance) {
		this.balance = balance;
	}

	public String getStDate() {
		return stDate;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}
}