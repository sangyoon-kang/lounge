package com.tagosolution.controller.admin.statistic;

import java.net.InetAddress;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.SearchVO;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.config.sitemeta.SiteMetaController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.HistoryLoginVO;
import com.tagosolution.service.model.SiteApiVO;



/**
 * 
 * @author Munkhtulga
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/stat/manage")

public class  HistoryLoginController extends BaseController {
	/*private static final Logger logger = LoggerFactory.getLogger(SiteMetaController.class);

	@Resource
	GeneralDAOImpl _gDao;
	
	
	@RequestMapping(value = "/counterAdmin")
	public String loginCounterAdmin(SearchVO search, BindingResult result, Model model) throws Exception {
		HistoryLoginVO accessLogin = new HistoryLoginVO();	
		
		accessLogin.setSiteSeq(super.getSiteSession().getSiteSeq().intValue());
		accessLogin.setUserIp(InetAddress.getLocalHost().getHostAddress());
		accessLogin.setUserId(super.getAdminSession().getAdminId());
		accessLogin.setUserType("A"); //A:관리자админ
		accessLogin.setSessonInfo(super.getAdminSession().getNickname());
		
		//model.addAttribute("sess", super.getUserSession().getBirthDt());
		model.addAttribute("accessLogin", accessLogin.getUserId());		
		_gDao.insert("historyLogin.insert", accessLogin);

		return super.getConfig().getAdminRoot() + "/stat/manage/import";
	};


	@RequestMapping(value = "/counterUser")
	public  void loginCounterUser() throws Exception {
		HistoryLoginVO accessLogin = new HistoryLoginVO();
		
		
		accessLogin.setSiteSeq(super.getSiteSession().getSiteSeq().intValue());
		accessLogin.setUserIp(InetAddress.getLocalHost().getHostAddress());
		accessLogin.setUserId(super.getUserSession().getUserId());
		accessLogin.setUserType("U"); //A:관리자админ
		accessLogin.setSessonInfo(super.getUserSession().getNickname());

		
		_gDao.insert("historyLogin.insert", accessLogin);		
	};
	*/
	
}
