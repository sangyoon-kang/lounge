package com.tagosolution.service.model;
import java.util.Date;

import com.tagoplus.model.GeneralModel;


public class HistoryLoginVO  implements GeneralModel  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5953017039090683176L;
	
	private int historyLoginIdx;
	
	private String userType;
	
	private String userId;
	
	private String userIp;
	
	private String sessonInfo;
	
	private String allInfo;
	
	private Date regDate;
	
	private Integer count;

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public int getHistoryLoginIdx() {
		return historyLoginIdx;
	}

	public void setHistoryLoginIdx(int historyLoginIdx) {
		this.historyLoginIdx = historyLoginIdx;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public String getSessonInfo() {
		return sessonInfo;
	}

	public void setSessonInfo(String sessonInfo) {
		this.sessonInfo = sessonInfo;
	}

	public String getAllInfo() {
		return allInfo;
	}

	public void setAllInfo(String allInfo) {
		this.allInfo = allInfo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	


}
