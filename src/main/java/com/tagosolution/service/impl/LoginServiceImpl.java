package com.tagosolution.service.impl;

import java.net.InetAddress;
import org.springframework.stereotype.Service;
import com.tagosolution.service.model.HistoryLoginVO;
import com.tagosolution.service.model.MemberInfoVO;

/**
 * 
 * @author Munkhtulga
 *
 */
@Service("loginService")
public class LoginServiceImpl extends BaseServiceImpl {
	
	
	/**
	 * 
	 * @param memVo
	 * @throws Exception
	 */
	public void insertLoginUserCounter(MemberInfoVO memVo ) throws Exception{
		
		HistoryLoginVO accessLogin = new HistoryLoginVO();
		accessLogin.setUserIp(InetAddress.getLocalHost().getHostAddress());
		accessLogin.setUserId(memVo.getUserId());
		accessLogin.setUserType("U"); //A:관리자админ
		accessLogin.setSessonInfo(memVo.getNickname());
		super.getDAO().insert("historyLogin.insert", accessLogin);
	}	

}
