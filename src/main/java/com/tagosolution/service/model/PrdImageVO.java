package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 상품 이미지 모델
 * @author wimy
 *
 */
public class PrdImageVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -2678693916947475907L;

	private Integer prdImageSeq;

    private Integer prdSeq;

    private String originalFilename;

    private String saveFilename;

    private String listFilename;

    private String smallFilename;

    private String detailFilename;

    private String largeFilename;

    public Integer getPrdImageSeq() {
        return prdImageSeq;
    }

    public void setPrdImageSeq(Integer prdImageSeq) {
        this.prdImageSeq = prdImageSeq;
    }

    public Integer getPrdSeq() {
        return prdSeq;
    }

    public void setPrdSeq(Integer prdSeq) {
        this.prdSeq = prdSeq;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    public String getSaveFilename() {
        return saveFilename;
    }

    public void setSaveFilename(String saveFilename) {
        this.saveFilename = saveFilename;
    }

	public String getListFilename() {
		return listFilename;
	}

	public void setListFilename(String listFilename) {
		this.listFilename = listFilename;
	}

	public String getSmallFilename() {
		return smallFilename;
	}

	public void setSmallFilename(String smallFilename) {
		this.smallFilename = smallFilename;
	}

	public String getDetailFilename() {
		return detailFilename;
	}

	public void setDetailFilename(String detailFilename) {
		this.detailFilename = detailFilename;
	}

	public String getLargeFilename() {
		return largeFilename;
	}

	public void setLargeFilename(String largeFilename) {
		this.largeFilename = largeFilename;
	}

    
}