package com.tagosolution.service.model;

import java.util.Date;

import com.tagoplus.model.GeneralModel;


public class CommContentsVO implements GeneralModel {
	
	/**
	 * Created By Mongolian Team D.Bilguun 2018-11-05 ts_comm_contents
	 */
	private static final long serialVersionUID = 1L;
	
	private	Integer iDx;
	
	private	String contentsType;
	
	private	Integer version;
	
	private String title;
	
	private	String subtitle;
	
	private String linkURL;
	
	private	String contents;
	
	private Integer viewCount;
	
	private	String useFlag;
	
	private String regUser;
	
	private String modUser;
	
	private	Date regDate;
	
	private	Date modDate;

	public Integer getiDx() {
		return iDx;
	}
	public void setiDx(Integer iDx) {
		this.iDx = iDx;
	}
	public String getContentsType() {
		return contentsType;
	}
	public void setContentsType(String contentsType) {
		this.contentsType = contentsType;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getLinkURL() {
		return linkURL;
	}
	public void setLinkURL(String linkURL) {
		this.linkURL = linkURL;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getViewCount() {
		return viewCount;
	}
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
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
	public String getModUser() {
		return modUser;
	}
	public void setModUser(String modUser) {
		this.modUser = modUser;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	
}