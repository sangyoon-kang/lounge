package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class RateVO implements GeneralModel {
	
	 /**
	 * park young-jin 2019-12-18.
	 */
	private static final long serialVersionUID = -1L;
	
	private Byte lrIdx;
	
	private Integer runTime;
	
    private Integer lineRate1;

    private Integer lineRate2;

    private Integer lineRate3;

    private Integer lineRate4;

	private Integer lineRate5;

    private Integer lineRateT;

    public Byte getLrIdx() {
		return lrIdx;
	}

	public void setLrIdx(Byte lrIdx) {
		this.lrIdx = lrIdx;
	}
	
	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public Integer getRunTime() {
        return runTime;
    }

	public Integer getLineRate1() {
        return lineRate1;
    }

    public void setLineRate1(Integer lineRate1) {
        this.lineRate1 = lineRate1;
    }
    
    public Integer getLineRate2() {
        return lineRate2;
    }

    public void setLineRate2(Integer lineRate2) {
        this.lineRate2 = lineRate2;
    }
    
    public Integer getLineRate3() {
        return lineRate3;
    }

    public void setLineRate3(Integer lineRate3) {
        this.lineRate3 = lineRate3;
    }    
    
    public Integer getLineRate4() {
        return lineRate4;
    }

    public void setLineRate4(Integer lineRate4) {
        this.lineRate4 = lineRate4;
    }
    
    public Integer getLineRate5() {
        return lineRate5;
    }

    public void setLineRate5(Integer lineRate5) {
        this.lineRate5 = lineRate5;
    }
    
    public Integer getLineRateT() {
        return lineRateT;
    }

    public void setLineRateT(Integer lineRateT) {
        this.lineRateT = lineRateT;
    }
    
    
}