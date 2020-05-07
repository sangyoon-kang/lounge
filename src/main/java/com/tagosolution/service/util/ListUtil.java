package com.tagosolution.service.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.google.common.collect.ImmutableMap;
import com.tagoplus.model.common.StringPair;

/**
 * RSA 암호화 유틸리티<br>
 * /common/js/rsa 디렉토리 내 rsa 암호화 처리용 자바스크립트와 함께 사용
 * @author wimy
 *
 */
public class ListUtil {
	
	/**
	 * Created by Mongolian Team
	 * - spring model 바인딩
	 * @param request
	 * @param model
	 * @param sessionName
	 * @param keySize
	 * @throws Exception
	 */
    
	public static final Map<String, String> additionalType = ImmutableMap.<String, String>builder()
		.put("text", "text")
	    .put("select", "select")
	    .put("radio", "radio")
	    .put("checkbox", "checkbox")
	    .put("textarea", "textarea")
	    .put("file", "file")
	    .put("datepicker", "일자(단력)")
	    .put("dtimepick", "년월일시")
	    .put("birthdate", "생년월일")
	    .put("mobileno", "전화번호")
	    .put("address", "주소찾기")
	    .put("email", "이메일")
	    .build();
	
	public static List<StringPair> typeQuickAsk() throws Exception {
		 List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("이름", "userName"));
		 pair.add(new StringPair("연락처", "contact"));
		 pair.add(new StringPair("이메일", "email"));
		 pair.add(new StringPair("내용", "content"));
		 
		 return pair;
	}
	
	/*public static List<StringPair> listContentsType() throws Exception {
		 List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("유형", ""));
		 pair.add(new StringPair("가입약관", "terms"));
		 pair.add(new StringPair("개인정보 보호정책", "privacy"));
		 pair.add(new StringPair("회원가입약관", "memterms"));
		 
		 return pair;
	}*/
	
	public static Map<String, String> listContentsType () throws Exception {
		Map<String, String> myMap = new HashMap<String, String>();
		myMap.put("memterms", "회원가입약관");
		myMap.put("terms", "가입약관" );
	    myMap.put("privacy", "개인정보 보호정책");
		return myMap;
	}
	
	public static List<StringPair> ListCompanyType() throws Exception {
		 List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("개인", "P"));
		 pair.add(new StringPair("회사", "C"));
		 return pair;
	}
	
	public static List<StringPair> BoardSearchType() throws Exception {
		List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("제목","subject"));
		 pair.add(new StringPair("내용","body"));
		 pair.add(new StringPair("글쓴이","author"));
		 
		 return pair;
	}
	
	public static Map<Integer, String> gradeLevelList () throws Exception {
		Map<Integer, String> myMap = new HashMap<Integer, String>();
		myMap.put(1 , "head" );
	    myMap.put(2 , "disterbuter");
	    myMap.put(3 , "agent");
	    myMap.put(4 , "branch");
	    myMap.put(5 , "dealer");
	    myMap.put(6 , "normalmember");
		return myMap;
	}
	
	public static Map<Integer, String> timeHoursMap () throws Exception {
		Map<Integer, String> myMap = new HashMap<Integer, String>();
		for(Integer i = 0; i < 24; i++){
			String text = (i < 10 ? "0"+ i : i) + " 시";
			myMap.put(i, text);
		}
		return myMap;
	}

	public static Map<Integer, String> timeMinuts1Map (String currHour, Integer runTime) throws Exception {
		Map<Integer, String> myMap = new TreeMap<Integer, String>();
		currHour = (!currHour.isEmpty()) ? currHour : "00";
		for(Integer i = 0; i < 60; i+=runTime){
			String text = (i < 10 ? "0"+ i : i.toString());
			myMap.put(i, currHour.concat(":"+text));
		}
		return myMap;
	}

	public static String getCurrentHour(Date date, int plus) throws Exception {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(date);
		Integer minutes = calendar.get(Calendar.MINUTE);
		Integer hour = (minutes == 0) ? calendar.get(Calendar.HOUR_OF_DAY) : calendar.get(Calendar.HOUR_OF_DAY)+plus;
		return ((hour < 10) ? "0" + hour : hour).toString(); 
	}
	
	public static String getCurrentHourMinute(Date date) throws Exception {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(date);
		Integer minutes = calendar.get(Calendar.MINUTE);
		Integer hour = calendar.get(Calendar.HOUR_OF_DAY);
		return hour.toString().concat(":"+((minutes < 10) ? "0"+minutes : minutes));
	}
	
	public static String getCurrentYearMonth(Date date) throws Exception {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(date);
		Integer year = calendar.get(Calendar.YEAR);
		Integer month = calendar.get(Calendar.MONTH);
		month = month +1;
		return year.toString().concat("-"+((month < 10 ? "0"+month : month).toString()));
	}

	public static String getCurrentDate() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmm");
		Calendar time = Calendar.getInstance();
		return format.format(time.getTime());

	}

	/**
	 * check date equals today.
	 * 
//	 * @param Object
	 * @return boolean 
	 */
	public static boolean isCurrent(String begin, String end) throws Exception {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			Date beginDate = formatter.parse(begin);
			Date endDate = formatter.parse(end);
			
			if (beginDate.equals(endDate)) {
				return true;
			}
			else {
				return false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * Deposit & Withdraw States
//	 * @param currHour
	 * @return
	 * @throws Exception
	 */
	public static Map<String, String> getStateMap() throws Exception {
		Map<String, String> myMap = new TreeMap<String, String>();
		myMap.put("R", "요청");
		myMap.put("A", "승인");
		myMap.put("C", "취소");
		return myMap;
	}
	
	/**
	 * IoTypes
//	 * @param currHour
	 * @return
	 * @throws Exception
	 */
	public static List<StringPair> listIoType() throws Exception {
		List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("I", "입금"));
		 pair.add(new StringPair("O", "출금 "));
		return pair;
	}
	public static Map<String, String> monthMap () throws Exception {
		Map<String, String> myMap = new TreeMap<String, String>();
		for(Integer i = 1; i <= 12; i++){
			String text = (i < 10 ? "0"+ i : i) + " 월";
			myMap.put((i < 10 ? "0"+ i : i.toString()), text);
		}
		return myMap;
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public static boolean isWorkingHour(int start, int end) throws Exception {
		DateFormat datos = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date thisdate = datos.parse(datos.format(new Date()));
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(thisdate);
		Integer hour = cal1.get(Calendar.HOUR_OF_DAY);  
		return start <= hour && hour < end;
	}
}
