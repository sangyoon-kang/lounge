package com.tagosolution.controller.admin.fxprd;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.DepositServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.impl.PaymentServiceImpl;
import com.tagosolution.service.model.MoneyVO;
import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagosolution.service.util.ListUtil;
import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 기본설정 > 기본설정 컨트롤러
 *
 * @author sky line
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
	 *
	 * @param search
	 * @param result
	 * @param model
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
	 *
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
			else if(search.getStatus().equalsIgnoreCase("R") && mo.getState().equalsIgnoreCase("A")){
				// 승인상태 원복
				_paymentService.updateDepositAcceptUndo(vo);
				_paymentService.deleteByDeposit(vo);
				_memberService.updateByDepositUndo(vo.getMoneySeq());
			} else if(search.getStatus().equalsIgnoreCase("R") && mo.getState().equalsIgnoreCase("C")){
				// 취소상태 원복
				_paymentService.updateDepositCancelUndo(vo);
				_memberService.updateByDepositCancelUndo(vo.getMoneySeq());
			}

           /* if (!mo.getState().equalsIgnoreCase("R"))
                am.setMessage("이미 승인된 처리입니다.");*/
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './list.do');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}

	@RequestMapping(value = "/api/dep_proc_list.do")
	public String basicPopupProcList(MoneyVO vo, DepositSearchVO search, BindingResult result, Model model, int currentPageNo, String ioType, String checkList) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();

		// checkList 는 화면에서 JSON.stringify 로 변환한 객체리스트 배열
		Gson gson = new Gson();

		String list = StringEscapeUtils.unescapeHtml(checkList);
		ArrayList<Map> mapArrayList = gson.fromJson(list, new TypeToken<ArrayList<Map>>() {
		}.getType());

		//mapArrayList 로 처리
		MoneyVO vo1 = null;

		int acceptCnt = 0;
		int cancelCnt = 0;
		int alreadyProc = 0;
		String tmpMessage = "";

		try {

			if (mapArrayList == null || mapArrayList.size() == 0) {
				am.setMessage("처리할 입금/출금 내역이 없습니다.");
			} else {
				for (int i = 0; i < mapArrayList.size(); i++) {
					vo1 = new MoneyVO();
					vo1.setUserId(super.getAdminSession().getUserID());

					Map<String, String> mapObject = (Map) mapArrayList.get(i);
					vo1.setMoneySeq(Integer.parseInt(mapObject.get("moneySeq"))); // moneySeq 저장
					String status = mapObject.get("status");

					MoneyVO mo = (MoneyVO) _gDao.selectByKey("money.selectByKey", vo1.getMoneySeq());

					if (status.equalsIgnoreCase("A") && mo.getState().equalsIgnoreCase("R")) {
						_paymentService.updateDepositAccept(vo1);
						_paymentService.insertCashByDeposit(vo1);
						_memberService.updateByDeposit(vo1.getMoneySeq());
						acceptCnt++;

						if (i == 0) {
							tmpMessage = "승인처리가 되었습니다.";
						}

					} else if (status.equalsIgnoreCase("C") && mo.getState().equalsIgnoreCase("R")) {
						_paymentService.updateDepositCancel(vo1);
						_memberService.updateByDepositCancel(vo1.getMoneySeq());
						cancelCnt++;
					}

					if (!mo.getState().equalsIgnoreCase("R")) {
						alreadyProc++;
					}
				}

				tmpMessage = "승인 : " + acceptCnt + "건 , 취소 : " + cancelCnt + "건 , 이미 승인된 처리 :" + alreadyProc + "건";
				am.setMessage(tmpMessage);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}

		am.setScript("$.Nav('go', './../list.do?ioType=" + ioType + "&cpage=" + currentPageNo + "');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}

	/**
	 * CheckUserCash
	 *
	 * @param body
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
}
