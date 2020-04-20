package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

/**
 * 게시판 그룹 모델
 * @author wimy
 *
 */
public class GroupVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -5953017039090683176L;

	
	private int groupSeq;

    private String groupType;

    private String groupName;

    public int getGroupSeq() {
        return groupSeq;
    }

    public void setGroupSeq(int groupSeq) {
        this.groupSeq = groupSeq;
    }

    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}