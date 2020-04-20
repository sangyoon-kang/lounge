package com.tagosolution.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.PrdCategoryVO;
import com.tagosolution.service.model.PrdVO;
import com.tagosolution.service.model.SiteVO;

/**
 * 프론트 - 메인 컨트롤러
 *  
 * @author wimy
 *
 */
@Controller
public class MainController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
		
	/**
	 * 메인 페이지
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public String index(SiteVO site, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("메인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		/*List<PrdVO> prdList = (List<PrdVO>) _gDao.selectList("prd.selectMainList", null);
		
		List<PrdCategoryVO> prdCategoryList = (List<PrdCategoryVO>) _gDao.selectList("prdCategory.selectAll", null);
		
		model.addAttribute("prdCategoryList", prdCategoryList);
		model.addAttribute("prdList", prdList);*/
		return "/front/main";
	}
}
