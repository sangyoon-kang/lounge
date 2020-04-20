package com.tagosolution.service.model;

import com.tagoplus.model.common.BaseFileVO;

public class FileVO extends BaseFileVO {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1280239252761194769L;

	private Long fileSeq;

    private String tableName;

    private String originalFilename;

    private String saveFilename;

    private String mimeType;

    //private Long refSeq;

    private int masterSeq;
    
    private Short ordering;

    private String uploadTypeFixedCode;

    private String refUserId;

    private String fileSize;

    //이미지 파일 체크
    private boolean isImageFile;
    
    
    public Long getFileSeq() {
        return fileSeq;
    }

    public void setFileSeq(Long fileSeq) {
        this.fileSeq = fileSeq;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
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

    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    
    public Short getOrdering() {
        return ordering;
    }

    public void setOrdering(Short ordering) {
        this.ordering = ordering;
    }

    public String getUploadTypeFixedCode() {
        return uploadTypeFixedCode;
    }

    public void setUploadTypeFixedCode(String uploadTypeFixedCode) {
        this.uploadTypeFixedCode = uploadTypeFixedCode;
    }

    public String getRefUserId() {
        return refUserId;
    }

    public void setRefUserId(String refUserId) {
        this.refUserId = refUserId;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

	public int getMasterSeq() {
		return masterSeq;
	}

	public void setMasterSeq(int masterSeq) {
		this.masterSeq = masterSeq;
	}
	
	/**
	 * 이미지 파일 여부
	 * @return
	 */
	public boolean getIsImageFile() {
		String sType = this.saveFilename.substring(this.saveFilename.lastIndexOf("."), this.saveFilename.length()); 
		String[] imageTypes = {"jpg", "bmp", "bmp", "gif"};
		
		for (String imageType : imageTypes) {
			if (sType.contains(imageType))
				return true;
		}
		
		return false;
	}
}