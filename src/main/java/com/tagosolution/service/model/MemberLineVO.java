package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class MemberLineVO implements GeneralModel {
	
	private static final long serialVersionUID = -6568950051260811476L;
	
    private String userId;

    private String lineId1;

    private Integer lineRate1;

    private String lineId2;

    private Integer lineRate2;

    private String lineId3;

    private Integer lineRate3;

    private String lineId4;

    private Integer lineRate4;

	private String lineId5;

    private Integer lineRate5;
    
    private Integer lineRateT;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLineId1() {
        return lineId1;
    }

    public void setLineId1(String lineId1) {
        this.lineId1 = lineId1;
    }

    public Integer getLineRate1() {
        return lineRate1;
    }

    public void setLineRate1(Integer lineRate1) {
        this.lineRate1 = lineRate1;
    }

    public String getLineId2() {
        return lineId2;
    }

    public void setLineId2(String lineId2) {
        this.lineId2 = lineId2;
    }

    public Integer getLineRate2() {
        return lineRate2;
    }

    public void setLineRate2(Integer lineRate2) {
        this.lineRate2 = lineRate2;
    }

    public String getLineId3() {
        return lineId3;
    }

    public void setLineId3(String lineId3) {
        this.lineId3 = lineId3;
    }

    public Integer getLineRate3() {
        return lineRate3;
    }

    public void setLineRate3(Integer lineRate3) {
        this.lineRate3 = lineRate3;
    }

    public String getLineId4() {
        return lineId4;
    }

    public void setLineId4(String lineId4) {
        this.lineId4 = lineId4;
    }

    public Integer getLineRate4() {
        return lineRate4;
    }

    public void setLineRate4(Integer lineRate4) {
        this.lineRate4 = lineRate4;
    }

	public String getLineId5() {
        return lineId5;
    }

    public void setLineId5(String lineId5) {
        this.lineId5 = lineId5;
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