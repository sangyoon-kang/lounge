package com.tagosolution.service.model;

import java.util.ArrayList;
import java.util.List;

import com.tagoplus.model.GeneralModel;

/**
 * 폼메일 항목 모델
 * @author kky
 *
 */
public class FormInfoVO implements GeneralModel {


	/**
	 * 
	 */
	private static final long serialVersionUID = 2844420854603860044L;

	private Integer formInfoSeq;

    private Integer formSeq;

    private String formInfoName;

    private String property;

    private Integer size;

    private Integer detailCount;

    private String detailName;
    
    private Short ordering;

    private String requiredYn;
    
    private List<String> detailNameArray;
    
    
    private String saveFile;
    
    private FormValueVO valueVO;
    
    public Integer getFormInfoSeq() {
        return formInfoSeq;
    }

    public void setFormInfoSeq(Integer formInfoSeq) {
        this.formInfoSeq = formInfoSeq;
    }

    public Integer getFormSeq() {
        return formSeq;
    }

    public void setFormSeq(Integer formSeq) {
        this.formSeq = formSeq;
    }

    public String getFormInfoName() {
        return formInfoName;
    }

    public void setFormInfoName(String formInfoName) {
        this.formInfoName = formInfoName;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getDetailCount() {
        return detailCount;
    }

    public void setDetailCount(Integer detailCount) {
        this.detailCount = detailCount;
    }

    public String getRequiredYn() {
        return requiredYn;
    }

    public void setRequiredYn(String requiredYn) {
        this.requiredYn = requiredYn;
    }

	public String getDetailName() {
		return detailName;
	}

	public void setDetailName(String detailName) {
		this.detailName = detailName;
	}

	public List<String> getDetailNameArray() {
		if (this.detailNameArray == null)
			this.detailNameArray = new ArrayList<String>();
		return detailNameArray;
	}

	public void setDetailNameArray(List<String> detailNameArray) {
		this.detailNameArray = detailNameArray;
	}

	public Short getOrdering() {
		return ordering;
	}

	public void setOrdering(Short ordering) {
		this.ordering = ordering;
	}

	public String getSaveFile() {
		return saveFile;
	}

	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	
	public FormValueVO getValueVO() {
		if (this.valueVO == null)
			this.valueVO = new FormValueVO();
		return valueVO;
	}

	public void setValueVO(FormValueVO valueVO) {
		this.valueVO = valueVO;
	}



	
}