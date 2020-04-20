package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 메인 상품 게시 모델 
 * @author wimy
 *
 */
public class RecentPrdVO implements GeneralModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = -4725948815332833870L;

	private Integer rpSeq;

    private String listType;

    private String linkUrl;

    private Short prdCount;

    private Short subjectCharCount;

    private Short summaryCharCount;

    private Short lfCount;
    
    private String codingStart;
    
    private String codingLoop;
    
    private String codingEnd;

    public Integer getRpSeq() {
        return rpSeq;
    }

    public void setRpSeq(Integer rpSeq) {
        this.rpSeq = rpSeq;
    }

    public String getListType() {
        return listType;
    }

    public void setListType(String listType) {
        this.listType = listType;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public Short getPrdCount() {
        return prdCount;
    }

    public void setPrdCount(Short prdCount) {
        this.prdCount = prdCount;
    }

    public Short getSubjectCharCount() {
        return subjectCharCount;
    }

    public void setSubjectCharCount(Short subjectCharCount) {
        this.subjectCharCount = subjectCharCount;
    }

    public Short getSummaryCharCount() {
        return summaryCharCount;
    }

    public void setSummaryCharCount(Short summaryCharCount) {
        this.summaryCharCount = summaryCharCount;
    }

    public Short getLfCount() {
        return lfCount;
    }

    public void setLfCount(Short lfCount) {
        this.lfCount = lfCount;
    }

	public String getCodingStart() {
		return codingStart;
	}

	public void setCodingStart(String codingStart) {
		this.codingStart = codingStart;
	}

	public String getCodingLoop() {
		return codingLoop;
	}

	public void setCodingLoop(String codingLoop) {
		this.codingLoop = codingLoop;
	}

	public String getCodingEnd() {
		return codingEnd;
	}

	public void setCodingEnd(String codingEnd) {
		this.codingEnd = codingEnd;
	}
    
    
}