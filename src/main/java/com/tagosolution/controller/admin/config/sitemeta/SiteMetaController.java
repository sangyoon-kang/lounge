package com.tagosolution.controller.admin.config.sitemeta;

import java.util.List;

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
import com.tagosolution.service.impl.SiteMetaServiceImpl;
import com.tagosolution.service.model.SiteMetaVO;
import com.tagosolution.service.model.CommGroupVO;

/**
 * 
 * @author Munkhtulga
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/sitemeta")
public class SiteMetaController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SiteMetaController.class);

	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	SiteMetaServiceImpl _siteMetaServiceImpl ; 

	/**
	 * 
	 * @param vo
	 * @param gVO
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seo_list")
	public String sitemetaList(SiteMetaVO vo, SearchVO search, BindingResult result, Model model) throws Exception {
		List<SiteMetaVO> list;
		
		
		super.setPageSubTitle("page title", model);
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		search.setTotalCount(_gDao.getCountBySearch("siteMeta.totalCount", search));
		/*gVO.setGroupDiv("TBMeta");*/	
		search.setGroupType("TBMeta");	
		/*List<CommGroupVO> commgrouplist = (List<CommGroupVO>) _gDao.selectList("commGroup.selectList", search);*/
		if(search.getStatus().toLowerCase().equals("s")){
			
			list=	(List<SiteMetaVO>) _gDao.selectList("siteMeta.selectbysearch", search);
		}
		else{	
		
		
			list = (List<SiteMetaVO>) _gDao.selectList("siteMeta.selectList", search);
		}
		model.addAttribute("list", list);
		/*model.addAttribute("commgrouplist", commgrouplist);*/
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/config/sitemeta/site_meta_list";
	}

	@RequestMapping(value = "/seo_write")

	/**
	 * 
	 * @param vo1
	 * @param commGroupVO
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String commGroupWrite(SiteMetaVO vo1, SearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("page title ", model);

		SiteMetaVO vo = (SiteMetaVO) _gDao.selectByKey("siteMeta.selectByKey", vo1.getSeoIdx());
		
		/*commGroupVO.setGroupDiv("TBMeta");*/
		search.setGroupType("TBMeta");/********************** Munkhtulga TBMeta database zaaval unshih shaarlagatai ^^zasvar ******************************************/		
		/*List<CommGroupVO> listGroup =  (List<CommGroupVO>) _gDao.selectList("commGroup.selectList", search);*/
		model.addAttribute("vo", vo);
		/*model.addAttribute("listGroup", listGroup);*/

		if (result.hasErrors())
			return super.setBindingResult(result, model);

		return super.getConfig().getAdminRoot() + "/config/sitemeta/site_meta_write";
	}

	/**
	 * 
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/proc.do")
	public String commGroupProcc(SiteMetaVO vo, SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle(" page title ", model);
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		vo.setModUser(super.getAdminSession().getAdminId());
		try {
			
			
			if (vo.getUseFlag()!=null && vo.getUseFlag().toLowerCase().equals("d")) {			
				_siteMetaServiceImpl.deleteSiteMeta(vo);
			} else {
				vo.setRegUser(super.getAdminSession().getAdminId());
				vo.setUseFlag("U");
				_siteMetaServiceImpl.insertSiteMeta(vo);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\n" + e.getMessage());
		}

		am.setScript("$.Nav('go', './seo_list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}

}
