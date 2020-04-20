package com.tagosolution.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.tagoplus.model.common.SearchVO;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.AdminServiceImpl;
import com.tagosolution.service.model.BannerMasterVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.FormWritingVO;
import com.tagosolution.service.model.GroupVO;
import com.tagosolution.service.model.HistoryHostVO;
import com.tagosolution.service.model.HistoryLoginVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.SiteVO;

/**
 * 관리자 메인 컨트롤러
 *  > 관리자 GNB, LNB 포함
 * @author wimy
 *
 */
@Controller(value = "adminMainController")
@RequestMapping(value = "#{globals['url.admin.root']}")
public class MainController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	AdminServiceImpl _adminService;
	
	@Autowired
	private ResourceLoader _resourceLoader;
	
	/**
	 * 관리자 메인 페이지
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index(SiteVO site, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("관리자 메인", model);
		
		
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//logger.debug(">>>>>> {}, {}", EgovProperties.getProperty("globals.web.mode"), EgovProperties.getProperty("common.date.type"));
		//ClassPathResource cpr = new ClassPathResource("/");
		//logger.debug(">>>>>> cpr.getPath(): {}", cpr.getPath());
		//logger.debug(">>>>>> _resourceLoader.getResource(): {}", _resourceLoader.getResource("classpath:/").getURI().getPath());
		//logger.debug(">>>>>> this.getClass().getResource(\"\").getPath() : {}", new ClassPathResource("", cl).getPath());
		
		
		return super.getConfig().getAdminRoot() + "/index";
	}
	
	/**
	 * 관리자 GNB
	 * @param reqURI : 파라미터 : com.tagosolution.interceptor.AuthenticInterceptor 참조 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/common/gnb")
	public String gnb(Model model, HttpServletRequest request) {
		//logger.debug(" >>>>>>> gnb's reqURI : {}", request.getAttribute("reqURI"));
		Short level = 1;
		List<MenuSettingVO> menus =	(List<MenuSettingVO>) _gDao.selectList("menuSetting.selectByKey", level);
		
		model.addAttribute("menus", menus);
		return super.getConfig().getAdminRoot() + "/module/gnb";
	}
	
	/**
	 * 관리자 LNB
	 * @param reqURI : 파라미터 : com.tagosolution.interceptor.AuthenticInterceptor 참조
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/common/lnb")
	public String lnb(Model model, HttpServletRequest request) {
		//logger.debug(" >>>>>>> lnb's reqURI : {}", request.getAttribute("reqURI"));
		
		String sReqURI = (String) request.getAttribute("reqURI");
		String menuId = "";
		Short level = 1;
		List<MenuSettingVO> menus =	(List<MenuSettingVO>) _gDao.selectList("menuSetting.selectByKey", level);
		for(MenuSettingVO vo : menus){
			String str = vo.getFolderPath();
			if(str.lastIndexOf("/") > -1){
				str =  str.substring(0,str.lastIndexOf("/"));
				if(sReqURI.indexOf("/config") == -1 && sReqURI.contains(str)){
					menuId = vo.getMenuIdx();
					break;
				}else if(sReqURI.indexOf("/config") == -1 && vo.getFolderPath().indexOf("/board") > -1 && sReqURI.indexOf("/board") > -1){
					menuId = vo.getMenuIdx();
					break;
				}else if(sReqURI.indexOf("/config") == -1 && vo.getFolderPath().indexOf("/banner") > -1 && sReqURI.indexOf("/banner") > -1){
					menuId = vo.getMenuIdx();
					break;
				}else if(sReqURI.indexOf("/config") == -1 && vo.getFolderPath().indexOf("/formmail") > -1 && sReqURI.indexOf("/formmail") > -1){
					menuId = vo.getMenuIdx();
					break;
				}else if(sReqURI.indexOf("/config") > -1 && str.indexOf("/config") > -1){
					menuId = vo.getMenuIdx();
					break;
				}
			}
		}
		if(menuId != null && !menuId.isEmpty()){
			List<MenuSettingVO> listMenus = (List<MenuSettingVO>) _gDao.selectList("menuSetting.selectByLnb", menuId);
			model.addAttribute("listMenus", listMenus);
			model.addAttribute("menuId", menuId);
		}else{
			String param = sReqURI.replaceFirst(super.getConfig().getAdminRoot(), "");
			List<MenuSettingVO> listMenus = (List<MenuSettingVO>) _gDao.selectList("menuSetting.selectByUrl", param);
			model.addAttribute("listMenus", listMenus);
		}
		//게시판 관리
		if (sReqURI.contains("/board/manage/") || sReqURI.contains("/board/list/") || sReqURI.contains("/board/write/") || sReqURI.contains("/board/quick")) {
			SearchVO search = new SearchVO();
			search.setGroupType("B");
			//구분용 그룹
			List<GroupVO> listGroup = (List<GroupVO>) _gDao.selectList("group.selectListByGroup", search);
			List<BoardMasterVO> list = (List<BoardMasterVO>) _gDao.selectList("boardMaster.selectListForLNB", null);
			
			model.addAttribute("listGroup", listGroup);
			model.addAttribute("listBoardMaster", list);
		} 
		else if (sReqURI.contains("/page/")) {
			SearchVO search = new SearchVO();
			search.setGroupType("P");
			List<GroupVO> listGroup = (List<GroupVO>) _gDao.selectList("group.selectListByGroup", search);
			List<PageVO> list = (List<PageVO>) _gDao.selectList("page.selectListForLNB", null);
			
			model.addAttribute("listGroup", listGroup);
			model.addAttribute("listPage", list);
		} 
//		else if (sReqURI.contains("/banner/manage/") || sReqURI.contains("/banner/list/") || sReqURI.contains("/banner/write/")) {
		else if (sReqURI.contains("/banner/")) {
			List<BannerMasterVO> list = (List<BannerMasterVO>) _gDao.selectList("bannerMaster.selectListForLNB", null);
			model.addAttribute("listBannerMaster", list);
			
		}
		else if (sReqURI.contains("/formmail/")) {
			List<FormVO> listForm = (List<FormVO>) _gDao.selectList("form.selectListForm", null);
			List<FormWritingVO> listWriting = (List<FormWritingVO>) _gDao.selectList("formWriting.selectForListLNB", null);
			model.addAttribute("listForm", listForm);
			model.addAttribute("listW", listWriting);
		}
		
		return super.getConfig().getAdminRoot() + "/module/lnb";
	}
	
	
	

	
}
