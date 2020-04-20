package com.tagosolution.controller.admin.fxprd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.util.ExcelDownloadUtil;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.CashServiceImpl;
import com.tagosolution.service.model.CashVO;
import com.tagosolution.service.model.MemberGradeVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PaymentSearchVO;

@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/payment/cash")
public class CashManagementController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CashManagementController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	CashServiceImpl _cashService;
	
	/**
	 * 상품 /정산관리 > 상품관리 
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String prdManagementList(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 정산관리   ", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		if(search.getStartDate() == null || (search.getStartDate() != null && search.getStartDate().isEmpty())) search.setStartDate(StringUtil.getDateToString("yyyy-MM-dd"));
		if(search.getEndDate() == null || (search.getEndDate() != null && search.getEndDate().isEmpty())) search.setEndDate(StringUtil.getDateToString("yyyy-MM-dd"));
		CashVO totalSum = _cashService.selectCashTotal(search);
		List<CashVO> list = _cashService.selectCashList(search);
		List<MemberGradeVO> gradeList = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectListGrade", null);
		
		model.addAttribute("totalSum", totalSum);
		model.addAttribute("search", search);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("list", list);
		return super.getConfig().getAdminRoot() + "/payment/cash/list";
	}
	
	/**
	 * 상품 /정산관리 > 정산관리 16
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mem_cash16_pop.do")
	public String memCashPop16(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 정산관리    ", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberInfoVO mo = (MemberInfoVO) _gDao.selectOne("memberInfo.selectById", (search.getSellUserId() != null && !search.getSellUserId().isEmpty()) ? search.getSellUserId() : search.getUserId());
		if(mo != null) search.setGlevel(mo.getGradeLevel());
		if(search.getSellUserId() == null || (search.getSellUserId() != null && search.getSellUserId().isEmpty())) search.setSellUserId(search.getUserId());
		List<CashVO> list = _cashService.selectCash16List(search);
		
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		model.addAttribute("mo", mo);
		return super.getConfig().getAdminRoot() + "/payment/cash/member_cash_popup";
	}
	
	/**
	 * 상품 /정산관리 > 정산관리 17
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mem_cash17_pop.do")
	public String memCashPop17(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 정산관리    ", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<CashVO> list = _cashService.selectCash17List(search);
		
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		return super.getConfig().getAdminRoot() + "/payment/cash/member_cash17_popup";
	}
	
	/**
	 * 상품 /정산관리 > 기본수량설정 
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cash_excel.do")
	public String ListExcel(PaymentSearchVO search, BindingResult result, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		if(result.hasErrors()) return super.setBindingResult(result, model);
		
		search.setCpage(1);
		search.setRecordCount(Integer.MAX_VALUE);
		List<CashVO> list = _cashService.selectCashList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		ExcelDownloadUtil.downloadExcel(request, response, map, "", "cash_list.xlsx");
		
		return null;
	}
}
