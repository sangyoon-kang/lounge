package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import java.util.Date;

public class PageVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -2048023800923935253L;

	private Short pageSeq;

    private String pageCode;

    private String pageName;

    private String pageUrl;

    private Short pageGrade;

    private Integer priority;

    private Date regDate;

    private Integer pageGroupSeq;

    private String pageBody;
    
    private String regUser;
    
    private String regUserName;
    
    private String groupName;
    
    

    public Short getPageSeq() {
        return pageSeq;
    }

    public void setPageSeq(Short pageSeq) {
        this.pageSeq = pageSeq;
    }

    public String getPageCode() {
        return pageCode;
    }

    public void setPageCode(String pageCode) {
        this.pageCode = pageCode;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    public Short getPageGrade() {
        return pageGrade;
    }

    public void setPageGrade(Short pageGrade) {
        this.pageGrade = pageGrade;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Integer getPageGroupSeq() {
        return pageGroupSeq;
    }

    public void setPageGroupSeq(Integer pageGroupSeq) {
        this.pageGroupSeq = pageGroupSeq;
    }

    public String getPageBody() {
        return pageBody;
    }

    public void setPageBody(String pageBody) {
        this.pageBody = pageBody;
    }

	public String getRegUser() {
		return regUser;
	}

	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}

	public String getRegUserName() {
		return regUserName;
	}

	public void setRegUserName(String regUserName) {
		this.regUserName = regUserName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
    
    
}