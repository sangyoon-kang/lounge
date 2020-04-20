package com.tagosolution.controller.front.fxresult;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.model.common.StringPair;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.MoneyVO;
import com.tagosolution.service.model.ResultSecVO;
import com.tagosolution.service.model.ResultVO;
import com.tagosolution.service.model.RunTimeVO;
import com.tagosolution.service.util.ListUtil;
/**
 * 회원 컨트롤러 
 * @author bb
 *
 */
@Controller
@RequestMapping(value = "/fxresult")
public class FxResultController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(FxResultController.class);
	
	@Resource
	GeneralDAOImpl _gDao;

	@RequestMapping(value = "/list.do")
	public String index(ResultVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("상품별 결과", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		if (search.getStartDate() == ""){
			Date todayDate = Calendar.getInstance().getTime();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String todayString = formatter.format(todayDate);
			search.setStartDate(todayString);
		}
		if (search.getType1() == ""){
			search.setType1("1");
		}
		
		List<RunTimeVO> runTimeVO = (List<RunTimeVO>) _gDao.selectList("runTime.selectByRunTime", search);
		Map<String, String> map = new HashMap<String, String>(2);
		map.put("runTime", "2");
		map.put("runDate", "2020-02-26");
		
		search.setRecordCount(20);
		List<ResultVO> list = (List<ResultVO>) _gDao.selectBySearch("resultfx.selectRuntimeOne",search, "totalCount");
		model.addAttribute("list", list);
		model.addAttribute("getStateMap", ListUtil.getStateMap());
		model.addAttribute("runTimeVO", runTimeVO);
		model.addAttribute("search", search);
		return "/front/fxresult/list";
	}
	
	@RequestMapping(value = "/listResult.do")
	public String indexResult(ResultSecVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("API 리스트", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setRecordCount(50);
		List<ResultSecVO> list = (List<ResultSecVO>) _gDao.selectBySearch("resultsecfx.selectResultSecByTime", search,"totalCountRsec");
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "/front/fxresult/listResult";
	}
}