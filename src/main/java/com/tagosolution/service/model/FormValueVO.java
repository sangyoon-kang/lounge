package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 항목 내용 모델
 * @author kky
 *
 */
public class FormValueVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 550995670086479731L;

	private Integer formValueSeq;

    private String formInfoName;

    private String formInfoValue;
    
    private Integer formWritingSeq;
    
    private String property;
    
    private List<String> nameValue;
    
    private List<String> phoneValue;
    
    private List<String> emailValue;
    
    private List<String> addressValue;
    
    private List<String> selectValue;
    
    private List<String> radioValue;
    
    private List<String> textValue;
    
    private List<String> checkboxValue;
    
    private List<String> textareaValue;
    
    private List<String> dateValue;
    
    private List<MultipartFile> fileValue;
    
    private List<Integer> chkCount;
    
    private List<String> formInfoValueArr;

    public Integer getFormValueSeq() {
        return formValueSeq;
    }

    public void setFormValueSeq(Integer formValueSeq) {
        this.formValueSeq = formValueSeq;
    }

    public String getFormInfoName() {
        return formInfoName;
    }

    public void setFormInfoName(String formInfoName) {
        this.formInfoName = formInfoName;
    }

    public String getFormInfoValue() {
        return formInfoValue;
    }

    public void setFormInfoValue(String formInfoValue) {
        this.formInfoValue = formInfoValue;
    }
    
    
    


	public List<String> getTextValue() {
		if (this.textValue == null)
			this.textValue = new ArrayList<String>();
		return textValue;
	}

	public void setTextValue(List<String> textValue) {
		this.textValue = textValue;
	}

	public List<String> getCheckboxValue() {
		if (this.checkboxValue == null)
			this.checkboxValue = new ArrayList<String>();
		return checkboxValue;
	}

	public void setCheckboxValue(List<String> checkboxValue) {
		this.checkboxValue = checkboxValue;
	}

	public List<String> getTextareaValue() {
		if (this.textareaValue == null)
			this.textareaValue = new ArrayList<String>();
		return textareaValue;
	}

	public void setTextareaValue(List<String> textareaValue) {
		this.textareaValue = textareaValue;
	}

	public List<String> getDateValue() {
		if (this.dateValue == null)
			this.dateValue = new ArrayList<String>();
		return dateValue;
	}

	public void setDateValue(List<String> dateValue) {
		this.dateValue = dateValue;
	}

	public List<MultipartFile> getFileValue() {
		return fileValue;
	}

	public void setFileValue(List<MultipartFile> fileValue) {
		this.fileValue = fileValue;
	}


	public List<String> getSelectValue() {
		if (this.selectValue == null)
			this.selectValue = new ArrayList<String>();
		return selectValue;
	}

	public void setSelectValue(List<String> selectValue) {
		this.selectValue = selectValue;
	}

	public List<String> getRadioValue() {
		if (this.radioValue == null)
			this.radioValue = new ArrayList<String>();
		return radioValue;
	}

	public void setRadioValue(List<String> radioValue) {
		this.radioValue = radioValue;
	}

	public List<Integer> getChkCount() {
		if (this.chkCount == null)
			this.chkCount = new ArrayList<Integer>();
		return chkCount;
	}

	public void setChkCount(List<Integer> chkCount) {
		this.chkCount = chkCount;
	}

	public List<String> getNameValue() {
		if (this.nameValue == null)
			this.nameValue = new ArrayList<String>();
		return nameValue;
	}

	public void setNameValue(List<String> nameValue) {
		this.nameValue = nameValue;
	}

	public List<String> getEmailValue() {
		if (this.emailValue == null)
			this.emailValue = new ArrayList<String>();
		return emailValue;
	}

	public void setEmailValue(List<String> emailValue) {
		this.emailValue = emailValue;
	}

	public List<String> getPhoneValue() {
		if (this.phoneValue == null)
			this.phoneValue = new ArrayList<String>();
		return phoneValue;
	}

	public void setPhoneValue(List<String> phoneValue) {
		this.phoneValue = phoneValue;
	}

	public List<String> getAddressValue() {
		if (this.addressValue == null)
			this.addressValue = new ArrayList<String>();
		return addressValue;
	}

	public void setAddressValue(List<String> addressValue) {
		this.addressValue = addressValue;
	}

	public List<String> getFormInfoValueArr() {
		if (this.formInfoValueArr == null)
			this.formInfoValueArr = new ArrayList<String>();
		return formInfoValueArr;
	}

	public void setFormInfoValueArr(List<String> formInfoValueArr) {
		this.formInfoValueArr = formInfoValueArr;
	}

	public Integer getFormWritingSeq() {
		return formWritingSeq;
	}

	public void setFormWritingSeq(Integer formWritingSeq) {
		this.formWritingSeq = formWritingSeq;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}


	

    
    
}