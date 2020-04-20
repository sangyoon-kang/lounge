package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 배너그룹관리 모델
 * @author kky
 *
 */
public class BankVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -6285620828425627959L;
	
	private Short bankSeq;

    private String bankFixedCode;

    private String accountNo;

    private String accountName;
    
    private String codeName;
    
    public Short getbankSeq() {
        return bankSeq;
    }

    public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public void setbankSeq(Short bankSeq) {
        this.bankSeq = bankSeq;
    }

    public String getbankFixedCode() {
        return bankFixedCode;
    }

    public void setbankFixedCode(String bankFixedCode) {
        this.bankFixedCode = bankFixedCode;
    }

    public String getaccountNo() {
        return accountNo;
    }

    public void setaccountNo(String masteraccountNo) {
        this.accountNo = masteraccountNo;
    }

    public String getaccountName() {
        return accountName;
    }

    public void setaccountName(String accountName) {
        this.accountName = accountName;
    }
    
}