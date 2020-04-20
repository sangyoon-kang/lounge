package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.model.common.MailAddressVO;
import com.tagoplus.model.common.PhoneVO;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CommentVO implements GeneralModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long commentSeq;
	
	private Long parentSeq;

	private Long boardSeq;
	
	private String boardCode;
	
	private String productCode;

	private Long hGroup;
	
	private Integer hOrder;
	
	private Integer hDepth;
	
	private Integer star;
	
	private String userName;
	
	private String nickName;
	
	private String body;
	
	private String pwd;
	
	private String regUser;
	
	private Date regDate;
	
	private String displayYn;
	
	private String useYn;
	
	private String dateFormatList;
	
	private String ipAddr;
	
	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	
	public Long getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(Long commentSeq) {
		this.commentSeq = commentSeq;
	}
	
	public Long getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(Long parentSeq) {
		this.parentSeq = parentSeq;
	}


	public String getBody() {
		return body;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Long gethGroup() {
		return hGroup;
	}

	public void sethGroup(Long hGroup) {
		this.hGroup = hGroup;
	}

	public Integer gethOrder() {
		return hOrder;
	}

	public void sethOrder(Integer hOrder) {
		this.hOrder = hOrder;
	}

	public Integer gethDepth() {
		return hDepth;
	}

	public void sethDepth(Integer hDepth) {
		this.hDepth = hDepth;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getDisplayYn() {
		return displayYn;
	}

	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
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

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public Long getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(Long boardSeq) {
		this.boardSeq = boardSeq;
	}
	
	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getDateFormatList() {
		return dateFormatList;
	}

	public void setDateFormatList(String dateFormatList) {
		this.dateFormatList = dateFormatList;
	}
	
}