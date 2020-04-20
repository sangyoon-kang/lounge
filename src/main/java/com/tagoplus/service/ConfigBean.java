package com.tagoplus.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.tagoplus.model.common.StringPair;

/**
 * globals.properties 모음 ParentController에서 로드하여 객체 접근 방법으로 코딩 가능 globals.properties를 추가하면 이 클래스에도 getter/setter를 추가해야 함.
 * 
 * @author wimy
 *
 */
@Component
public class ConfigBean {
	@Value("#{globals['globals.web.mode']}")
	String _sWebMode;
	
	
	@Value("#{globals['site.baseTitle']}")
	String _sHTMLTitle;
	
	@Value("#{globals['site.pageTitle']}")
	String _sPageTitle;
	
	@Value("#{globals['session.name.admin']}")
	String _sSessionNameAdmin;
	
	@Value("#{globals['session.name.user']}")
	String _sSessionNameUser;
	
	@Value("#{globals['session.name.site']}")
	String _sSessionNameSite;
	
	@Value("#{globals['session.name.auth']}")
	String _sSessionNameAuth;
	
	@Value("#{globals['session.name.siteapi']}")
	String _sSessionNameSiteApi;
	
	
	
	@Value("#{globals['cookie.popup.prefix']}")
	String _sCookiePopupPrefix;
	
	@Value("#{globals['cookie.redirect']}")
	String _sCookieRedirect;
	
	@Value("#{globals['cannot.using.id']}")
	String _sCannotUsingID;
	
	@Value("#{globals['url.host.local']}")
	String _sHostLocal;
	
	@Value("#{globals['url.host.dev']}")
	String _sHostDev;
	
	@Value("#{globals['url.host.op']}")
	String _sHostOp;
	
	@Value("#{globals['url.cdn.local']}")
	String _sCdnLocal;
	
	@Value("#{globals['url.cdn.dev']}")
	String _sCdnDev;
	
	@Value("#{globals['url.cdn.op']}")
	String _sCdnOp;
	
	@Value("#{globals['url.admin.root']}")
	String _sAdminRoot;
	
	@Value("#{globals['url.admin.login']}")
	String _sAdminLoginURL;
	
	@Value("#{globals['url.admin.main']}")
	String _sAdminMainURL;
	
	@Value("#{globals['url.front.login']}")
	String _sFrontLoginURL;
	
	@Value("#{globals['url.front.main']}")
	String _sFrontMainURL;
	
	@Value("#{globals['view.alert']}")
	String _sViewAlert;
	
	@Value("#{globals['view.error']}")
	String _sViewError;
	
	@Value("#{globals['upload.path.physical.local']}")
	String _sPathPhysicalLocal;
	
	@Value("#{globals['upload.path.physical.dev']}")
	String _sPathPhysicalDev;
	
	@Value("#{globals['upload.path.physical.op']}")
	String _sPathPhysicalOp;
	
	@Value("#{globals['upload.path.virtual']}")
	String _sPathVirtual;
	
	@Value("#{globals['upload.path.common']}")
	String _sPathCommon;
	
	@Value("#{globals['upload.path.files']}")
	String _sPathFiles;
	
	@Value("#{globals['upload.path.test']}")
	String _sPathTest;
	
	@Value("#{globals['upload.path.editor']}")
	String _sPathEditor;
	
	@Value("#{globals['upload.path.image']}")
	String _sPathImage;
	
	@Value("#{globals['upload.path.temp']}")
	String _sPathTemp;
	
	
	@Value("#{globals['upload.ext']}")
	String _sUploadExtensions;
	
	@Value("#{globals['admin.email']}")
	String _sAdminEmail;
	
	@Value("#{globals['admin.name']}")
	String _sAdminName;
	
	@Value("#{globals['admin.keynumber']}")
	String _sAdminKeyNumber;
	
	@Value("#{globals['admin.address']}")
	String _sAdminAddress;
	
	@Value("#{globals['mail.host']}")
	String _sMailHost;
	
	@Value("#{globals['mail.port']}")
	String _sMailPort;
	
	@Value("#{globals['sns.fb.api']}")
	String _sSNSFbAPIKey;
	
	@Value("#{globals['sns.kakao.api']}")
	String _sSNSKakaoAPIKey;
	
	@Value("#{globals['sns.naver.api']}")
	String _sSNSNaverAPIKey;

	@Value("#{globals['map.daum.api']}")
	String _sMapDaumAPIKey;
	
	
	@Value("#{globals['common.date.type']}")
	String _sDateType;
	
	@Value("#{globals['common.time.type']}")
	String _sTimeType;
	
	
	@Value("#{globals['common.emails']}")
	String _sCommonEmails;
	
	@Value("#{globals['email.auth']}")
	String _sEmailAuth;
	
	@Value("#{globals['email.join']}")
	String _sEmailJoin;
	
	@Value("#{globals['email.general']}")
	String _sEmailGeneral;
	
	@Value("#{globals['email.password']}")
	String _sEmailPassword;
	
	@Value("#{globals['email.withdrawal']}")
	String _sEmailWithdrawal;
	
	@Value("#{globals['email.question']}")
	String _sEmailQuestion;
	
	// @Value("#{globals['email.qna']}")
	// String _sEmailQna;
	
	@Value("#{globals['google.path.api.secret']}")
	String _googleApiSecret;
	
	@Value("#{globals['member.line.rate.fxoffice']}")
	Integer _sFxoffice;
	
	@Value("#{globals['member.line.rate.disterbuter']}")
	Integer _sDisterbuter;
	
	@Value("#{globals['member.line.rate.agent']}")
	Integer _sAgent;
	
	@Value("#{globals['member.line.rate.branch']}")
	Integer _sBranch;
	
	@Value("#{globals['member.line.rate.dealer']}")
	Integer _sDealer;

	@Value("#{globals['site.name.u']}")
	String _sSiteNameU;

	@Value("#{globals['site.name.u']}")
	String _sSiteNameL;

	public String get_sSiteNameU() {
		return _sSiteNameU;
	}

	public void set_sSiteNameU(String _sSiteNameU) {
		this._sSiteNameU = _sSiteNameU;
	}

	public String get_sSiteNameL() {
		return _sSiteNameL;
	}

	public void set_sSiteNameL(String _sSiteNameL) {
		this._sSiteNameL = _sSiteNameL;
	}

	public Integer getFxoffice(){
		return _sFxoffice;
	}
	
	public Integer getDisterbuter(){
		return _sDisterbuter;
	}
	
	public Integer getAgent(){
		return _sAgent;
	}
	
	public Integer getBranch(){
		return _sBranch;
	}
	
	public Integer getDealer(){
		return _sDealer;
	}
	
	/**
	 * 웹 모드 : local, dev, op
	 * 
	 * @return
	 */
	public String getWebMode() {
		return _sWebMode;
	}
	
	/**
	 * 
	 * @return 기본 타이틀
	 */
	public String getHTMLTitle() {
		return _sHTMLTitle;
	}
	
	/**
	 * @return 페이지 타이틀 속성 이름. model.addAttribute()에 사용되는 타이틀 바인딩용 attribute 이름
	 */
	public String getPageTitle() {
		return _sPageTitle;
	}
	
	/**
	 * @return 관리자 세션 이름
	 */
	public String getSessionNameForAdmin() {
		return _sSessionNameAdmin;
	}
	
	/**
	 * @return 사용자 세션 이름
	 */
	public String getSessionNameForUser() {
		return _sSessionNameUser;
	}
		
	/**
	 * 사이트 정보 세션 이름
	 * @return
	 */
	public String getSessionNameForSite() {
		return _sSessionNameSite;
	}
	
	public String getSessionNameForSiteApi() {
		return _sSessionNameSiteApi;
	}
	
	/**
	 * 로그인 계정의 권한 세션 이름
	 * @return
	 */
	public String getSessionNameForAuth() {
		return _sSessionNameAuth;
	}
	
	/**
	 * @return 팝업용 쿠키 이름 접두사
	 */
	public String getCookiePopupPrefix() {
		return _sCookiePopupPrefix;
	}
	
	/**
	 * @return 로그인 후 리디렉션 URL 쿠키
	 */
	public String getCookieRedirect() {
		return _sCookieRedirect;
	}
	
	/**
	 * 
	 * @return 사용할 수 없는 아이디 문자열
	 */
	public String[] getCannotUseIDs() {
		return _sCannotUsingID.split(",");
	}
	
	/**
	 * 서버 호스트 : globals.web.mode 값에 따라 값이 달라짐. 기본값 local
	 * 
	 * @return
	 */
	public String getHost() {
		if (this.getWebMode().equals("dev"))
			return this._sHostDev;
		else if (this.getWebMode().equals("op"))
			return this._sHostOp;
		else
			return this._sHostLocal;
	}
	
	/**
	 * CDN : globals.web.mode 값에 따라 값이 달라짐. 기본값 local
	 * 
	 * @return
	 */
	public String getCdn() {
		if (this.getWebMode().equals("dev"))
			return this._sCdnDev;
		else if (this.getWebMode().equals("op"))
			return this._sCdnOp;
		else
			return this._sCdnLocal;
	}
	
	/**
	 * 관리자 루트 - #{globals['url.admin.root']}
	 * @return
	 */
	public String getAdminRoot() {
		return _sAdminRoot;
	}
	
	/**
	 * @return 관리자 로그인 URL
	 */
	public String getAdminLoginURL() {
		return _sAdminLoginURL;
	}
	
	/**
	 * @return 관리자 메인 URL
	 */
	public String getAdminMainURL() {
		return _sAdminMainURL;
	}
	
	/**
	 * @return 사용자 로그인 URL
	 */
	public String getFrontLoginURL() {
		return _sFrontLoginURL;
	}
	
	/**
	 * @return 사용자 메인 URL
	 */
	public String getFrontMain() {
		return _sFrontMainURL;
	}
	
	/**
	 * 
	 * @return 스프링 컨트롤러 alert 출력용 URL
	 */
	public String getViewAlert() {
		return _sViewAlert;
	}
	
	/**
	 * 
	 * @return 스프링 컨트롤러 error 출력용 URL
	 */
	public String getViewError() {
		return _sViewError;
	}
	
	/**
	 * @return 이메일 서버 호스트
	 */
	public String getMailHost() {
		return _sMailHost;
	}
	
	/**
	 * @return 메일 서버 포트 : 기본값 25
	 */
	public int getMailPort() {
		if (StringUtils.isEmpty(_sMailPort))
			return 25;
		else
			return Integer.parseInt(_sMailPort);
	}
	
	/**
	 * 파일 업로드 물리 경로 globals.properties - upload.path.physical 참조 : globals.web.mode 값에 따라 값이 달라짐. 기본값 local
	 * 
	 * @return
	 */
	public String getUploadPathPhysical() {
		if (this.getWebMode().equals("dev"))
			return this._sPathPhysicalDev;
		else if (this.getWebMode().equals("op"))
			return this._sPathPhysicalOp;
		else
			return this._sPathPhysicalLocal;
	}
	
	/**
	 * 업로드 루트 가상디렉토리
	 * 
	 * @return
	 */
	public String getUploadPathVirtual() {
		return this._sPathVirtual;
	}
	
	/**
	 * 업로드 일반 파일 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathCommon() {
		return this._sPathCommon;
	}
	
	/**
	 * 업로드 일반 파일 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathFiles() {
		return this._sPathFiles;
	}
	
	
	/**
	 * 업로드 테스트 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathTest() {
		return this._sPathTest;
	}
	
	/**
	 * 업로드 에디터 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathEditor() {
		return _sPathEditor;
	}
	
	/**
	 * 업로드 이미지 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathImage() {
		return _sPathImage;
	}
	
	
	/**
	 * 업로드 이미지 경로 (임시)
	 * @return
	 */
	public String getUploadPathTemp() {
		return _sPathTemp;
	}
	
	/**
	 * 업로드 가능 확장자 배열 : globals.properties = upload.ext 참조
	 * 
	 * @return
	 */
	public String[] getUploadExtensions() {
		String[] arr = _sUploadExtensions.split(",");
		return arr;
	}
	
	/**
	 * 관리자 대표 이메일
	 * 
	 * @return
	 */
	public String getAdminEmail() {
		return _sAdminEmail;
	}
	
	/**
	 * 관리자 대표 이메일 표시용 이름
	 * 
	 * @return
	 */
	public String getAdminName() {
		return _sAdminName;
	}
	
	/**
	 * 대표 전화번호
	 * 
	 * @return
	 */
	public String getAdminKeyNumber() {
		return _sAdminKeyNumber;
	}
	
	/**
	 * 회사 주소
	 * 
	 * @return
	 */
	public String getAdminAddress() {
		return _sAdminAddress;
	}
	
	/**
	 * 페이스북 API 키
	 * 
	 * @return
	 */
	public String getSNSFbAPIKey() {
		return _sSNSFbAPIKey;
	}
	
	/**
	 * 카카오 API 키
	 * 
	 * @return
	 */
	public String getSNSKakaoAPIKey() {
		return _sSNSKakaoAPIKey;
	}
	
	/**
	 * 네이버 API 키
	 * 
	 * @return
	 */
	public String getSNSNaverAPIKey() {
		return _sSNSNaverAPIKey;
	}
	
	/**
	 * 다음 지도 API
	 * @return
	 */
	public String getMapDaumApiKey() {
		return this._sMapDaumAPIKey;
	}
	
	/**
	 * 날짜 표시 유형 : SearchVO 참조
	 * 
	 * @return
	 */
	public String getDateFormat() {
		return _sDateType;
	}
	
	/**
	 * 시각 표시 유형
	 * 
	 * @return
	 */
	public String getTimeFormat() {
		return _sTimeType;
	}
	
	/**
	 * GOOGLE API SECRET PATH
	 * 
	 * @return
	 */
	public String getGoogleApiSecret() {
		return _googleApiSecret;
	}
	
	/**
	 * 날짜 + 시각 표시 형식
	 * @return
	 */
	public String getDateTimeFormat() {
		return _sDateType + " " + _sTimeType;
	}
	
	List<StringPair> _listEmails = null;
	
	/**
	 * 공용 이메일 목록 globals.properties : common.emails 참조
	 * 
	 * @return
	 */
	public List<StringPair> getEmails() {
		if (!StringUtils.isEmpty(this._sCommonEmails)) {
			if (_listEmails == null) {
				_listEmails = new ArrayList<StringPair>();
				
				String[] arrEmails = this._sCommonEmails.split(",");
				for (String s : arrEmails)
					_listEmails.add(new StringPair(s.trim(), s.trim()));
			}
		}
		
		return _listEmails;
	}
	
	/**
	 * 이메일 템플릿 URL - 인증
	 * @return the _sEmailAuth
	 */
	@Deprecated
	public String getEmailAuth() {
		return _sEmailAuth;
	}
	
	/**
	 * 이메일 템플릿 URL - 회원가입
	 * 
	 * @return the _sEmailMember
	 */
	@Deprecated
	public String getEmailJoin() {
		return _sEmailJoin;
	}
	
	/**
	 * 이메일 템플릿 URL - 일반
	 * 
	 * @return the _sEmailGeneral
	 */
	@Deprecated
	public String getEmailGeneral() {
		return _sEmailGeneral;
	}
	
	/**
	 * 이메일 템플릿 URL - 비밀번호 변경
	 * 
	 * @return
	 */
	@Deprecated
	public String getEmailPassword() {
		return _sEmailPassword;
	}
	
	/**
	 * 이메일 템플릿 URL - 회원 탈퇴
	 * 
	 * @return
	 */
	@Deprecated
	public String getEmailWithdrawal() {
		return _sEmailWithdrawal;
	}
	
	/**
	 * 이메일 템플릿 URL - 문의 형식
	 * 
	 * @return
	 */
	@Deprecated
	public String getEmailQuestion() {
		return _sEmailQuestion;
	}
	
	/**
	 * 이메일 템플릿 URL - QNA
	 * 
	 * @return
	 */
	@Deprecated
	public String getEmailQna() {
		return _sEmailQuestion;
	}

}
