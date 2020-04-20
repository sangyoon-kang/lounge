package com.tagosolution.service.model.search;

import java.util.Date;
import java.util.List;

import com.tagoplus.model.common.SearchVO;

public class MenuSettingSearchVO  extends SearchVO {
	
	/**
	 * Created By Mongolian Team
	 */
	private static final long serialVersionUID = 1L;
	
	private	Integer xD;
	
	private Byte siteCode;
	
	private String flag;
	
	private Integer count;
	
	private	String menuIdx;
	
	private String parentIdx;
	
	private	Short menuLevel;
	
	private	String adminId;
	
	private	Short[] menuLevels;
	
	private String type;
	
	private String sortNum;

	public String getSortNum() {
		return sortNum;
	}

	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Short[] getMenuLevels() {
		return menuLevels;
	}

	public void setMenuLevels(Short[] menuLevels) {
		this.menuLevels = menuLevels;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public Short getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Short menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getParentIdx() {
		return parentIdx;
	}

	public void setParentIdx(String parentIdx) {
		this.parentIdx = parentIdx;
	}

	public String getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}

	public Integer getxD() {
		return xD;
	}

	public void setxD(Integer xD) {
		this.xD = xD;
	}

	public Byte getSiteCode() {
		return siteCode;
	}

	public void setSiteCode(Byte siteCode) {
		this.siteCode = siteCode;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	
	
	
}
