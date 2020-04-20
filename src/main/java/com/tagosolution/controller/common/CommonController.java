package com.tagosolution.controller.common;

import java.awt.Image;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.PopupVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.PopupSearchVO;
import com.tagoplus.controller.ParentController;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;

/**
 * 공통 컨트롤러
 * 	- 공통 처리 컨트롤러 
 * @author wimy
 *
 */
@Controller
public class CommonController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	/**
	 * 권한 없음 경고 페이지
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "#{globals['url.admin.root']}/common/noAuth")
	public String alertNoAuth(String msg, Model model) throws Exception {
		if (StringUtil.isEmpty(msg))
			msg = "페이지 접근 권한이 없습니다.";
		//AlertModel am = new AlertModel(msg, super.getConfig().getAdminMainURL(), null);
		AlertModel am = new AlertModel(msg, null, "history.back();");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	/**
	 * 사이트 정보 자동 등록 안내 페이지
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "#{globals['url.admin.root']}/common/siteInfoCreate")
	public String siteInfoCreate(Model model, HttpServletRequest request) throws Exception {
		SiteVO site = super.getSiteSession();
		model.addAttribute("site", site);
		super.getSession().invalidate();
		return super.getConfig().getAdminRoot() + "/common/siteInfoCreate";
	}
	
	/**
	 * 사이트 사용 불가 페이지
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "#{globals['url.admin.root']}/common/cannotUseAdmin")
	public String cannotUseAdmin(Model model, HttpServletRequest request) throws Exception {
		
		SiteVO vo = new SiteVO();
		vo.setSiteDomain(request.getServerName());
		SiteVO site = (SiteVO) _gDao.selectOne("site.selectByServerName", vo.getSiteDomain());
		
		model.addAttribute("site", site);
		return super.getConfig().getAdminRoot() + "/common/cannotUseAdmin";

	}	

	/**
	 * 파일 존재 여부 확인
	 * 	- 파일이 없을 경우 Exception이 나옴
	 * @param filePath
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/file_exist_json.do", method = RequestMethod.POST)
	public String getFileExistJson(@RequestBody(required = false) String body, @RequestParam String filePath, BindingResult result, Model model) {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			String sPhysicalFile = super.getSession().getServletContext().getRealPath(filePath);
			File f = new File(sPhysicalFile);
			model.addAttribute("isFile", f.exists());
			Image image = ImageIO.read(f);
			if(f.exists() && image != null){
				model.addAttribute("imageUrl", filePath);
				model.addAttribute("isImage", true);
			}
		}
		catch (Exception e) {
			logger.warn("file not exist. filePath : {}", filePath);
			logger.error(e.getMessage());
			
			model.addAttribute("isFile", false);
		}
		
		return "jsonView";
	}
}
