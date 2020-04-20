package com.tagosolution.service.model;

import java.util.Date;

import com.tagoplus.model.GeneralModel;

public class MemberCMomeyVO implements GeneralModel {

	/**
	 * Created by Mongolian Team 2018-10-30.
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer iDx;
	
	private String userId;
	
	private Integer cMoney;
	
	private String summary;
	
	private Integer orderUid;
	
	private String editorName;
	
	private String reason;
	
	private Date regDate;
	
	private String useFlag;

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}

	public Integer getiDx() {
		return iDx;
	}

	public void setiDx(Integer iDx) {
		this.iDx = iDx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getcMoney() {
		return cMoney;
	}

	public void setcMoney(Integer cMoney) {
		this.cMoney = cMoney;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Integer getOrderUid() {
		return orderUid;
	}

	public void setOrderUid(Integer orderUid) {
		this.orderUid = orderUid;
	}

	public String getEditorName() {
		return editorName;
	}

	public void setEditorName(String editorName) {
		this.editorName = editorName;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
