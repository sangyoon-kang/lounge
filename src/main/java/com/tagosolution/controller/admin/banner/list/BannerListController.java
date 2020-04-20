package com.tagosolution.controller.admin.banner.list;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BannerServiceImpl;
import com.tagosolution.service.model.BannerInfoVO;
import com.tagosolution.service.model.BannerMasterVO;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.search.BannerSearchVO;

/**
 * 배너관리 > 배너 컨트롤러
 * @author kky
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/banner")
public class BannerListController  extends BaseController  {
	
private static final Logger logger = LoggerFactory.getLogger(BannerListController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BannerServiceImpl _bannerService;
	
	/**
	 * 배너관리 > 배너목록
	 * @param masterCode
	 * @param search
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list/{bmSeq}")
	public String BannerList(@PathVariable Short bmSeq, BannerSearchVO search, Model model) throws Exception {
		BannerMasterVO bm = (BannerMasterVO) _gDao.selectByKey("bannerMaster.selectByKey", bmSeq);
		super.setPageSubTitle("배너관리  &gt; " + ((bm != null) ? bm.getMasterName() : ""), model);
		//logger.debug(">>배너배너: {}", new Gson().toJson(bm));
		
		search.setTableName("banner");
		search.setBseq(bm.getBmSeq());
		List<BannerInfoVO> list = (List<BannerInfoVO>) _gDao.selectBySearch("bannerInfo.selectList", search, "totalCount");
		
		
		//logger.debug(">>배너배너: {}", new Gson().toJson(list));
		
		
		model.addAttribute("list", list);
		model.addAttribute("bm", bm);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/banner/list/list";
	}
	
	/**
	 * 배너관리 > 배너 등록 수정 UI
	 * @param masterCode
	 * @param search
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/write/{bmSeq}")
	public String BannerWrite(@PathVariable Short bmSeq, BannerSearchVO search, Model model) throws Exception {
		BannerMasterVO bm = (BannerMasterVO) _gDao.selectByKey("bannerMaster.selectByKey", bmSeq);
		super.setPageSubTitle("배너관리  &gt; " + ((bm != null) ? bm.getMasterName() : ""), model);
		List<BannerMasterVO> MasterList = (List<BannerMasterVO>) _gDao.selectList("bannerMaster.selectListForLNB", null);
		BannerInfoVO vo = (BannerInfoVO) _gDao.selectByKey("bannerInfo.selectByKey", search.getBiseq());
		
		search.setTableName("banner");
		search.setRefSeq(String.valueOf(search.getBiseq()));
		FileVO file =  (FileVO) _gDao.selectOne("file.selectByRefSeq", search);
		
		//logger.debug("파일 : {}", new Gson().toJson(file));
		
		model.addAttribute("file", file);
		model.addAttribute("vo", vo);
		model.addAttribute("masterList", MasterList);
		model.addAttribute("bm", bm);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/banner/list/write";
	}
	
	/**
	 * 배너관리 > 배너 등록 수정
	 * @param masterCode
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_proc")
	public String BannerProc(BannerSearchVO search, BannerInfoVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors()) 
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		if (StringUtil.isEmpty(vo.getLinkTarget()))
			vo.setLinkTarget("_self");
		vo.setBannerSeq(search.getBiseq());
		short bmseq = search.getBseq();
		//logger.debug("sMaster : " + sMaster);
		try {
			if (search.getStatus().equals("d")) {
				_bannerService.deleteBannerInfo(search);
			} else {
				search.setUser(super.getAdminSession().getAdminId());
				 bmseq = _bannerService.insertBannerInfo(vo, search);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './list/"+ bmseq +"');");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
}
