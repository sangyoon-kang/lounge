package com.tagosolution.service.model.sns;

import java.util.Map;

public class KakaoAccountVO {
	private Boolean profile_needs_agreement;
	private Map<String,String> profile;
	private Boolean has_email;
	private Boolean email_needs_agreement;
	private Boolean is_email_valid;
	private Boolean is_email_verified;
	private String email;
	private String birthday;
	private String name;
	private Boolean has_birthday;
	private Boolean birthday_needs_agreement;
	private Boolean has_gender;
	private Boolean gender_needs_agreement;
	
	public Boolean getProfile_needs_agreement() {
		return profile_needs_agreement;
	}
	public void setProfile_needs_agreement(Boolean profile_needs_agreement) {
		this.profile_needs_agreement = profile_needs_agreement;
	}
	public Map<String,String> getProfile() {
		return profile;
	}
	public void setProfile(Map<String,String> profile) {
		this.profile = profile;
	}
	public Boolean getHas_email() {
		return has_email;
	}
	public void setHas_email(Boolean has_email) {
		this.has_email = has_email;
	}
	public Boolean getEmail_needs_agreement() {
		return email_needs_agreement;
	}
	public void setEmail_needs_agreement(Boolean email_needs_agreement) {
		this.email_needs_agreement = email_needs_agreement;
	}
	public Boolean getIs_email_valid() {
		return is_email_valid;
	}
	public void setIs_email_valid(Boolean is_email_valid) {
		this.is_email_valid = is_email_valid;
	}
	public Boolean getIs_email_verified() {
		return is_email_verified;
	}
	public void setIs_email_verified(Boolean is_email_verified) {
		this.is_email_verified = is_email_verified;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getHas_birthday() {
		return has_birthday;
	}
	public void setHas_birthday(Boolean has_birthday) {
		this.has_birthday = has_birthday;
	}
	public Boolean getBirthday_needs_agreement() {
		return birthday_needs_agreement;
	}
	public void setBirthday_needs_agreement(Boolean birthday_needs_agreement) {
		this.birthday_needs_agreement = birthday_needs_agreement;
	}
	public Boolean getHas_gender() {
		return has_gender;
	}
	public void setHas_gender(Boolean has_gender) {
		this.has_gender = has_gender;
	}
	public Boolean getGender_needs_agreement() {
		return gender_needs_agreement;
	}
	public void setGender_needs_agreement(Boolean gender_needs_agreement) {
		this.gender_needs_agreement = gender_needs_agreement;
	}
}
