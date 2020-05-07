package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 배너그룹관리 모델
 *
 * @author kky
 */
public class AccountCheckVO implements GeneralModel {

    private static final long serialVersionUID = 6380757351023139445L;

    private String inqRsn = "10";    // 조회사유 - 10:회원가입 20:기존회원가입 30:성인인증 40:비회원확인 90:기타사유
    private String strGbn = "1";      // 1 : 개인, 2: 사업자
    private String service = "1";      //서비스구분 1=계좌소유주확인 2=계좌성명확인 3=계좌유효성확인
    private String strResId = "";     //생년월일(사업자 번호,법인번호)
    private String strNm = "";        //계좌소유주명
    private String strBankCode = "";  //은행코드(전문참조)
    private String strAccountNo = ""; //계좌번호
    private String svcGbn = "5";       //업무구분(전문참조) 5: 계좌 소유주 확인, 4: 계좌 유효성 , 2: 계좌 소유주 성명확인
    private String svcCls = "";      //내-외국인구분
    private String strOrderNo = "";   //주문번호 : 매 요청마다 중복되지 않도록 유의

    public String getInqRsn() {
        return inqRsn;
    }

    public void setInqRsn(String inqRsn) {
        this.inqRsn = inqRsn;
    }

    public String getStrGbn() {
        return strGbn;
    }

    public void setStrGbn(String strGbn) {
        this.strGbn = strGbn;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getStrResId() {
        return strResId;
    }

    public void setStrResId(String strResId) {
        this.strResId = strResId;
    }

    public String getStrNm() {
        return strNm;
    }

    public void setStrNm(String strNm) {
        this.strNm = strNm;
    }

    public String getStrBankCode() {
        return strBankCode;
    }

    public void setStrBankCode(String strBankCode) {
        this.strBankCode = strBankCode;
    }

    public String getStrAccountNo() {
        return strAccountNo;
    }

    public void setStrAccountNo(String strAccountNo) {
        this.strAccountNo = strAccountNo;
    }

    public String getSvcGbn() {
        return svcGbn;
    }

    public void setSvcGbn(String svcGbn) {
        this.svcGbn = svcGbn;
    }

    public String getSvcCls() {
        return svcCls;
    }

    public void setSvcCls(String svcCls) {
        this.svcCls = svcCls;
    }

    public String getStrOrderNo() {
        return strOrderNo;
    }

    public void setStrOrderNo(String strOrderNo) {
        this.strOrderNo = strOrderNo;
    }
}