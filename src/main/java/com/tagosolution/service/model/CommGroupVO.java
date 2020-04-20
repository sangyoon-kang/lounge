package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;



import java.util.Date;

@Deprecated
public class CommGroupVO implements GeneralModel {

	private static final long serialVersionUID = -628562041235627959L;
	private int commGroupIdx;
	private String groupDiv;
	private String title;
	private String subTitle;
	private String linkUrl;
	private int sortNum;
	private String useFlag;
	private String regUser;
	private Date regDate;
	private String modUser;
	private Date modDate;

	public int getCommGroupIdx() {
		return commGroupIdx;
	}

	public void setCommGroupIdx(int commGroupIdx) {
		this.commGroupIdx = commGroupIdx;
	}

	public String getGroupDiv() {
		return groupDiv;
	}

	public void setGroupDiv(String groupDiv) {
		this.groupDiv = groupDiv;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public int getSortNum() {
		return sortNum;
	}

	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
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

}
