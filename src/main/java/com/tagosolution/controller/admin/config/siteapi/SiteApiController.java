package com.tagosolution.controller.admin.config.siteapi;


import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;

import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.SiteApiServiceImpl;
import com.tagosolution.service.model.SiteApiVO;


/**
 * API Controller
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/siteapi")
public class SiteApiController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteApiController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	SiteApiServiceImpl _apiService;
		
	/**
	 * API List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api")
	public String apiset(SiteApiVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		model.addAttribute("set", set);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/config/siteapi/siteapi";
	}
	
	/**
	 * API Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api_proc")
	public String apiproc(SiteApiVO vo,  BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		try {
			vo.setSiteCode(super.getSiteSession().getSiteSeq());
			_apiService.mergeApi(vo);
			am.setMessage("저장 완료");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		am.setScript("$.Nav('go', './api');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
}
