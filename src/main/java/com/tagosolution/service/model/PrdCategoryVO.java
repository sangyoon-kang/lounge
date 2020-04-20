package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.util.Date;
import java.util.List;

public class PrdCategoryVO implements GeneralModel {
	
	
	private static final long serialVersionUID = 1L;
	
	
	
	private	String cateIdx;
	
	private	String groupIdx;
	
	private	Short cateLevel;
	
	private	String parentIdx;
	
	private	String cateName;
	
	private	String cateDescription;
	
	private String prdCount;
	

	
	private String sortNum;
	
	private String useFlag;
	
	private String regUser;
	
	private Date regDate;
	
	private String modUser;
	
	private Date modDate;
	
	private List<String> cateIds;

	public String getCateIdx() {
		return cateIdx;
	}

	public void setCateIdx(String cateIdx) {
		this.cateIdx = cateIdx;
	}

	public String getGroupIdx() {
		return groupIdx;
	}

	public void setGroupIdx(String groupIdx) {
		this.groupIdx = groupIdx;
	}

	public Short getCateLevel() {
		return cateLevel;
	}

	public void setCateLevel(Short cateLevel) {
		this.cateLevel = cateLevel;
	}

	public String getParentIdx() {
		return parentIdx;
	}

	public void setParentIdx(String parentIdx) {
		this.parentIdx = parentIdx;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}


	public String getCateDescription() {
		return cateDescription;
	}

	public void setCateDescription(String cateDescription) {
		this.cateDescription = cateDescription;
	}

	public String getPrdCount() {
		return prdCount;
	}

	public void setPrdCount(String prdCount) {
		this.prdCount = prdCount;
	}

	public String getSortNum() {
		return sortNum;
	}

	public void setSortNum(String sortNum) {
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

	public List<String> getCateIds() {
		return cateIds;
	}

	public void setCateIds(List<String> cateIds) {
		this.cateIds = cateIds;
	}
	

	
}