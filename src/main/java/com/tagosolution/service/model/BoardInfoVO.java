package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.model.common.MailAddressVO;
import com.tagoplus.model.common.PhoneVO;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardInfoVO implements GeneralModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5561480392305520388L;
	
	private Long boardSeq;
	
	//private String boardCode;
	
	private String productCode;
	
	private Long hGroup;
	
	private Integer hOrder;
	
	private Integer hDepth;
	
	private Short star;
	
	private String noticeYn;
	
	private String userName;
	
	private String nickname;
	
	// private String email;
	
	// private String phone;
	
	// private String mobile;
	
	private String zipcode;
	
	private String addr1;
	
	private String addr2;
	
	private String subject;
	
	private String htmlYn;
	
	private String secretYn;
	
	private String pwd;
	
	private Integer readCount;
	
	private Integer recommCount;
	
	private Integer notRecommCount;
	
	private Integer commentCount;
	
	//added by Mongolian Team
	private String allowCommYn;
	
	private String ipAddr;
	
	private String regUser;
	
	private Date regDate;
	
	private String modUser;
	
	private Date modDate;
	
	private String faqFixedCode;
	
	private String linkUrl;
	
	private String statusFixedCode;
	
	private String addCol1;
	
	private String addCol2;
	
	private String addCol3;
	
	private String addCol4;
	
	private String useYn;
	
	private String body;
	
	private String answer;
	
	private String writerFormatFixedCode;
	
	private String dateFormatList;
	
	//이전글
	private Long prevBoardSeq;
	private String prevSubject;
	//다음글
	private Long nextBoardSeq;
	private String nextSubject;	
	
	//첨부파일
	private List<FileVO> fileVOList;
	
	private PhoneVO phoneVO;
	private PhoneVO mobilVO;
	private MailAddressVO emailVO;
	private BoardMasterVO bmVO;
	private String regUserName;
	private String modUserName;
	private int bcSeq;
	private String cateName;
	
	//첨부 파일 또는 이미지 파일
	private List<Long> fileSeqList;
	private List<MultipartFile> fileList;
	
	public String getAllowCommYn() {
		return allowCommYn;
	}

	public void setAllowCommYn(String allowCommYn) {
		this.allowCommYn = allowCommYn;
	}

	public BoardMasterVO getBmVO() {
		if (this.bmVO == null)
			this.bmVO = new BoardMasterVO();
		return bmVO;
	}

	public void setBmVO(BoardMasterVO bmVO) {
		this.bmVO = bmVO;
	}

	public PhoneVO getPhoneVO() {
		if (this.phoneVO == null)
			this.phoneVO = new PhoneVO();
		return phoneVO;
	}
	
	public void setPhoneVO(PhoneVO phoneVO) {
		this.phoneVO = phoneVO;
	}
	
	public PhoneVO getMobilVO() {
		if (this.mobilVO == null)
			this.mobilVO = new PhoneVO();
		return mobilVO;
	}
	
	public void setMobilVO(PhoneVO mobilVO) {
		this.mobilVO = mobilVO;
	}
	
	public MailAddressVO getEmailVO() {
		if (this.emailVO == null)
			this.emailVO = new MailAddressVO();
		
		return emailVO;
	}
	
	public void setEmailVO(MailAddressVO emailVO) {
		this.emailVO = emailVO;
	}
	
	public Long getBoardSeq() {
		return boardSeq;
	}
	
	public void setBoardSeq(Long boardSeq) {
		this.boardSeq = boardSeq;
	}
	
	public String getBoardCode() {
		return this.getBmVO().getBoardCode();
	}
	
	public void setBoardCode(String boardCode) {
		this.getBmVO().setBoardCode(boardCode);
	}
	
	public String getBoardName() {
		return this.getBmVO().getBoardName();
	}
	
	public void setBoardName(String boardName) {
		this.getBmVO().setBoardName(boardName);
	}
	
	public String getProductCode() {
		return productCode;
	}
	
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	public Integer gethOrder() {
		return hOrder;
	}
	
	public void sethOrder(Integer hOrder) {
		this.hOrder = hOrder;
	}
	
	public Long gethGroup() {
		return hGroup;
	}
	
	public void sethGroup(Long hGroup) {
		this.hGroup = hGroup;
	}
	
	public Integer gethDepth() {
		return hDepth;
	}
	
	public void sethDepth(Integer hDepth) {
		this.hDepth = hDepth;
	}
	
	public Short getStar() {
		return star;
	}
	
	public void setStar(Short star) {
		this.star = star;
	}
	
	public String getNoticeYn() {
		return noticeYn;
	}
	
	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return this.getEmailVO().getAddress();
	}
	
	public void setEmail(String email) {
		this.getEmailVO().setAddress(email);
	}
	
	public String getPhone() {
		return this.getPhoneVO().getNo();
	}
	
	public void setPhone(String phone) {
		this.getPhoneVO().setNo(phone);
	}
	
	public String getMobile() {
		return this.getMobilVO().getNo();
	}
	
	public void setMobile(String mobile) {
		this.getMobilVO().setNo(mobile);
	}
	
	public String getZipcode() {
		return zipcode;
	}
	
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getAddr1() {
		return addr1;
	}
	
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	
	public String getAddr2() {
		return addr2;
	}
	
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getHtmlYn() {
		return htmlYn;
	}
	
	public void setHtmlYn(String htmlYn) {
		this.htmlYn = htmlYn;
	}
	
	public String getSecretYn() {
		return secretYn;
	}
	
	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public Integer getReadCount() {
		return readCount;
	}
	
	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}
	
	public Integer getRecommCount() {
		return recommCount;
	}
	
	public void setRecommCount(Integer recommCount) {
		this.recommCount = recommCount;
	}
	
	public Integer getNotRecommCount() {
		return notRecommCount;
	}
	
	public void setNotRecommCount(Integer notRecommCount) {
		this.notRecommCount = notRecommCount;
	}
	
	public Integer getCommentCount() {
		return commentCount;
	}
	
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	
	public String getIpAddr() {
		return ipAddr;
	}
	
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
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
	
	public String getModUser() {
		return modUser;
	}
	
	public void setModUser(String modUser) {
		this.modUser = modUser;
	}
	
	public Date getModDate() {
		return modDate;
	}
	
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	/**
	 * faq - 고정코드[007]
	 * @return
	 */
	public String getFaqFixedCode() {
		return faqFixedCode;
	}

	/**
	 * faq - 고정코드[007]
	 * @param faqFixedCode
	 */
	public void setFaqFixedCode(String faqFixedCode) {
		this.faqFixedCode = faqFixedCode;
	}

	/**
	 * 링크 URL
	 * @return
	 */
	public String getLinkUrl() {
		return linkUrl;
	}

	/**
	 * 링크 URL
	 * @param linkUrl
	 */
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getStatusFixedCode() {
		return statusFixedCode;
	}
	
	public void setStatusFixedCode(String statusFixedCode) {
		this.statusFixedCode = statusFixedCode;
	}
	
	public String getAddCol1() {
		return addCol1;
	}
	
	public void setAddCol1(String addCol1) {
		this.addCol1 = addCol1;
	}
	
	public String getAddCol2() {
		return addCol2;
	}
	
	public void setAddCol2(String addCol2) {
		this.addCol2 = addCol2;
	}
	
	public String getAddCol3() {
		return addCol3;
	}
	
	public void setAddCol3(String addCol3) {
		this.addCol3 = addCol3;
	}
	
	public String getAddCol4() {
		return addCol4;
	}
	
	public void setAddCol4(String addCol4) {
		this.addCol4 = addCol4;
	}
	
	public String getUseYn() {
		return useYn;
	}
	
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	public String getBody() {
		return body;
	}
	
	public void setBody(String body) {
		this.body = body;
	}
	
	public String getAnswer() {
		return answer;
	}
	
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	/**
	 * 이전글 seq
	 * @return
	 */
	public Long getPrevBoardSeq() {
		return prevBoardSeq;
	}
	
	public String getWriterFormatFixedCode() {
		return writerFormatFixedCode;
	}

	public void setWriterFormatFixedCode(String writerFormatFixedCode) {
		this.writerFormatFixedCode = writerFormatFixedCode;
	}

	public String getDateFormatList() {
		return dateFormatList;
	}

	public void setDateFormatList(String dateFormatList) {
		this.dateFormatList = dateFormatList;
	}

	/**
	 * 이전글 seq
	 * @param prevBoardSeq
	 */
	public void setPrevBoardSeq(Long prevBoardSeq) {
		this.prevBoardSeq = prevBoardSeq;
	}

	/**
	 * 이전글
	 * @return
	 */
	public String getPrevSubject() {
		return prevSubject;
	}

	/**
	 * 이전글
	 * @param prevSubject
	 */
	public void setPrevSubject(String prevSubject) {
		this.prevSubject = prevSubject;
	}

	/**
	 * 다음글 seq
	 * @return
	 */
	public Long getNextBoardSeq() {
		return nextBoardSeq;
	}

	/**
	 * 다음글 seq
	 * @param nextBoardSeq
	 */
	public void setNextBoardSeq(Long nextBoardSeq) {
		this.nextBoardSeq = nextBoardSeq;
	}

	/**
	 * 다음글
	 * @return
	 */
	public String getNextSubject() {
		return nextSubject;
	}

	/**
	 * 다음글
	 * @param nextSubject
	 */
	public void setNextSubject(String nextSubject) {
		this.nextSubject = nextSubject;
	}

	public String getRegUserName() {
		return regUserName;
	}

	public void setRegUserName(String regUserName) {
		this.regUserName = regUserName;
	}

	public String getModUserName() {
		return modUserName;
	}

	public void setModUserName(String modUserName) {
		this.modUserName = modUserName;
	}

	public int getBcSeq() {
		return bcSeq;
	}

	public void setBcSeq(int bcSeq) {
		this.bcSeq = bcSeq;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	/**
	 * 첨부 파일 또는 이미지 파일 seq
	 * @return
	 */
	public List<Long> getFileSeqList() {
		return fileSeqList;
	}

	/**
	 * 첨부 파일 또는 이미지 파일 seq
	 * @param fileSeqList
	 */
	public void setFileSeqList(List<Long> fileSeqList) {
		this.fileSeqList = fileSeqList;
	}

	/**
	 * 첨부 파일 또는 이미지 파일
	 * @return
	 */
	public List<MultipartFile> getFileList() {
		return fileList;
	}

	/**
	 * 첨부 파일 또는 이미지 파일
	 * @param fileList
	 */
	public void setFileList(List<MultipartFile> fileList) {
		this.fileList = fileList;
	}
	
	/**
	 * 첨부파일 셀렉트 용
	 * @return
	 */
	public List<FileVO> getFileVOList() {
		return fileVOList;
	}

	/**
	 * 첨부파일 셀렉트 용
	 * @param fileVOList
	 */
	public void setFileVOList(List<FileVO> fileVOList) {
		this.fileVOList = fileVOList;
	}
	
	
	
	
}