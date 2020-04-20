package com.tagosolution.service.model.search;

import java.util.List;

import com.tagoplus.model.common.SearchVO;

/**
 * 게시판 관리 검색 모델
 * @author wimy
 *
 */
public class BoardSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2695873893100155691L;
	
	
	private String bcode;

	private int gseq; 

	//private String groupType;
	
	private int bcseq;
	
	private long bseq;
	
	private List<Long> bseqs;
	
	private long prSeq;
	
	private String mode; 
	
	private int rbseq;
	
	private String bType;
	
	private String allowYn;
	
	private Integer maxLevel;
	
	private Integer estimateSeq;
	
	private Integer counselmonSeq;
	
	private String searchType;
	
	private String reguser;


	public String getReguser() {
		return reguser;
	}


	public void setReguser(String reguser) {
		this.reguser = reguser;
	}


	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public Integer getEstimateSeq() {
		return estimateSeq;
	}


	public void setEstimateSeq(Integer estimateSeq) {
		this.estimateSeq = estimateSeq;
	}


	public Integer getCounselmonSeq() {
		return counselmonSeq;
	}


	public void setCounselmonSeq(Integer counselmonSeq) {
		this.counselmonSeq = counselmonSeq;
	}


	public Integer getMaxLevel() {
		return maxLevel;
	}


	public void setMaxLevel(Integer maxLevel) {
		this.maxLevel = maxLevel;
	}

	public String getAllowYn() {
		return allowYn;
	}



	public void setAllowYn(String allowYn) {
		this.allowYn = allowYn;
	}



	/**
	 * 게시판 코드 : board_code
	 * @return
	 */
	
	public String getBcode() {
		return bcode;
	}

	

	/**
	 * 게시판 코드 : board_code
	 * @param bcode
	 */
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	



	/**
	 * 그룹 순번 (TS_GROUP.GROUP_SEQ)
	 * @return
	 */
	public int getGseq() {
		return gseq;
	}

	/**
	 * 그룹 순번 (TS_GROUP.GROUP_SEQ)
	 * @param gseq
	 */
	public void setGseq(int gseq) {
		this.gseq = gseq;
	}

	/**
	 * 게시판 카테고리 순번
	 * @return
	 */
	public int getBcseq() {
		return bcseq;
	}

	/**
	 * 게시판 카테고리 순번
	 * @param bcseq
	 */
	public void setBcseq(int bcseq) {
		this.bcseq = bcseq;
	}

	/**
	 * 게시물 순번
	 * @return
	 */
	public long getBseq() {
		return bseq;
	}

	/**
	 * 게시물 순번
	 * @param bseq
	 */
	public void setBseq(long bseq) {
		this.bseq = bseq;
	}

	/**
	 * 게시물 순번 리스트	
	 * @return
	 */
	public List<Long> getBseqs() {
		return bseqs;
	}

	/**
	 * 게시물 순번 리스트
	 * @param bseqs
	 */
	public void setBseqs(List<Long> bseqs) {
		this.bseqs = bseqs;
	}

	/**
	 * 부모 게시물 순번 - 게시물 답글 등록용
	 * @return
	 */
	public long getPrSeq() {
		return prSeq;
	}

	/**
	 * 부모 게시물 순번 - 게시물 답글 등록용
	 * @param prSeq
	 */
	public void setPrSeq(long prSeq) {
		this.prSeq = prSeq;
	}

	/**
	 * 게시판 모드:- 1. "", list:목록, 2. view:보기, 3. write: 등록, 4.edit: 수정, 5.reply: 계층형 답글
	 * @return
	 */
	public String getMode() {
		return mode;
	}

	/**
	 * 게시판 모드:- 1. "", list:목록, 2. view:보기, 3. write: 등록, 4.edit: 수정, 5.reply: 계층형 답글
	 * @param mode
	 */
	public void setMode(String mode) {
		this.mode = mode;
	}

	/**
	 * 최근 게시물 순번 : TS_RECENT_BOARD.RECENT_BOARD_SEQ
	 * @return
	 */
	public int getRbseq() {
		return rbseq;
	}

	/**
	 * 최근 게시물 순번 : TS_RECENT_BOARD.RECENT_BOARD_SEQ
	 * @param rbseq
	 */
	public void setRbseq(int rbseq) {
		this.rbseq = rbseq;
	}

	/**
	 * 게시판 타입
	 * @return
	 */
	public String getbType() {
		return bType;
	}

	/**
	 * 게시판 타입
	 * @param bType
	 */
	public void setbType(String bType) {
		this.bType = bType;
	}
	
	
	
}
