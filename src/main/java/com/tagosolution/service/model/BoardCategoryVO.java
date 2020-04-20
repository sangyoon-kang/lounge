package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 게시판 카테고리 모델
 * @author wimy
 *
 */
public class BoardCategoryVO implements GeneralModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2118519119319688942L;

	private Integer bcSeq;

    private String boardCode;

    private String cateName;

    private String mouseoverImage;

    private String mouseoutImage;

    private Short ordering;
    
    private String boardName;
    
    public Integer getBcSeq() {
        return bcSeq;
    }

    public void setBcSeq(Integer bcSeq) {
        this.bcSeq = bcSeq;
    }

    public String getBoardCode() {
        return boardCode;
    }

    public void setBoardCode(String boardCode) {
        this.boardCode = boardCode;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getMouseoverImage() {
        return mouseoverImage;
    }

    public void setMouseoverImage(String mouseoverImage) {
        this.mouseoverImage = mouseoverImage;
    }

    public String getMouseoutImage() {
        return mouseoutImage;
    }

    public void setMouseoutImage(String mouseoutImage) {
        this.mouseoutImage = mouseoutImage;
    }

    public Short getOrdering() {
        return ordering;
    }

    public void setOrdering(Short ordering) {
        this.ordering = ordering;
    }

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
    
    
}