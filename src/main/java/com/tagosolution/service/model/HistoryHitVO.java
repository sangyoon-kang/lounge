package com.tagosolution.service.model;
import java.util.Date;

import com.tagoplus.model.GeneralModel;

public class HistoryHitVO implements GeneralModel{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -5953017039090683176L;
	
	private int historyHitIdx;
	
	private String hitDate;
	
	private String hitTime;
	
	private int hitCnt;
	
	
	
	public int getHistoryHitIdx() {
		return historyHitIdx;
	}
	
	public void setHistoryHitIdx(int historyHitIdx) {
		this.historyHitIdx = historyHitIdx;
	}
	
	public String getHitDate() {
		return hitDate;
	}
	
	public void setHitDate(String hitDate) {
		this.hitDate = hitDate;
	}
	
	public String getHitTime() {
		return hitTime;
	}
	
	public void setHitTime(String hitTime) {
		this.hitTime = hitTime;
	}
	
	public int getHitCnt() {
		return hitCnt;
	}
	
	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}	


}