package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class GoodsBaseVO implements GeneralModel {
	
	 /**
	 * sky line 2019-05-23.
	 */
	private static final long serialVersionUID = -1L;
	
	private Byte siteSeq;
	
	private Integer runTime;
	
    private Integer buyLot1;

    private Integer buyLot2;

    private Integer buyLot10;

    private Integer buyLot20;

	private Integer buyLot40;

    private Integer sellLot1;

    private Integer sellLot2;

    private Integer sellLot10;

    private Integer sellLot20;

	private Integer sellLot40;

    private Integer autoClose1;

    private Integer autoClose2;

    private Integer autoClose10;

    private Integer autoClose20;

    private Integer autoClose40;

    public Integer getAutoClose1() {
        return autoClose1;
    }

    public void setAutoClose1(Integer autoClose1) {
        this.autoClose1 = autoClose1;
    }

    public Integer getAutoClose2() {
        return autoClose2;
    }

    public void setAutoClose2(Integer autoClose2) {
        this.autoClose2 = autoClose2;
    }

    public Integer getAutoClose10() {
        return autoClose10;
    }

    public void setAutoClose10(Integer autoClose10) {
        this.autoClose10 = autoClose10;
    }

    public Integer getAutoClose20() {
        return autoClose20;
    }

    public void setAutoClose20(Integer autoClose20) {
        this.autoClose20 = autoClose20;
    }

    public Integer getAutoClose40() {
        return autoClose40;
    }

    public void setAutoClose40(Integer autoClose40) {
        this.autoClose40 = autoClose40;
    }

    public Byte getSiteSeq() {
		return siteSeq;
	}

	public void setSiteSeq(Byte siteSeq) {
		this.siteSeq = siteSeq;
	}
	
	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public Integer getRunTime() {
        return runTime;
    }

	public Integer getBuyLot1() {
        return buyLot1;
    }
	
    public void setBuyLot1(Integer buyLot1) {
        this.buyLot1 = buyLot1;
    }

    public Integer getBuyLot2() {
        return buyLot2;
    }

    public void setBuyLot2(Integer buyLot2) {
        this.buyLot2 = buyLot2;
    }

    public Integer getBuyLot10() {
        return buyLot10;
    }

    public void setBuyLot10(Integer buyLot10) {
        this.buyLot10 = buyLot10;
    }

    public Integer getBuyLot20() {
        return buyLot20;
    }

    public void setBuyLot20(Integer buyLot20) {
        this.buyLot20 = buyLot20;
    }

	public Integer getBuyLot40() {
        return buyLot40;
    }

    public void setBuyLot40(Integer buyLot40) {
        this.buyLot40 = buyLot40;
    }

    public Integer getSellLot1() {
        return sellLot1;
    }

    public void setSellLot1(Integer sellLot1) {
        this.sellLot1 = sellLot1;
    }

    public Integer getSellLot2() {
        return sellLot2;
    }

    public void setSellLot2(Integer sellLot2) {
        this.sellLot2 = sellLot2;
    }

    public Integer getSellLot10() {
        return sellLot10;
    }

    public void setSellLot10(Integer sellLot10) {
        this.sellLot10 = sellLot10;
    }

    public Integer getSellLot20() {
        return sellLot20;
    }

    public void setSellLot20(Integer sellLot20) {
        this.sellLot20 = sellLot20;
    }

	public Integer getSellLot40() {
        return sellLot40;
    }

    public void setSellLot40(Integer sellLot40) {
        this.sellLot40 = sellLot40;
    }
}