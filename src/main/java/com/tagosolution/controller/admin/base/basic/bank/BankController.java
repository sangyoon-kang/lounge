package com.tagosolution.controller.admin.base.basic.bank;

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
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;

import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BankServiceImpl;
import com.tagosolution.service.impl.CommContentsServiceImpl;
import com.tagosolution.service.model.BankVO;
import com.tagosolution.service.model.CommContentsVO;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.search.CommContentsSearchVO;

/**
 * Common Contents Controller
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/base/basic/bank")
public class BankController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BankController.class);
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BankServiceImpl _bankService;
	/**
	 * List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String list(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<BankVO> list = (List<BankVO>)_gDao.selectBySearch("bank.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/basic/bank/list";
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
	public String write(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
	
		BankVO vo = (BankVO) _gDao.selectOne("bank.selectByKey", search.getBankSeq());
		
		List<FixedCodeVO> bankList =(List<FixedCodeVO>)_gDao.selectList("fixedCode.selectByBank", null);
		
		model.addAttribute("vo", vo);
		model.addAttribute("bankList", bankList);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/basic/bank/write";
	}
	
	/**
	 * Edit or Delete
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bank_proc.do")
	public String Proc(BankVO vo, SearchVO search, BindingResult result, Model model) throws Exception {
	
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		 try {
			 if(search.getStatus().equalsIgnoreCase("d")){
		 		_bankService.deleteBank(search);
		 		am.setMessage("삭제되었습니다.");
			 }else{
			 	_bankService.insertBank(vo);
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
