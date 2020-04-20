package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class MailTmplVO implements GeneralModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = 3926706320276141029L;

	private Integer mailSeq;

    private String mailName;

    private String adminSendYn;

    private String userSendYn;
    
    private String body;
    
    private String subject;

    public Integer getMailSeq() {
        return mailSeq;
    }

    public void setMailSeq(Integer mailSeq) {
        this.mailSeq = mailSeq;
    }

    public String getMailName() {
        return mailName;
    }

    public void setMailName(String mailName) {
        this.mailName = mailName;
    }

 

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

	public String getUserSendYn() {
		return userSendYn;
	}

	public void setUserSendYn(String userSendYn) {
		this.userSendYn = userSendYn;
	}

	public String getAdminSendYn() {
		return adminSendYn;
	}

	public void setAdminSendYn(String adminSendYn) {
		this.adminSendYn = adminSendYn;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getSendName() {
		if (this.adminSendYn.equals("Y") && this.userSendYn.equals("Y"))
			return "관리자, 회원";
		else if (this.adminSendYn.equals("Y") && this.userSendYn.equals("N"))
			return "관리자";
		else if (this.adminSendYn.equals("N") && this.userSendYn.equals("Y"))
			return "회원";
		else
			return "발송안함";
		
	}
	
}