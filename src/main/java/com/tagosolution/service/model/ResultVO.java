package com.tagosolution.service.model;

import java.math.BigDecimal;
import java.util.Date;

import com.tagoplus.model.common.SearchVO;

public class ResultVO extends SearchVO {
	
	private static final long serialVersionUID = -1L;
	
	private Date modTime;
	private BigDecimal sVal;
	private BigDecimal hVal;
	private BigDecimal lVal;
	private BigDecimal eVal;
	private String goodsResult;
	private String rTime;
	private Integer rowNumber;
	
	
	
	public Integer getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(Integer rowNumber) {
		this.rowNumber = rowNumber;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public String getGoodsResult() {
		return goodsResult;
	}
	public void setGoodsResult(String goodsResult) {
		this.goodsResult = goodsResult;
	}
	public BigDecimal getsVal() {
		return sVal;
	}
	public void setsVal(BigDecimal sVal) {
		this.sVal = sVal;
	}
	public BigDecimal gethVal() {
		return hVal;
	}
	public void sethVal(BigDecimal hVal) {
		this.hVal = hVal;
	}
	public BigDecimal getlVal() {
		return lVal;
	}
	public void setlVal(BigDecimal lVal) {
		this.lVal = lVal;
	}
	public BigDecimal geteVal() {
		return eVal;
	}
	public void seteVal(BigDecimal eVal) {
		this.eVal = eVal;
	}
	public Date getModTime() {
		return modTime;
	}
	public void setModTime(Date modTime) {
		this.modTime = modTime;
	}
  
}