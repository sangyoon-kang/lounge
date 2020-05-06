package com.tagosolution.service.impl;


import com.tagoplus.util.MailUtil;
import com.tagosolution.service.model.*;
import com.tagosolution.service.model.search.PaymentSearchVO;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Properties;

@Service("paymentService")
public class PaymentServiceImpl extends BaseServiceImpl {
    @Autowired
    MailUtil _mailUtil;

    private static final Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);

    /**
     * Base Goods FX
     *
     * @param GoodsBaseVO
     * @return
     */
    public void saveBaseGoods(GoodsBaseVO gb) throws Exception {
        getDAO().insert("goodsBase.merge", gb);
    }

    /**
     * Rate FX
     *
     * @param RateVO
     * @return
     */
    public void saveRate(RateVO vo) throws Exception {
        getDAO().update("rate.updateSelective", vo);
        getDAO().insert("rate.merge", vo);
    }

    /**
     * Goods FX
     *
     * @param adminVo
     * @return
     */
    public void saveGoods(GoodsVO vo) throws Exception {
        if ((vo.getBuyLot1Total() + vo.getBuyLot2Total() + vo.getBuyLot10Total() + vo.getBuyLot20Total() + vo.getBuyLot40Total()) <= 0) {
            vo.setBuyLot1State("E");
            vo.setBuyLot2State("E");
            vo.setBuyLot10State("E");
            vo.setBuyLot20State("E");
            vo.setBuyLot40State("E");
        } else {
            vo.setBuyLot1State("U");
            vo.setBuyLot2State("U");
            vo.setBuyLot10State("U");
            vo.setBuyLot20State("U");
            vo.setBuyLot40State("U");
        }
        if ((vo.getSellLot1Total() + vo.getSellLot2Total() + vo.getSellLot10Total() + vo.getSellLot20Total() + vo.getSellLot40Total()) <= 0) {
            vo.setSellLot1State("E");
            vo.setSellLot2State("E");
            vo.setSellLot10State("E");
            vo.setSellLot20State("E");
            vo.setSellLot40State("E");
        } else {
            vo.setSellLot1State("U");
            vo.setSellLot2State("U");
            vo.setSellLot10State("U");
            vo.setSellLot20State("U");
            vo.setSellLot40State("U");
        }
        getDAO().insert("goods.merge", vo);
    }

    /**
     * Fx Deposit Accept
     *
     * @param vo
     * @throws Exception
     */
    public void updateDepositAccept(MoneyVO vo) throws Exception {
        getDAO().update("money.updateDepositAccept", vo);
    }

    /**
     * Fx Deposit Cancel
     *
     * @param vo
     * @throws Exception
     */
    public void updateDepositCancel(MoneyVO vo) throws Exception {
        getDAO().update("money.updateDepositCancel", vo);
    }

    /**
     * Fx Deposit Request Undo (tyrus-k added 2020-04-23)
     *
     * @param vo
     * @throws Exception
     */
    public void updateDepositAcceptUndo(MoneyVO vo) throws Exception {
        getDAO().update("money.updateDepositAcceptUndo", vo);
    }

    /**
     * Fx Deposit Request Undo (tyrus-k added 2020-04-23)
     *
     * @param vo
     * @throws Exception
     */
    public void updateDepositCancelUndo(MoneyVO vo) throws Exception {
        getDAO().update("money.updateDepositCancelUndo", vo);
    }

    /**
     * Fx Cash Update
     *
     * @param vo
     * @throws Exception
     */
    public void insertCashByDeposit(MoneyVO vo) throws Exception {
        getDAO().update("cash.insertByDeposit", vo);
    }

    /**
     * Fx Cash Delete(tyrus-k added)
     * 승인처리 원복시 해당 건 삭제
     *
     * @param vo
     * @throws Exception
     */
    public void deleteByDeposit(MoneyVO vo) throws Exception {
        getDAO().update("cash.deleteByDeposit", vo);
    }

    public String saveTransaction(OrderVO vo, PaymentSearchVO search) throws Exception {
        String dataCheck = "";
        BigDecimal fth = new BigDecimal(50000);

        logger.info("saveTransaction start");
        // 매입, 매도 체크
        if (search.getBsType().isEmpty()) {
            return "주문이 실패하였습니다.\n새로고침(F5) 하고 다시 주문하세요.";
        }

        // 구매수량, 구매금액 체크
        Integer cash = (Integer) super.getDAO().selectOne("memberInfo.selectByCash", vo.getUserId());

        Double totalBuyOrSellLotDbl = (search.getBsType().equals("B")) ?
                ((search.getBuyLot1() * 0.1) + (search.getBuyLot2() * 0.2) + search.getBuyLot10() + (search.getBuyLot20() * 2) + (search.getBuyLot40() * 4)) * 50000
                : ((search.getSellLot1() * 0.1) + (search.getSellLot2() * 0.2) + search.getSellLot10() + (search.getSellLot20() * 2) + (search.getSellLot40() * 4)) * 50000;
        int totalBuyOrSellLot = (int) Math.round(totalBuyOrSellLotDbl);
        if (totalBuyOrSellLot == 0) {
            return "주문이 실패하였습니다. 주문수량이 없습니다.";
        } else if (totalBuyOrSellLot != search.getTotalLot().multiply(fth).intValue()) {
            return "주문이 실패하였습니다. 개별 구매수량과 합계구매 수량이 다릅니다.";
        } else if (search.getTotalLot().multiply(fth).intValue() > cash) {
            return "주문이 실패하였습니다. 보유한 캐쉬보다 구매하려는 금액이 큽니다.";
        } else if (cash < 5000) {
            return "주문이 실패하였습니다. 보유한 캐쉬가 상품을 구매할 수 있는 최소캐쉬보다 작습니다.";
        }
        logger.info("saveTransaction middle");
        // 상품의 유효성 체크
        GoodsVO gv = (GoodsVO) this.selectDetail1(search);
        logger.info("saveTransaction this.selectDetail1");
        if (gv == null) {
            logger.error("chk1");
            return "주문이 실패하였습니다. 등록된 상품이 없습니다.";
        } else if (gv.getRunType().equalsIgnoreCase("C")) {
            logger.error("chk2");
            return "주문이 실패하였습니다. 관리자가 운영을 정지한 상태입니다.";
        } else if (gv.getApiState().equalsIgnoreCase("A")) {
            logger.error("chk3");
            return "주문이 실패하였습니다. API수신이 정지 상태입니다.";
        } else if (gv.getBuyLot1Check().equalsIgnoreCase("NF") || gv.getBuyLot2Check().equalsIgnoreCase("NF") || gv.getBuyLot10Check().equalsIgnoreCase("NF") || gv.getBuyLot20Check().equalsIgnoreCase("NF") || gv.getBuyLot40Check().equalsIgnoreCase("NF") || gv.getSellLot1Check().equalsIgnoreCase("NF") || gv.getSellLot2Check().equalsIgnoreCase("NF") || gv.getSellLot10Check().equalsIgnoreCase("NF") || gv.getSellLot20Check().equalsIgnoreCase("NF") || gv.getSellLot40Check().equalsIgnoreCase("NF")) {
            logger.error("chk4");
            return "주문이 실패하였습니다. 구매하는 상품의 수량이 모두 소진되었습니다.";
        } else if (gv.getBuyLot1Check().equalsIgnoreCase("SF") || gv.getBuyLot2Check().equalsIgnoreCase("SF") || gv.getBuyLot10Check().equalsIgnoreCase("SF") || gv.getBuyLot20Check().equalsIgnoreCase("SF") || gv.getBuyLot40Check().equalsIgnoreCase("SF") || gv.getSellLot1Check().equalsIgnoreCase("SF") || gv.getSellLot2Check().equalsIgnoreCase("SF") || gv.getSellLot10Check().equalsIgnoreCase("SF") || gv.getSellLot20Check().equalsIgnoreCase("SF") || gv.getSellLot40Check().equalsIgnoreCase("SF")) {
            logger.error("chk5");
            return "주문이 실패하였습니다. 구매하려는 상품이 마감되었습니다.";
        } else if (gv.getBuyLot1Check().equalsIgnoreCase("TF") || gv.getBuyLot2Check().equalsIgnoreCase("TF") || gv.getBuyLot10Check().equalsIgnoreCase("TF") || gv.getBuyLot20Check().equalsIgnoreCase("TF") || gv.getBuyLot40Check().equalsIgnoreCase("TF") || gv.getSellLot1Check().equalsIgnoreCase("TF") || gv.getSellLot2Check().equalsIgnoreCase("TF") || gv.getSellLot10Check().equalsIgnoreCase("TF") || gv.getSellLot20Check().equalsIgnoreCase("TF") || gv.getSellLot40Check().equalsIgnoreCase("TF")) {
            logger.error("chk6");
            return "주문이 실패하였습니다. 상품의 구매시간이 종료되었습니다.";
        }
        logger.info("saveTransaction PaymentSearchVO search1 = new PaymentSearchVO()");
        // 중복구매 체크
        PaymentSearchVO search1 = new PaymentSearchVO();
        search1.setRunTime(gv.getRunTime());
        search1.setGoodsDate(gv.getGoodsDate());
        search1.setGoodsTime(gv.getGoodsTime());
        search1.setUserId(vo.getUserId());
        int count = (int) super.getDAO().getCountBySearch("order.checkMemberOrder", search1);
        //dataCheck = !(count > 0);
        if (count > 0) {
            return "결과 대기중인 구매내역이 있습니다.\n동시에 시간의 여러 상품을 구매할 수 없습니다.";
        }

        // 상품 등록
        vo.setLot(search.getTotalLot());
        vo.setGoodsTime(gv.getGoodsTime());
        vo.setGoodsDate(gv.getGoodsDate());

        search.setUserId(vo.getUserId());
        search.setGoodsDate(gv.getGoodsDate());
        search.setGoodsTime(gv.getGoodsTime());
        logger.info("insert start");
        super.getDAO().insert("order.insertFront", vo);
        logger.info("order.insertFront end");
        search.setOrderSeq(vo.getOrderSeq());

        super.getDAO().insert("orderDetail.insertFront", search);
        logger.info("orderDetail.insertFront end");
        super.getDAO().update("goods.updateFront", search);
        logger.info("goods.updateFront end");
        super.getDAO().insert("cash.insertFront", search);
        logger.info("cash.insertFront end");
        super.getDAO().update("memberInfo.updateFront", search);
        logger.info("memberInfo.updateFront end");
        logger.info("insert end");
        return dataCheck;
    }

    public void sendMail(OrderVO vo, PaymentSearchVO search, HttpServletRequest request) throws Exception {
        MemberInfoVO mVo = (MemberInfoVO) getDAO().selectByKey("memberInfo.selectById", vo.getUserId());
        if (mVo != null) {
            search.setEmail(mVo.getEmail());
            search.setSubject("거래 확인서");
            String sTemplatePath = request.getSession().getServletContext().getRealPath("/mailTemplate");
            Properties p = new Properties();
            p.setProperty("file.resource.loader.path", sTemplatePath);
            Velocity.init(p);
            VelocityContext context = new VelocityContext();
            context.put("host", super.getConfig().getHost());
            context.put("goodsTime", vo.getGoodsTime());
            context.put("goodsDate", vo.getGoodsDate());
            context.put("bstype", vo.getBsType());
            context.put("buyLot1", search.getBuyLot1());
            context.put("buyLot2", search.getBuyLot2());
            context.put("buyLot10", search.getBuyLot10());
            context.put("buyLot20", search.getBuyLot20());
            context.put("buyLot40", search.getBuyLot40());
            context.put("sellLot1", search.getSellLot1());
            context.put("sellLot2", search.getSellLot2());
            context.put("sellLot10", search.getSellLot10());
            context.put("sellLot20", search.getSellLot20());
            context.put("sellLot40", search.getSellLot40());
            NumberFormat formatter = new DecimalFormat("#0,000");
            context.put("buySum", formatter.format(search.getBuyLot1() * 5000 + search.getBuyLot2() * 10000 + search.getBuyLot10() * 50000 + search.getBuyLot20() * 100000 + search.getBuyLot40() * 200000));
            context.put("sellSum", formatter.format(search.getSellLot1() * 5000 + search.getSellLot2() * 10000 + search.getSellLot10() * 50000 + search.getSellLot20() * 100000 + search.getSellLot40() * 200000));

            Template template = Velocity.getTemplate("tx_form.vm");
            StringWriter writer = new StringWriter();

            template.merge(context, writer);
            search.setBody(writer.toString());

            try {
                String[] arr = search.getEmail().split(",");
                String sSubject = search.getSubject();
                String sBody = search.getBody();
                this._mailUtil.send(arr, sSubject, sBody);
            } catch (Exception e) {
                logger.error(e.getMessage(), e);
            }
        }
    }

    /**
     * update Status of Lot State
     *
     * @param vo
     * @param search
     */
    public void updateStatus(GoodsVO vo, PaymentSearchVO search) throws Exception {
        switch (search.getLotType()) {
            case "buyLot1State":
                vo.setBuyLot1State("N");
                break;
            case "buyLot2State":
                vo.setBuyLot2State("N");
                break;
            case "buyLot10State":
                vo.setBuyLot10State("N");
                break;
            case "buyLot20State":
                vo.setBuyLot20State("N");
                break;
            case "buyLot40State":
                vo.setBuyLot40State("N");
                break;
            case "sellLot1State":
                vo.setSellLot1State("N");
                break;
            case "sellLot2State":
                vo.setSellLot2State("N");
                break;
            case "sellLot10State":
                vo.setSellLot10State("N");
                break;
            case "sellLot20State":
                vo.setSellLot20State("N");
                break;
            case "sellLot40State":
                vo.setSellLot40State("N");
                break;
        }
        super.getDAO().update("goods.updateStatus", vo);
    }

    public boolean updateGoodsStatus(GoodsVO vo, PaymentSearchVO search) throws Exception {

        GoodsVO existVO = (GoodsVO) super.getDAO().selectByKey("goods.selectByKey", search);

        logger.info("existVO.getGoodsResult() >>>>> " + existVO.getGoodsResult());

        if (search.getStatus().equalsIgnoreCase("C")) {
            if (existVO != null && existVO.getGoodsResult() != null) {
                if (existVO.getGoodsResult().equalsIgnoreCase("U") || existVO.getGoodsResult().equalsIgnoreCase("D") || existVO.getGoodsResult().equalsIgnoreCase("T")) {
                    if (existVO.getGoodsResult().equalsIgnoreCase("U") || existVO.getGoodsResult().equalsIgnoreCase("D")) {
                        super.getDAO().update("memberInfo.updateCancleUD", search);
                    } else {
                        super.getDAO().update("memberInfo.updateCancleT", search);
                    }

                    super.getDAO().delete("cash.deleteCashCancle", search);
                    super.getDAO().update("order.updateOrderCancle", search);
                } else {
                    super.getDAO().update("order.updateOrderCancleN", search);
                }
                super.getDAO().update("goods.updateGoodsCancle", search);
            }
        } else {
            if (existVO != null && existVO.getGoodsResult() != null)
                return false;

            switch (search.getStatus()) {
                case "U":
                    search.setProfitType("B");
                    search.setLossType("S");
                    vo.setGoodsResult("U");
                    search.setGoodsResult("U");
                    super.getDAO().update("goods.updateGoodsStatus", vo);
                    super.getDAO().update("order.updateStatusUD", search);
                    super.getDAO().insert("cash.insertAdminUD", search);
                    super.getDAO().update("memberInfo.updateAdminUD", search);
                    super.getDAO().insert("cash.insertRecommCash", search);
                    //super.getDAO().update("memberInfo.updateRecommUser", search);
                    break;
                case "D":
                    search.setProfitType("S");
                    search.setLossType("B");
                    vo.setGoodsResult("D");
                    search.setGoodsResult("D");
                    super.getDAO().update("goods.updateGoodsStatus", vo);
                    super.getDAO().update("order.updateStatusUD", search);
                    super.getDAO().insert("cash.insertAdminUD", search);
                    super.getDAO().update("memberInfo.updateAdminUD", search);
                    super.getDAO().insert("cash.insertRecommCash", search);
                    //super.getDAO().update("memberInfo.updateRecommUser", search);
                    break;
                case "T":
                    vo.setGoodsResult("T");
                    super.getDAO().update("goods.updateGoodsStatus", vo);
                    super.getDAO().update("order.updateStatusT", search);
                    super.getDAO().insert("cash.insertAdminT", search);
                    super.getDAO().update("memberInfo.updateAdminT", search);
                    break;
                case "N":
                    vo.setGoodsResult("N");
                    super.getDAO().update("goods.updateGoodsStatus", vo);
                    super.getDAO().update("order.updateStatusN", search);
            }
        }

        return true;
    }

    public List<GoodsVO> selectList(PaymentSearchVO search) throws Exception {
        return (List<GoodsVO>) super.getDAO().selectList("goods.selectMngList", search);
    }

    public GoodsVO selectDetail(PaymentSearchVO search) throws Exception {
        return (GoodsVO) super.getDAO().selectOne("goods.selectForDeal", search);
    }

    public GoodsVO selectDetail1(PaymentSearchVO search) throws Exception {
        return (GoodsVO) super.getDAO().selectOne("goods.selectForDeal1", search);
    }
}
