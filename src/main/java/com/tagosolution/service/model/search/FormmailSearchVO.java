package com.tagosolution.service.model.search;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.tagoplus.model.common.SearchVO;

/**
 * 폼메일 검색 모델
 * @author kky
 *
 */
public class FormmailSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4543990788362244851L;
	
	
	private int fseq;
	
	private int fiseq;
	
	private int fwseq;
	
	private int mailseq;
	
	private int num;
	
	private String user;

	private Long fileSeq;
	
	
	private String answerYn;
	
	private List<MultipartFile> formImg;
	
	private List<String> deleteFlag;
	
	private int preSeq;
	
	private int nextSeq;
	
	
	/**
	 * 폼메일 seq
	 * @return
	 */
	public int getFseq() {
		return fseq;
	}

	/**
	 * 폼메일 seq
	 * @param fseq
	 */
	public void setFseq(int fseq) {
		this.fseq = fseq;
	}

	/**
	 * 폼메일인포 seq
	 * @return
	 */
	public int getFiseq() {
		return fiseq;
	}

	/**
	 * 폼메일인포 seq
	 * @param fiseq
	 */
	public void setFiseq(int fiseq) {
		this.fiseq = fiseq;
	}
	
	/**
	 * 세부항목개수
	 * @return
	 */
	public int getNum() {
		return num;
	}
	
	/**
	 * 세부항목개수
	 * @param num
	 */
	public void setNum(int num) {
		this.num = num;
	}
	
	
	public List<MultipartFile> getFormImg() {
		return formImg;
	}


	public void setFormImg(List<MultipartFile> formImg) {
		this.formImg = formImg;
	}

	public List<String> getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(List<String> deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Long getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(Long fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	/**
	 * 항목 - 우선순위 현재seq
	 * @return
	 */
	public int getPreSeq() {
		return preSeq;
	}
	
	/**
	 * 항목 - 우선순위 현재seq
	 * @param preSeq
	 */
	public void setPreSeq(int preSeq) {
		this.preSeq = preSeq;
	}
	
	/**
	 * 항목 - 우선순위 이전다음seq
	 * @return
	 */
	public int getNextSeq() {
		return nextSeq;
	}
	
	/**
	 * 항목 - 우선순위 이전다음seq
	 * @param nextSeq
	 */
	public void setNextSeq(int nextSeq) {
		this.nextSeq = nextSeq;
	}


	public String getAnswerYn() {
		return answerYn;
	}

	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}

	public int getFwseq() {
		return fwseq;
	}

	public void setFwseq(int fwseq) {
		this.fwseq = fwseq;
	}

	public int getMailseq() {
		return mailseq;
	}

	public void setMailseq(int mailseq) {
		this.mailseq = mailseq;
	}
	
	
	
	

	
}
