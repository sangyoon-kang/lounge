package com.tagoplus.model.common;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 전화번호 모델
 * 	- 2018-06-22<br> 
 * 		> 정규식으로 변경<br>
 *  	> 4번째 자리 번호 제외<br>
 *  	> 하이픈 제거 getter 추가<br>
 * 
 * @author wimy
 *
 */
public class PhoneVO implements Serializable {

	private static final long serialVersionUID = -3298463449590604490L;

	/**
	 * 전화번호 판단 정규식 : 국내 전화번호 규칙 사용
	 */
	public static final String _REG_EXP_PHONE = "(^02.{0}|^01.{1}|^0[0-9]{2})-?([0-9]{3,4})-?([0-9]{4})$";
	
	/**
	 * 8자리 전화번호
	 */
	public static final String _REG_EXP_PHONE_8 = "(^1[0-9]{3})-?([0-9]{4})$";
	
	private String no;

	private String no1 = "";
	private String no2 = "";
	private String no3 = "";
	//private String no4 = "";

	public String getNo() {
		if (this.no == null)
			this.splitPhone();
		
		return this.no;
	}
	
	public void setNo(String no) {
		this.no = no;
		this.splitPhone();
	}
	
	/**
	 * [읽기전용] 하이픈 제거된 전화번호
	 * @return
	 */
	public String getNoWithoutHyphen() {
		return this.getNo().replaceAll("-", "");
	}

	/**
	 * split no number
	 */
	private void splitPhone() {
		if (this.no == null)
			this.no = "";
		
		Pattern pattern = Pattern.compile(_REG_EXP_PHONE);
		Matcher match = pattern.matcher(this.no);

		if (match.find()) {
			this.no = match.replaceAll("$1-$2-$3");
			String[] arr = this.no.split("-");
			
			//8자리 전화번호
			if (arr[1].length() == 1) {
				Pattern pattern2 = Pattern.compile(_REG_EXP_PHONE_8);
				Matcher match2 = pattern2.matcher(this.no.replaceAll("[^\\d]", ""));
				if (match2.find()) {
					this.no = match2.replaceAll("$1-$2");
					String[] arr2 = this.no.split("-");
					this.setNo1("");
					this.setNo2(arr2[0]);
					this.setNo3(arr2[1]);
				}
				else {
					this.setNo1("");
					this.setNo2("");
					this.setNo3("");
				}
			}
			else {
				this.setNo1(arr[0]);
				this.setNo2(arr[1]);
				this.setNo3(arr[2]);
			}
		}
		else {
			Pattern pattern2 = Pattern.compile(_REG_EXP_PHONE_8);
			Matcher match2 = pattern2.matcher(this.no.replaceAll("[^\\d]", ""));
			if (match2.find()) {
				this.no = match2.replaceAll("$1-$2");
				String[] arr2 = this.no.split("-");
				this.setNo1("");
				this.setNo2(arr2[0]);
				this.setNo3(arr2[1]);
			}
			
			//this.no = this.no;
			this.setNo1("");
			this.setNo2("");
			this.setNo3("");
		}
	}

	/**
	 * @return no1
	 */
	public String getNo1() {
		return this.no1;
	}

	/**
	 * @param no1
	 */
	public void setNo1(String no1) {
		this.no1 = no1;
	}

	/**
	 * @return no2
	 */
	public String getNo2() {
		return this.no2;
	}

	/**
	 * @param no2
	 */
	public void setNo2(String no2) {
		this.no2 = no2;
	}

	/**
	 * @return no3
	 */
	public String getNo3() {
		return this.no3;
	}

	/**
	 * @param no3
	 */
	public void setNo3(String no3) {
		this.no3 = no3;
	}

//	/**
//	 * @return no4
//	 */
//	public String getNo4() {
//		if (no4 == null)
//			splitPhone();
//		return this.no4;
//	}
//
//	/**
//	 * @param no4
//	 */
//	public void setNo4(String no4) {
//		this.no4 = no4;
//	}

}
