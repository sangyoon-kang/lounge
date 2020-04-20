package com.tagosolution.controller.admin.fxprd;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tagosolution.service.model.RunTimeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.PaymentServiceImpl;
import com.tagosolution.service.model.GoodsBaseVO;
import com.tagosolution.service.model.RateVO;
import com.tagosolution.service.model.GoodsVO;
import com.tagosolution.service.model.search.PaymentSearchVO;
import com.tagosolution.service.model.wrapper.FxPrductWrapper;
import com.tagosolution.service.util.ListUtil;

/**
 * 기본설정 > 기본설정 컨트롤러 
 * @author sky line
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/payment")
public class ProductPaymentController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductPaymentController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	PaymentServiceImpl _paymentService;
	

	/**
	 * 상품 /정산관리 > 기본수량설정 
	 * @param search
	 * @param result
	 * @param model
//	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/base_info")
	public String siteInfo(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 기본수량설정 ", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<RunTimeVO> runTimeList = (List<RunTimeVO>)_gDao.selectList("runTime.selectByRunTime", search);
		GoodsBaseVO gb = new GoodsBaseVO();

		if(search.getRunTime() == null &&  runTimeList != null  && runTimeList.size() > 0){
			search.setRunTime(runTimeList.get(0).getRunTime());
		}
		if(search.getRunTime() != null){
			gb.setRunTime(search.getRunTime());
		}
		gb.setSiteSeq(super.getSiteSession().getSiteSeq());
		gb = (GoodsBaseVO)_gDao.selectByKey("goodsBase.selectByKey", gb);
		model.addAttribute("gb", gb);
		model.addAttribute("search", search);
		model.addAttribute("runTime", runTimeList);
		return super.getConfig().getAdminRoot() + "/payment/base/base_info";
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
	@RequestMapping(value="/base_proc.do")
	public String basicPopupProc(GoodsBaseVO vo, PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();
		try {
			vo.setSiteSeq(super.getSiteSession().getSiteSeq());
			_paymentService.saveBaseGoods(vo);
			am.setMessage("저장되었습니다.");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './base_info');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}



	/**
	 * 상품 /정산관리 > 기본수량설정
	 * @param search
	 * @param result
	 * @param model
//	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rate_info")
	public String rateInfo(PaymentSearchVO search, BindingResult result, Model model ) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 수수료설정 ", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<RunTimeVO> runTimeList = (List<RunTimeVO>)_gDao.selectList("runTime.selectByRunTime", search);
	//	RateVO gb = new RateVO();

		if(search.getRunTime() == null &&  runTimeList != null  && runTimeList.size() > 0){
			search.setRunTime(runTimeList.get(0).getRunTime());
		}
	/*	if(search.getRunTime() != null){
			gb.setRunTime(search.getRunTime());
		}*/

		List<RateVO> rateVOList = (List<RateVO>) _gDao.selectList("rate.selectByVer", search);
		model.addAttribute("gb", rateVOList);
		model.addAttribute("runTimeList", runTimeList);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/payment/rate/rate_info";
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
	@RequestMapping(value="/rate_proc.do")
	public String rateProc(RateVO vo, PaymentSearchVO search, BindingResult result, FxPrductWrapper wrapper, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();
		try {

			for (RateVO vs : wrapper.getPrr()) {
				_paymentService.saveRate(vs);
			}
			am.setMessage("저장되었습니다.");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './rate_info');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}




	/**
	 * 상품 /정산관리 > 상품설정
	 * @param search
	 * @param result
	 * @param model
//	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd_list")
	public String prdList(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품 /정산관리  &gt; 상품설정 ", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		String currentDate = StringUtil.getDateToString(new Date(), "yyyy-MM-dd");
		if(search.getGoodsDate() == null)
			search.setGoodsDate(currentDate);

		String currentHour = (ListUtil.isCurrent(currentDate, search.getGoodsDate())) ? ListUtil.getCurrentHour(new Date(), 1) : "0";
		if(search.getGoodsTime() == null)
			search.setGoodsTime(currentHour);
		else
			search.setGoodsTime(search.getGoodsTime().length() > 1 ? search.getGoodsTime() : "0"+search.getGoodsTime());

		List<RunTimeVO> runTimeList = (List<RunTimeVO>)_gDao.selectList("runTime.selectByRunTime", search);
		if(search.getRunTime() == null &&  runTimeList != null  && runTimeList.size() > 0){
			search.setRunTime(runTimeList.get(0).getRunTime());
		}
		RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", search);
		if(search.getRunTime() == null &&  runTimeVO != null){
			search.setRunTime(runTimeVO.getRunTime());
		}

		List<GoodsVO> list = (List<GoodsVO>)_gDao.selectList("goods.selectList", search);
		
		int goodsCount = _gDao.getCountBySearch("goods.selectCount", search);
		model.addAttribute("goodsCount", goodsCount);
		model.addAttribute("runTime", runTimeList);
		model.addAttribute("runTimeVO", runTimeVO);
		model.addAttribute("list", list);
		model.addAttribute("timeHoursMap", ListUtil.timeHoursMap());
		model.addAttribute("timeMinutsMap", ListUtil.timeMinuts1Map(search.getGoodsTime().toString(),search.getRunTime()));
		model.addAttribute("search", search);
		model.addAttribute("currentHour", currentHour);
		model.addAttribute("isCurrent", StringUtil.diffOfDate(currentDate, search.getGoodsDate()));
		return super.getConfig().getAdminRoot() + "/payment/prd/list";
	}

	/**
	 * Reserve Confirmation
	 *
//	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd_proc.do")
	public String reserveComProc(PaymentSearchVO search, FxPrductWrapper wrapper, BindingResult result, Model model,
			HttpServletRequest request) throws Exception {

		super.setPageSubTitle("메인", model);

		if (result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();
		try {
			for (GoodsVO vo : wrapper.getPrd()) {
				vo.setGoodsDate(search.getGoodsDate());
				vo.setRunTime(search.getRunTime());
				_paymentService.saveGoods(vo);
			}
			am.setMessage("저장되었습니다.");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './prd_list', {runTime: '"+ search.getRunTime() +"', goodsDate: '"+ search.getGoodsDate() +"', goodsTime: '"+ search.getGoodsTime() +"'});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}


	/**
	 * Last Hour Data Fetching.
	 * @param body
//	 * @param idType
//	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{type}/lot_list.do")
	@ResponseBody
	public Object ajaxCheckId(@RequestBody(required = false) String body, PaymentSearchVO search, String hour, String date,Integer runTime, BindingResult result, Model model, @PathVariable String type) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		Map<String, Object> map = new HashMap<String, Object>();
		List<?> list = null;
		switch(type){
			case"lasthour":
				search.setGoodsTime(hour);
				search.setGoodsDate(date);
				list = (List<GoodsVO>)_gDao.selectList("goods.selectList", search);
				map.put("result", list);
			break;
			case "basesetting":
//				search.setRunTime(runTime);
//				GoodsBaseVO gb = (GoodsBaseVO)_gDao.selectByKey("goodsBase.selectByKey", search);

				GoodsBaseVO gb = new GoodsBaseVO();
				gb.setRunTime(search.getRunTime());
				gb.setSiteSeq(super.getSiteSession().getSiteSeq());
				gb = (GoodsBaseVO)_gDao.selectOne("goodsBase.selectByRunTime", gb);
				map.put("result", gb);
			break;
		}
		map.put("type", type);
		return new Gson().toJson(map);
	}
	
	/**
	 * Fetch Last Date data and save.
	 * @param body
//	 * @param idType
//	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajaxlastDate.do")
	@ResponseBody
	public Object ajaxDate(@RequestBody(required = false) String body, PaymentSearchVO search, String date, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		/* insertLastDate */
		search.setGoodsDate(date);
		_gDao.insert("goods.insertLastDate", search);
		return "";

		
	}

}
