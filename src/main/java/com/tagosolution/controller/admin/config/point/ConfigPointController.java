package com.tagosolution.controller.admin.config.point;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.ConfigPointServiceImpl;
import com.tagosolution.service.model.BaseCMomeyVO;
import com.tagosolution.service.model.MemberSettingVO;

/**
 * Config Point Controller
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/point")
public class ConfigPointController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConfigPointController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	ConfigPointServiceImpl _configPointService;
	
	
	/**
	 * Config Point Detail
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/manage")
	public String boardManage(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 포인트 관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		BaseCMomeyVO vo = (BaseCMomeyVO) _gDao.selectByKey("baseCMomey.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("vo", vo);
		return super.getConfig().getAdminRoot() + "/config/point/manage";
	}
	
	/**
	 * Config Point Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/point_proc")
	public String pointConfProc(BaseCMomeyVO vo, SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 포인트 관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		try {
			vo.setSiteSeq(super.getSiteSession().getSiteSeq());
			_configPointService.mergePoint(vo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		AlertModel am = new AlertModel("", "./manage", null);
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}
