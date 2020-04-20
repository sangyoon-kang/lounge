package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class GoodsVO implements GeneralModel {
	
	/**
	 * sky line 2019-05-24.
	 */
	private static final long serialVersionUID = -1L;

	private Integer runTime;
	
	private String goodsDate;
	
	private String goodsTime;
	
    private String goodsResult;

    private Integer buyLot1Total;

    private Integer buyLot2Total;

    private Integer buyLot10Total;

    private Integer buyLot20Total;

	private Integer buyLot40Total;

    private Integer sellLot1Total;

    private Integer sellLot2Total;

    private Integer sellLot10Total;

    private Integer sellLot20Total;

	private Integer sellLot40Total;

    private String buyLot1State;

    private String buyLot2State;

    private String buyLot10State;

    private String buyLot20State;

	private String buyLot40State;

    private String sellLot1State;

    private String sellLot2State;

    private String sellLot10State;

    private String sellLot20State;

	private String sellLot40State;

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
	
	private String buyLot1Remain;
	private String buyLot2Remain;
	private String buyLot10Remain;
	private String buyLot20Remain;
	private String buyLot40Remain;
	private String sellLot1Remain;
	private String sellLot2Remain;
	private String sellLot10Remain;
	private String sellLot20Remain;
	private String sellLot40Remain;
	
	
	private String runType;
	private String apiState;
	private String buyLot1Check;
	private String buyLot2Check;
	private String buyLot10Check;
	private String buyLot20Check;
	private String buyLot40Check;
	private String sellLot1Check;
	private String sellLot2Check;
	private String sellLot10Check;
	private String sellLot20Check;
	private String sellLot40Check;
	
	
	
	
	

	public String getRunType() {
		return runType;
	}

	public void setRunType(String runType) {
		this.runType = runType;
	}

	public String getApiState() {
		return apiState;
	}

	public void setApiState(String apiState) {
		this.apiState = apiState;
	}

	public String getBuyLot1Check() {
		return buyLot1Check;
	}

	public void setBuyLot1Check(String buyLot1Check) {
		this.buyLot1Check = buyLot1Check;
	}

	public String getBuyLot2Check() {
		return buyLot2Check;
	}

	public void setBuyLot2Check(String buyLot2Check) {
		this.buyLot2Check = buyLot2Check;
	}

	public String getBuyLot10Check() {
		return buyLot10Check;
	}

	public void setBuyLot10Check(String buyLot101Check) {
		this.buyLot10Check = buyLot101Check;
	}

	public String getBuyLot20Check() {
		return buyLot20Check;
	}

	public void setBuyLot20Check(String buyLot20Check) {
		this.buyLot20Check = buyLot20Check;
	}

	public String getBuyLot40Check() {
		return buyLot40Check;
	}

	public void setBuyLot40Check(String buyLot40Check) {
		this.buyLot40Check = buyLot40Check;
	}

	public String getSellLot1Check() {
		return sellLot1Check;
	}

	public void setSellLot1Check(String sellLot1Check) {
		this.sellLot1Check = sellLot1Check;
	}

	public String getSellLot2Check() {
		return sellLot2Check;
	}

	public void setSellLot2Check(String sellLot2Check) {
		this.sellLot2Check = sellLot2Check;
	}

	public String getSellLot10Check() {
		return sellLot10Check;
	}

	public void setSellLot10Check(String sellLot10Check) {
		this.sellLot10Check = sellLot10Check;
	}

	public String getSellLot20Check() {
		return sellLot20Check;
	}

	public void setSellLot20Check(String sellLot20Check) {
		this.sellLot20Check = sellLot20Check;
	}

	public String getSellLot40Check() {
		return sellLot40Check;
	}

	public void setSellLot40Check(String sellLot40Check) {
		this.sellLot40Check = sellLot40Check;
	}

	public String getBuyLot1Remain() {
		return buyLot1Remain;
	}

	public void setBuyLot1Remain(String buyLot1Remain) {
		this.buyLot1Remain = buyLot1Remain;
	}

	public String getBuyLot2Remain() {
		return buyLot2Remain;
	}

	public void setBuyLot2Remain(String buyLot2Remain) {
		this.buyLot2Remain = buyLot2Remain;
	}

	public String getBuyLot10Remain() {
		return buyLot10Remain;
	}

	public void setBuyLot10Remain(String buyLot10Remain) {
		this.buyLot10Remain = buyLot10Remain;
	}

	public String getBuyLot20Remain() {
		return buyLot20Remain;
	}

	public void setBuyLot20Remain(String buyLot20Remain) {
		this.buyLot20Remain = buyLot20Remain;
	}

	public String getBuyLot40Remain() {
		return buyLot40Remain;
	}

	public void setBuyLot40Remain(String buyLot40Remain) {
		this.buyLot40Remain = buyLot40Remain;
	}

	public String getSellLot1Remain() {
		return sellLot1Remain;
	}

	public void setSellLot1Remain(String sellLot1Remain) {
		this.sellLot1Remain = sellLot1Remain;
	}

	public String getSellLot2Remain() {
		return sellLot2Remain;
	}

	public void setSellLot2Remain(String sellLot2Remain) {
		this.sellLot2Remain = sellLot2Remain;
	}

	public String getSellLot10Remain() {
		return sellLot10Remain;
	}

	public void setSellLot10Remain(String sellLot10Remain) {
		this.sellLot10Remain = sellLot10Remain;
	}

	public String getSellLot20Remain() {
		return sellLot20Remain;
	}

	public void setSellLot20Remain(String sellLot20Remain) {
		this.sellLot20Remain = sellLot20Remain;
	}

	public String getSellLot40Remain() {
		return sellLot40Remain;
	}

	public void setSellLot40Remain(String sellLot40Remain) {
		this.sellLot40Remain = sellLot40Remain;
	}

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

    private String goodsResultText;
    
    public String getGoodsResultText() {
		return goodsResultText;
	}

	public void setGoodsResultText(String goodsResultText) {
		this.goodsResultText = goodsResultText;
	}
	
	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public Integer getRunTime() {
        return runTime;
    }

	public String getGoodsDate() {
		return goodsDate;
	}

	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}

	public String getGoodsTime() {
		return goodsTime;
	}

	public void setGoodsTime(String goodsTime) {
		this.goodsTime = goodsTime;
	}

    public String getGoodsResult() {
        return goodsResult;
    }

    public void setGoodsResult(String goodsResult) {
        this.goodsResult = goodsResult;
    }

    public Integer getBuyLot1Total() {
        return buyLot1Total;
    }

    public void setBuyLot1Total(Integer buyLot1Total) {
        this.buyLot1Total = buyLot1Total;
    }

    public Integer getBuyLot2Total() {
        return buyLot2Total;
    }

    public void setBuyLot2Total(Integer buyLot2Total) {
        this.buyLot2Total = buyLot2Total;
    }

    public Integer getBuyLot10Total() {
        return buyLot10Total;
    }

    public void setBuyLot10Total(Integer buyLot10Total) {
        this.buyLot10Total = buyLot10Total;
    }

    public Integer getBuyLot20Total() {
        return buyLot20Total;
    }

    public void setBuyLot20Total(Integer buyLot20Total) {
        this.buyLot20Total = buyLot20Total;
    }

	public Integer getBuyLot40Total() {
        return buyLot40Total;
    }

    public void setBuyLot40Total(Integer buyLot40Total) {
        this.buyLot40Total = buyLot40Total;
    }

    public Integer getSellLot1Total() {
        return sellLot1Total;
    }

    public void setSellLot1Total(Integer sellLot1Total) {
        this.sellLot1Total = sellLot1Total;
    }

    public Integer getSellLot2Total() {
        return sellLot2Total;
    }

    public void setSellLot2Total(Integer sellLot2Total) {
        this.sellLot2Total = sellLot2Total;
    }

    public Integer getSellLot10Total() {
        return sellLot10Total;
    }

    public void setSellLot10Total(Integer sellLot10Total) {
        this.sellLot10Total = sellLot10Total;
    }

    public Integer getSellLot20Total() {
        return sellLot20Total;
    }

    public void setSellLot20Total(Integer sellLot20Total) {
        this.sellLot20Total = sellLot20Total;
    }

	public Integer getSellLot40Total() {
        return sellLot40Total;
    }

    public void setSellLot40Total(Integer sellLot40Total) {
        this.sellLot40Total = sellLot40Total;
    }

    public String getBuyLot1State() {
        return buyLot1State;
    }

    public void setBuyLot1State(String buyLot1State) {
        this.buyLot1State = buyLot1State;
    }

    public String getBuyLot2State() {
        return buyLot2State;
    }

    public void setBuyLot2State(String buyLot2State) {
        this.buyLot2State = buyLot2State;
    }

    public String getBuyLot10State() {
        return buyLot10State;
    }

    public void setBuyLot10State(String buyLot10State) {
        this.buyLot10State = buyLot10State;
    }

    public String getBuyLot20State() {
        return buyLot20State;
    }

    public void setBuyLot20State(String buyLot20State) {
        this.buyLot20State = buyLot20State;
    }

    public String getBuyLot40State() {
        return buyLot40State;
    }

    public void setBuyLot40State(String buyLot40State) {
        this.buyLot40State = buyLot40State;
    }

    public String getSellLot1State() {
        return sellLot1State;
    }

    public void setSellLot1State(String sellLot1State) {
        this.sellLot1State = sellLot1State;
    }

    public String getSellLot2State() {
        return sellLot2State;
    }

    public void setSellLot2State(String sellLot2State) {
        this.sellLot2State = sellLot2State;
    }

    public String getSellLot10State() {
        return sellLot10State;
    }

    public void setSellLot10State(String sellLot10State) {
        this.sellLot10State = sellLot10State;
    }

    public String getSellLot20State() {
        return sellLot20State;
    }

    public void setSellLot20State(String sellLot20State) {
        this.sellLot20State = sellLot20State;
    }

    public String getSellLot40State() {
        return sellLot40State;
    }

    public void setSellLot40State(String sellLot40State) {
        this.sellLot40State = sellLot40State;
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