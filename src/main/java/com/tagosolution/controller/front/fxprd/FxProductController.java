package com.tagosolution.controller.front.fxprd;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.PaymentServiceImpl;
import com.tagosolution.service.model.*;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PaymentSearchVO;
import com.tagosolution.service.util.ListUtil;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Fx Product
 *
 * @author sky line
 */
@Controller
@RequestMapping(value = "/prd")
public class FxProductController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(FxProductController.class);

    @Resource
    GeneralDAOImpl _gDao;

    @Resource
    PaymentServiceImpl _paymentService;

    /**
     * deal
     * //	 * @param site
     *
     * @param result
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deal.do")
    public String deal(PaymentSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {

        super.setPageSubTitle("메인", model);

        if(StringUtil.isEmpty(super.getUserSession().getBirthDt())){
            AlertModel am = new AlertModel();
            am.setMessage("고객님은 계좌실명인증이 필요합니다.\\n회원정보 변경페이지로 이동합니다.\\n\\n계좌실명인증 완료 후 거래를 진행 해주시기 바랍니다.");
            am.setScript("location.href = '"+ "/request_modify.do?id="+super.getUserSession().getUserId() +"&pageType=bank';");

            model.addAttribute("alert", am);
            return super.getConfig().getViewAlert();
        }

        if (result.hasErrors())
            return super.setBindingResult(result, model);
        if (search.getSearchRunTime() == null)
            search.setSearchRunTime(2);
        if (search.getRunTime() == null)
            search.setRunTime(2);
        GoodsVO vo = (GoodsVO) _paymentService.selectDetail(search);

        Date time = new Date();
        if (vo != null)
            time = StringUtil.getDate(vo.getGoodsDate().concat(" " + vo.getGoodsTime()), "yyyy-MM-dd HH:mm");
        search.setCurrentTime(new Date(time.getTime() + (new Date().getTime() - time.getTime())).getTime());

        Date next = new Date((long) Math.ceil(time.getTime() / (search.getRunTime() * 60000)) * (search.getRunTime() * 60000) + (search.getRunTime() * 60000));
        search.setNextTime(next.getTime());
        Date difference = new Date(next.getTime() - new Date().getTime());
        long remainingTime = (long) Math.floor((next.getTime() - new Date().getTime()) / 1000);

        RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", search);
        List<ResultVO> list = (List<ResultVO>) _gDao.selectList("resultfx.getRecentResult", search.getRunTime());
        Integer cash = (Integer) _gDao.selectOne("memberInfo.selectByCash", super.getUserSession().getUserId());
        GoodsVO maxBuyMdl = (GoodsVO) _gDao.selectOne("goods.checkRemainingLots", vo);
        RateVO rateVo = (RateVO) _gDao.selectOne("rate.selectByKey", search);

        Map<String, Object> classlist = new HashMap<String, Object>();
        if (vo != null) {
            classlist.put("BLot1class", (!vo.getBuyLot1State().equalsIgnoreCase("N") && vo.getAutoClose1() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("BLot2class", (!vo.getBuyLot2State().equalsIgnoreCase("N") && vo.getAutoClose2() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("BLot3class", (!vo.getBuyLot10State().equalsIgnoreCase("N") && vo.getAutoClose10() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("BLot4class", (!vo.getBuyLot20State().equalsIgnoreCase("N") && vo.getAutoClose20() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("BLot5class", (!vo.getBuyLot40State().equalsIgnoreCase("N") && vo.getAutoClose40() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("SLot1class", (!vo.getSellLot1State().equalsIgnoreCase("N") && vo.getAutoClose1() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("SLot2class", (!vo.getSellLot2State().equalsIgnoreCase("N") && vo.getAutoClose2() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("SLot3class", (!vo.getSellLot10State().equalsIgnoreCase("N") && vo.getAutoClose10() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("SLot4class", (!vo.getSellLot20State().equalsIgnoreCase("N") && vo.getAutoClose20() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
            classlist.put("SLot5class", (!vo.getSellLot40State().equalsIgnoreCase("N") && vo.getAutoClose40() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? "" : "disabled"));
        } else {
            classlist.put("BLot1class", ("disabled"));
            classlist.put("BLot2class", ("disabled"));
            classlist.put("BLot3class", ("disabled"));
            classlist.put("BLot4class", ("disabled"));
            classlist.put("BLot5class", ("disabled"));
            classlist.put("SLot1class", ("disabled"));
            classlist.put("SLot2class", ("disabled"));
            classlist.put("SLot3class", ("disabled"));
            classlist.put("SLot4class", ("disabled"));
            classlist.put("SLot5class", ("disabled"));
        }


        rateVo.setRunTime(search.getRunTime());
        model.addAttribute("remainList", maxBuyMdl);
        model.addAttribute("resultList", list);
        model.addAttribute("search", search);
        model.addAttribute("runTimeList", runTimeVO);
        model.addAttribute("vo", vo);
        model.addAttribute("rateVo", rateVo);
        model.addAttribute("cash", cash);
        model.addAttribute("remainingTime", remainingTime);
        model.addAttribute("classlist", classlist);
        model.addAttribute("diff", StringUtil.getDateToString(difference, "mm:ss"));
        model.addAttribute("next", StringUtil.getDateToString(next, "HH시 mm분"));
        model.addAttribute("isWorkingHour", ListUtil.isWorkingHour(runTimeVO.getBreakStart(), runTimeVO.getBreakEnd()));
        return "/front/prd/deal";
    }

    /**
     * deal
     * //	 * @param site
     *
     * @param result
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/contract_popup.do")
    public String contract(PaymentSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {

        super.setPageSubTitle("메인", model);

        if (result.hasErrors())
            return super.setBindingResult(result, model);
        if (search.getSearchRunTime() == null)
            search.setSearchRunTime(1);
        GoodsVO vo = (GoodsVO) _paymentService.selectDetail(search);
        Date time = new Date();
        if (vo != null)
            time = StringUtil.getDate(vo.getGoodsDate().concat(" " + vo.getGoodsTime()), "yyyy-MM-dd HH:mm");

        RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", search);
        runTimeVO.setRunTime(search.getRunTime());

        RateVO rateVo = (RateVO) _gDao.selectOne("rate.selectByKey", search);
        rateVo.setRunTime(search.getRunTime());

        search.setCurrentTime(new Date(time.getTime() + (new Date().getTime() - time.getTime())).getTime());
        Date next = new Date(time.getTime() + (search.getRunTime() * 60000));
        search.setNextTime(next.getTime());
        Integer cash = (Integer) _gDao.selectOne("memberInfo.selectByCash", super.getUserSession().getUserId());
        if ((search.getBsType().equalsIgnoreCase("B") && cash < (search.getBuyLot1() + search.getBuyLot2() + search.getBuyLot10() + search.getBuyLot20() + search.getBuyLot40()))
                || (search.getBsType().equalsIgnoreCase("S") && cash < (search.getSellLot1() + search.getSellLot2() + search.getSellLot10() + search.getSellLot20() + search.getSellLot40())))
            return "redirect:" + super.getConfig().getFrontMain();
        model.addAttribute("search", search);
        model.addAttribute("rateVo", rateVo);
        model.addAttribute("runTimeVO", runTimeVO);
        model.addAttribute("vo", vo);
        model.addAttribute("next", StringUtil.getDateToString(next, "HH:mm"));
        return "/front/prd/contract";
    }

    @RequestMapping(value = "/contract_view_ajax")
    @ResponseBody
    public Object contract1(PaymentSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {

        super.setPageSubTitle("메인", model);

        if (result.hasErrors())
            return super.setBindingResult(result, model);
        Map<String, Object> map = new HashMap<String, Object>();
        if (search.getSearchRunTime() == null)
            search.setSearchRunTime(1);
        GoodsVO vo = (GoodsVO) _paymentService.selectDetail(search);
        Date time = new Date();
        if (vo != null)
            time = StringUtil.getDate(vo.getGoodsDate().concat(" " + vo.getGoodsTime()), "yyyy-MM-dd HH:mm");

        RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", search);
        runTimeVO.setRunTime(search.getRunTime());

        RateVO rateVo = (RateVO) _gDao.selectOne("rate.selectByKey", search);
        rateVo.setRunTime(search.getRunTime());

        search.setCurrentTime(new Date(time.getTime() + (new Date().getTime() - time.getTime())).getTime());
        Date next = new Date(time.getTime() + (search.getRunTime() * 60000));
        search.setNextTime(next.getTime());
        Integer cash = (Integer) _gDao.selectOne("memberInfo.selectByCash", super.getUserSession().getUserId());
        if ((search.getBsType().equalsIgnoreCase("B") && cash < (search.getBuyLot1() + search.getBuyLot2() + search.getBuyLot10() + search.getBuyLot20() + search.getBuyLot40()))
                || (search.getBsType().equalsIgnoreCase("S") && cash < (search.getSellLot1() + search.getSellLot2() + search.getSellLot10() + search.getSellLot20() + search.getSellLot40())))
            return "redirect:" + super.getConfig().getFrontMain();


        map.put("rateVo", rateVo);
        map.put("runTimeVO", runTimeVO);
        map.put("vo", vo);
        map.put("search", search);
        map.put("next", StringUtil.getDateToString(next, "HH:mm"));

        return new Gson().toJson(map);
    }


    /**
     * Save
     *
     * @param search
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/contract_proc.do")
    @ResponseBody
    public String goodsProc(OrderVO vo, PaymentSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Map rtnObj = new HashMap();
        Map objCount = (Map)ajaxCheckMaxCount(search, vo.getRunTime(), result, model);
        int totalPrice = search.getBuyLot1() + search.getBuyLot2() + search.getBuyLot10() + search.getBuyLot20() + search.getSellLot1() + search.getSellLot2() + search.getSellLot10() + search.getSellLot20();

        try {
            //AlertModel am = new AlertModel();

            if((int)objCount.get("count") > 0){
                logger.error("투자는 1회차마다 한 번만 가능합니다.");
                rtnObj.put("message", "투자는 1회차마다 한 번만 가능합니다.");
            }else{

                vo.setUserId(super.getUserSession().getUserId());

                search.setBuyLot1(search.getBuyLot1() / 5000);
                search.setBuyLot2(search.getBuyLot2() / 10000);
                search.setBuyLot10(search.getBuyLot10() / 50000);
                search.setBuyLot20(search.getBuyLot20() / 100000);
                search.setBuyLot40(search.getBuyLot40() / 200000);
                search.setSellLot1(search.getSellLot1() / 5000);
                search.setSellLot2(search.getSellLot2() / 10000);
                search.setSellLot10(search.getSellLot10() / 50000);
                search.setSellLot20(search.getSellLot20() / 100000);
                search.setSellLot40(search.getSellLot40() / 200000);


                String res = _paymentService.saveTransaction(vo, search);

                if (res.isEmpty()) {
                    logger.error("[계약체결성공] 주문자:" + super.getUserSession().getUserName() + "(" + super.getUserSession().getUserID() + ")");

                    //am.setMessage("정상 처리되었습니다.");
                    rtnObj.put("message", "정상 처리되었습니다.");
                    rtnObj.put("totalPrice", totalPrice);
                    if (super.getUserSession().getTransEmailYn().toLowerCase().equals("y"))
                        _paymentService.sendMail(vo, search, request);
                } else {
                    logger.error("[계약체결실패] 주문자:" + super.getUserSession().getUserName() + "(" + super.getUserSession().getUserID() + ")");
                    rtnObj.put("message", "주문이 정상적으로 처리되지 않았습니다.\n관리자에게 문의 바랍니다.");
                }
            }
        } catch (Exception e) {
            //am.setMessage(e.getMessage() + ": " + e);
            rtnObj.put("message", e.getMessage() + ": " + e.toString());
            logger.error(e.getMessage(), e);
        }
        return new Gson().toJson(rtnObj);
    }

    /**
     * Checking available lots
     *
     * @param body   //	 * @param idType
     *               //	 * @param id
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/check_count_max.do")
    @ResponseBody
    public Object ajaxCheckMaxCount(PaymentSearchVO search1, int runtime, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        search1.setRunTime(runtime);
        Map<String, Object> map = new HashMap<String, Object>();
        GoodsVO vo = (GoodsVO) _paymentService.selectDetail(search1);
        if (vo != null) {
            Date time = new Date();
            Date next = new Date((long) Math.ceil(time.getTime() / (runtime * 60000)) * (runtime * 60000) + (runtime * 60000));
            long remainingTime = (long) Math.floor((next.getTime() - new Date().getTime()) / 1000);

            PaymentSearchVO search = new PaymentSearchVO();
            search.setGoodsDate(vo.getGoodsDate());
            search.setGoodsTime(vo.getGoodsTime());
            search.setUserId(super.getUserSession().getUserId());
            search.setRunTime(vo.getRunTime());
            int count = (int) _gDao.getCountBySearch("order.checkMemberOrder", search);
            GoodsVO maxBuyMdl = (GoodsVO) _gDao.selectOne("goods.checkRemainingLots", search);
            RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", search);
            map.put("GS", maxBuyMdl);
            map.put("runTimeVO", runTimeVO);
            map.put("BLot1", (!vo.getBuyLot1State().equalsIgnoreCase("N") && vo.getAutoClose1() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getBuyLot1Total() - vo.getBuyLot1() : 0));
            map.put("BLot2", (!vo.getBuyLot2State().equalsIgnoreCase("N") && vo.getAutoClose2() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getBuyLot2Total() - vo.getBuyLot2() : 0));
            map.put("BLot3", (!vo.getBuyLot10State().equalsIgnoreCase("N") && vo.getAutoClose10() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getBuyLot10Total() - vo.getBuyLot10() : 0));
            map.put("BLot4", (!vo.getBuyLot20State().equalsIgnoreCase("N") && vo.getAutoClose20() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getBuyLot20Total() - vo.getBuyLot20() : 0));
            map.put("BLot5", (!vo.getBuyLot40State().equalsIgnoreCase("N") && vo.getAutoClose40() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getBuyLot40Total() - vo.getBuyLot40() : 0));
            map.put("SLot1", (!vo.getSellLot1State().equalsIgnoreCase("N") && vo.getAutoClose1() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getSellLot1Total() - vo.getSellLot1() : 0));
            map.put("SLot2", (!vo.getSellLot2State().equalsIgnoreCase("N") && vo.getAutoClose2() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getSellLot2Total() - vo.getSellLot2() : 0));
            map.put("SLot3", (!vo.getSellLot10State().equalsIgnoreCase("N") && vo.getAutoClose10() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getSellLot10Total() - vo.getSellLot10() : 0));
            map.put("SLot4", (!vo.getSellLot20State().equalsIgnoreCase("N") && vo.getAutoClose20() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getSellLot20Total() - vo.getSellLot20() : 0));
            map.put("SLot5", (!vo.getSellLot40State().equalsIgnoreCase("N") && vo.getAutoClose40() < remainingTime && runTimeVO.getAutoCloseAll() < remainingTime ? vo.getSellLot40Total() - vo.getSellLot40() : 0));
            map.put("autoClose", (runTimeVO.getAutoCloseAll() < remainingTime));
            map.put("count", count);
        }
        return map;
    }

    @RequestMapping(value = "/ajaxCheckRemaining.do")
    @ResponseBody
    public Object ajaxCheckRemaining(PaymentSearchVO search, int runtime, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
        String strDate = formatter.format(date);
        String strTime = formatter2.format(date);

        search.setGoodsTime(strTime);
        search.setGoodsDate(strDate);
        search.setRunTime(runtime);
        Map<String, Object> map = new HashMap<String, Object>();
        GoodsVO maxBuyMdl = (GoodsVO) _gDao.selectOne("goods.checkRemainingLots", search);

        if (maxBuyMdl != null) {
            maxBuyMdl.setRunTime(runtime);
            map.put("GS", maxBuyMdl);
        }

        return map;
    }


    @RequestMapping(value = "/getCurrentTime.do")
    @ResponseBody
    public Object getCurrentTime(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        Date time = new Date();
        return time;
    }

    @RequestMapping(value = "/getCurrentResultState.do")
    @ResponseBody
    public Object getCurrentResultState(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        Map<String, Object> map = new HashMap<String, Object>();
        String resState = (String) _gDao.selectOne("resultsecfx.resultState", "");
        map.put("result", resState);
        return map;
    }

    @RequestMapping(value = "/getGoodsResult.do")
    @ResponseBody
    public Object getGoodsResult(int runtime, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        Map<String, Object> map = new HashMap<String, Object>();
        PaymentSearchVO search = new PaymentSearchVO();
        search.setRunTime(runtime);
        String resState = (String) _gDao.selectOne("goods.goodsResult", search);
        map.put("result", resState);
        return map;
    }

    @RequestMapping(value = "/ajaxLastBar.do")
    @ResponseBody
    public Object ajaxLastBar(PaymentSearchVO search, int runtime, long goodsDate, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Date date = new Date(goodsDate);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
        String gdsDate = formatter.format(date);
        String gdsTime = formatter2.format(date);

        search.setRunTime(runtime);
        search.setGoodsDate(gdsDate);
        search.setGoodsTime(gdsTime);
        @SuppressWarnings("unchecked")
        List<ResultVO> list = (List<ResultVO>) _gDao.selectList("resultfx.getRecentResult", search.getRunTime());
        return list;
    }

    /**
     * @param search
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/largeChart")
    public String MemberHistory(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
        super.setPageSubTitle("차트크게보기", model);
        if(result.hasErrors())
            return super.setBindingResult(result, model);

        model.addAttribute("search", search);

        return "/front/popup/large_chart_popup";
    }

}