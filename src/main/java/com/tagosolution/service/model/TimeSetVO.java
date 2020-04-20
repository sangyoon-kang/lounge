package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class TimeSetVO implements GeneralModel {
	/**
	 * sky line
	 */
	private static final long serialVersionUID = 1L;
	
    private Integer tsSeq;

    private short tsMinute;

    private short breakStart;

	private short breakEnd;

	private short stopLimit;

	private short autoClose1;

	private short autoClose2;

	private short autoClose3;

	private short autoClose4;

	private short autoClose5;

	private short autoCloseAll;

	private short maxBuyCnt1;

	private short maxBuyCnt2;

	private short maxBuyCnt3;

	private short maxBuyCnt4;

	private short maxBuyCnt5;

	private Integer maxBuyPrice;


    
	public Integer getTsSeq() {
		return tsSeq;
	}

	public void setTsSeq(Integer tsSeq) {
		this.tsSeq = tsSeq;
	}

	public short geTtsMinute() {
		return tsMinute;
	}

	public void seTtsMinute(short tsMinute) {
		this.tsMinute = tsMinute;
	}

	public short getBreakStart() {
		return breakStart;
	}

	public void setBreakStart(short breakStart) {
		this.breakStart = breakStart;
	}

	public short getBreakEnd() {
		return breakEnd;
	}

	public void setBreakEnd(short breakEnd) {
		this.breakEnd = breakEnd;
	}

	public short getStopLimit() {
		return stopLimit;
	}

	public void setStopLimit(short stopLimit) {
		this.stopLimit = stopLimit;
	}

	public short getAutoClose1() {
		return autoClose1;
	}

	public void setAutoClose1(short autoClose1) {
		this.autoClose1 = autoClose1;
	}

	public short getAutoClose2() {
		return autoClose2;
	}

	public void setAutoClose2(short autoClose2) {
		this.autoClose2 = autoClose2;
	}

	public short getAutoClose3() {
		return autoClose3;
	}

	public void setAutoClose3(short autoClose3) {
		this.autoClose3 = autoClose3;
	}

	public short getAutoClose4() {
		return autoClose4;
	}

	public void setAutoClose4(short autoClose4) {
		this.autoClose4 = autoClose4;
	}

	public short getAutoClose5() {
		return autoClose5;
	}

	public void setAutoClose5(short autoClose5) {
		this.autoClose5 = autoClose5;
	}

	
	public short getAutoCloseAll() {
		return autoCloseAll;
	}

	public void setAutoCloseAll(short autoCloseAll) {
		this.autoCloseAll = autoCloseAll;
	}

	public short getMaxBuyCnt1() {
		return maxBuyCnt1;
	}

	public void setMaxBuyCnt1(short maxBuyCnt1) {
		this.maxBuyCnt1 = maxBuyCnt1;
	}

	public short getMaxBuyCnt2() {
		return maxBuyCnt2;
	}

	public void setMaxBuyCnt2(short maxBuyCnt2) {
		this.maxBuyCnt2 = maxBuyCnt2;
	}

	public short getMaxBuyCnt3() {
		return maxBuyCnt3;
	}

	public void setMaxBuyCnt3(short maxBuyCnt3) {
		this.maxBuyCnt3 = maxBuyCnt3;
	}

	public short getMaxBuyCnt4() {
		return maxBuyCnt4;
	}

	public void setMaxBuyCnt4(short maxBuyCnt4) {
		this.maxBuyCnt4 = maxBuyCnt4;
	}

	public short getMaxBuyCnt5() {
		return maxBuyCnt5;
	}

	public void setMaxBuyCnt5(short maxBuyCnt5) {
		this.maxBuyCnt5 = maxBuyCnt5;
	}

	public Integer getMaxBuyPrice() {
		return maxBuyPrice;
	}

	public void setMaxBuyPrice(Integer maxBuyPrice) {
		this.maxBuyPrice = maxBuyPrice;
	}

}