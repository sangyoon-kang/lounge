package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class FixedCodeVO implements GeneralModel {
	
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -4436166289206146169L;

	private String codeCode;

    private String codeName;

    private String codeDesc;

    private String codeDesc2;

    public String getCodeCode() {
        return codeCode;
    }

    public void setCodeCode(String codeCode) {
        this.codeCode = codeCode;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getCodeDesc() {
        return codeDesc;
    }

    public void setCodeDesc(String codeDesc) {
        this.codeDesc = codeDesc;
    }

    public String getCodeDesc2() {
        return codeDesc2;
    }

    public void setCodeDesc2(String codeDesc2) {
        this.codeDesc2 = codeDesc2;
    }
}