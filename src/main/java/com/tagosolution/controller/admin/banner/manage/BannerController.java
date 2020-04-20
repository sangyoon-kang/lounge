package com.tagosolution.controller.admin.banner.manage;

import java.util.List;

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
import com.tagosolution.service.impl.BannerServiceImpl;
import com.tagosolution.service.model.BannerMasterVO;
import com.tagosolution.service.model.search.BannerSearchVO;

/**
 * 배너관리 > 배너그룹  컨트롤러
 * @author kky
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/banner/manage")
public class BannerController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BannerController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BannerServiceImpl _bannerService;
	
	/**
	 * 배너관리 - 배너그룹목록
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/banner_list")
	public String BannerList(BannerSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("배너관리 &gt; 배너관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<BannerMasterVO> list = (List<BannerMasterVO>) _gDao.selectBySearch("bannerMaster.selectList", search, "totalCount");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/banner/manage/banner_list";
	}
	
	/**
	 * 배너관리 - 배너그룹 등록수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/banner_write")
	public String BannerWrite(BannerSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("배너관리 &gt; 배너관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		BannerMasterVO vo = (BannerMasterVO) _gDao.selectByKey("bannerMaster.selectByKey", search.getBseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/banner/manage/banner_write";
	}
	
	/**
	 * 배너관리 - 등록수정 
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/banner_proc")
	public String BannerProc(BannerSearchVO search, BannerMasterVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			if (search.getStatus().equals("d")) {
				_bannerService.deleteBannerMaster(search);
			} else {
				_bannerService.insertBannerMaster(vo);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './banner_list');");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
}
