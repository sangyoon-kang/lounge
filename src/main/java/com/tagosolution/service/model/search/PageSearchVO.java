package com.tagosolution.service.model.search;

import com.tagoplus.model.common.SearchVO;

/**
 * 페이지 검색 모델
 * @author kky
 *
 */
public class PageSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4543990788362244851L;
	
	
	private int gseq;
	
	private Short pseq;
	
	private String pcode;
	
	
	
	
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

	public Short getPseq() {
		return pseq;
	}

	public void setPseq(Short pseq) {
		this.pseq = pseq;
	}
	
	/**
	 * 페이지코드
	 * @return
	 */
	public String getPcode() {
		return pcode;
	}
	
	/**
	 * 페이지코드
	 * @param pcode
	 */
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	
	

	
}
