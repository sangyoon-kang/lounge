package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.util.StringUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 게시판 마스터 모델
 * 
 * @author wimy
 *
 */
public class BoardMasterVO implements GeneralModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6425350230727495996L;

	private String boardCode;
	
	// private String boardTypeFixedCode;
	
	private String boardName;
	
	//private Integer groupSeq;
	
	private Integer priority;
	
	private String boardAdmin;
	
	//private Short authList;
	
	//private Short authView;
	
	//private Short authWrite;
	
	//private Short authReply;
	
	//private Short authComment;
	
	private String dateFormatList;
	
	private String dateFormatView;
	
	private String cssPrefix;
	
	private String cssPrefixMobile;
	
	private String noAuthMsg;
	
	private String noAuthRedirect;
	
	private String editorYn;
	
	private String useYn;
	
	private String autoSecretYn;
	
	private String commentYn;
	
	private Integer commentLevel;

	private String showListYn;
	
	private String showPrevNextYn;
	
	private String previewImageYn;
	
	private String previewImageAlign;
	
	private String recommYn;
	
	private String emailYn;
	
	private String phoneYn;
	
	private String checkSpamYn;
	
	private String writeButtonYn;
	
	private String filteringYn;
	
	private String smsYn;
	
	private Short fileUploadCount;
	
	private Short movieUploadCount;
	
	private Short imageSizeList;
	
	private Short imageSizeView;
	
	private Short pagerRowCount;
	
	private Short pagerBlockCount;
	
	private Short newPeriod;
	
	private Integer hotCount;
	
	private Short lfCount;
	
	private Short subjectCharCount;
	
	private Integer pointView;
	
	private Integer pointWrite;
	
	private Integer pointReply;
	
	private Integer pointRecomm;
	
	private Integer pointDownload;
	
	private Integer pointComment;
	
	private String pointNoMsg;
	
	// private String writerFormatFixedCode;
	
	private String regUser;
	
	private Date regDate;
	
	private String modUser;
	
	private Date modDate;
	
	private String filter;
	
	
	
	
	private FixedCodeVO boardTypeFixedCodeVO;
	
	private FixedCodeVO writerFormatFixedCodeVO;
	
	private GroupVO groupVO;
	
	private List<BoardCategoryVO> boardCategoryVO;
	
	
	private MemberGradeVO authListMemberGradeVO;
	
	private MemberGradeVO authViewMemberGradeVO;
	
	private MemberGradeVO authWriteMemberGradeVO;
	
	private MemberGradeVO authReplyMemberGradeVO;
	
	private MemberGradeVO authCommentMemberGradeVO;
	
	private String regUserName;
	
	private String modUserName;
	
	public String getEmailYn() {
		return emailYn;
	}

	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}

	public String getPhoneYn() {
		return phoneYn;
	}

	public void setPhoneYn(String phoneYn) {
		this.phoneYn = phoneYn;
	}

	/**
	 * 게시판 카테고리 
	 * @return
	 */
	public List<BoardCategoryVO> getBoardCategoryVO() {
		if (this.boardCategoryVO == null)
			this.boardCategoryVO = new ArrayList<BoardCategoryVO>();
		return boardCategoryVO;
	}

	/**
	 * 게시판 카테고리
	 * @param boardCategoryVO
	 */
	public void setBoardCategoryVO(List<BoardCategoryVO> boardCategoryVO) {
		this.boardCategoryVO = boardCategoryVO;
	}

	/**
	 * 게시판 그룹 
	 * @return
	 */
	public GroupVO getGroupVO() {
		if (this.groupVO == null)
			this.groupVO = new GroupVO();
		return groupVO;
	}

	/**
	 * 게시판 그룹
	 * @param groupVO
	 */
	public void setGroupVO(GroupVO groupVO) {
		this.groupVO = groupVO;
	}

	/**
	 * 게시판 유형 코드
	 * 
	 * @return
	 */
	public FixedCodeVO getBoardTypeFixedCodeVO() {
		if (this.boardTypeFixedCodeVO == null)
			this.boardTypeFixedCodeVO = new FixedCodeVO();
		
		return boardTypeFixedCodeVO;
	}
	
	/**
	 * 게시판 유형 코드
	 * 
	 * @param boardTypeFixedCodeVO
	 */
	public void setBoardTypeFixedCodeVO(FixedCodeVO boardTypeFixedCodeVO) {
		this.boardTypeFixedCodeVO = boardTypeFixedCodeVO;
	}
	
	/**
	 * 작성자 형식 코드
	 * 
	 * @return
	 */
	public FixedCodeVO getWriterFormatFixedCodeVO() {
		if (this.writerFormatFixedCodeVO == null)
			this.writerFormatFixedCodeVO = new FixedCodeVO();
		return writerFormatFixedCodeVO;
	}
	
	/**
	 * 작성자 형식 코드
	 * 
	 * @param writerFormatFixedCodeVO
	 */
	public void setWriterFormatFixedCodeVO(FixedCodeVO writerFormatFixedCodeVO) {
		this.writerFormatFixedCodeVO = writerFormatFixedCodeVO;
	}
	
	
	public MemberGradeVO getAuthListMemberGradeVO() {
		if (this.authListMemberGradeVO == null)
			this.authListMemberGradeVO = new MemberGradeVO();
		return authListMemberGradeVO;
	}

	public void setAuthListMemberGradeVO(MemberGradeVO authListMemberGradeVO) {
		this.authListMemberGradeVO = authListMemberGradeVO;
	}

	public MemberGradeVO getAuthViewMemberGradeVO() {
		if (this.authViewMemberGradeVO == null)
			this.authViewMemberGradeVO = new MemberGradeVO();
		return authViewMemberGradeVO;
	}

	public void setAuthViewMemberGradeVO(MemberGradeVO authViewMemberGradeVO) {
		this.authViewMemberGradeVO = authViewMemberGradeVO;
	}

	public MemberGradeVO getAuthWriteMemberGradeVO() {
		if (this.authWriteMemberGradeVO == null)
			this.authWriteMemberGradeVO = new MemberGradeVO();
		return authWriteMemberGradeVO;
	}

	public void setAuthWriteMemberGradeVO(MemberGradeVO authWriteMemberGradeVO) {
		this.authWriteMemberGradeVO = authWriteMemberGradeVO;
	}

	public MemberGradeVO getAuthReplyMemberGradeVO() {
		if (this.authReplyMemberGradeVO == null)
			this.authReplyMemberGradeVO = new MemberGradeVO();
		return authReplyMemberGradeVO;
	}

	public void setAuthReplyMemberGradeVO(MemberGradeVO authReplyMemberGradeVO) {
		this.authReplyMemberGradeVO = authReplyMemberGradeVO;
	}

	public MemberGradeVO getAuthCommentMemberGradeVO() {
		if (this.authCommentMemberGradeVO == null)
			this.authCommentMemberGradeVO = new MemberGradeVO();
		return authCommentMemberGradeVO;
	}

	public void setAuthCommentMemberGradeVO(MemberGradeVO authCommentMemberGradeVO) {
		this.authCommentMemberGradeVO = authCommentMemberGradeVO;
	}

	public String getBoardCode() {
		return boardCode;
	}
	
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	
	public String getBoardTypeFixedCode() {
		return this.getBoardTypeFixedCodeVO().getCodeCode();
	}
	
	public void setBoardTypeFixedCode(String boardTypeFixedCode) {
		this.getBoardTypeFixedCodeVO().setCodeCode(boardTypeFixedCode);
	}
	
	public String getBoardTypeFixedCodeName() {
		return this.getBoardTypeFixedCodeVO().getCodeName();
	}
	
	public void setBoardTypeFixedCodeName(String boardTypeFixedCodeName) {
		this.getBoardTypeFixedCodeVO().setCodeName(boardTypeFixedCodeName);
	}
	
	
	public String getBoardName() {
		return boardName;
	}
	
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	public int getGroupSeq() {
		return this.getGroupVO().getGroupSeq();
	}
	
	public void setGroupSeq(int groupSeq) {
		this.getGroupVO().setGroupSeq(groupSeq);
	}
	
	public String getGroupName() {
		return this.getGroupVO().getGroupName();
	}
	
	public void setGroupName(String groupName) {
		this.getGroupVO().setGroupName(groupName);
	}
	
	public Integer getPriority() {
		return priority;
	}
	
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	
	public String getBoardAdmin() {
		return boardAdmin;
	}
	
	public void setBoardAdmin(String boardAdmin) {
		this.boardAdmin = boardAdmin;
	}
	
	
	/**
	 * [읽기전용] 게시판 관리자 아이디 배열
	 * @return
	 */
	public String[] getBoardAdmins() {
		if (StringUtil.isEmpty(this.getBoardAdmin()))
			return null;
		else
			return this.getBoardAdmin().split(",");
	}
	
	
	public Short getAuthList() {
		return this.getAuthListMemberGradeVO().getGradeLevel();
	}
	
	public void setAuthList(Short authList) {
		this.getAuthListMemberGradeVO().setGradeLevel(authList);
	}
	
	public String getAuthListName() {
		return this.getAuthListMemberGradeVO().getGradeName();
	}
	
	public void setAuthListName(String authListName) {
		this.getAuthListMemberGradeVO().setGradeName(authListName);
	}
	
	
	
	public Short getAuthView() {
		return this.getAuthViewMemberGradeVO().getGradeLevel();
	}
	
	public void setAuthView(Short authView) {
		this.getAuthViewMemberGradeVO().setGradeLevel(authView);
	}
	
	public String getAuthViewName() {
		return this.getAuthViewMemberGradeVO().getGradeName();
	}
	
	public void setAuthViewName(String authViewName) {
		this.getAuthViewMemberGradeVO().setGradeName(authViewName);
	}
	
	
	
	public Short getAuthWrite() {
		return this.getAuthWriteMemberGradeVO().getGradeLevel();
	}
	
	public void setAuthWrite(Short authWrite) {
		this.getAuthWriteMemberGradeVO().setGradeLevel(authWrite);
	}
	
	public String getAuthWriteName() {
		return this.getAuthWriteMemberGradeVO().getGradeName();
	}
	
	public void setAuthWriteName(String authWriteName) {
		this.getAuthWriteMemberGradeVO().setGradeName(authWriteName);
	}
	
	

	public Short getAuthReply() {
		return this.getAuthReplyMemberGradeVO().getGradeLevel();
	}
	
	public void setAuthReply(Short authReply) {
		this.getAuthReplyMemberGradeVO().setGradeLevel(authReply);
	}
	
	public String getAuthReplyName() {
		return this.getAuthReplyMemberGradeVO().getGradeName();
	}
	
	public void setAuthReplyName(String authReplyName) {
		this.getAuthReplyMemberGradeVO().setGradeName(authReplyName);
	}
	
	
	
	public Short getAuthComment() {
		return this.getAuthCommentMemberGradeVO().getGradeLevel();
	}
	
	public void setAuthComment(Short authComment) {
		this.getAuthCommentMemberGradeVO().setGradeLevel(authComment);
	}
	
	public String getAuthCommentName() {
		return this.getAuthCommentMemberGradeVO().getGradeName();
	}
	
	public void setAuthCommentName(String authCommentName) {
		this.getAuthCommentMemberGradeVO().setGradeName(authCommentName);
	}
	
	
	
	public String getDateFormatList() {
		return dateFormatList;
	}
	
	public void setDateFormatList(String dateFormatList) {
		this.dateFormatList = dateFormatList;
	}
	
	public String getDateFormatView() {
		return dateFormatView;
	}
	
	public void setDateFormatView(String dateFormatView) {
		this.dateFormatView = dateFormatView;
	}
	
	public String getCssPrefix() {
		return cssPrefix;
	}
	
	public void setCssPrefix(String cssPrefix) {
		this.cssPrefix = cssPrefix;
	}
	
	public String getCssPrefixMobile() {
		return cssPrefixMobile;
	}
	
	public void setCssPrefixMobile(String cssPrefixMobile) {
		this.cssPrefixMobile = cssPrefixMobile;
	}
	
	public String getNoAuthMsg() {
		return noAuthMsg;
	}
	
	public void setNoAuthMsg(String noAuthMsg) {
		this.noAuthMsg = noAuthMsg;
	}
	
	public String getNoAuthRedirect() {
		return noAuthRedirect;
	}
	
	public void setNoAuthRedirect(String noAuthRedirect) {
		this.noAuthRedirect = noAuthRedirect;
	}
	
	public String getEditorYn() {
		return editorYn;
	}
	
	public void setEditorYn(String editorYn) {
		this.editorYn = editorYn;
	}
	
	public String getUseYn() {
		return useYn;
	}
	
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	public String getAutoSecretYn() {
		return autoSecretYn;
	}
	
	public void setAutoSecretYn(String autoSecretYn) {
		this.autoSecretYn = autoSecretYn;
	}
	
	public String getCommentYn() {
		return commentYn;
	}
	
	public void setCommentYn(String commentYn) {
		this.commentYn = commentYn;
	}
	
	// Added by Mongolian Team
	public Integer getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(Integer commentLevel) {
		this.commentLevel = commentLevel;
	}
	
	public String getShowListYn() {
		return showListYn;
	}
	
	public void setShowListYn(String showListYn) {
		this.showListYn = showListYn;
	}
	
	public String getShowPrevNextYn() {
		return showPrevNextYn;
	}
	
	public void setShowPrevNextYn(String showPrevNextYn) {
		this.showPrevNextYn = showPrevNextYn;
	}
	
	public String getPreviewImageYn() {
		return previewImageYn;
	}
	
	public void setPreviewImageYn(String previewImageYn) {
		this.previewImageYn = previewImageYn;
	}
	
	
	
	public String getPreviewImageAlign() {
		return previewImageAlign;
	}

	public void setPreviewImageAlign(String previewImageAlign) {
		this.previewImageAlign = previewImageAlign;
	}

	public String getRecommYn() {
		return recommYn;
	}
	
	public void setRecommYn(String recommYn) {
		this.recommYn = recommYn;
	}
	
	public String getCheckSpamYn() {
		return checkSpamYn;
	}
	
	public void setCheckSpamYn(String checkSpamYn) {
		this.checkSpamYn = checkSpamYn;
	}
	
	public String getWriteButtonYn() {
		return writeButtonYn;
	}
	
	public void setWriteButtonYn(String writeButtonYn) {
		this.writeButtonYn = writeButtonYn;
	}
	
	public String getFilteringYn() {
		return filteringYn;
	}
	
	public void setFilteringYn(String filteringYn) {
		this.filteringYn = filteringYn;
	}
	
	public String getSmsYn() {
		return smsYn;
	}
	
	public void setSmsYn(String smsYn) {
		this.smsYn = smsYn;
	}
	
	public Short getFileUploadCount() {
		return fileUploadCount;
	}
	
	public void setFileUploadCount(Short fileUploadCount) {
		this.fileUploadCount = fileUploadCount;
	}
	
	public Short getMovieUploadCount() {
		return movieUploadCount;
	}
	
	public void setMovieUploadCount(Short movieUploadCount) {
		this.movieUploadCount = movieUploadCount;
	}
	
	public Short getImageSizeList() {
		return imageSizeList;
	}
	
	public void setImageSizeList(Short imageSizeList) {
		this.imageSizeList = imageSizeList;
	}
	
	public Short getImageSizeView() {
		return imageSizeView;
	}
	
	public void setImageSizeView(Short imageSizeView) {
		this.imageSizeView = imageSizeView;
	}
	
	public Short getPagerRowCount() {
		return pagerRowCount;
	}
	
	public void setPagerRowCount(Short pagerRowCount) {
		this.pagerRowCount = pagerRowCount;
	}
	
	public Short getPagerBlockCount() {
		return pagerBlockCount;
	}
	
	public void setPagerBlockCount(Short pagerBlockCount) {
		this.pagerBlockCount = pagerBlockCount;
	}
	
	public Short getNewPeriod() {
		return newPeriod;
	}
	
	public void setNewPeriod(Short newPeriod) {
		this.newPeriod = newPeriod;
	}
	
	public Integer getHotCount() {
		return hotCount;
	}
	
	public void setHotCount(Integer hotCount) {
		this.hotCount = hotCount;
	}
	
	public Short getLfCount() {
		return lfCount;
	}
	
	public void setLfCount(Short lfCount) {
		this.lfCount = lfCount;
	}
	
	public Short getSubjectCharCount() {
		return subjectCharCount;
	}
	
	public void setSubjectCharCount(Short subjectCharCount) {
		this.subjectCharCount = subjectCharCount;
	}
	
	public Integer getPointView() {
		return pointView;
	}
	
	public void setPointView(Integer pointView) {
		this.pointView = pointView;
	}
	
	public Integer getPointWrite() {
		return pointWrite;
	}
	
	public void setPointWrite(Integer pointWrite) {
		this.pointWrite = pointWrite;
	}
	
	public Integer getPointReply() {
		return pointReply;
	}
	
	public void setPointReply(Integer pointReply) {
		this.pointReply = pointReply;
	}
	
	public Integer getPointRecomm() {
		return pointRecomm;
	}
	
	public void setPointRecomm(Integer pointRecomm) {
		this.pointRecomm = pointRecomm;
	}
	
	public Integer getPointDownload() {
		return pointDownload;
	}
	
	public void setPointDownload(Integer pointDownload) {
		this.pointDownload = pointDownload;
	}
	
	public Integer getPointComment() {
		return pointComment;
	}
	
	public void setPointComment(Integer pointComment) {
		this.pointComment = pointComment;
	}
	
	public String getPointNoMsg() {
		return pointNoMsg;
	}
	
	public void setPointNoMsg(String pointNoMsg) {
		this.pointNoMsg = pointNoMsg;
	}
	
	public String getWriterFormatFixedCode() {
		return this.getWriterFormatFixedCodeVO().getCodeCode();
	}
	
	public void setWriterFormatFixedCode(String writerFormatFixedCode) {
		this.getWriterFormatFixedCodeVO().setCodeCode(writerFormatFixedCode);
	}
	
	public String getWriterFormatFixedCodeName() {
		return this.getWriterFormatFixedCodeVO().getCodeName();
	}
	
	public void setWriterFormatFixedCodeName(String writerFormatFixedCodeName) {
		this.getWriterFormatFixedCodeVO().setCodeName(writerFormatFixedCodeName);
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
	
	public String getFilter() {
		return filter;
	}
	
	public void setFilter(String filter) {
		this.filter = filter;
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
	
	
}