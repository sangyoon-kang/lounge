package com.tagosolution.service.model.search;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.tagoplus.model.common.SearchVO;

/**
 * 배너관리 검색모델
 * @author kky
 *
 */
public class BannerSearchVO extends SearchVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7047179206070385315L;
	
	
	private Short bseq;
	
	private String user;

	private Short biseq;
	
	private Long fseq;
	
	private String mcode;
	
	private List<MultipartFile> imgFile;

	private List<String> deleteFlag;
	
	
	/**
	 * 배너마스터 Seq
	 * @return
	 */
	public Short getBseq() {
		return bseq;
	}

	/**
	 * 배너마스터 Seq
	 * @param bseq
	 */
	public void setBseq(Short bseq) {
		this.bseq = bseq;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}
	
	/**
	 * 배너인포 Seq
	 * @return
	 */
	public Short getBiseq() {
		return biseq;
	}
	
	/**
	 * 배너인포 Seq
	 * @param biseq
	 */
	public void setBiseq(Short biseq) {
		this.biseq = biseq;
	}
	
	/**
	 * 파일 Seq
	 * @return
	 */
	public Long getFseq() {
		return fseq;
	}
	
	/**
	 * 파일 Seq
	 * @param fseq
	 */
	public void setFseq(Long fseq) {
		this.fseq = fseq;
	}

	
	public List<MultipartFile> getImgFile() {
		return imgFile;
	}

	public void setImgFile(List<MultipartFile> imgFile) {
		this.imgFile = imgFile;
	}
	
	/**
	 * 배너 마스터 코드
	 * @return
	 */
	public String getMcode() {
		return mcode;
	}

	/**
	 * 배너 마스터 코드
	 * @param mcode
	 */
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public List<String> getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(List<String> deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	

	
}
