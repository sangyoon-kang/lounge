package com.tagosolution.service.model;

import com.tagoplus.model.common.GeneralUserVO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AdminVO extends GeneralUserVO {
    /**
	 * 
	 */
	private static final long serialVersionUID = 4897699775884661134L;
	
	
    private String icon;

    private String memo;

    private Date regDate;

    private Date modDate;

    private String useYn;

    private String auths;
    
    private String userType;
    
    private Integer authGroupIdx;
    
    private String nickname;
    
    private List<MultipartFile> iconfile;
    
    private List<MenuAuthoSettingVO> adminAuth;
    
    
    public List<MenuAuthoSettingVO> getAdminAuth() {
		return adminAuth;
	}

	public void setAdminAuth(List<MenuAuthoSettingVO> adminAuth) {
		this.adminAuth = adminAuth;
	}

	/**
     * 관리자 유형 : superuser:슈퍼유저, disigner:디자이너, admin:관리자
     * @return
     */
    public String getUserType() {
		return userType;
	}

    /**
     * 관리자 유형 : superuser:슈퍼유저, disigner:디자이너, admin:관리자
     * @param userType
     */
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getAdminId() {
        return super.getUserID();
    }

    public void setAdminId(String adminId) {
        super.setUserID(adminId);
    }

    public String getAdminPwd() {
        return super.getPassword();
    }

    public void setAdminPwd(String adminPwd) {
        super.setPassword(adminPwd);
    }

    public String getAdminName() {
        return super.getUserName();
    }

    public void setAdminName(String adminName) {
        super.setUserName(adminName);
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getModDate() {
        return modDate;
    }

    public void setModDate(Date modDate) {
        this.modDate = modDate;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getAuths() {
        return auths;
    }

    public void setAuths(String auths) {
        this.auths = auths;
    }

	public Integer getAuthGroupIdx() {
		return authGroupIdx;
	}

	public void setAuthGroupIdx(Integer authGroupIdx) {
		this.authGroupIdx = authGroupIdx;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public List<MultipartFile> getIconfile() {
		return iconfile;
	}

	public void setIconfile(List<MultipartFile> iconfile) {
		this.iconfile = iconfile;
	}
    
    
}