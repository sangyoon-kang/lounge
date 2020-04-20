package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 회원 등급 모델
 * @author wimy
 *
 */
public class MemberGradeVO implements GeneralModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4279106386868819927L;
	
	private short gradeLevel;
	
	private String icon;
	
	private String gradeName;
	
	private String gradeMemo;
	
	public short getGradeLevel() {
		return gradeLevel;
	}
	
	public void setGradeLevel(short gradeLevel) {
		this.gradeLevel = gradeLevel;
	}
	
	public String getIcon() {
		return icon;
	}
	
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getGradeName() {
		return gradeName;
	}
	
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	public String getGradeMemo() {
		return gradeMemo;
	}
	
	public void setGradeMemo(String gradeMemo) {
		this.gradeMemo = gradeMemo;
	}
}