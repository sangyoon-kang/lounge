package com.tagosolution.service.model.search;

import java.util.List;

import com.tagoplus.model.common.SearchVO;

public class RegionSearchVO  extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2695873893100155691L;
	
	
	private String mainRegionName;
	private String subRegionName;
	private String regDate;
	private String reqUser;
	private long regionSeq;
	private long count;
	private Long mainRegionSeq;
	public String getMainRegionName() {
		return mainRegionName;
	}
	public void setMainRegionName(String mainRegionName) {
		this.mainRegionName = mainRegionName;
	}
	public String getSubRegionName() {
		return subRegionName;
	}
	public void setSubRegionName(String subRegionName) {
		this.subRegionName = subRegionName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getReqUser() {
		return reqUser;
	}
	public void setReqUser(String reqUser) {
		this.reqUser = reqUser;
	}
	public long getRegionSeq() {
		return regionSeq;
	}
	public void setRegionSeq(long regionSeq) {
		this.regionSeq = regionSeq;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public Long getMainRegionSeq() {
		return mainRegionSeq;
	}
	public void setMainRegionSeq(Long mainRegionSeq) {
		this.mainRegionSeq = mainRegionSeq;
	}
	
	
	
}
