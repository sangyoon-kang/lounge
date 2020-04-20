package com.tagosolution.service.model;

import java.util.Date;

import com.tagoplus.model.GeneralModel;


public class RunTimeVO implements GeneralModel {
	
	/**
	 * Created By Mongolian Team D.Bilguun 2018-11-05 ts_comm_contents
	 */
	private static long serialVersionUID = 1L;
	
	private	Integer runTime;
	private	Integer breakStart;
	private	Integer breakEnd;
	private	Integer stopLimit;
	private	Integer autoClose1;
	private	Integer autoClose2;
	private	Integer autoClose3;
	private	Integer autoClose4;
	private	Integer autoClose5;
	private	Integer autoCloseAll;
	private	Integer maxBuyCnt1;
	private	Integer maxBuyCnt2;
	private	Integer maxBuyCnt3;
	private	Integer maxBuyCnt4;
	private	Integer maxBuyCnt5;
	private	Integer maxBuyPrice;
	private	Integer randomTime1;
	private	Integer randomTime2;
	private	Integer randomTime3;
	private	Integer randomTime4;
	private	Integer randomTime5;
	private String runType;
	private String apiState;
	
	

	public String getRunType() {
		return runType;
	}

	public void setRunType(String runType) {
		this.runType = runType;
	}

	public String getApiState() {
		return apiState;
	}

	public void setApiState(String apiState) {
		this.apiState = apiState;
	}

	public Integer getRandomTime1() {
		return randomTime1;
	}

	public void setRandomTime1(Integer randomTime1) {
		this.randomTime1 = randomTime1;
	}

	public Integer getRandomTime2() {
		return randomTime2;
	}

	public void setRandomTime2(Integer randomTime2) {
		this.randomTime2 = randomTime2;
	}

	public Integer getRandomTime3() {
		return randomTime3;
	}

	public void setRandomTime3(Integer randomTime3) {
		this.randomTime3 = randomTime3;
	}

	public Integer getRandomTime4() {
		return randomTime4;
	}

	public void setRandomTime4(Integer randomTime4) {
		this.randomTime4 = randomTime4;
	}

	public Integer getRandomTime5() {
		return randomTime5;
	}

	public void setRandomTime5(Integer randomTime5) {
		this.randomTime5 = randomTime5;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public static void setSerialversionuid(long serialversionuid) {
		serialVersionUID = serialversionuid;
	}

	public Integer getRunTime() {
		return runTime;
	}

	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public Integer getBreakStart() {
		return breakStart;
	}

	public void setBreakStart(Integer breakStart) {
		this.breakStart = breakStart;
	}

	public Integer getBreakEnd() {
		return breakEnd;
	}

	public void setBreakEnd(Integer breakEnd) {
		this.breakEnd = breakEnd;
	}

	public Integer getStopLimit() {
		return stopLimit;
	}

	public void setStopLimit(Integer stopLimit) {
		this.stopLimit = stopLimit;
	}

	public Integer getAutoClose1() {
		return autoClose1;
	}

	public void setAutoClose1(Integer autoClose1) {
		this.autoClose1 = autoClose1;
	}

	public Integer getAutoClose2() {
		return autoClose2;
	}

	public void setAutoClose2(Integer autoClose2) {
		this.autoClose2 = autoClose2;
	}

	public Integer getAutoClose3() {
		return autoClose3;
	}

	public void setAutoClose3(Integer autoClose3) {
		this.autoClose3 = autoClose3;
	}

	public Integer getAutoClose4() {
		return autoClose4;
	}

	public void setAutoClose4(Integer autoClose4) {
		this.autoClose4 = autoClose4;
	}

	public Integer getAutoClose5() {
		return autoClose5;
	}

	public void setAutoClose5(Integer autoClose5) {
		this.autoClose5 = autoClose5;
	}

	public Integer getAutoCloseAll() {
		return autoCloseAll;
	}

	public void setAutoCloseAll(Integer autoCloseAll) {
		this.autoCloseAll = autoCloseAll;
	}

	public Integer getMaxBuyCnt1() {
		return maxBuyCnt1;
	}

	public void setMaxBuyCnt1(Integer maxBuyCnt1) {
		this.maxBuyCnt1 = maxBuyCnt1;
	}

	public Integer getMaxBuyCnt2() {
		return maxBuyCnt2;
	}

	public void setMaxBuyCnt2(Integer maxBuyCnt2) {
		this.maxBuyCnt2 = maxBuyCnt2;
	}

	public Integer getMaxBuyCnt3() {
		return maxBuyCnt3;
	}

	public void setMaxBuyCnt3(Integer maxBuyCnt3) {
		this.maxBuyCnt3 = maxBuyCnt3;
	}

	public Integer getMaxBuyCnt4() {
		return maxBuyCnt4;
	}

	public void setMaxBuyCnt4(Integer maxBuyCnt4) {
		this.maxBuyCnt4 = maxBuyCnt4;
	}

	public Integer getMaxBuyCnt5() {
		return maxBuyCnt5;
	}

	public void setMaxBuyCnt5(Integer maxBuyCnt5) {
		this.maxBuyCnt5 = maxBuyCnt5;
	}

	public Integer getMaxBuyPrice() {
		return maxBuyPrice;
	}

	public void setMaxBuyPrice(Integer maxBuyPrice) {
		this.maxBuyPrice = maxBuyPrice;
	}
}