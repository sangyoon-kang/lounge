package com.tagosolution.service.model.search;

import java.util.Date;


import com.tagoplus.model.common.SearchVO;


public class QuickConsultSearchVO extends SearchVO {
	
	/**
	 * Created By Mongolian Team D.Bilguun 2018-11-27
	 */
	private static final long serialVersionUID = 1L;
	
	private	Integer Idx;
	private	String userName;
	private	String email;
	private	String contact;
	private String content;
	private String useFlag;
	private String answer;
	private String regUser;
	private Date regDate;
	private String modUser;
	private Date modDate;
	public Integer getIdx() {
		return Idx;
	}
	public void setIdx(Integer idx) {
		Idx = idx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegUser() {
		return regUser;
	}
	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}
	public String getModUser() {
		return modUser;
	}
	public void setModUser(String modUser) {
		this.modUser = modUser;
	}
	public Date getRegDate() {
		return regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}

	


}