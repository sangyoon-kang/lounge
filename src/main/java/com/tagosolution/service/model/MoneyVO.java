package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import java.util.Date;

public class MoneyVO implements GeneralModel {
	
	/**
	 * Created By sky line
	 */
	private static final long serialVersionUID = 1L;
	
    private Integer moneySeq;

    private String userId;

    private String ioType;

    private Integer cash;

    private String bankName;

    private String accountNo;

    private String accountName;

    private Date regDate;

    private String state;

    private Date acceptDate;

    private String acceptId;

    private String depositName;

    private String memo;
    
    private Integer balance;

	private Integer bankSeq;
    
    private Integer memberCash;
    
    private Long cashR;
    
    private Long cashC;
    
    private Long cashA;
    
    private Integer stateR;
    
    private Integer stateC;
    
    private Integer stateA;
    
    private String ioTypeName;
    
    private String userName;
    
    private String gradeLevel;
    
    private String nickName;
    
    private String gradeName;
    
    private Long orderSeq;
    
    private String ioDate;
    
    private Integer iCount;
    
    private Integer iCash;
    
    private Integer oCount;
    
    private Integer oCash;
    
    private Integer totalCash;
    
    private String regYears;
    
    private String regYearsText;
    
    public String getRegYears() {
		return regYears;
	}

	public void setRegYears(String regYears) {
		this.regYears = regYears;
	}

	public String getRegYearsText() {
		return regYearsText;
	}

	public void setRegYearsText(String regYearsText) {
		this.regYearsText = regYearsText;
	}

	public String getIoDate() {
		return ioDate;
	}

	public void setIoDate(String ioDate) {
		this.ioDate = ioDate;
	}

	public Integer getiCount() {
		return iCount;
	}

	public void setiCount(Integer iCount) {
		this.iCount = iCount;
	}

	public Integer getiCash() {
		return iCash;
	}

	public void setiCash(Integer iCash) {
		this.iCash = iCash;
	}

	public Integer getoCount() {
		return oCount;
	}

	public void setoCount(Integer oCount) {
		this.oCount = oCount;
	}

	public Integer getoCash() {
		return oCash;
	}

	public void setoCash(Integer oCash) {
		this.oCash = oCash;
	}

	public Integer getTotalCash() {
		return totalCash;
	}

	public void setTotalCash(Integer totalCash) {
		this.totalCash = totalCash;
	}

	public Integer getBalance() {
		return balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(String gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public Long getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(Long orderSeq) {
		this.orderSeq = orderSeq;
	}

	public String getIoTypeName() {
		return ioTypeName;
	}

	public void setIoTypeName(String ioTypeName) {
		this.ioTypeName = ioTypeName;
	}

	public Long getCashR() {
		return cashR;
	}

	public void setCashR(Long cashR) {
		this.cashR = cashR;
	}

	public Long getCashC() {
		return cashC;
	}

	public void setCashC(Long cashC) {
		this.cashC = cashC;
	}

	public Long getCashA() {
		return cashA;
	}

	public void setCashA(Long cashA) {
		this.cashA = cashA;
	}

	public Integer getStateR() {
		return stateR;
	}

	public void setStateR(Integer stateR) {
		this.stateR = stateR;
	}

	public Integer getStateC() {
		return stateC;
	}

	public void setStateC(Integer stateC) {
		this.stateC = stateC;
	}

	public Integer getStateA() {
		return stateA;
	}

	public void setStateA(Integer stateA) {
		this.stateA = stateA;
	}

	public Integer getMemberCash() {
		return memberCash;
	}

	public void setMemberCash(Integer memberCash) {
		this.memberCash = memberCash;
	}

	public Integer getBankSeq() {
		return bankSeq;
	}

	public void setBankSeq(Integer bankSeq) {
		this.bankSeq = bankSeq;
	}

	public Integer getMoneySeq() {
        return moneySeq;
    }

    public void setMoneySeq(Integer moneySeq) {
        this.moneySeq = moneySeq;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getIoType() {
        return ioType;
    }

    public void setIoType(String ioType) {
        this.ioType = ioType;
    }

    public Integer getCash() {
        return cash;
    }

    public void setCash(Integer cash) {
        this.cash = cash;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getAcceptDate() {
        return acceptDate;
    }

    public void setAcceptDate(Date acceptDate) {
        this.acceptDate = acceptDate;
    }

    public String getAcceptId() {
        return acceptId;
    }

    public void setAcceptId(String acceptId) {
        this.acceptId = acceptId;
    }

    public String getDepositName() {
        return depositName;
    }

    public void setDepositName(String depositName) {
        this.depositName = depositName;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}