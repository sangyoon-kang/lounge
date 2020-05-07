package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class RateVO implements GeneralModel {

	 /**
	 * park young-jin 2019-12-18.
	 */
	private static final long serialVersionUID = -1L;

	private Integer lrIdx;

	private Integer runTime;

    private Float lineRate1;

    private Float lineRate2;

    private Float lineRate3;

    private Float lineRate4;

	private Float lineRate5;

    private Float lineRateT;

    public Integer getLrIdx() {
		return lrIdx;
	}

	public void setLrIdx(Integer lrIdx) {
		this.lrIdx = lrIdx;
	}

	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public Integer getRunTime() {
        return runTime;
    }

    public Float getLineRate1() {
        return lineRate1;
    }

    public void setLineRate1(Float lineRate1) {
        this.lineRate1 = lineRate1;
    }

    public Float getLineRate2() {
        return lineRate2;
    }

    public void setLineRate2(Float lineRate2) {
        this.lineRate2 = lineRate2;
    }

    public Float getLineRate3() {
        return lineRate3;
    }

    public void setLineRate3(Float lineRate3) {
        this.lineRate3 = lineRate3;
    }

    public Float getLineRate4() {
        return lineRate4;
    }

    public void setLineRate4(Float lineRate4) {
        this.lineRate4 = lineRate4;
    }

    public Float getLineRate5() {
        return lineRate5;
    }

    public void setLineRate5(Float lineRate5) {
        this.lineRate5 = lineRate5;
    }

    public Float getLineRateT() {
        return lineRateT;
    }

    public void setLineRateT(Float lineRateT) {
        this.lineRateT = lineRateT;
    }
}