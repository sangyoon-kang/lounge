package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.util.StringUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SiteVO implements GeneralModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 939760524933016267L;
	
	private boolean isNew;
	
	private Byte siteSeq;

	private String siteName;
	
	private String siteDomain;
	
	private String email;
	
	private String keyNumber;
	
	private String adminPhone;
	
	private String siteCertKey;
	
	private String adminMobile;
	
	private Date installDate;
	
	private String ftpAddr;
	
	private String ftpId;
	
	private String ftpPwd;
	
	private String adminTitleUrl;
	
	private String adminCopyright;
	
	private String addBoardYn;
	
	private String sslYn;
	
	private String sslPort;
	
	private String smsYn;
	
	private String smsKind;
	
	private String smsId;
	
	private String smsPwd;
	
	private String realCertYn;
	
	private String realCertId;
	
	private String realCertPwd;
	
	private String pointYn;
	
	private Integer pointLogin;
	
	private Integer pointView;
	
	private Integer pointWrite;
	
	private Integer pointComment;
	
	private Integer pointRecomm;
	
	private String pointNoMsg;
	
	private Integer pointDownload;
	
	private Integer pointJoin;
	
	private String suId;
	
	private String suPwd;
	
	private String dsId;
	
	private String dsPwd;
	
	private String adminStartPage;
	
	private String useMenu;
	
	private String footBusinessNumber;
	
	private String footBusinessName;
	
	private String footRepName;
	
	private String footInfoName;
	
	private String footZipcode;
	
	private String footAddr1;
	
	private String footCondition;
	
	private String footItem;
	
	private String footPhone;
	
	private String footFax;
	
	private String footAddr2;
	
	private String useMsg;
	
	private Date modDate;

	private String customerCenter;

	private String depositWithdrawalTelephone;

	private String businessHours;

	private String depositTime;

	private String withdrawalTime;

	private String personalInformationOfficer;

	private String orderMail;

	public String getPersonalInformationOfficer() {
		return personalInformationOfficer;
	}

	public void setPersonalInformationOfficer(String personalInformationOfficer) {
		this.personalInformationOfficer = personalInformationOfficer;
	}

	public String getOrderMail() {
		return orderMail;
	}

	public void setOrderMail(String orderMail) {
		this.orderMail = orderMail;
	}

	public String getCustomerCenter() {
		return customerCenter;
	}

	public void setCustomerCenter(String customerCenter) {
		this.customerCenter = customerCenter;
	}

	public String getDepositWithdrawalTelephone() {
		return depositWithdrawalTelephone;
	}

	public void setDepositWithdrawalTelephone(String depositWithdrawalTelephone) {
		this.depositWithdrawalTelephone = depositWithdrawalTelephone;
	}

	public String getBusinessHours() {
		return businessHours;
	}

	public void setBusinessHours(String businessHours) {
		this.businessHours = businessHours;
	}

	public String getDepositTime() {
		return depositTime;
	}

	public void setDepositTime(String depositTime) {
		this.depositTime = depositTime;
	}

	public String getWithdrawalTime() {
		return withdrawalTime;
	}

	public void setWithdrawalTime(String withdrawalTime) {
		this.withdrawalTime = withdrawalTime;
	}

	private boolean isCertified;
	private String checkedSu = "";
	private String checkedDs = "";
	
	//private List<FixedCodeVO> useMenusVO;
	
	private List<SiteMetaVO> siteMetaSeo;
	
	public List<SiteMetaVO> getSiteMetaSeo() {
		if (this.siteMetaSeo == null)
			this.siteMetaSeo = new ArrayList<SiteMetaVO>();
		return siteMetaSeo;
	}

	public void setSiteMetaSeo(List<SiteMetaVO> siteMetaSeo) {
		this.siteMetaSeo = siteMetaSeo;
	}
	

	/**
	 * 사이트 정보 신규 등록 여부
	 * @return
	 */
	public boolean isNew() {
		return isNew;
	}

	/**
	 * 사이트 정보 신규 등록 여부
	 * @param isNew
	 */
	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}
	
	
	public String getCheckedSu() {
		return checkedSu;
	}

	public void setCheckedSu(String checkedSu) {
		this.checkedSu = checkedSu;
	}

	public String getCheckedDs() {
		return checkedDs;
	}

	public void setCheckedDs(String checkedDs) {
		this.checkedDs = checkedDs;
	}

	
	
	public Byte getSiteSeq() {
		return siteSeq;
	}
	
	public void setSiteSeq(Byte siteSeq) {
		this.siteSeq = siteSeq;
	}
	
	public String getSiteName() {
		return siteName;
	}
	
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	
	public String getSiteDomain() {
		return siteDomain;
	}
	
	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getKeyNumber() {
		return keyNumber;
	}
	
	public void setKeyNumber(String keyNumber) {
		this.keyNumber = keyNumber;
	}
	
	public String getAdminPhone() {
		return adminPhone;
	}
	
	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}
	
	public String getSiteCertKey() {
		return siteCertKey;
	}
	
	public void setSiteCertKey(String siteCertKey) {
		this.siteCertKey = siteCertKey;
	}
	
	/**
	 * 인증 키 인증 여부
	 * @return
	 */
	public boolean isCertified() {
		return isCertified;
	}

	/**
	 * 인증 키 인증 여부
	 * @param isCertified
	 */
	public void setCertified(boolean isCertified) {
		this.isCertified = isCertified;
	}

	public String getAdminMobile() {
		return adminMobile;
	}
	
	public void setAdminMobile(String adminMobile) {
		this.adminMobile = adminMobile;
	}
	
	public Date getInstallDate() {
		return installDate;
	}
	
	public void setInstallDate(Date installDate) {
		this.installDate = installDate;
	}
	
	public String getFtpAddr() {
		return ftpAddr;
	}
	
	public void setFtpAddr(String ftpAddr) {
		this.ftpAddr = ftpAddr;
	}
	
	public String getFtpId() {
		return ftpId;
	}
	
	public void setFtpId(String ftpId) {
		this.ftpId = ftpId;
	}
	
	public String getFtpPwd() {
		return ftpPwd;
	}
	
	public void setFtpPwd(String ftpPwd) {
		this.ftpPwd = ftpPwd;
	}
	
	public String getAdminTitleUrl() {
		return adminTitleUrl;
	}
	
	public void setAdminTitleUrl(String adminTitleUrl) {
		this.adminTitleUrl = adminTitleUrl;
	}
	
	public String getAdminCopyright() {
		return adminCopyright;
	}
	
	public void setAdminCopyright(String adminCopyright) {
		this.adminCopyright = adminCopyright;
	}
	
	public String getAddBoardYn() {
		return addBoardYn;
	}
	
	public void setAddBoardYn(String addBoardYn) {
		this.addBoardYn = addBoardYn;
	}
	
	public String getSslYn() {
		return sslYn;
	}
	
	public void setSslYn(String sslYn) {
		this.sslYn = sslYn;
	}
	
	public String getSslPort() {
		return sslPort;
	}
	
	public void setSslPort(String sslPort) {
		this.sslPort = sslPort;
	}
	
	public String getSmsYn() {
		return smsYn;
	}
	
	public void setSmsYn(String smsYn) {
		this.smsYn = smsYn;
	}
	
	public String getSmsKind() {
		return smsKind;
	}
	
	public void setSmsKind(String smsKind) {
		this.smsKind = smsKind;
	}
	
	public String getSmsId() {
		return smsId;
	}
	
	public void setSmsId(String smsId) {
		this.smsId = smsId;
	}
	
	public String getSmsPwd() {
		return smsPwd;
	}
	
	public void setSmsPwd(String smsPwd) {
		this.smsPwd = smsPwd;
	}
	
	public String getRealCertYn() {
		return realCertYn;
	}
	
	public void setRealCertYn(String realCertYn) {
		this.realCertYn = realCertYn;
	}
	
	public String getRealCertId() {
		return realCertId;
	}
	
	public void setRealCertId(String realCertId) {
		this.realCertId = realCertId;
	}
	
	public String getRealCertPwd() {
		return realCertPwd;
	}
	
	public void setRealCertPwd(String realCertPwd) {
		this.realCertPwd = realCertPwd;
	}
	
	public String getPointYn() {
		return pointYn;
	}
	
	public void setPointYn(String pointYn) {
		this.pointYn = pointYn;
	}
	
	public Integer getPointLogin() {
		return pointLogin;
	}
	
	public void setPointLogin(Integer pointLogin) {
		this.pointLogin = pointLogin;
	}
	
	public Integer getPointView() {
		return pointView;
	}
	
	public void setPointView(Integer pointView) {
		this.pointView = pointView;
	}
	
	public Integer getPointWrite() {
		return pointWrite;
	}
	
	public void setPointWrite(Integer pointWrite) {
		this.pointWrite = pointWrite;
	}
	
	public Integer getPointComment() {
		return pointComment;
	}
	
	public void setPointComment(Integer pointComment) {
		this.pointComment = pointComment;
	}
	
	public Integer getPointRecomm() {
		return pointRecomm;
	}
	
	public void setPointRecomm(Integer pointRecomm) {
		this.pointRecomm = pointRecomm;
	}
	
	public String getPointNoMsg() {
		return pointNoMsg;
	}
	
	public void setPointNoMsg(String pointNoMsg) {
		this.pointNoMsg = pointNoMsg;
	}
	
	public Integer getPointDownload() {
		return pointDownload;
	}
	
	public void setPointDownload(Integer pointDownload) {
		this.pointDownload = pointDownload;
	}
	
	public Integer getPointJoin() {
		return pointJoin;
	}
	
	public void setPointJoin(Integer pointJoin) {
		this.pointJoin = pointJoin;
	}
	
	public String getSuId() {
		return suId;
	}
	
	public void setSuId(String suId) {
		this.suId = suId;
	}
	
	public String getSuPwd() {
		return suPwd;
	}
	
	public void setSuPwd(String suPwd) {
		this.suPwd = suPwd;
	}
	
	
	
	public String getDsId() {
		return dsId;
	}

	public void setDsId(String dsId) {
		this.dsId = dsId;
	}

	public String getDsPwd() {
		return dsPwd;
	}

	public void setDsPwd(String dsPwd) {
		this.dsPwd = dsPwd;
	}

	public String getAdminStartPage() {
		return adminStartPage;
	}
	
	public void setAdminStartPage(String adminStartPage) {
		this.adminStartPage = adminStartPage;
	}
	
	public String getUseMenu() {
		return useMenu;
	}
	
	public void setUseMenu(String useMenu) {
		this.useMenu = useMenu;
	}
	
	/**
	 * [읽기전용] 사용 가능 메뉴 배열
	 * @return
	 */
	public String[] getUseMenus() {
		if (StringUtil.isEmpty(this.getUseMenu()))
			return null;
		else
			return this.getUseMenu().split(",");
	}
	
	public String getFootBusinessNumber() {
		return footBusinessNumber;
	}
	
	public void setFootBusinessNumber(String footBusinessNumber) {
		this.footBusinessNumber = footBusinessNumber;
	}
	
	public String getFootBusinessName() {
		return footBusinessName;
	}
	
	public void setFootBusinessName(String footBusinessName) {
		this.footBusinessName = footBusinessName;
	}
	
	public String getFootRepName() {
		return footRepName;
	}
	
	public void setFootRepName(String footRepName) {
		this.footRepName = footRepName;
	}
	
	public String getFootInfoName() {
		return footInfoName;
	}
	
	public void setFootInfoName(String footInfoName) {
		this.footInfoName = footInfoName;
	}
	
	public String getFootZipcode() {
		return footZipcode;
	}
	
	public void setFootZipcode(String footZipcode) {
		this.footZipcode = footZipcode;
	}
	
	public String getFootAddr1() {
		return footAddr1;
	}
	
	public void setFootAddr1(String footAddr1) {
		this.footAddr1 = footAddr1;
	}
	
	public String getFootCondition() {
		return footCondition;
	}
	
	public void setFootCondition(String footCondition) {
		this.footCondition = footCondition;
	}
	
	public String getFootItem() {
		return footItem;
	}
	
	public void setFootItem(String footItem) {
		this.footItem = footItem;
	}
	
	public String getFootPhone() {
		return footPhone;
	}
	
	public void setFootPhone(String footPhone) {
		this.footPhone = footPhone;
	}
	
	public String getFootFax() {
		return footFax;
	}
	
	public void setFootFax(String footFax) {
		this.footFax = footFax;
	}
	
	public String getFootAddr2() {
		return footAddr2;
	}
	
	public void setFootAddr2(String footAddr2) {
		this.footAddr2 = footAddr2;
	}
	
	public String getUseMsg() {
		return useMsg;
	}
	
	public void setUseMsg(String useMsg) {
		this.useMsg = useMsg;
	}
	
	public Date getModDate() {
		return modDate;
	}
	
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

}