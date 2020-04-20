package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.util.Date;
import java.util.List;

public class MenuSettingVO implements GeneralModel {
	
	/**
	 * Created By Mongolian Team D.Bilguun 2018-10-16 menu
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	private	String menuIdx;
	
	private	String groupIdx;
	
	private	Short menuLevel;
	
	private	String parentIdx;
	
	private	String menuName;
	
	private	String menuTable;
	
	private String folderPath;
	
	private String prefixPath;
	
	private String sortNum;
	
	private String useFlag;
	
	private String regUser;
	
	private Date regDate;
	
	private String modUser;
	
	private Date modDate;
	
	private String authList;
	
	private String authView;
	
	private String authWrite;
	
	private String authDelete;
	
	private String authModify;
	
	public String getAuthList() {
		return authList;
	}

	public void setAuthList(String authList) {
		this.authList = authList;
	}

	public String getAuthView() {
		return authView;
	}

	public void setAuthView(String authView) {
		this.authView = authView;
	}

	public String getAuthWrite() {
		return authWrite;
	}

	public void setAuthWrite(String authWrite) {
		this.authWrite = authWrite;
	}

	public String getAuthDelete() {
		return authDelete;
	}

	public void setAuthDelete(String authDelete) {
		this.authDelete = authDelete;
	}

	public String getAuthModify() {
		return authModify;
	}

	public void setAuthModify(String authModify) {
		this.authModify = authModify;
	}

	private List<String> menuIds;
	

	public List<String> getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(List<String> menuIds) {
		this.menuIds = menuIds;
	}

	public String getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}

	public String getGroupIdx() {
		return groupIdx;
	}

	public void setGroupIdx(String groupIdx) {
		this.groupIdx = groupIdx;
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

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuTable() {
		return menuTable;
	}

	public void setMenuTable(String menuTable) {
		this.menuTable = menuTable;
	}

	public String getFolderPath() {
		return folderPath;
	}

	public void setFolderPath(String folderPath) {
		this.folderPath = folderPath;
	}
	
	public String getPrefixPath() {
		return prefixPath;
	}

	public void setPrefixPath(String prefixPath) {
		this.prefixPath = prefixPath;
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

	
	
	
	
}