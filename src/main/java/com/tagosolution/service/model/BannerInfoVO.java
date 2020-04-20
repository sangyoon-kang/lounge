package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 배너관리 모델
 * @author kky
 *
 */
public class BannerInfoVO implements GeneralModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1295630410300196505L;

	private Short bannerSeq;

    private Short bmSeq;

    private Short ordering;

    private String useYn;

    private String linkUrl;

    private String linkTarget;

    private String bannerType;

    private String body;
    
    
    private FileVO file;
    

    public Short getBannerSeq() {
        return bannerSeq;
    }

    public void setBannerSeq(Short bannerSeq) {
        this.bannerSeq = bannerSeq;
    }

    public Short getBmSeq() {
        return bmSeq;
    }

    public void setBmSeq(Short bmSeq) {
        this.bmSeq = bmSeq;
    }

    public Short getOrdering() {
        return ordering;
    }

    public void setOrdering(Short ordering) {
        this.ordering = ordering;
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

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkTarget() {
        return linkTarget;
    }

    public void setLinkTarget(String linkTarget) {
        this.linkTarget = linkTarget;
    }

    public String getBannerType() {
        return bannerType;
    }

    public void setBannerType(String bannerType) {
        this.bannerType = bannerType;
    }
    
    /**
     * [읽기전용]
     * 디자인방법
     * @return
     */
    public String getBannerTypeName() {
    	if (this.getBannerType().equals("I"))
    		return "이미지";
    	else if (this.getBannerType().equals("B"))
    		return "HTML";
    	else
    		return "";
    }
    
    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }


	public FileVO getFile() {
		if (this.file == null)
			this.file = new FileVO();
		return file;
	}

	public void setFile(FileVO file) {
		this.file = file;
	}
}