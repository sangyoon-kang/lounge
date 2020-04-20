package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.util.StringUtil;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 폼메일 모델
 * @author kky
 *
 */
public class FormVO implements GeneralModel {


	/**
	 * 
	 */
	private static final long serialVersionUID = -111477097609213892L;

	private Integer formSeq;

    private String formCode;

    private String formName;

    private String termsYn;

    private String termsBody;

    private String cssPrefix;

    private String boardReceiveYn;

    private String emailReceiveYn;

    private String smsReceiveYn;

    private String emailReceive;

    private String smsReceive;

    private String regUser;

    private Date regDate;

   
   

    public Integer getFormSeq() {
        return formSeq;
    }

    public void setFormSeq(Integer formSeq) {
        this.formSeq = formSeq;
    }

    public String getFormCode() {
        return formCode;
    }

    public void setFormCode(String formCode) {
        this.formCode = formCode;
    }

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public String getTermsYn() {
        return termsYn;
    }

    public void setTermsYn(String termsYn) {
        this.termsYn = termsYn;
    }

    public String getTermsBody() {
        return termsBody;
    }

    public void setTermsBody(String termsBody) {
        this.termsBody = termsBody;
    }

    public String getCssPrefix() {
        return cssPrefix;
    }

    public void setCssPrefix(String cssPrefix) {
        this.cssPrefix = cssPrefix;
    }

    public String getBoardReceiveYn() {
        return boardReceiveYn;
    }

    public void setBoardReceiveYn(String boardReceiveYn) {
        this.boardReceiveYn = boardReceiveYn;
    }

    public String getEmailReceiveYn() {
        return emailReceiveYn;
    }

    public void setEmailReceiveYn(String emailReceiveYn) {
        this.emailReceiveYn = emailReceiveYn;
    }

    public String getSmsReceiveYn() {
        return smsReceiveYn;
    }

    public void setSmsReceiveYn(String smsReceiveYn) {
        this.smsReceiveYn = smsReceiveYn;
    }

    public String getEmailReceive() {
        return emailReceive;
    }

    public void setEmailReceive(String emailReceive) {
        this.emailReceive = emailReceive;
    }

    public String getSmsReceive() {
        return smsReceive;
    }

    public void setSmsReceive(String smsReceive) {
        this.smsReceive = smsReceive;
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

	


}