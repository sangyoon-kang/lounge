package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.util.StringUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 작성된 폼메일 모델
 * @author kky
 *
 */
public class FormWritingVO implements GeneralModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = -3313245423666832549L;

	private Integer formWritingSeq;

    private Integer formSeq;

    private String subject;

    private String phone;

    private String email;

    private String name;

    private String process;

    private Date regDate;

    private String regUser;

    private String body;
    
    private String formName;
    
    private String[] userEmail;
    
    //private String writebody;
    
    private List<FormInfoVO> infoVO;
    
    private List<FormValueVO> valueVO;

    public Integer getFormWritingSeq() {
        return formWritingSeq;
    }

    public void setFormWritingSeq(Integer formWritingSeq) {
        this.formWritingSeq = formWritingSeq;
    }

    public Integer getFormSeq() {
        return formSeq;
    }

    public void setFormSeq(Integer formSeq) {
        this.formSeq = formSeq;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }
    
    /**
     * [읽기전용]
     * 처리상태
     * @return
     */
	public String getProcessName() {
		if (!StringUtil.isEmpty(this.getProcess())) {
			if (this.getProcess().equals("W"))
				return "대기중";
			else if (this.getProcess().equals("P"))
				return "처리중";
			else if (this.getProcess().equals("C"))
				return "처리완료";
			else
				return "";
		} else {
			return "";
		}
	
	}

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getRegUser() {
        return regUser;
    }

    public void setRegUser(String regUser) {
        this.regUser = regUser;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

	public List<FormInfoVO> getInfoVO() {
		if (this.infoVO == null)
			this.infoVO = new ArrayList<FormInfoVO>();
		return infoVO;
	}

	public void setInfoVO(List<FormInfoVO> infoVO) {
		this.infoVO = infoVO;
	}

	public List<FormValueVO> getValueVO() {
		if (this.valueVO == null)
			this.valueVO = new ArrayList<FormValueVO>();
		return valueVO;
	}

	public void setValueVO(List<FormValueVO> valueVO) {
		this.valueVO = valueVO;
	}

	public String[] getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String[] userEmail) {
		this.userEmail = userEmail;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

//	public String getWritebody() {
//		return writebody;
//	}
//
//	public void setWritebody(String writebody) {
//		this.writebody = writebody;
//	}

	



	
}