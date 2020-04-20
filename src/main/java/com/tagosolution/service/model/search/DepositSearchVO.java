package com.tagosolution.service.model.search;

import java.util.List;

import com.tagoplus.model.common.SearchVO;

/**
 * 게시판 관리 검색 모델
 * @author wimy
 *
 */
public class DepositSearchVO extends SearchVO {

	/**
	 * sky line
	 */
	private static final long serialVersionUID = -2695873893100155691L;
	
	private String userId;
	
	private String startDate;
	
	private String endDate;
	
	private String ioType;

	public String getIoType() {
		return ioType;
	}

	public void setIoType(String ioType) {
		this.ioType = ioType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
