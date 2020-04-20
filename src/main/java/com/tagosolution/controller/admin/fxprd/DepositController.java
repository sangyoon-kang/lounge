package com.tagosolution.controller.admin.fxprd;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.DepositServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.impl.PaymentServiceImpl;
import com.tagosolution.service.model.MoneyVO;
import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagosolution.service.util.ListUtil;

/**
 * 기본설정 > 기본설정 컨트롤러 
 * @author sky line
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/payment/deposit")
public class DepositController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(DepositController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	PaymentServiceImpl _paymentService;
	
	@Resource
	MemberServiceImpl _memberService;
	@Resource
	DepositServiceImpl _depService;
	

	/**
	 * 상품 /정산관리 >입출금관리 
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.do")
	public String siteInfo(DepositSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 기본수량설정 ", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		search.setRecordCount(20);
		List<MoneyVO> list = (List<MoneyVO>)_gDao.selectBySearch("money.selectListAdmin", search, "totalCountAdmin");
		List<MoneyVO> totalSum = (List<MoneyVO>) _gDao.selectList("money.selectTotalSum", search);
		
		model.addAttribute("list", list);
		model.addAttribute("totalSum", totalSum);
		model.addAttribute("search", search);
		model.addAttribute("listIoType", ListUtil.listIoType());
		return super.getConfig().getAdminRoot() + "/payment/deposit/list";
	}
	
	/**
	 * 상품 /정산관리 >입출금관리 
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dep_proc.do")
	public String basicPopupProc(MoneyVO vo, DepositSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		try {
			vo.setUserId(super.getAdminSession().getUserID());
			MoneyVO mo = (MoneyVO) _gDao.selectByKey("money.selectByKey", vo.getMoneySeq());
			if(search.getStatus().equalsIgnoreCase("A") && mo.getState().equalsIgnoreCase("R")){
				_paymentService.updateDepositAccept(vo);
				_paymentService.insertCashByDeposit(vo);
				_memberService.updateByDeposit(vo.getMoneySeq());
				am.setMessage("저장되었습니다.");
			} else if(search.getStatus().equalsIgnoreCase("C") && mo.getState().equalsIgnoreCase("R")){
				_paymentService.updateDepositCancel(vo);
				_memberService.updateByDepositCancel(vo.getMoneySeq());
				am.setMessage("저장되었습니다.");
			}
			if(!mo.getState().equalsIgnoreCase("R"))
				am.setMessage("이미 승인된 처리입니다.");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './list.do');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}

	
	/**
	 * CheckUserCash
	 * @param body
	 * @param idType
	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/cash.do")
	@ResponseBody
	public Object ajaxCheckId(@RequestBody(required = false) String body, String userId, Integer cash, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		Integer userCash = (Integer) _gDao.selectOne("memberInfo.selectByCash", userId);
		map.put("result", (userCash >= cash));
		return new Gson().toJson(map);
	}
	
	@RequestMapping(value= "/deposit_bigdb.do")
	@ResponseBody
	public String depProcBigdb(HttpServletRequest request) throws Exception {
		String retVal = "ok";
		MoneyVO vo = new MoneyVO();
		String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";
		DateFormat formatter = new SimpleDateFormat(DEFAULT_PATTERN);
		try {
			vo.setAcceptDate(formatter.parse(request.getParameter("times")));
			vo.setCash(Integer.parseInt(request.getParameter("amount")));
			vo.setBankName(request.getParameter("bankname"));
			vo.setAccountNo(request.getParameter("banknum"));
			vo.setUserName(request.getParameter("name"));
			
			Integer moneySeq = (Integer) _gDao.selectOne("money.selectByAccountName", vo);
			if (moneySeq == 0) {
				return retVal;
			}
			vo.setMoneySeq(moneySeq);
			_depService.updateBigdb(vo);
			_paymentService.updateDepositAccept(vo);
			_paymentService.insertCashByDeposit(vo);
			_memberService.updateByDeposit(vo.getMoneySeq());
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
		}
		return retVal;
	}
	
}
