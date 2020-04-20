package com.tagosolution.service.model.search;

import java.util.List;

import com.tagoplus.model.common.SearchVO;

/**
 * 상품 검색 모델
 * @author wimy
 *
 */
public class PrdSearchVO extends SearchVO {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1761999877794105058L;

	private int prdseq;
	
	private String cateIdx;

	private String srcLink;
	
	private int lastLevel;
	
	private int baseLevel;
	
	private List<Integer> prdseqs;
	
	private String mode;
	
	private int prdimgseq;
	
	private String recommendyn;
	
	private String mainyn;
	
	private int srcDepth;
	
	private int rpseq;
	
	private int count;
	
	private	Short cateLevel;
	
	private	String parentIdx;
	
	private String type;
	
	private String sortNum;
	
	public String getSortNum() {
		return sortNum;
	}

	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParentIdx() {
		return parentIdx;
	}

	public void setParentIdx(String parentIdx) {
		this.parentIdx = parentIdx;
	}

	public Short getCateLevel() {
		return cateLevel;
	}

	public void setCateLevel(Short cateLevel) {
		this.cateLevel = cateLevel;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * 최근 게시물 순번 : TS_RECENT_PRD.RECENT_PRD_SEQ
	 * @return
	 */
	public int getRpseq() {
		return rpseq;
	}

	/**
	 * 최근 게시물 순번 : TS_RECENT_PRD.RECENT_PRD_SEQ
	 * @return
	 */
	public void setRpseq(int rpseq) {
		this.rpseq = rpseq;
	}

	/**
	 * 추천상품 여부	
	 * @return
	 */
	public String getRecommendyn() {
		return recommendyn;
	}

	/**
	 * 추천상품여부
	 * @param recommendyn
	 */
	public void setRecommendyn(String recommendyn) {
		this.recommendyn = recommendyn;
	}

	/**
	 * 메인노출 여부
	 * @return
	 */
	public String getMainyn() {
		return mainyn;
	}

	/**
	 * 메인노출 여부
	 * @param mainyn
	 */
	public void setMainyn(String mainyn) {
		this.mainyn = mainyn;
	}

	/**
	 * 상품이미지 순번
	 * @return
	 */
	public int getPrdimgseq() {
		return prdimgseq;
	}

	/**
	 * 상품이미지 순번
	 * @param prdimgseq
	 */
	public void setPrdimgseq(int prdimgseq) {
		this.prdimgseq = prdimgseq;
	}

	/**
	 * 상품 순번
	 * @return
	 */
	public int getPrdseq() {
		return prdseq;
	}

	/**
	 * 상품 순번
	 * @param prdseq
	 */
	public void setPrdseq(int prdseq) {
		this.prdseq = prdseq;
	}



	public String getCateIdx() {
		return cateIdx;
	}

	public void setCateIdx(String cateIdx) {
		this.cateIdx = cateIdx;
	}

	public int getLastLevel() {
		return lastLevel;
	}

	public void setLastLevel(int lastLevel) {
		this.lastLevel = lastLevel;
	}

	public int getBaseLevel() {
		return baseLevel;
	}

	public void setBaseLevel(int baseLevel) {
		this.baseLevel = baseLevel;
	}

	/**
	 * 상품 리스트 - 체크박스선택 용 seq리스트
	 * @return
	 */
	public List<Integer> getPrdseqs() {
		return prdseqs;
	}

	/**
	 * 상품 리스트 - 체크박스선택 용 seq리스트
	 * @param prdseqList
	 */
	public void setPrdseqs(List<Integer> prdseqs) {
		this.prdseqs = prdseqs;
	}

	/**
	 * 상품 메인 list , view
	 * @return
	 */
	public String getMode() {
		return mode;
	}

	/**
	 * 상품 메인 list , view
	 * @param mode
	 */
	public void setMode(String mode) {
		this.mode = mode;
	}

	/**
	 * 링크주소
	 * @return
	 */
	public String getSrcLink() {
		return srcLink;
	}

	/**
	 * 링크주소
	 * @param srcLink
	 */
	public void setSrcLink(String srcLink) {
		this.srcLink = srcLink;
	}

	/**
	 * 카테고리 뎁스 검색
	 * @return
	 */
	public int getSrcDepth() {
		return srcDepth;
	}

	/**
	 * 카테고리 뎁스 검색
	 * @param srcDepth
	 */
	public void setSrcDepth(int srcDepth) {
		this.srcDepth = srcDepth;
	}
	
	
	
}
