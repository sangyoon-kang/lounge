package com.tagosolution.controller.front.fxdep;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.DepositServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.model.BankVO;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.MemberCompanyVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.MoneyVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.util.ListUtil;
/**
 * 회원 컨트롤러 
 * @author lhg
 *
 */
@Controller
@RequestMapping(value = "/deposit")
public class FxDepositController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(FxDepositController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	DepositServiceImpl _depService;
	
	@Resource
	MemberServiceImpl _memberService;
	
	/**
	 * deposit
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.do")
	public String index(DepositSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("메인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setUserId(super.getUserSession().getUserId());
		search.setRecordCount(10);
		List<MoneyVO> list = (List<MoneyVO>) _gDao.selectBySearch("money.selectListUser", search, "totalCountUser");
		model.addAttribute("list", list);
		model.addAttribute("getStateMap", ListUtil.getStateMap());
		model.addAttribute("search", search);
		return "/front/deposit/list";
	}
	
	@RequestMapping(value = "/ajax/extend_stats.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object getStatsScroll(@RequestBody(required = false) String body, BindingResult result, Model model, DepositSearchVO search) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		search.setUserId(super.getUserSession().getUserId());
		List<MoneyVO> list = (List<MoneyVO>) _gDao.selectBySearch("money.selectListUser", search, "totalCountUser");
		
		return new Gson().toJson(list);
	}
	/**
	 * deposit
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdraw_popup.do")
	public String index1(DepositSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("메인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		

		SiteVO site = (SiteVO) _gDao.selectOne("site.selectByServerName", request.getServerName());
		
		List<FixedCodeVO> bankList = (List<FixedCodeVO>) _gDao.selectList("fixedCode.selectByBank", null);
		MemberInfoVO memberVO = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByKey", super.getUserSession().getMemberSeq());
		search.setStatus("O");
		model.addAttribute("bankList", bankList);
		model.addAttribute("search", search);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("withdrawalValueLimit", site.getWithdrawalValueLimit());
		model.addAttribute("withdrawalCountLimit", site.getWithdrawalCountLimit());

		return "/front/deposit/withdraw_popup";
	}
	
	/**
	 * deposit
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit_popup.do")
	public String index2(DepositSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("메인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		
		List<BankVO> list = (List<BankVO>)_gDao.selectBySearch("bank.selectList", search);
		search.setStatus("I");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "/front/deposit/deposit_popup";
	}
	
	
	@RequestMapping(value= "/deposit_proc.do")
	public String depProc (DepositSearchVO search, MoneyVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();

		try {
			Integer cash = (Integer) _gDao.selectOne("memberInfo.selectByCash", super.getUserSession().getUserId());
			vo.setUserId(super.getUserSession().getUserId());
			if(search.getStatus().equalsIgnoreCase("I")){
				_depService.insertDeposit(vo);
			}else if(search.getStatus().equalsIgnoreCase("O") && cash >= vo.getCash()){
				_depService.insertWithdraw(vo);
				_memberService.updateByWithdraw(vo.getMoneySeq());
			}
			if(cash < vo.getCash() && search.getStatus().equalsIgnoreCase("O"))
				am.setMessage("잘못된 요청입니다.");
			else
				am.setMessage("처리 되었습니다.");
			
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './list.do', {});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}