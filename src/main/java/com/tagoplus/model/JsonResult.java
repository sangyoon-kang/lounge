package com.tagoplus.model;

/**
 * 공용 JSON 리턴 모델
 * @author wimy
 *
 */
public class JsonResult implements GeneralModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6362971805582357050L;
	
	private boolean success;
	
	private String code;
	
	private String message;
	
	private Object data;

	
	/**
	 * json 성공 여부
	 * @return
	 */
	public boolean isSuccess() {
		return success;
	}

	/**
	 * json 성공 여부
	 * @param success
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}

	/**
	 * 코드
	 * @return
	 */
	public String getCode() {
		return code;
	}

	/**
	 * 코드
	 * @param code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * 메시지
	 * @return
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * 메시지
	 * @param message
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * JSON 데이터
	 * @return
	 */
	public Object getData() {
		return data;
	}

	/**
	 * JSON 데이터
	 * @param data
	 */
	public void setData(Object data) {
		this.data = data;
	}
	
}
