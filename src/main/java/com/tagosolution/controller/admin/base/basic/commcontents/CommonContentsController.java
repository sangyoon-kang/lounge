package com.tagosolution.controller.admin.base.basic.commcontents;

import java.util.List;
import com.tagosolution.service.util.ListUtil;


import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;

import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.CommContentsServiceImpl;
import com.tagosolution.service.model.CommContentsVO;
import com.tagosolution.service.model.search.CommContentsSearchVO;

/**
 * Common Contents Controller
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/base/basic/policies")
public class CommonContentsController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonContentsController.class);
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	CommContentsServiceImpl _commService;
	/**
	 * List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(CommContentsSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<CommContentsVO> list = _commService.getList(search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/base/basic/policies/list";
	}
	
	/**
	 * Detail
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/write")
	public String write(CommContentsVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
	
		CommContentsVO vo = (CommContentsVO) _gDao.selectOne("policies.selectbyKey", search);
		if(vo != null){
			search.setContentsType(vo.getContentsType());
			List<CommContentsVO> sameName = _commService.getSiblings(search);
			
			model.addAttribute("vo", vo);
			model.addAttribute("sameName",sameName);
			model.addAttribute("search", search);
		}
		model.addAttribute("caseList", ListUtil.listContentsType());
		return super.getConfig().getAdminRoot() + "/base/basic/policies/write";
	}
	
	/**
	 * Edit or Delete
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/policies_proc")
	public String Proc(CommContentsVO vo,CommContentsSearchVO search, BindingResult result, Model model) throws Exception {
	
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		 try {
			 if(search.getStatus().toLowerCase().equals('d')){
		 		_commService.deleteCommContent(search);
			 }else{
			 	vo.setRegUser(super.getAdminSession().getAdminId());
			 	
			 	vo.setVersion(0);
			 	vo.setUseFlag("U");
			 	
			 	search.setIdx(vo.getiDx());
			 	search.setTitle(vo.getTitle());
			 	vo.setContents(StringUtil.replaceEditorTag(vo.getContents()));
			 	search.setContents(vo.getContents());
			 	search.setContentsType(vo.getContentsType());
			 	search.setVersion(vo.getVersion());
			 	_commService.insertCommContent(search, vo);
			 	am.setMessage("저장 완료");
			 }
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		am.setScript("$.Nav('go', './list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}
