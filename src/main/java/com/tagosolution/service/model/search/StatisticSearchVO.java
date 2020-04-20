package com.tagosolution.service.model.search;

import java.util.List;

import com.tagoplus.model.common.SearchVO;

/**
 * 게시판 관리 검색 모델
 * @author wimy
 *
 */
public class StatisticSearchVO extends SearchVO {

	/**
	 * Ozl
	 */
	private static final long serialVersionUID = -3659873893100155691L;
	
	private String userId;
	
	private String goodsDate;
	
	private String sYear;
	
	private String sMonth;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGoodsDate() {
		return goodsDate;
	}

	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}

	public String getsYear() {
		return sYear;
	}

	public void setsYear(String sYear) {
		this.sYear = sYear;
	}

	public String getsMonth() {
		return sMonth;
	}

	public void setsMonth(String sMonth) {
		this.sMonth = sMonth;
	}

}
