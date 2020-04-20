package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class CommonMdlVO implements GeneralModel {
	private static final long serialVersionUID = 1L;
	private Integer requestSeq;
	private String amount;
    private String name;
    private String bankName;
    private String bankNum;
    private String times;
    private String failed;
    
    
	public Integer getRequestSeq() {
		return requestSeq;
	}
	public void setRequestSeq(Integer requestSeq) {
		this.requestSeq = requestSeq;
	}
	public String getFailed() {
		return failed;
	}
	public void setFailed(String failed) {
		this.failed = failed;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankNum() {
		return bankNum;
	}
	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
    
}
