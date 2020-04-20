package com.tagosolution.service.model.search;


import java.math.BigDecimal;

import com.tagoplus.model.common.SearchVO;

/**
 * 게시판 관리 검색 모델
 * @author wimy
 *
 */
public class PaymentSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2695873893100155691L;
	
	private String userId;

	private String userName;
	
	private Long orderSeq;
	
	private String bsType;
	
	private String searchType;
	
	private Integer runTime;
	
	private String goodsDate;
	
	private String goodsTime;
	
	private Integer buyLot1;

    private Integer buyLot2;

    private Integer buyLot10;

    private Integer buyLot20;

    private Integer buyLot40;

    private Integer sellLot1;

    private Integer sellLot2;

    private Integer sellLot10;

    private Integer sellLot20;
    
    private Integer sellLot40;

    private BigDecimal totalLot;
    
    private long currentTime;
    
    private long nextTime;
    
    private String currentHourMinute;
    
    private Integer searchRunTime;
    
    private String searchDate;
    
    private String searchTime;
    
    private String lotType;
    
    private String profitType;
    
    private String lossType;
    
    private String goodsResult;
    
    private short glevel;
    
    private String nickName;
    
    private String email;
    
    private String body;
    
    private String sellUserId;
    
    private String listUserId;

	public String getListUserId() {
		return listUserId;
	}

	public void setListUserId(String listUserId) {
		this.listUserId = listUserId;
	}

	public String getSellUserId() {
		return sellUserId;
	}

	public void setSellUserId(String sellUserId) {
		this.sellUserId = sellUserId;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public short getGlevel() {
		return glevel;
	}

	public void setGlevel(short glevel) {
		this.glevel = glevel;
	}

	public String getProfitType() {
		return profitType;
	}

	public void setProfitType(String profitType) {
		this.profitType = profitType;
	}

	public String getLossType() {
		return lossType;
	}

	public void setLossType(String lossType) {
		this.lossType = lossType;
	}

	public String getGoodsResult() {
		return goodsResult;
	}

	public void setGoodsResult(String goodsResult) {
		this.goodsResult = goodsResult;
	}

	public String getLotType() {
		return lotType;
	}

	public void setLotType(String lotType) {
		this.lotType = lotType;
	}
	
	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public String getSearchTime() {
		return searchTime;
	}

	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}
	
	public void setSearchRunTime(Integer searchRunTime) {
		this.searchRunTime = searchRunTime;
	}

	public Integer getSearchRunTime() {
        return searchRunTime;
    }

	public String getCurrentHourMinute() {
		return currentHourMinute;
	}

	public void setCurrentHourMinute(String currentHourMinute) {
		this.currentHourMinute = currentHourMinute;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(Long orderSeq) {
		this.orderSeq = orderSeq;
	}

	public String getBsType() {
		return bsType;
	}

	public void setBsType(String bsType) {
		this.bsType = bsType;
	}

	public BigDecimal getTotalLot() {
		return totalLot;
	}

	public void setTotalLot(BigDecimal totalLot) {
		this.totalLot = totalLot;
	}

	public long getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(long currentTime) {
		this.currentTime = currentTime;
	}

	public long getNextTime() {
		return nextTime;
	}

	public void setNextTime(long nextTime) {
		this.nextTime = nextTime;
	}

	public Integer getBuyLot1() {
		return buyLot1;
	}

	public void setBuyLot1(Integer buyLot1) {
		this.buyLot1 = buyLot1;
	}

	public Integer getBuyLot2() {
		return buyLot2;
	}

	public void setBuyLot2(Integer buyLot2) {
		this.buyLot2 = buyLot2;
	}

	public Integer getBuyLot10() {
		return buyLot10;
	}

	public void setBuyLot10(Integer buyLot10) {
		this.buyLot10 = buyLot10;
	}

	public Integer getBuyLot20() {
		return buyLot20;
	}

	public void setBuyLot20(Integer buyLot20) {
		this.buyLot20 = buyLot20;
	}

	public Integer getBuyLot40() {
		return buyLot40;
	}

	public void setBuyLot40(Integer buyLot40) {
		this.buyLot40 = buyLot40;
	}

	public Integer getSellLot1() {
		return sellLot1;
	}

	public void setSellLot1(Integer sellLot1) {
		this.sellLot1 = sellLot1;
	}

	public Integer getSellLot2() {
		return sellLot2;
	}

	public void setSellLot2(Integer sellLot2) {
		this.sellLot2 = sellLot2;
	}

	public Integer getSellLot10() {
		return sellLot10;
	}

	public void setSellLot10(Integer sellLot10) {
		this.sellLot10 = sellLot10;
	}

	public Integer getSellLot20() {
		return sellLot20;
	}

	public void setSellLot20(Integer sellLot20) {
		this.sellLot20 = sellLot20;
	}

	public Integer getSellLot40() {
		return sellLot40;
	}

	public void setSellLot40(Integer sellLot40) {
		this.sellLot40 = sellLot40;
	}
	
	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public Integer getRunTime() {
        return runTime;
    }

	public String getGoodsDate() {
		return goodsDate;
	}
	
	public String getGoodsTime() {
		return goodsTime;
	}

	public void setGoodsTime(String goodsTime) {
		this.goodsTime = goodsTime;
	}

	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
}
