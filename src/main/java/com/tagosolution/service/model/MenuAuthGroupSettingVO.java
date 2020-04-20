package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.util.Date;
import java.util.List;

public class MenuAuthGroupSettingVO implements GeneralModel {
	
	/**
	 * Created By Mongolian Team 2018-10-26
	 */
	private static final long serialVersionUID = 1L;
	
	private	Integer idX;

	private	String authoTitle;
	
	private	String authoContents;
	
	private	String useFlag;
	
	private String regUser;
	
	private Date regDate;
	
	private String modUser;
	
	private Date modDate;
	
	private List<String> userList;
	
	private List<MenuAuthoSettingVO> menuAuthList;

	public List<MenuAuthoSettingVO> getMenuAuthList() {
		return menuAuthList;
	}

	public void setMenuAuthList(List<MenuAuthoSettingVO> menuAuthList) {
		this.menuAuthList = menuAuthList;
	}

	public Integer getIdX() {
		return idX;
	}

	public void setIdX(Integer idX) {
		this.idX = idX;
	}

	public String getAuthoTitle() {
		return authoTitle;
	}

	public void setAuthoTitle(String authoTitle) {
		this.authoTitle = authoTitle;
	}

	public String getAuthoContents() {
		return authoContents;
	}

	public void setAuthoContents(String authoContents) {
		this.authoContents = authoContents;
	}

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}

	public String getRegUser() {
		return regUser;
	}

	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getModUser() {
		return modUser;
	}

	public void setModUser(String modUser) {
		this.modUser = modUser;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	public List<String> getUserList() {
		return userList;
	}

	public void setUserList(List<String> userList) {
		this.userList = userList;
	}
}