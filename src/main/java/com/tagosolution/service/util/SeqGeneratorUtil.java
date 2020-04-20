package com.tagosolution.service.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 
 * @author G.Tenger
 * Purpose of Generating MenuIdx
 */
public class SeqGeneratorUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(SeqGeneratorUtil.class);
	
	
	public static String genMenuId(Short level,Integer maxId, String pId) {
		String s = "";
		Integer foo = maxId;
		foo++;
		switch (level) {
        case 1:  
			foo = foo*10000;
			s = foo.toString();
			if(s.length() == 5) s= "0"+s;
        	break;
        case 2:  
			s = foo.toString();
			if(s.length() == 1) s= "0"+s;
			s= pId+s+"00";
        	break;
        case 3: 
			s = foo.toString();
			if(s.length() == 1) s = "0"+s;
			s= pId+s;
        	break;
        default:
        	break;
		}
		return s;
	}
}
