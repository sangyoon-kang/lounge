package com.tagosolution.service.model;


import com.tagoplus.model.GeneralModel;



import java.util.Date;


public  class SiteMetaVO implements GeneralModel  {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 123456789;
	
	private int seoIdx;
	private Integer groupIdx;
	private String pageName;
	private String pageLink;
	private String metaTitle;
	private String metaKeywords;
	private String metaSubject;
	private String metaDescription;
	private String useFlag;
	private String regUser;
	private Date regDate;
	private String modUser;
	private Date modDate;
	
	private CommGroupVO commGroupVO;

	
	/**
	 * 게시판 그룹 
	 * @return
	 */
	public CommGroupVO getCommGroupVO() {
		if (this.commGroupVO == null)
			this.commGroupVO = new CommGroupVO();
		return commGroupVO;
	}

	/**
	 * 게시판 그룹
	 * @param commGroupVO
	 */
	public void setCommGroupVO(CommGroupVO commGroupVO) {
		this.commGroupVO = commGroupVO;
	}
	

	public int getSeoIdx() {
		return seoIdx;
	}


	public void setSeoIdx(int seoIdx) {
		this.seoIdx = seoIdx;
	}


	public Integer getGroupIdx() {
		return groupIdx;
	}


	public void setGroupIdx(Integer groupIdx) {
		this.groupIdx = groupIdx;
	}


	public String getPageName() {
		return pageName;
	}


	public void setPageName(String pageName) {
		this.pageName = pageName;
	}


	public String getPageLink() {
		return pageLink;
	}


	public void setPageLink(String pageLink) {
		this.pageLink = pageLink;
	}


	public String getMetaTitle() {
		return metaTitle;
	}


	public void setMetaTitle(String metaTitle) {
		this.metaTitle = metaTitle;
	}


	public String getMetaKeywords() {
		return metaKeywords;
	}


	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}


	public String getMetaSubject() {
		return metaSubject;
	}


	public void setMetaSubject(String metaSubject) {
		this.metaSubject = metaSubject;
	}


	public String getMetaDescription() {
		return metaDescription;
	}


	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
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
	
	public String getTitle() {
		return this.getCommGroupVO().getTitle();
	}
	
	public void setTitle(String title) {
		this.getCommGroupVO().setTitle(title);
	}


}
