package com.tagosolution.controller.admin.fxstat.manage;

import com.tagoplus.util.ExcelDownloadUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.member.manage.MemberManageController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.DayBalanceVO;
import com.tagosolution.service.model.MoneyVO;
import com.tagosolution.service.model.OrderVO;
import com.tagosolution.service.model.search.AccumulateSearchVO;
import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.StatisticSearchVO;
import com.tagosolution.service.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/fxstat/manage")
public class DayStatManageController  extends BaseController{
	
private static final Logger logger = LoggerFactory.getLogger(MemberManageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	/**
	 * day trade list
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/day_trade_list")
	public String daysStatList(StatisticSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원목록", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		String currentYear = (ListUtil.getCurrentYearMonth(new Date()).split("-")[0]);
		String currentMonth = (ListUtil.getCurrentYearMonth(new Date()).split("-")[1]);
		
		if(search.getsMonth() == null){
			search.setsMonth(currentMonth);
		}

		if(search.getsYear() == null){
			search.setsYear(currentYear);
		}
        
		List<OrderVO> year = (List<OrderVO>) _gDao.selectList("order.selectYears", null);
		List<OrderVO> list = (List<OrderVO>) _gDao.selectList("order.selectDayStatList", search);
		
		
		model.addAttribute("list", list);
		model.addAttribute("year", year);
		model.addAttribute("search", search);
		model.addAttribute("monthMap", ListUtil.monthMap());
		return super.getConfig().getAdminRoot() + "/statistic/manage/day_trade_list";
	}

	/**
	 * day trade list
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/day_user_balance_list")
	public String daysUserBalanseList(StatisticSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원목록", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		String currentYear = (ListUtil.getCurrentYearMonth(new Date()).split("-")[0]);
		String currentMonth = (ListUtil.getCurrentYearMonth(new Date()).split("-")[1]);

		if(search.getsMonth() == null){
			search.setsMonth(currentMonth);
		}

		if(search.getsYear() == null){
			search.setsYear(currentYear);
		}

		List<OrderVO> year = (List<OrderVO>) _gDao.selectList("order.selectYears", null);
		List<DayBalanceVO> list = (List<DayBalanceVO>) _gDao.selectList("order.selectDayUserBalanceStatList", search);


		model.addAttribute("list", list);
		model.addAttribute("year", year);
		model.addAttribute("search", search);
		model.addAttribute("monthMap", ListUtil.monthMap());
		return super.getConfig().getAdminRoot() + "/statistic/manage/day_user_balance_list";
	}


	/**
	 * 출금 리스트 엑셀 다운로드
	 *
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/day_user_balance_list_excel.do")
	public String ListExcel(StatisticSearchVO search, BindingResult result, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		if (result.hasErrors()) return super.setBindingResult(result, model);

		if (result.hasErrors())
			return super.setBindingResult(result, model);

		List<DayBalanceVO> list = (List<DayBalanceVO>) _gDao.selectList("order.selectDayUserBalanceStatList", search);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("search", search);

		ExcelDownloadUtil.downloadExcel(request, response, map, "", "day_balance_list.xlsx");

		return null;
	}

	/**
	 * total bill list
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/day_total_bill")
	public String daysBillList(StatisticSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원목록", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		String currentYear = (ListUtil.getCurrentYearMonth(new Date()).split("-")[0]);
		String currentMonth = (ListUtil.getCurrentYearMonth(new Date()).split("-")[1]);
		
		if(search.getsMonth() == null){
			search.setsMonth(currentMonth);
		}

		if(search.getsYear() == null){
			search.setsYear(currentYear);
		}
        
		List<MoneyVO> regDate = (List<MoneyVO>) _gDao.selectList("money.selectRegDate", null);
		List<MoneyVO> list = (List<MoneyVO>) _gDao.selectList("money.selectDayTotalBill", search);
		
		
		model.addAttribute("list", list);
		model.addAttribute("regDate", regDate);
		model.addAttribute("search", search);
		model.addAttribute("monthMap", ListUtil.monthMap());
		return super.getConfig().getAdminRoot() + "/statistic/manage/day_total_bill";
	}


	/**
	 * User accumulated reserves
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_accumulated_reserves")
	public String userAccumulatedReserves(AccumulateSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("통계관리  &gt; 누적보유금현황", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		search.setRecordCount(20);
		List<MoneyVO> list = (List<MoneyVO>) _gDao.selectBySearch("money.getAccumulatedReservesList", search,"getAccumulatedReservesListCount");


		model.addAttribute("list", list);
		model.addAttribute("search", search);

		return super.getConfig().getAdminRoot() + "/statistic/manage/user_accumulated_reserves";
	}


	/**
	 * User accumulated reserves
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_accumulated_reserves_excel")
	public String userAccumulatedReserves(AccumulateSearchVO search, BindingResult result, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		super.setPageSubTitle("통계관리  &gt; 누적보유금현황", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<MoneyVO> list = (List<MoneyVO>) _gDao.selectList("money.getAccumulatedReservesAllList", search);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("search", search);

		ExcelDownloadUtil.downloadExcel(request, response, map, "accumulated_reserves_list_"+ ListUtil.getCurrentDate() +".xlsx", "accumulated_reserves_list.xlsx");

		return null;
	}


	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_possession_pistory_popup")
	public String memberPossessionPistoryPopup(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<MoneyVO> list = (List<MoneyVO>)_gDao.selectBySearch("order.selectSupportCashHistoryList", search,"totalSupportCashHistoryList");

		model.addAttribute("list", list);
		model.addAttribute("search", search);

		return super.getConfig().getAdminRoot() + "/member/manage/support_cash_history_view_popup";
	}





}
