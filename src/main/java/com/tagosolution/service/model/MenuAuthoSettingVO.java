package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.util.Date;

public class MenuAuthoSettingVO implements GeneralModel {
	
	/**
	 * Created By Mongolian 2018-10-26
	 */
	private static final long serialVersionUID = 1L;
	
	private	Integer menuAuthoGroupIdx;
	
	private	Integer groupId;
	
	private	String menuId;
	
	private	String authoList;
	
	private	String authoView;
	
	private String authoWrite;
	
	private String authoModify;
	
	private String authoDelete;
	
	private String folderPath;
	
	private String prefixPath;

	public String getPrefixPath() {
		return prefixPath;
	}

	public void setPrefixPath(String prefixPath) {
		this.prefixPath = prefixPath;
	}

	public String getFolderPath() {
		return folderPath;
	}

	public void setFolderPath(String folderPath) {
		this.folderPath = folderPath;
	}

	public Integer getMenuAuthoGroupIdx() {
		return menuAuthoGroupIdx;
	}

	public void setMenuAuthoGroupIdx(Integer menuAuthoGroupIdx) {
		this.menuAuthoGroupIdx = menuAuthoGroupIdx;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getAuthoList() {
		return authoList;
	}

	public void setAuthoList(String authoList) {
		this.authoList = authoList;
	}

	public String getAuthoView() {
		return authoView;
	}

	public void setAuthoView(String authoView) {
		this.authoView = authoView;
	}

	public String getAuthoWrite() {
		return authoWrite;
	}

	public void setAuthoWrite(String authoWrite) {
		this.authoWrite = authoWrite;
	}

	public String getAuthoModify() {
		return authoModify;
	}

	public void setAuthoModify(String authoModify) {
		this.authoModify = authoModify;
	}

	public String getAuthoDelete() {
		return authoDelete;
	}

	public void setAuthoDelete(String authoDelete) {
		this.authoDelete = authoDelete;
	}

}