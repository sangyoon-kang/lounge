package com.tagosolution.service.model;

import java.math.BigDecimal;
import java.util.Date;

import com.tagoplus.model.common.SearchVO;

public class ResultSecVO extends SearchVO {
	
	private static final long serialVersionUID = -1L;
	private String resultDate;
	private String resultTime;
	private String resultSec;
	private BigDecimal sVal;
	private BigDecimal hVal;
	private BigDecimal lVal;
	private BigDecimal eVal;
	private BigDecimal bVal;
	private BigDecimal aVal;
	private long timestamp;
	private String resultMinute;
	private Integer rowNumber;
	private String runTime;
	
	
	
	public String getRunTime() {
		return runTime;
	}
	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}
	public Integer getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(Integer rowNumber) {
		this.rowNumber = rowNumber;
	}
	public String getResultDate() {
		return resultDate;
	}
	public void setResultDate(String resultDate) {
		this.resultDate = resultDate;
	}
	public String getResultTime() {
		return resultTime;
	}
	public void setResultTime(String resultTime) {
		this.resultTime = resultTime;
	}
	public String getResultSec() {
		return resultSec;
	}
	public void setResultSec(String resultSec) {
		this.resultSec = resultSec;
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
	public BigDecimal getbVal() {
		return bVal;
	}
	public void setbVal(BigDecimal bVal) {
		this.bVal = bVal;
	}
	public BigDecimal getaVal() {
		return aVal;
	}
	public void setaVal(BigDecimal aVal) {
		this.aVal = aVal;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	public String getResultMinute() {
		return resultMinute;
	}
	public void setResultMinute(String resultMinute) {
		this.resultMinute = resultMinute;
	}	  
}