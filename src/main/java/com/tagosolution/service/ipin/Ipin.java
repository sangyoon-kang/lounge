package com.tagosolution.service.ipin;

public class Ipin {
	private String sSiteCode, sSitePw, sReturnURL, sRtnMsg, sEncData, sCPRequest;
	private String m, enc_data, param_r1, param_r2, param_r3, sResponseData, sReservedParam1, sReservedParam2, sReservedParam3;
	private String EncodeData, sEncDataCheckPlus, sCertType;
	int iRtn;
	
	public String getsResponseData() {
		return sResponseData;
	}
	public void setsResponseData(String sResponseData) {
		this.sResponseData = sResponseData;
	}
	public String getsReservedParam1() {
		return sReservedParam1;
	}
	public void setsReservedParam1(String sReservedParam1) {
		this.sReservedParam1 = sReservedParam1;
	}
	public String getsReservedParam2() {
		return sReservedParam2;
	}
	public void setsReservedParam2(String sReservedParam2) {
		this.sReservedParam2 = sReservedParam2;
	}
	public String getsReservedParam3() {
		return sReservedParam3;
	}
	public void setsReservedParam3(String sReservedParam3) {
		this.sReservedParam3 = sReservedParam3;
	}
	public String getM() {
		return m;
	}
	public void setM(String m) {
		this.m = m;
	}
	public String getEncodeData() {
		return EncodeData;
	}
	public void setEncodeData(String EncodeData) {
		this.EncodeData = EncodeData;
	}
	public String getEnc_data() {
		return enc_data;
	}
	public void setEnc_data(String enc_data) {
		this.enc_data = enc_data;
	}
	public String getParam_r1() {
		return param_r1;
	}
	public void setParam_r1(String param_r1) {
		this.param_r1 = param_r1;
	}
	public String getParam_r2() {
		return param_r2;
	}
	public void setParam_r2(String param_r2) {
		this.param_r2 = param_r2;
	}
	public String getParam_r3() {
		return param_r3;
	}
	public void setParam_r3(String param_r3) {
		this.param_r3 = param_r3;
	}
	public String getsSiteCode() {
		return sSiteCode;
	}
	public void setsSiteCode(String sSiteCode) {
		this.sSiteCode = sSiteCode;
	}
	public String getsSitePw() {
		return sSitePw;
	}
	public void setsSitePw(String sSitePw) {
		this.sSitePw = sSitePw;
	}
	public String getsReturnURL() {
		return sReturnURL;
	}
	public void setsReturnURL(String sReturnURL) {
		this.sReturnURL = sReturnURL;
	}
	public String getsRtnMsg() {
		return sRtnMsg;
	}
	public void setsRtnMsg(String sRtnMsg) {
		this.sRtnMsg = sRtnMsg;
	}
	public String getsEncData() {
		return sEncData;
	}
	public void setsEncData(String sEncData) {
		this.sEncData = sEncData;
	}
	public String getsEncDataCheckPlus() {
		return sEncDataCheckPlus;
	}
	public void setsEncDataCheckPlus(String sEncDataCheckPlus) {
		this.sEncDataCheckPlus = sEncDataCheckPlus;
	}
	public String getsCPRequest() {
		return sCPRequest;
	}
	public void setsCPRequest(String sCPRequest) {
		this.sCPRequest = sCPRequest;
	}
	public int getiRtn() {
		return iRtn;
	}
	public void setiRtn(int iRtn) {
		this.iRtn = iRtn;
	};
	public String getsCertType() {
		return sCertType;
	}
	public void setsCertType(String sCertType) {
		this.sCertType = sCertType;
	}
}