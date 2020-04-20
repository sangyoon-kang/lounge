package com.tagosolution.service.model;

import com.tagoplus.model.common.GeneralUserVO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberInfoVO extends GeneralUserVO {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -6360550051260811476L;

	private String userType;
	
	private Integer memberSeq;

    private Short gradeLevel;

    private String photo;

    private String icon;

    private String nickname;

    private String virtualNumber;

    private String compPhone;

    private String homepage;

    private String zipcode;

    private String addr1;

    private String addr2;

    private String emailYn;

    private String smsYn;

    private String birthDt;

    private String isLunar;

    private String recommUserId;
    
    private String bank;
    
    private String bankAccount;
    
    private String accountOwner;
    
    private String transEmailYn;
    
    private String gradeName;
    
    private Integer recommUlevel;
    
    private String recommUname;
    
    private String recommUsername;
    
    private String recommNickname;

    private Integer loginCount;

    private Date recentLoginDate;

    private String memo;

    private String memoAdmin;

    private Date pwdChangeDate;

    private Date regDate;

    private String withdrawalYn;

    private String useYn;
    
    private String withdrawalReason;
    
    private Date withdrawalDt;
    
    private Integer cash;
    
    private MultipartFile iconfile;
    
    private MultipartFile photofile;
    
    private List<MemberCMomeyVO> cmomey;
    
    private String additionalItem1;
    
    private String additionalItem2;
    
    private String additionalItem3;
    
    private String additionalItem4;
    
    private String additionalItem5;
   
    private String job;
    
    private String education;
    
    private String monthIncome;
    
    private String hobby;
    
    private MultipartFile etc1File;
    
    private MultipartFile etc2File;
    
    private MultipartFile etc3File;
    
    private MultipartFile etc4File;
    
    private MultipartFile etc5File;
    
    private String ipin;
    
    private String ipinDi;
    
    private Integer countBelong;
    
    private String snsType = "NORMAL";
    
    private Boolean snsYn = false;

	public String getSnsType() {
		return snsType;
	}

	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}

	public Boolean getSnsYn() {
		return snsYn;
	}

	public void setSnsYn(Boolean snsYn) {
		this.snsYn = snsYn;
	}

	public Integer getCountBelong() {
		return countBelong;
	}

	public void setCountBelong(Integer countBelong) {
		this.countBelong = countBelong;
	}

	public Integer getCash() {
		return cash;
	}

	public void setCash(Integer cash) {
		this.cash = cash;
	}

	public String getIpinDi() {
		return ipinDi;
	}

	public void setIpinDi(String ipinDi) {
		this.ipinDi = ipinDi;
	}
	
	public String getIpin() {
		return ipin;
	}

	public void setIpin(String ipin) {
		this.ipin = ipin;
	}

	public String getRecommNickname() {
		return recommNickname;
	}

	public void setRecommNickname(String recommNickname) {
		this.recommNickname = recommNickname;
	}

	public String getRecommUsername() {
		return recommUsername;
	}

	public void setRecommUsername(String recommUsername) {
		this.recommUsername = recommUsername;
	}

	public Integer getRecommUlevel() {
		return recommUlevel;
	}

	public void setRecommUlevel(Integer recommUlevel) {
		this.recommUlevel = recommUlevel;
	}

	public String getRecommUname() {
		return recommUname;
	}

	public void setRecommUname(String recommUname) {
		this.recommUname = recommUname;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getAccountOwner() {
		return accountOwner;
	}

	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}

	public String getTransEmailYn() {
		return transEmailYn;
	}

	public void setTransEmailYn(String transEmailYn) {
		this.transEmailYn = transEmailYn;
	}

	public MultipartFile getEtc2File() {
		return etc2File;
	}

	public void setEtc2File(MultipartFile etc2File) {
		this.etc2File = etc2File;
	}

	public MultipartFile getEtc3File() {
		return etc3File;
	}

	public void setEtc3File(MultipartFile etc3File) {
		this.etc3File = etc3File;
	}

	public MultipartFile getEtc4File() {
		return etc4File;
	}

	public void setEtc4File(MultipartFile etc4File) {
		this.etc4File = etc4File;
	}

	public MultipartFile getEtc5File() {
		return etc5File;
	}

	public void setEtc5File(MultipartFile etc5File) {
		this.etc5File = etc5File;
	}

	public MultipartFile getEtc1File() {
		return etc1File;
	}

	public void setEtc1File(MultipartFile etc1File) {
		this.etc1File = etc1File;
	}

	public String getAdditionalItem1() {
		return additionalItem1;
	}

	public void setAdditionalItem1(String additionalItem1) {
		this.additionalItem1 = additionalItem1;
	}

	public String getAdditionalItem2() {
		return additionalItem2;
	}

	public void setAdditionalItem2(String additionalItem2) {
		this.additionalItem2 = additionalItem2;
	}

	public String getAdditionalItem3() {
		return additionalItem3;
	}

	public void setAdditionalItem3(String additionalItem3) {
		this.additionalItem3 = additionalItem3;
	}

	public String getAdditionalItem4() {
		return additionalItem4;
	}

	public void setAdditionalItem4(String additionalItem4) {
		this.additionalItem4 = additionalItem4;
	}

	public String getAdditionalItem5() {
		return additionalItem5;
	}

	public void setAdditionalItem5(String additionalItem5) {
		this.additionalItem5 = additionalItem5;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getMonthIncome() {
		return monthIncome;
	}

	public void setMonthIncome(String monthIncome) {
		this.monthIncome = monthIncome;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public List<MemberCMomeyVO> getCmomey() {
		if (this.cmomey == null)
			this.cmomey = new ArrayList<MemberCMomeyVO>();
		return cmomey;
	}

	public void setCmomey(List<MemberCMomeyVO> cmomey) {
		this.cmomey = cmomey;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Integer getMemberSeq() {
        return memberSeq;
    }

    public void setMemberSeq(Integer memberSeq) {
        this.memberSeq = memberSeq;
    }

    public String getUserId() {
        return super.getUserID();
    }

    public void setUserId(String userId) {
        super.setUserID(userId);
    }

    public Short getGradeLevel() {
        return gradeLevel;
    }

    public void setGradeLevel(Short gradeLevel) {
        this.gradeLevel = gradeLevel;
    }

    public String getUserPwd() {
        return super.getPassword();
    }

    public void setUserPwd(String userPwd) {
        super.setPassword(userPwd);
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getVirtualNumber() {
        return virtualNumber;
    }

    public void setVirtualNumber(String virtualNumber) {
        this.virtualNumber = virtualNumber;
    }

    public String getCompPhone() {
        return compPhone;
    }

    public void setCompPhone(String compPhone) {
        this.compPhone = compPhone;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getEmailYn() {
        return emailYn;
    }

    public void setEmailYn(String emailYn) {
        this.emailYn = emailYn;
    }

    public String getSmsYn() {
        return smsYn;
    }

    public void setSmsYn(String smsYn) {
        this.smsYn = smsYn;
    }

    public String getBirthDt() {
        return birthDt;
    }

    public void setBirthDt(String birthDt) {
        this.birthDt = birthDt;
    }

    public String getIsLunar() {
        return isLunar;
    }

    public void setIsLunar(String isLunar) {
        this.isLunar = isLunar;
    }

    public String getRecommUserId() {
        return recommUserId;
    }

    public void setRecommUserId(String recommUserId) {
        this.recommUserId = recommUserId;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public Date getRecentLoginDate() {
        return recentLoginDate;
    }

    public void setRecentLoginDate(Date recentLoginDate) {
        this.recentLoginDate = recentLoginDate;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getMemoAdmin() {
        return memoAdmin;
    }

    public void setMemoAdmin(String memoAdmin) {
        this.memoAdmin = memoAdmin;
    }

    public Date getPwdChangeDate() {
        return pwdChangeDate;
    }

    public void setPwdChangeDate(Date pwdChangeDate) {
        this.pwdChangeDate = pwdChangeDate;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getWithdrawalYn() {
        return withdrawalYn;
    }

    public void setWithdrawalYn(String withdrawalYn) {
        this.withdrawalYn = withdrawalYn;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

	public String getWithdrawalReason() {
		return withdrawalReason;
	}

	public void setWithdrawalReason(String withdrawalReason) {
		this.withdrawalReason = withdrawalReason;
	}

	public Date getWithdrawalDt() {
		return withdrawalDt;
	}

	public void setWithdrawalDt(Date withdrawalDt) {
		this.withdrawalDt = withdrawalDt;
	}
	

    public MultipartFile getIconfile() {
		return iconfile;
	}

	public void setIconfile(MultipartFile iconfile) {
		this.iconfile = iconfile;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}
}