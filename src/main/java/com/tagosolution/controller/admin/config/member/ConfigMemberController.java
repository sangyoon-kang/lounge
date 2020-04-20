package com.tagosolution.controller.admin.config.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.tagosolution.service.impl.ConfigMemberServiceImpl;
import com.tagosolution.service.model.MemberSettingVO;

import com.tagosolution.service.util.ListUtil;

/**
 * Member Setting
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/member")
public class ConfigMemberController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConfigMemberController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	ConfigMemberServiceImpl _memConfigService;
	
	/**
	 * Member Config List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/manage")
	public String memConfManage(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 회원 관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberSettingVO vo = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", super.getSiteSession().getSiteSeq());
		String host = super.getConfig().getHost();
		
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		model.addAttribute("HOST", host);
		model.addAttribute("addItems", ListUtil.additionalType);
		return super.getConfig().getAdminRoot() + "/config/member/manage";
	}
	
	/**
	 * Member Config Save
	 * @param vo
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/member_conf_proc")
	public String basicSysConfigProc(MemberSettingVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		try{
			vo.setSiteSeq(super.getSiteSession().getSiteSeq());
			_memConfigService.mergeMemberConfig(vo);
			am.setMessage("저장 완료");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("오류 : " + e.getMessage());
		}
		am.setScript("$.Nav('go', './manage')");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * SNS List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sns")
	public String Snsset(MemberSettingVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
	
		MemberSettingVO set = (MemberSettingVO) _gDao.selectOne("memberSetting.selectBySns",  super.getSiteSession().getSiteSeq());
		model.addAttribute("set", set);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/config/snsconfig/sns";
	}
	
	/**
	 * SNS Save
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sns_proc")
	public String Snsproc(MemberSettingVO vo,  BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		try{
			vo.setSiteSeq(super.getSiteSession().getSiteSeq());
			_memConfigService.updateSns(vo);
			am.setMessage("저장 완료");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("오류 : " + e.getMessage());
		}
		am.setScript("$.Nav('go', './sns');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}
