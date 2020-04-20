package com.tagosolution.service.model.wrapper;

import com.tagoplus.model.GeneralModel;
import com.tagosolution.service.model.GoodsVO;
import com.tagosolution.service.model.RateVO;

import java.util.List;

public class FxPrductWrapper implements GeneralModel {
	
	/**
	 * Author sky line OrderGoodsVO
	 */
	private static final long serialVersionUID = -4608672490380839584L;
	
	private List<GoodsVO> prd;

	private List<RateVO> prr;

	public List<RateVO> getPrr() {
		return prr;
	}

	public void setPrr(List<RateVO> prr) {
		this.prr = prr;
	}

	public List<GoodsVO> getPrd() {
		return prd;
	}

	public void setPrd(List<GoodsVO> prd) {
		this.prd = prd;
	}

}
