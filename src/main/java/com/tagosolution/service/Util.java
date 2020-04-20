package com.tagosolution.service;

import java.util.ArrayList;
import java.util.List;

public class Util {
	
	//public static 
	
	/**
	 * 날짜 표시 형식 리스트
	 * @return
	 */
	public static List<String> getDateFormats() {
		List<String> list = new ArrayList<String>();
		list.add("yyyy-MM-dd");
		list.add("yyyy.MM.dd");
		list.add("yyyy/MM/dd");
		list.add("yy-MM-dd");
		list.add("yy.MM.dd");
		list.add("yy/MM/dd");
		list.add("yyyy-MM-dd HH:mm");
		list.add("yyyy-MM-dd a hh:mm");
		return list;
	}
	
	public static final String SECRET_TOKEN = "fxprime_secret";
}
