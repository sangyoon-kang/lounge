package com.tagosolution.service.model.sns;

public class KakaoVO {
	private String id;
	
	private String connected_at;
	
	private KakaoAccountVO kakao_account;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getConnected_at() {
		return connected_at;
	}

	public void setConnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public KakaoAccountVO getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(KakaoAccountVO kakao_account) {
		this.kakao_account = kakao_account;
	}
}
