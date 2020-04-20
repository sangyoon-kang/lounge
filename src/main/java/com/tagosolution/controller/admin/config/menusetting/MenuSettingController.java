package com.tagosolution.controller.admin.config.menusetting;

import java.util.List;


import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;

import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.MenuSettingServiceImpl;
import com.tagosolution.service.model.MenuAuthGroupSettingVO;
import com.tagosolution.service.model.MenuAuthoSettingVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.search.MenuSettingSearchVO;

import java.util.Map;
import java.util.Map.Entry;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * Menu Setting Controller
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/menu")
public class MenuSettingController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuSettingController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	MenuSettingServiceImpl _menuSettingService;
	
	@Autowired
	RequestMappingHandlerMapping requestMappingHandlerMapping;
	
	/**
	 * Menu Setting List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String regionList(MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setCount(_gDao.getCountBySearch("menuSetting.totalCount", search));
		List<MenuSettingVO>list = (List<MenuSettingVO>) _gDao.selectList("menuSetting.selectList", search);
		List<MenuSettingVO>parentlist = (List<MenuSettingVO>) _gDao.selectBySearch("menuSetting.parentList", search);
		List<MenuSettingVO>childList = (List<MenuSettingVO>) _gDao.selectBySearch("menuSetting.mainmenu", search);
		model.addAttribute("childList", new Gson().toJson(childList));
		model.addAttribute("mainmenu", childList);
		model.addAttribute("list", list);
		model.addAttribute("parentlist", parentlist);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/menureg/list/list";
	}

	/**
	 * Menu Setting Ordering Update
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/menu_ordering_update")
	public String prdOrderingUpdate(MenuSettingSearchVO search, MenuSettingVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {			
			_menuSettingService.menuOrderUpdate(search, vo);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
				
		am.setScript("$.Nav('go', '" + super.getConfig().getAdminRoot() + "/config/menu/list');");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * Menu Setting Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/menu_proc")
	public String regionProc(MenuSettingVO vo, MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		
	    try {
			vo.setRegUser(super.getAdminSession().getAdminId());
			vo.setModUser(super.getAdminSession().getAdminId());
			_menuSettingService.mergeMenu(search, vo);
			am.setMessage("저장 완료");
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		am.setScript("$.Nav('go', './list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	/**
	 * Menu Setting Role List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grouprole/list")
	public String menuGroupList(MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본 설정 &gt; 사이트 정보", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setSiteCode(super.getSiteSession().getSiteSeq());
		List<MenuAuthGroupSettingVO> list = (List<MenuAuthGroupSettingVO>) _gDao.selectBySearch("menuAuthGroup.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/config/menureg/group/list";
	}
	
	/**
	 * Menu Setting Role Detail
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grouprole/write")
	public String memuGroupWrite(MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원등록", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		MenuAuthGroupSettingVO vo = (MenuAuthGroupSettingVO) _gDao.selectByKey("menuAuthGroup.selectByKey", search.getxD());
		
		List<MenuSettingVO> menuList = (List<MenuSettingVO>) _gDao.selectList("menuSetting.selectMenuForGroup", search);
		
		Map<RequestMappingInfo, HandlerMethod> handlerMethods = this.requestMappingHandlerMapping.getHandlerMethods();

		for (Entry<RequestMappingInfo, HandlerMethod> item : handlerMethods.entrySet()) {
			RequestMappingInfo mapping = item.getKey();
			HandlerMethod method = item.getValue();

			
			for (String urlPattern : mapping.getPatternsCondition().getPatterns()) {
				if (urlPattern.indexOf(this.getConfig().getAdminRoot()) > -1) {
					for(MenuSettingVO v : menuList){
						if(urlPattern.contains("_popup") || urlPattern.contains("group") || urlPattern.contains("category") || urlPattern.contains("toCategory") || urlPattern.contains("send"))
							break;
						if(v.getPrefixPath() != null && urlPattern.indexOf(v.getPrefixPath().split(",")[0]) > -1){
							if(v.getAuthList() == null){
								v.setAuthList((v.getFolderPath().split("/").length > 1) ? v.getFolderPath() : v.getPrefixPath());
							}
							if(urlPattern.contains("write") || urlPattern.endsWith("_write")){
								if(v.getPrefixPath().split(",")[0].contains("{")){
									urlPattern = urlPattern.replace(v.getPrefixPath().split(",")[0], "");
								}else if(urlPattern.contains("{")){
									urlPattern = urlPattern.split("\\{")[0];
								}
								v.setAuthView(urlPattern);
							}
							if(urlPattern.contains("proc") || urlPattern.endsWith("_proc")){
								v.setAuthWrite(urlPattern);
								v.setAuthModify(urlPattern);
								v.setAuthDelete(urlPattern);
							}
						}else if (v.getAuthWrite() == null && v.getAuthModify() == null && v.getAuthDelete() == null && v.getFolderPath().split("/").length > 1 && urlPattern.contains(v.getFolderPath().split("/")[1]) && (urlPattern.endsWith("_proc") || urlPattern.endsWith("proc") || urlPattern.endsWith("proc.do"))){
							v.setAuthWrite(urlPattern);
							v.setAuthModify(urlPattern);
							v.setAuthDelete(urlPattern);
						}
					}
				}
			}
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/menureg/group/write";
	}
	
	/**
	 * Menu Setting Role Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grouprole/group_proc")
	public String memuGroupWriteProc(MenuAuthGroupSettingVO vo, MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원등록", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		//logger.debug("회원 {}", new Gson().toJson(vo));
		try {
			if (search.getStatus().equals("d")) {
				_menuSettingService.deleteMenuAutho(search);
				am.setMessage("삭제 완료");
			} else {
				vo.setRegUser(super.getAdminSession().getAdminId());
				vo.setModUser(super.getAdminSession().getAdminId());
				vo.setUseFlag("U");
				_menuSettingService.mergeMenuAutho(search, vo);
				am.setMessage("저장 완료");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './list', {});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}
