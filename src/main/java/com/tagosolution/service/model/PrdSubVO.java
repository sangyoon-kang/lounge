package com.tagosolution.service.model;

import java.util.List;

import com.tagoplus.model.GeneralModel;

/**
 * 상품 부가 정보 모델
 * @author wimy
 *
 */
public class PrdSubVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -3351734398420191559L;

	private Integer prdSubSeq;

    private Integer prdSeq;

    private String header;

    private String content;
    
    public Integer getPrdSubSeq() {
        return prdSubSeq;
    }

    public void setPrdSubSeq(Integer prdSubSeq) {
        this.prdSubSeq = prdSubSeq;
    }

    public Integer getPrdSeq() {
        return prdSeq;
    }

    public void setPrdSeq(Integer prdSeq) {
        this.prdSeq = prdSeq;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
        
}