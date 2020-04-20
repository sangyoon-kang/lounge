package com.tagosolution.service.impl;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tagosolution.service.GlobalProperty;
import com.tagosolution.service.dao.GeneralDAOImpl;

/**
 * ServiceImpl 부모 클래스 
 * @author wimy
 *
 */
@Service
public abstract class BaseServiceImpl {
	
	@Autowired
	private GlobalProperty _globalProperty;
	
	@Autowired
	private HttpSession _session;
	
	@Resource
	private GeneralDAOImpl _gDao;
	
	
	protected GlobalProperty getConfig() {
		return this._globalProperty;
	}
	
	protected GeneralDAOImpl getDAO() {
		return this._gDao;
	}
	
	protected HttpSession getSession() {
		return this._session;
	}
	
	protected ServletContext getServletContext() {
		return this.getSession().getServletContext();
	}
}
