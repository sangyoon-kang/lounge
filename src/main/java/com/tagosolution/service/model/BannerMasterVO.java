package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 배너그룹관리 모델
 * @author kky
 *
 */
public class BannerMasterVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -6285620828425627959L;
	
	

	private Short bmSeq;

    private String masterCode;

    private String masterName;

    private String direction;

    private Short lfCount;

    private String margin;

    private String useYn;

    private int imgCount;
    
    public Short getBmSeq() {
        return bmSeq;
    }

    public void setBmSeq(Short bmSeq) {
        this.bmSeq = bmSeq;
    }

    public String getMasterCode() {
        return masterCode;
    }

    public void setMasterCode(String masterCode) {
        this.masterCode = masterCode;
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }
    
    /**
     * [읽기전용]
     * 배너 형태
     * @return
     */
    public String getDirectionName() {
    	if (this.getDirection().toUpperCase().equals("H"))
    		return "가로";
    	else if (this.getDirection().toUpperCase().equals("V"))
    		return "세로";
    	else
    		return "";
    }

    public Short getLfCount() {
        return lfCount;
    }

    public void setLfCount(Short lfCount) {
        this.lfCount = lfCount;
    }

    public String getMargin() {
        return margin;
    }

    public void setMargin(String margin) {
        this.margin = margin;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    
    /**
     * [읽기전용]
     * 배너사용여부
     * @return
     */
    public String getUseYnName() {
    	if (this.getUseYn().toUpperCase().equals("Y"))
    		return "사용함";
    	else if (this.getUseYn().toUpperCase().equals("N"))
    		return "사용안함";
    	else
    		return "";
    }

	public int getImgCount() {
		return imgCount;
	}

	public void setImgCount(int imgCount) {
		this.imgCount = imgCount;
	}
}