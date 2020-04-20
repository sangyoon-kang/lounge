package com.tagosolution.service.model.json;

import com.tagoplus.model.GeneralModel;

public class zTree implements GeneralModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1525614929944015972L;
	
	private String id;
	
	private String pId;
	
	private String name;
	
	private boolean open = true;
	
	private boolean isIsParent;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isIsParent() {
		return isIsParent;
	}

	public void setIsParent(boolean isIsParent) {
		this.isIsParent = isIsParent;
	}
	
}
