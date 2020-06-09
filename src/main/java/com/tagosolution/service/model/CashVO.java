package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.math.BigDecimal;
import java.util.Date;

public class CashVO implements GeneralModel {
	/**
	 * sky line
	 */
	private static final long serialVersionUID = 1L;
	
    private Integer cashSeq;

    private String userId;

    private Integer cash;
    
    private Integer oriPrice;
    
    private String regUser;

    private Date regDate;

    private String memo1;

    private Long mainSeq;
    
    private Integer dealerCount;
    
    private Integer userCount;
    
    private Long winCash;
    
    private Integer fxofficeCash;
    
    private Integer commiCash;
    
    private Integer commiCalculate;
    
    private String gradeName;
    
    private short gradeLevel;
    
    private String userName;
    
    private String nickName;
    
    private String phone;
    
    private String cashType;
    
    private Integer runTime;
    
    private String goodsDate;
    
    private String goodsTime;
    
    private BigDecimal lot;
    
    private String bsTypeText;
    
    private Integer profit;
    
    private Integer loss;
    
    private Long commission;
    
    private Long taxCommission;
    
    private String dateToday;
    
    private Integer transTotal;
    
    private Integer settleTotal;
    
    private Integer feeFor;

	private int rowNo;

	private int memCnt;

	public int getMemCnt() {
		return memCnt;
	}

	public void setMemCnt(int memCnt) {
		this.memCnt = memCnt;
	}

	public Integer getRowNo() {
		return rowNo;
	}

	public void setRowNo(Integer rowNo) {
		this.rowNo = rowNo;
	}

	public short getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(short gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public String getDateToday() {
		return dateToday;
	}

	public void setDateToday(String dateToday) {
		this.dateToday = dateToday;
	}

	public Integer getTransTotal() {
		return transTotal;
	}

	public void setTransTotal(Integer transTotal) {
		this.transTotal = transTotal;
	}

	public Integer getSettleTotal() {
		return settleTotal;
	}

	public void setSettleTotal(Integer settleTotal) {
		this.settleTotal = settleTotal;
	}

	public Integer getFeeFor() {
		return feeFor;
	}

	public void setFeeFor(Integer feeFor) {
		this.feeFor = feeFor;
	}

	public String getCashType() {
		return cashType;
	}

	public void setCashType(String cashType) {
		this.cashType = cashType;
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

	public BigDecimal getLot() {
		return lot;
	}

	public void setLot(BigDecimal lot) {
		this.lot = lot;
	}

	public String getBsTypeText() {
		return bsTypeText;
	}

	public void setBsTypeText(String bsTypeText) {
		this.bsTypeText = bsTypeText;
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

	public Long getCommission() {
		return commission;
	}

	public void setCommission(Long commission) {
		this.commission = commission;
	}

	public Long getTaxCommission() {
		return taxCommission;
	}

	public void setTaxCommission(Long taxCommission) {
		this.taxCommission = taxCommission;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getDealerCount() {
		return dealerCount;
	}

	public void setDealerCount(Integer dealerCount) {
		this.dealerCount = dealerCount;
	}

	public Integer getUserCount() {
		return userCount;
	}

	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}

	public Long getWinCash() {
		return winCash;
	}

	public void setWinCash(Long winCash) {
		this.winCash = winCash;
	}

	public Integer getFxofficeCash() {
		return fxofficeCash;
	}

	public void setFxofficeCash(Integer fxofficeCash) {
		this.fxofficeCash = fxofficeCash;
	}

	public Integer getCommiCash() {
		return commiCash;
	}

	public void setCommiCash(Integer commiCash) {
		this.commiCash = commiCash;
	}

	public Integer getCommiCalculate() {
		return commiCalculate;
	}

	public void setCommiCalculate(Integer commiCalculate) {
		this.commiCalculate = commiCalculate;
	}

	public Integer getCashSeq() {
        return cashSeq;
    }

    public void setCashSeq(Integer cashSeq) {
        this.cashSeq = cashSeq;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getCash() {
        return cash;
    }

    public void setCash(Integer cash) {
        this.cash = cash;
    }
    
    public Integer getOriPrice() {
        return oriPrice;
    }

    public void setOriPrice(Integer cash) {
        this.oriPrice = oriPrice;
    }
    
    public String getRegUser() {
        return regUser;
    }

    public void setRegUser(String regUser) {
        this.regUser = regUser;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getMemo1() {
        return memo1;
    }

    public void setMemo1(String memo1) {
        this.memo1 = memo1;
    }

	public Long getMainSeq() {
		return mainSeq;
	}

	public void setMainSeq(Long mainSeq) {
		this.mainSeq = mainSeq;
	}

}