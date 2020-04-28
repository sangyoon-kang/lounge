package com.tagosolution.service.model.search;

import java.util.ArrayList;
import java.util.List;

import com.tagoplus.model.common.SearchVO;

/**
 * 회원 검색 모델
 * @author wimy
 *
 */
public class MemberSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6267403157962230388L;

	private String aid;
	
	private int mseq;
	
	private int emseq;
	
	private short glevel;
	
	private String wyn;
	
	private String startDate1;
	
	private String endDate1;
	
	private String mid;
	
	private List<Integer> chkseq;
	
	private transient String subject;
	
	private String body;
	
	private String beforePwd;
	
	private String emails;
	
	private String userName;
	
	private String userEmail;
	
	private String nickname;
	
	private Boolean isAgreed;
	
	private String phone;
	
	private String userId;
	
	private short reLevel;
	
	private short gradeLevel;

	private String birthDate;

	private String gender;

	private Boolean isAdult = false; // 성인 체크 tyrus-k added

	public short getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(short gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public short getReLevel() {
		return reLevel;
	}

	public void setReLevel(short reLevel) {
		this.reLevel = reLevel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private String[] listContentsType;

	public String[] getListContentsType() {
		return listContentsType;
	}

	public void setListContentsType(String[] listContentsType) {
		this.listContentsType = listContentsType;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	/** 가입 시 인증방법*/
	private String certType;
	
	/** 아이핀 암호화된 데이터*/
	private String ipinEncdata;
	
	public String getCertType() {
		return certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}

	public String getIpinEncdata() {
		return ipinEncdata;
	}

	public void setIpinEncdata(String ipinEncdata) {
		this.ipinEncdata = ipinEncdata;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Boolean getIsAgreed() {
		if(this.isAgreed == null)
			isAgreed = false;
		return isAgreed;
	}

	public void setIsAgreed(Boolean isAgreed) {
		this.isAgreed = isAgreed;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmails() {
		return emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}

	/**
	 * 기존 비밀번호
	 * @return
	 */
	public String getBeforePwd() {
		return beforePwd;
	}

	/**
	 * 기존 비밀번호
	 * @param beforePwd
	 */
	public void setBeforePwd(String beforePwd) {
		this.beforePwd = beforePwd;
	}

	/**
	 * 회원 순번 파라미터
	 * @return
	 */
	public int getMseq() {
		return mseq;
	}

	/**
	 * 회원 순번 파라미터
	 * @param mseq
	 */
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}

	/**
	 * 회원 등급 파라미터
	 * @return
	 */
	public short getGlevel() {
		return glevel;
	}

	/**
	 * 회원 등급 파라미터
	 * @param glevel
	 */
	public void setGlevel(short glevel) {
		this.glevel = glevel;
	}

	/**
	 * 회원 아이디 파라미터
	 * @return
	 */
	public String getMid() {
		return mid;
	}

	/**
	 * 회원 아이디 파라미터
	 * @param mid
	 */
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	/**
	 * 회원 체크된 순번 리스트
	 * @return
	 */
	public List<Integer> getChkseq() {
		if (this.chkseq == null)
			this.chkseq = new ArrayList<Integer>();
		return chkseq;
	}

	public void setChkseq(List<Integer> chkseq) {
		this.chkseq = chkseq;
	}
	
	/**
	 * 관리자 아이디 파라미터
	 * @return
	 */
	public String getAid() {
		return aid;
	}
	
	/**
	 * 관리자 아이디 파라미터
	 * @param aid
	 */
	public void setAid(String aid) {
		this.aid = aid;
	}
	
	
	/**
	 * 메일 순번
	 * @return
	 */
	public int getEmseq() {
		return emseq;
	}
	
	/**
	 * 메일 순번
	 * @param emseq
	 */
	public void setEmseq(int emseq) {
		this.emseq = emseq;
	}
	
	/**
	 * 탈퇴여부 파라미터
	 * @return
	 */
	public String getWyn() {
		return wyn;
	}
	
	/**
	 * 탈퇴여부 파라미터
	 * @param wyn
	 */
	public void setWyn(String wyn) {
		this.wyn = wyn;
	}

	public String getStartDate1() {
		return startDate1;
	}

	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}

	public String getEndDate1() {
		return endDate1;
	}

	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public void setAdult(Boolean isAdult){
		this.isAdult = isAdult;
	}

	public Boolean getAdult(){
		return this.isAdult;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



}
