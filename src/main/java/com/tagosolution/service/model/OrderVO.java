package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import java.math.BigDecimal;
import java.util.Date;

public class OrderVO implements GeneralModel {
	
	/**
	 * Created By sky line
	 */
	private static final long serialVersionUID = 1L;
	
    private Long orderSeq;

    private String userId;
    
    private Integer runTime;

    private Integer stopLimit;

	private String goodsDate;

    private String goodsTime;

    private Date resultTime;

    private String bsType;

    private String orderResult;

    private BigDecimal lot;

    private Integer profit;

    private Integer loss;
   
    private Integer deposit;
    
    private String gradeName;
    
    private String userName;
    
    private Integer lotPrice;
    
    private Integer profitPrice;
    
    private BigDecimal winLot;
    
    private Integer profitS;
    
    private BigDecimal lossLot;
    
    private Integer lossS;
    
    private Integer fxComm;
    
    private Integer dealerComm;
    
    private Integer dealerCommFee;
    
    private String years;
    
    private Integer profitLoss;
    
    private String yearsText;

	public Integer getStopLimit() {
		return stopLimit;
	}

	public void setStopLimit(Integer stopLimit) {
		this.stopLimit = stopLimit;
	}

	public String getYearsText() {
		return yearsText;
	}

	public void setYearsText(String yearsText) {
		this.yearsText = yearsText;
	}

	public BigDecimal getWinLot() {
		return winLot;
	}

	public void setWinLot(BigDecimal winLot) {
		this.winLot = winLot;
	}

	public BigDecimal getLossLot() {
		return lossLot;
	}

	public void setLossLot(BigDecimal lossLot) {
		this.lossLot = lossLot;
	}

	public Integer getProfitLoss() {
		return profitLoss;
	}

	public void setProfitLoss(Integer profitLoss) {
		this.profitLoss = profitLoss;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public Integer getDealerCommFee() {
		return dealerCommFee;
	}

	public void setDealerCommFee(Integer dealerCommFee) {
		this.dealerCommFee = dealerCommFee;
	}

	public Integer getProfitS() {
		return profitS;
	}

	public void setProfitS(Integer profitS) {
		this.profitS = profitS;
	}

	public Integer getLossS() {
		return lossS;
	}

	public void setLossS(Integer lossS) {
		this.lossS = lossS;
	}

	public Integer getFxComm() {
		return fxComm;
	}

	public void setFxComm(Integer fxComm) {
		this.fxComm = fxComm;
	}

	public Integer getDealerComm() {
		return dealerComm;
	}

	public void setDealerComm(Integer dealerComm) {
		this.dealerComm = dealerComm;
	}

	public Integer getDeposit() {
		return deposit;
	}

	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}
    public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getLotPrice() {
		return lotPrice;
	}

	public void setLotPrice(Integer lotPrice) {
		this.lotPrice = lotPrice;
	}

	public Integer getProfitPrice() {
		return profitPrice;
	}

	public void setProfitPrice(Integer profitPrice) {
		this.profitPrice = profitPrice;
	}

	public Long getOrderSeq() {
        return orderSeq;
    }

    public void setOrderSeq(Long orderSeq) {
        this.orderSeq = orderSeq;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public Date getResultTime() {
        return resultTime;
    }

    public void setResultTime(Date resultTime) {
        this.resultTime = resultTime;
    }

    public String getBsType() {
        return bsType;
    }

    public void setBsType(String bsType) {
        this.bsType = bsType;
    }

    public String getOrderResult() {
        return orderResult;
    }

    public void setOrderResult(String orderResult) {
        this.orderResult = orderResult;
    }

    public BigDecimal getLot() {
        return lot;
    }

    public void setLot(BigDecimal lot) {
        this.lot = lot;
    }

    public Integer getProfit() {
        return profit;
    }

    public void setProfit(Integer profit) {
        this.profit = profit;
    }

    public Integer getLoss() {
        return loss;
    }

    public void setLoss(Integer loss) {
        this.loss = loss;
    }
}