package com.tagosolution.service.model.search;

import com.tagoplus.model.common.SearchVO;

/**
 * 관리자 로그인용 모델
 * @author wimy
 *
 */
public class AdminLoginSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4213347468632150496L;

	
	String secureId;
	String securePwd;
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

	public String getSecureId() {
		return secureId;
	}
	
	public void setSecureId(String secureId) {
		this.secureId = secureId;
	}
	
	public String getSecurePwd() {
		return securePwd;
	}
	
	public void setSecurePwd(String securePwd) {
		this.securePwd = securePwd;
	}
}
