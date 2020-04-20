package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class BaseCMomeyVO implements GeneralModel {

	/**
	 * Created by Mongolian Team 2018-10-30.
	 */
	private static final long serialVersionUID = 1L;
	
	private Byte siteSeq;
	
	private Integer joinCMomey;
	
	private Integer boardCMomey;
	
	private Integer commentCMomey;
	
	private String policyType;
	
	private Integer policyValue;
	
	private Integer useMin;
	
	private Integer useMax;

	public Byte getSiteSeq() {
		return siteSeq;
	}

	public void setSiteSeq(Byte siteSeq) {
		this.siteSeq = siteSeq;
	}

	public Integer getJoinCMomey() {
		return joinCMomey;
	}

	public void setJoinCMomey(Integer joinCMomey) {
		this.joinCMomey = joinCMomey;
	}

	public Integer getBoardCMomey() {
		return boardCMomey;
	}

	public void setBoardCMomey(Integer boardCMomey) {
		this.boardCMomey = boardCMomey;
	}

	public Integer getCommentCMomey() {
		return commentCMomey;
	}

	public void setCommentCMomey(Integer commentCMomey) {
		this.commentCMomey = commentCMomey;
	}

	public String getPolicyType() {
		return policyType;
	}

	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}

	public Integer getPolicyValue() {
		return policyValue;
	}

	public void setPolicyValue(Integer policyValue) {
		this.policyValue = policyValue;
	}

	public Integer getUseMin() {
		return useMin;
	}

	public void setUseMin(Integer useMin) {
		this.useMin = useMin;
	}

	public Integer getUseMax() {
		return useMax;
	}

	public void setUseMax(Integer useMax) {
		this.useMax = useMax;
	}
}
