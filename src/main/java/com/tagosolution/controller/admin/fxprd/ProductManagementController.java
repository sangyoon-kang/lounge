package com.tagosolution.controller.admin.fxprd;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tagosolution.service.model.RunTimeVO;
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
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.PaymentServiceImpl;
import com.tagosolution.service.model.GoodsVO;
import com.tagosolution.service.model.OrderVO;
import com.tagosolution.service.model.search.PaymentSearchVO;
import com.tagosolution.service.util.ListUtil;

@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/payment/mng")
public class ProductManagementController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductManagementController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	PaymentServiceImpl _paymentService;
	
	/**
	 * 상품 /정산관리 > 상품관리 
	 * @param search
	 * @param result
	 * @param model
//	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String prdManagementList(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 상품관리  ", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

//		if(search.getSearchRunTime() == null){
//			search.setSearchRunTime(1);
//		}

		if(search.getSearchDate() == null){
			search.setSearchDate(StringUtil.getDateToString("yyyy-MM-dd"));
		}
		if(search.getSearchTime() == null){
			search.setSearchTime(ListUtil.getCurrentHour(new Date(), 0));
		}

        List<RunTimeVO> runTimeList = (List<RunTimeVO>)_gDao.selectList("runTime.selectByRunTime", search);
        if(search.getRunTime() == null &&  runTimeList != null  && runTimeList.size() > 0){
            search.setRunTime(runTimeList.get(0).getRunTime());
        }

		List<GoodsVO> list = _paymentService.selectList(search);
		
		Date time = new Date();
		GoodsVO vo = (GoodsVO) _paymentService.selectDetail(search);
		if(vo != null)
			time = StringUtil.getDate(vo.getGoodsDate().concat(" "+ vo.getGoodsTime()), "yyyy-MM-dd HH:mm");
		search.setCurrentTime(new Date(time.getTime() + (new Date().getTime() - time.getTime())).getTime());
		Date next = new Date(time.getTime() + (search.getRunTime() * 60000));
		search.setNextTime(next.getTime());
		search.setCurrentHourMinute(ListUtil.getCurrentHourMinute(new Date()));
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("runTimeList", runTimeList);
		model.addAttribute("search", search);
		model.addAttribute("timeHoursMap", ListUtil.timeHoursMap());
		model.addAttribute("isCurrent", StringUtil.diffOfDate(StringUtil.getDateToString("yyyy-MM-dd"), search.getSearchDate()));
		return super.getConfig().getAdminRoot() + "/payment/mng/list";
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
	@RequestMapping(value="/mng_proc.do")
	public String lotStatusChange(GoodsVO vo, PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		boolean isUpdated = false;
		try {	
			search.setUserId(super.getAdminSession().getAdminId());
			if(search.getStatus().equalsIgnoreCase("L"))
				_paymentService.updateStatus(vo, search);
			else
				isUpdated = _paymentService.updateGoodsStatus(vo, search);
			
			am.setMessage((isUpdated) ? "저장되었습니다." : "상태가 변경 되었습니다.");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * Refreshing rows every 5 seconds
	 * @param body
//	 * @param idType
//	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/refresh_row.do")
	@ResponseBody
	public Object ajaxCheckId(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		GoodsVO vo = (GoodsVO) _paymentService.selectDetail(null);
		if(vo != null){
			NumberFormat formatter = new DecimalFormat("#0.0");
			NumberFormat formatter1 = new DecimalFormat("#0");
			map.put("bLot1", vo.getBuyLot1().toString().concat("/"+vo.getBuyLot1Total()));
			map.put("bLot2", vo.getBuyLot2().toString().concat("/"+vo.getBuyLot2Total()));
			map.put("bLot3", vo.getBuyLot10().toString().concat("/"+vo.getBuyLot10Total()));
			map.put("bLot4", vo.getBuyLot20().toString().concat("/"+vo.getBuyLot20Total()));
			map.put("bLot5", vo.getBuyLot40().toString().concat("/"+vo.getBuyLot40Total()));
			Double BUY_USER_TOTAL = (vo.getBuyLot1() * 0.1) +  (vo.getBuyLot2() * 0.2) +  (vo.getBuyLot10()) +  (vo.getBuyLot20() * 2) +  (vo.getBuyLot40() * 4);
			Double BUY_LOT_TOTAL = (vo.getBuyLot1Total() * 0.1) + (vo.getBuyLot2Total() * 0.2) +  (vo.getBuyLot10Total()) +  (vo.getBuyLot20Total() * 2) +  (vo.getBuyLot40Total() * 4);
			String BUY_USER_TOTAL_PRICE = formatter1.format(BUY_USER_TOTAL * 5);
			String BUY_LOT_TOTAL_PRICE = formatter1.format(BUY_LOT_TOTAL * 5);
			map.put("uBLot", formatter.format(BUY_USER_TOTAL).concat("/"+formatter.format(BUY_LOT_TOTAL)));
			map.put("uBPrice", BUY_USER_TOTAL_PRICE.concat("/"+BUY_LOT_TOTAL_PRICE));
			map.put("sLot1", vo.getSellLot1().toString().concat("/"+vo.getSellLot1Total()));
			map.put("sLot2", vo.getSellLot2().toString().concat("/"+vo.getSellLot2Total()));
			map.put("sLot3", vo.getSellLot10().toString().concat("/"+vo.getSellLot10Total()));
			map.put("sLot4", vo.getSellLot20().toString().concat("/"+vo.getSellLot20Total()));
			map.put("sLot5", vo.getSellLot40().toString().concat("/"+vo.getSellLot40Total()));
			Double SELL_USER_TOTAL = (vo.getSellLot1() * 0.1) +  (vo.getSellLot2() * 0.2) +  (vo.getSellLot10()) +  (vo.getSellLot20() * 2) +  (vo.getSellLot40() * 4);
			Double SELL_LOT_TOTAL = (vo.getSellLot1Total() * 0.1) + (vo.getSellLot2Total() * 0.2) +  (vo.getSellLot10Total()) + (vo.getSellLot20Total() * 2) + (vo.getSellLot40Total() * 4);
			String SELL_USER_TOTAL_PRICE = formatter1.format(SELL_USER_TOTAL * 5);
			String SELL_LOT_TOTAL_PRICE = formatter1.format(SELL_LOT_TOTAL * 5);
			map.put("uSLot", formatter.format(SELL_USER_TOTAL).concat("/"+formatter.format(SELL_LOT_TOTAL)));
			map.put("uSPrice", SELL_USER_TOTAL_PRICE.concat("/"+SELL_LOT_TOTAL_PRICE));
		}
		return new Gson().toJson(map);
	}
	
	
	/**
	 * Goods Detail Popup
	 * @param search
//	 * @param brvo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mng_detail.do")
	public String  goodsDetailPopup(GoodsVO vo, PaymentSearchVO search, BindingResult result, Model model) throws Exception {

		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<OrderVO> list = (List<OrderVO>) _gDao.selectList("order.selectDetailMng", search);
		Date date = StringUtil.getDate(search.getGoodsDate().concat(" "+search.getGoodsTime()), "yyyy-MM-dd HH:mm");
		date = new Date(date.getTime() + (search.getRunTime() * 60000));

		GoodsVO upDown = (GoodsVO) _gDao.selectByKey("goods.selectByKey", search);
		
		model.addAttribute("list", list);
		model.addAttribute("upDown", upDown);
		model.addAttribute("search", search);
		model.addAttribute("detailDate", StringUtil.getDateToString(date, "yyyy-MM-dd"));
		model.addAttribute("detailTime", StringUtil.getDateToString(date, "HH:mm"));
		return super.getConfig().getAdminRoot() + "/payment/mng/mng_detail";
	}
}
