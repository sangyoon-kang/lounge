package com.tagoplus.model.common;

import java.text.SimpleDateFormat;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.tagoplus.model.GeneralModel;

/**
 * 공용 검색 모델 * 검색 조건은 두 가지 까지 지원. 검색 조건이 더 생길 경우, 확장 클래스를 별도로 만들 것
 * 
 * @author wimy
 * 
 */
@Component
public class SearchVO implements GeneralModel {
	
	private static final long serialVersionUID = 6937599700079366836L;

	/**
	 * search word는 영문
	 */
	public final static String REGEX_PATTERN_WHITE_SPACE = "[\\s]+";

	/**
	 * search word 분리자 검색 문법 토큰을 포함한 파싱전 검색어
	 */
	private static final String TOKEN_SEPARATOR = " ";

	/**
	 * 공용 날짜 표시 형식  yyyy-MM-dd
	 */
	public static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 공용 시각 표시 형식 HH:mm
	 */
	public static final SimpleDateFormat SIMPLE_TIME_FORMAT = new SimpleDateFormat("HH:mm");
	
	/**
	 * 공용 날짜 시각 표시 형식 yyyy-MM-dd HH:mm"
	 */
	public static final SimpleDateFormat SIMPLE_DATETIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	
	public static final int MILLIS_IN_A_DAY = 24 * 60 * 60 * 1000;

	
	private Boolean paginated;
	private boolean isAdmin;
	
	private short bankSeq;
	/**
	 * 페이징 객체
	 */
	private PagingVO paging;
	
	private String searchWord = "";
	
	private String type1 = "";
	
	private String type2 = "";
	
	private String type3 = "";
	
	private String type4 = "";
	
	private String type5 = "";
	
	/**
	 * 공통 코드 마스터 그룹코드
	 */
	private String groupCode = "";
	
	/**
	 * 공통 코드
	 */
	private String cCode = "";
	
	/**
	 * 정렬
	 */
	private String orderBy = "";
	
	/**
	 * 날짜 검색 시작일 YYYY-MM-DD
	 */
	private String startDate = "";

	/**
	 * 날짜 검색 종료일 YYYY-MM-DD
	 */
	private String endDate = "";

	/**
	 * 날짜 검색 오늘 YYYY-MM-DD
	 */
	private String today = "";
	
	private String year1 = "";
	
	private String day1 = "";
	
	private String month1 = "";
	
	
	
	private String pageType = "";

	private String redirectURL = "";
	
	private String status = "";
	
	private String statusName = "";
	
	private String tableName = "";
	
	private String refSeq = "";
	
	private String masterSeq = "";
	
	private String pkName = "";
	
	private String pkSeq = "";
	
	private String fileType = "";
	
	private int cpageOld;
	
	
	private byte siteSeq;
	
	private String idType = "";
	
	private String id = "";
	
	private String groupType = "";
	
	private String ipAddr = "";
	
	private String callback = "";
	
	private String withdrawalDt = "";
	
	private String subject = "";
	
	
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the paginated
	 */
	// public Boolean isPaginated()
	// {
	// return (paginated != null && paginated) || (paginated == null && paging
	// != null);
	// }

	public String getWithdrawalDt() {
		return withdrawalDt;
	}

	public void setWithdrawalDt(String withdrawalDt) {
		this.withdrawalDt = withdrawalDt;
	}

	/**
	 * @param paginated
	 *            the paginated to set
	 */
	public void setPaginated(Boolean paginated) {
		this.paginated = paginated;
	}

	public Boolean getPaginated() {
		return paginated;
	}

	/**
	 * @return the isAdmin
	 */
	public boolean isAdmin() {
		return isAdmin;
	}

	/**
	 * @param isAdmin
	 *            the isAdmin to set
	 */
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	/**
	 * egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo를 상속한 PagingVO
	 * @return the paging
	 */
	public PagingVO getPaging() {

		if (this.paging == null)
			this.paging = new PagingVO();

		return paging;
	}

	/**
	 * @param paginationInfo
	 *            the paging to set
	 */
	public void setPaging(PagingVO paging) {
		this.paging = paging;
	}
	
	/**
	 * 페이지 인덱스 파라미터
	 * @return
	 */
	public int getCpage() {
		return this.getPaging().getPageIndex();
	}
	
	/**
	 * 페이지 인덱스 파라미터
	 * @param cpage
	 */
	public void setCpage(int cpage) {
		this.getPaging().setPageIndex(cpage);
	}
	
	/**
	 * 페이지 인덱스
	 * 
	 * @return
	 */
	public int getPageIndex() {
		return getPaging().getPageIndex();
	}

	/**
	 * 페이지 인덱스
	 */
	public void setPageIndex(int pageIndex) {
		getPaging().setPageIndex(pageIndex);
	}

	/**
	 * 한 페이지에 보이는 레코드 수<br>
	 * alias for getPaging().getRecordCount()
	 * @return
	 */
	public int getRecordCount() {
		return getPaging().getRecordCount();
	}
	
	/**
	 * 한 페이지에 보이는 레코드 수<br>
	 * alias for getPaging().setRecordCount(recordCount);
	 * @param recordCount
	 */
	public void setRecordCount(int recordCount) {
		getPaging().setRecordCount(recordCount);
	}
	
	
	/**
	 * 검색된 전체 레코드 수
	 * 
	 * @return
	 */
	public int getTotalCount() {
		return getPaging().getTotalCount();
	}

	/**
	 * 검색된 전체 레코드 수
	 * 
	 * @param totalCount
	 */
	public void setTotalCount(int totalCount) {
		getPaging().setTotalCount(totalCount);
	}

	/**
	 * 검색어 - 기본값 = ""
	 * 
	 * @return
	 */
	public String getSearchWord() {
		if (this.searchWord == null)
			this.searchWord = "";

		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = (searchWord == null || searchWord.length() == 0) ? ""
				: searchWord.trim();
	}

	/**
	 * alias of searchWord
	 * 
	 * @return
	 */
	public String getKeyword() {
		return this.getSearchWord();
	}

	/**
	 * alias of searchWord
	 * 
	 * @param keyword
	 */
	public void setKeyword(String keyword) {
		this.setSearchWord(keyword);
	}

	/**
	 * order by 문자열 - 기본값 = ""
	 * 
	 * @return
	 */
	public String getOrderBy() {
		if (this.orderBy == null)
			this.orderBy = "";
		return orderBy;
	}

	/**
	 * order by 문자열
	 * 
	 * @param orderBy
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	/**
	 * [읽기전용] orderBy 문자열을 배열로 변환 - Mybatis iterator용으로 사용 문자열이 없을 경우 null 반환
	 * 
	 * @return
	 */
	public String[] getOrderBys() {
		if (StringUtils.isEmpty(this.orderBy))
			return null;

		String[] arr = this.orderBy.split(",");
		return arr;
	}

	/**
	 * 공통 코드 마스터 그룹 코드
	 * 
	 * @return
	 */
	public String getGroupCode() {
		if (this.groupCode == null)
			this.groupCode = "";

		return this.groupCode;
	}

	/**
	 * 공통 코드 마스터 그룹 코드
	 * 
	 * @return
	 */
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	
	/**
	 * 공통 코드 - 코드
	 * @return
	 */
	public String getcCode() {
		return cCode;
	}

	/**
	 * 공통 코드 - 코드
	 * @param cCode
	 */
	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	/**
	 * 검색 날짜 시작일 yyyy-mm-dd - 기본값 = ""
	 * 
	 * @return
	 */
	public String getStartDate() {
		if (this.startDate == null)
			this.startDate = "";
		return startDate;
	}

	/**
	 * 검색 날짜 시작일 yyyy-mm-dd
	 * 
	 * @return
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	/**
	 * 검색 날짜 종료일 yyyy-mm-dd
	 * 
	 * @return
	 */
	public String getEndDate() {
		if (this.endDate == null)
			this.endDate = "";
		return endDate;
	}

	/**
	 * 검색 날짜 종료일 yyyy-mm-dd
	 * 
	 * @return
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	/**
	 *
	 * @return
	 */
	public String getToday() {
		if (this.today == null)
			this.today = "";
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}
	
	/**
	 * 검색조건 - 연도
	 * @return
	 */
	public String getYear1() {
		return year1;
	}

	/**
	 * 검색조건 - 연도
	 * @param year1
	 */
	public void setYear1(String year1) {
		this.year1 = year1;
	}

	/**
	 * 검색조건 - 날짜
	 * @return
	 */
	public String getDay1() {
		return day1;
	}

	/**
	 * 검색조건 - 날짜
	 * @param day1
	 */
	public void setDay1(String day1) {
		this.day1 = day1;
	}
	
	/**
	 * 검색조건 - 월
	 * @return
	 */
	public String getMonth1() {
		return month1;
	}

	/**
	 * 검색조건 - 월
	 * @param month1
	 */
	public void setMonth1(String month1) {
		this.month1 = month1;
	}
	
	

	/**
	 * 검색조건1 - 기본값 = ""
	 * 
	 * @return
	 */
	public String getType1() {
		if (this.type1 == null)
			this.type1 = "";
		return type1;
	}

	/**
	 * 검색조건1
	 * 
	 * @return
	 */
	public void setType1(String type1) {
		this.type1 = type1;
	}

	/**
	 * 검색조건2 - 기본값 = ""
	 * 
	 * @return
	 */
	public String getType2() {
		if (this.type2 == null)
			this.type2 = "";
		return type2;
	}

	/**
	 * 검색조건2
	 * 
	 * @return
	 */
	public void setType2(String type2) {
		this.type2 = type2;
	}
	
	public String getType3() {
		return type3;
	}

	public void setType3(String type3) {
		this.type3 = type3;
	}

	public String getType4() {
		return type4;
	}

	public void setType4(String type4) {
		this.type4 = type4;
	}
	
	public String getType5() {
		return type5;
	}

	public void setType5(String type5) {
		this.type5 = type5;
	}

	public String getPageType() {
		if (this.pageType == null)
			this.pageType = "";
		return pageType;
	}

	public void setPageType(String pageType) {
		this.pageType = pageType;
	}

		
	/**
	 * 로그인시 리다이렉트URL 파라미터
	 * @return
	 */
	public String getRedirectURL() {
		return redirectURL;
	}

	/**
	 * 로그인시 리다이렉트URL 파라미터
	 * @param redirectURL
	 */
	public void setRedirectURL(String redirectURL) {
		this.redirectURL = redirectURL;
	}
	
	
	/**
	 * i(등록)/r(답글)/u(수정)/v(상세보기)/d(삭제)/a(답변) 등의 상태 값
	 * @return
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * i(등록)/r(답글)/u(수정)/v(상세보기)/d(삭제)/a(답변) 등의 상태 값
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	/**
	 * 공통 파일 업로드 참조용 테이블 이름
	 * @return
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * 공통 파일 업로드 참조용 테이블 이름
	 * @param tableName
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	/**
	 * 공통 파일 업로드 참조용 순번 값
	 * @return
	 */
	public String getRefSeq() {
		return refSeq;
	}

	/**
	 * 공통 파일 업로드 참조용 순번 값
	 * @param refSeq
	 */
	public void setRefSeq(String refSeq) {
		this.refSeq = refSeq;
	}
	
	
	/**
	 * 공통 파일 업로드 참조용 마스터 순번 값
	 * @return
	 */
	public String getMasterSeq() {
		return masterSeq;
	}

	/**
	 * 공통 파일 업로드 참조용 마스터 순번 값
	 * @param masterSeq
	 */
	public void setMasterSeq(String masterSeq) {
		this.masterSeq = masterSeq;
	}

	/**
	 * 공통 파일 업로드 참조용 PK 이름
	 * @return
	 */
	public String getPkName() {
		return pkName;
	}

	/**
	 * 공통 파일 업로드 참조용 PK 이름
	 * @param pkName
	 */
	public void setPkName(String pkName) {
		this.pkName = pkName;
	}

	/**
	 * 공통 파일 업로드 참조용 PK 값
	 * @return
	 */
	public String getPkSeq() {
		return pkSeq;
	}

	/**
	 * 공통 파일 업로드 참조용 PK 값
	 * @param pkSeq
	 */
	public void setPkSeq(String pkSeq) {
		this.pkSeq = pkSeq;
	}

	/**
	 * 공통 파일 업로드 파일 유형 이름
	 * @return
	 */
	public String getFileType() {
		return fileType;
	}
	
	/**
	 * 공통 파일 업로드 파일 유형 이름
	 * @param fileType
	 */
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	
	public byte getSiteSeq() {
		return siteSeq;
	}

	public void setSiteSeq(byte siteSeq) {
		this.siteSeq = siteSeq;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * 그룹 유형 (TS_GROUP.GROUP_TYPE) - B:게시판, P:페이지
	 * @return
	 */
	public String getGroupType() {
		return groupType;
	}

	/**
	 * 그룹 유형 (TS_GROUP.GROUP_TYPE) - B:게시판, P:페이지
	 * @param groupType
	 */
	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	/**
	 * 날짜 표시 형식
	 * @return
	 */
	public String getDateFormat() {
		return SIMPLE_DATE_FORMAT.toPattern();
	}
	
	/**
	 * 시각 표시 형식
	 * @return
	 */
	public String getTimeFormat() {
		return SIMPLE_TIME_FORMAT.toPattern();
	}
	
	/**
	 * 날짜 시각 표시 형식
	 * @return
	 */
	public String getDateTimeFormat() {
		return SIMPLE_DATETIME_FORMAT.toPattern();
	}

	/**
	 * IP 주소
	 * @return
	 */
	public String getIpAddr() {
		return ipAddr;
	}

	/**
	 * IP 주소
	 * @param ipAddr
	 */
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	/**
	 * 이전 페이지 페이지 인덱스
	 * @return
	 */
	public int getCpageOld() {
		return cpageOld;
	}

	/**
	 * 이전 페이지 페이지 인덱스
	 * @param cpageOld
	 */
	public void setCpageOld(int cpageOld) {
		this.cpageOld = cpageOld;
	}
	
	public short getBankSeq() {
		return bankSeq;
	}

	public void setBankSeq(short bankSeq) {
		this.bankSeq = bankSeq;
	}
}
