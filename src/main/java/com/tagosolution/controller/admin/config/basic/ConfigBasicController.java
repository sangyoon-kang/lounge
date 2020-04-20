package com.tagosolution.controller.admin.config.basic;

import java.util.ArrayList;
import java.util.List;

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
import com.tagoplus.model.common.StringPair;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.SiteServiceImpl;
import com.tagosolution.service.model.BannerMasterVO;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.BannerSearchVO;
import com.tagosolution.service.model.search.FormmailSearchVO;
import com.tagosolution.service.model.search.PageSearchVO;
import com.tagosolution.service.model.search.PopupSearchVO;


/**
 * 환경설정 > 기본설정 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/basic")
public class ConfigBasicController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConfigBasicController.class);

	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	SiteServiceImpl _siteService; 
	
	/**
	 * 환경설정 > 기본설정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys_configuration")
	public String basicSysConfig(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 기본설정 &gt; 기본설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		//관리자 메뉴 목록
		//String sGroupCode = "005";
		//List<FixedCodeVO> useMenus = (List<FixedCodeVO>) _gDao.selectList("fixedCode.selectByGroup", sGroupCode);
//		Short level = 1;
//		List<MenuSettingVO> useMenus = (List<MenuSettingVO>) _gDao.selectList("menuSetting.selectByKey", level);
		
		//사용 여부
		List<StringPair> pointYns = new ArrayList<StringPair>();
		pointYns.add(new StringPair("사용", "Y"));
		pointYns.add(new StringPair("사용안함", "N"));
		
//		model.addAttribute("useMenus", useMenus);
		model.addAttribute("pointYns", pointYns);
		
		return super.getConfig().getAdminRoot() + "/config/basic/sys_config";
	}
	
	/**
	 * 환경설정 > 기본설정 - 처리
	 * @param vo
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys_config_proc")
	public String basicSysConfigProc(SiteVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		vo.setSiteSeq(super.getSiteSession().getSiteSeq());
		vo.setSiteCertKey("");
		
		if (vo.getCheckedSu().equals("Y") && !StringUtil.isEmpty(vo.getSuId()) && !StringUtil.isEmpty(vo.getSuPwd()))
			vo.setSuPwd(Encrypt.SHA256Hash(vo.getSuPwd()));
		
		if (vo.getCheckedDs().equals("Y") && !StringUtil.isEmpty(vo.getDsId()) && !StringUtil.isEmpty(vo.getDsPwd()))
			vo.setDsPwd(Encrypt.SHA256Hash(vo.getDsPwd()));
		
		//logger.debug(">>>>>>> vo.getUseMenu : {}", vo.getUseMenu());
		//logger.debug(">>>>>>> vo.getUseMenus : {}", vo.getUseMenus());
		
		_siteService.update(vo, request);
		
		AlertModel am = new AlertModel("", "./sys_configuration", null);
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	

	
	/**
	 * 환경설정 > 로그분석 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/log")
	public String basicLog(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 기본설정 &gt; 로그분석", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		return super.getConfig().getAdminRoot() + "/config/basic/log";
	}
	
	/**
	 * 환경설정 > 배너관리 - 생성코드
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/banner")
	public String basicBanner(BannerSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 배너관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<BannerMasterVO> list = (List<BannerMasterVO>) _gDao.selectBySearch("bannerMaster.selectList", search, "totalCount");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/basic/banner";
	}
	
	/**
	 * 환경설정 > 팝업관리 - 생성코드
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/popup")
	public String basicPopup(PopupSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 팝업관리", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		return super.getConfig().getAdminRoot() + "/config/basic/popup";
	}
	
	/**
	 * 환경설정 > 페이지관리 - 생성코드
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page")
	public String basicPage(PageSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 팝업관리", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//TODO : 수정
		// selectBySearch 메서드 사용법 확인 후 totalCount 바인딩 재확인
		
		List<PageVO> list = (List<PageVO>) _gDao.selectBySearch("page.selectList", search, "totalCount");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/basic/page";
	}
	
	@RequestMapping(value="/form")
	public String basicForm(FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 폼메일관리", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<FormVO> list = (List<FormVO>) _gDao.selectBySearch("form.selectListForm", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		
		return super.getConfig().getAdminRoot() + "/config/basic/form";
	}
	
	
	@RequestMapping(value="/auth_page")
	public String basicAuthPage(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 기본설정 &gt; 페이지 접근권한", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/basic/auth_page";
	}
	
}
