package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;
import java.util.Date;

public class PopupVO implements GeneralModel {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -4608672490380839584L;

	private Short popupSeq;

    private String subject;

    private String linkUrl;

    private Short positionX;

    private Short positionY;

    private Short horizontalSize;

    private Short verticalSize;

    private String startDt;

    private String endDt;

    private String popupType;

    private Date regDate;

    private Date modDate;

    private String regUser;

    private String modUser;

    private String useYn;

    private String body;

    public Short getPopupSeq() {
        return popupSeq;
    }

    public void setPopupSeq(Short popupSeq) {
        this.popupSeq = popupSeq;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public Short getPositionX() {
        return positionX;
    }

    public void setPositionX(Short positionX) {
        this.positionX = positionX;
    }

    public Short getPositionY() {
        return positionY;
    }

    public void setPositionY(Short positionY) {
        this.positionY = positionY;
    }

    public Short getHorizontalSize() {
        return horizontalSize;
    }

    public void setHorizontalSize(Short horizontalSize) {
        this.horizontalSize = horizontalSize;
    }

    public Short getVerticalSize() {
        return verticalSize;
    }

    public void setVerticalSize(Short verticalSize) {
        this.verticalSize = verticalSize;
    }

    public String getStartDt() {
        return startDt;
    }

    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }

    public String getEndDt() {
        return endDt;
    }

    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }

    public String getPopupType() {
        return popupType;
    }

    public void setPopupType(String popupType) {
        this.popupType = popupType;
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

    public String getRegUser() {
        return regUser;
    }

    public void setRegUser(String regUser) {
        this.regUser = regUser;
    }

    public String getModUser() {
        return modUser;
    }

    public void setModUser(String modUser) {
        this.modUser = modUser;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}