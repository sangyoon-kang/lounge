package com.tagosolution.service.model.json;

import java.util.HashMap;
import java.util.Map;

import com.tagoplus.model.GeneralModel;

public class jsTree implements GeneralModel {

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3937057965911555927L;

	private String id;
	
	private String text;
	
	private String parent;
	
	private Map<String, Object> li_attr;
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public Map<String, Object> getLi_attr() {
		if (this.li_attr == null)
			this.li_attr = new HashMap<String, Object>();
		return li_attr;
	}

	public void setLi_attr(Map<String, Object> li_attr) {
		this.li_attr = li_attr;
	}
	
	
}
