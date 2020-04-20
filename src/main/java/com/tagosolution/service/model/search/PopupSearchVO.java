package com.tagosolution.service.model.search;

import com.tagoplus.model.common.SearchVO;

/**
 * 팝업 검색 모델
 * @author wimy
 *
 */
public class PopupSearchVO extends SearchVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 522255274714877468L;
	
	private Short pseq;

	/**
	 * 팝업 순번
	 * @return
	 */
	public Short getPseq() {
		return pseq;
	}

	public void setPseq(Short pseq) {
		this.pseq = pseq;
	}
	
	
}
