package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 최근 게시물 모델
 * @author wimy
 *
 */
public class RecentBoardVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -3962861560181469607L;

	private int recentBoardSeq;

    private String boardCode;
    
    private int bcSeq;
    

    private String linkUrl;

    private short articleCount;

    private short subjectCharCount;

    private short bodyCharCount;

    private String codingStart;
    
    private String codingLoop;
    
    private String codingEnd;
    
    
    private String cateName; 
    
    private BoardMasterVO boardMasterVO;
    
    
    /**
     * 게시판 마스터 모델
     * @return
     */
    public BoardMasterVO getBoardMasterVO() {
    	if (this.boardMasterVO == null)
    		this.boardMasterVO = new BoardMasterVO();
		return boardMasterVO;
	}

    /**
     * 게시판 마스터 모델
     * @param boardMasterVO
     */
	public void setBoardMasterVO(BoardMasterVO boardMasterVO) {
		this.boardMasterVO = boardMasterVO;
	}

	public int getRecentBoardSeq() {
        return recentBoardSeq;
    }

    public void setRecentBoardSeq(int recentBoardSeq) {
        this.recentBoardSeq = recentBoardSeq;
    }

    public String getBoardCode() {
        return boardCode;
    }

    public void setBoardCode(String boardCode) {
        this.boardCode = boardCode;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public short getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(short articleCount) {
        this.articleCount = articleCount;
    }

    public short getSubjectCharCount() {
        return subjectCharCount;
    }

    public void setSubjectCharCount(short subjectCharCount) {
        this.subjectCharCount = subjectCharCount;
    }

    public short getBodyCharCount() {
        return bodyCharCount;
    }

    public void setBodyCharCount(short bodyCharCount) {
        this.bodyCharCount = bodyCharCount;
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

	public int getBcSeq() {
		return bcSeq;
	}

	public void setBcSeq(int bcSeq) {
		this.bcSeq = bcSeq;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
}