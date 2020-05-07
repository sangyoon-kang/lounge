package com.tagosolution.controller.ajax;

import com.google.gson.Gson;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.*;
import com.tagosolution.service.model.*;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PrdSearchVO;
import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.nio.charset.Charset;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 공통 ajax 컨트롤러
 * - json 요청, 리턴 등의 공통 처리
 *
 * @author wimy
 */
@RestController
@Controller
public class AjaxController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);

    @Resource
    GeneralDAOImpl _gDao;

    @Resource
    RunTimeServiceImpl rTime;

    @Resource
    BoardServiceImpl _boardService;

    @Resource
    ProductServiceImpl _prdService;

    @Resource
    QuickAskServiceImpl _quickAskService;

    @Resource
    DepositServiceImpl _depService;

    @Resource
    PaymentServiceImpl _paymentService;

    @Resource
    MemberServiceImpl _memberService;

    @Resource
    BankServiceImpl _bankService;

    /**
     * ajax - 아이디 중복 검사
     *
     * @param body
     * @param idType
     * @param id
     * @param result
     * @param model
     * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
     * @throws Exception
     */
    @RequestMapping(value = "/ajax/checkId")
    @ResponseBody
    public Object ajaxCheckId(@RequestBody(required = false) String body, String idType, String id, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Map<String, Object> map = new HashMap<String, Object>();
        SearchVO search = new SearchVO();
        search.setSiteSeq(super.getSiteSession().getSiteSeq());
        search.setId(id);
        search.setIdType(idType);
        List<AdminVO> list = (List<AdminVO>) _gDao.selectList("admin.selectForCheckId", search);

        if (!list.isEmpty())
            map.put("result", list.get(0));
        else
            map.put("result", null);

        //{"result":{"userType":"designer","userID":"","userName":"디자이너"}}
        // 주의 : map 변수를 그대로 리턴해도 가능하지만, null 상태의 멤버 변수까지 모두 출력된다.
        //return map;
        return new Gson().toJson(map);
    }

    /**
     * ajax - 아이디 중복 검사
     *
     * @param nickname
     * @param result
     * @param model
     * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
     * @throws Exception
     */
    @RequestMapping(value = "/ajax/checkNickname")
    @ResponseBody
    public Object ajaxCheckNickname(@RequestBody(required = false) String body, String recommUserId, String nickname, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Map<String, Object> map = new HashMap<String, Object>();
        MemberSearchVO search = new MemberSearchVO();
        search.setSiteSeq(super.getSiteSession().getSiteSeq());
        search.setNickname(nickname);
        List<MemberInfoVO> list = (List<MemberInfoVO>) _gDao.selectList("memberInfo.selectForCheckNickname", search);

        if (!list.isEmpty())
            map.put("result", list.get(0));
        else
            map.put("result", null);

        //{"result":{"userType":"designer","userID":"","userName":"디자이너"}}
        // 주의 : map 변수를 그대로 리턴해도 가능하지만, null 상태의 멤버 변수까지 모두 출력된다.
        //return map;
        return new Gson().toJson(map);
    }

    /**
     * ajax - 아이디 중복 검사
     *
     * @param body       the body
     * @param gradeLevel the grade level
     * @param result     the result
     * @param model      the model
     * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
     * @throws Exception the exception
     */
    @RequestMapping(value = "/ajax/grade")
    @ResponseBody
    public Object ajaxGrade(@RequestBody(required = false) String body, short gradeLevel, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Map<String, Object> map = new HashMap<String, Object>();
        MemberSearchVO search = new MemberSearchVO();
        search.setSiteSeq(super.getSiteSession().getSiteSeq());
        search.setGradeLevel(gradeLevel);
        List<MemberGradeVO> list = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectByLevel", search);

        if (!list.isEmpty())
            map.put("result", list.get(0));
        else
            map.put("result", null);

        //{"result":{"userType":"designer","userID":"","userName":"디자이너"}}
        // 주의 : map 변수를 그대로 리턴해도 가능하지만, null 상태의 멤버 변수까지 모두 출력된다.
        //return map;
        return new Gson().toJson(map);
    }

    /**
     * @param result
     * @param model
     * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
     * @throws Exception
     */
    @RequestMapping(value = "/ajax/limitToday")
    @ResponseBody
    public Object limitToday(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        DepositSearchVO search = new DepositSearchVO();
        search.setStatus("O");
        search.setUserId(super.getUserSession().getUserId());

        Map<String, Object> map = new HashMap<String, Object>();

        // 꽁머니 출금제한 로직 tyrus-k added
        List<Map> freeIncomeLimitList = (List<Map>) _gDao.selectList("money.selectLimitFreeIncome", search);

        // 꽁머니
        //int freeIncomeCnt = (int)freeIncomeLimitList.get(0).get("cnt");
        // 실제 입금 내역
        int incomeCnt = (int) (long) freeIncomeLimitList.get(1).get("cnt"); // null 걱정 없음
        // 실제 거래내역
        int orderCnt = (int) (long) freeIncomeLimitList.get(2).get("cnt"); // null 걱정 없음

        if (incomeCnt > 0 || orderCnt >= 4) {
            map.put("freeIncomeCount", 0);
        } else {
            // 총판, 지사 , 지점은 bypass
            if (super.getUserSession().getGradeLevel() == 2 || super.getUserSession().getGradeLevel() == 3 || super.getUserSession().getGradeLevel() == 4) {
                map.put("freeIncomeCount", 0);
            } else {
                map.put("freeIncomeCount", -1);
            }
        }

        // 이런 경우는 실제 입금된 경우라서 바로 출금가능해야함
        int count = (int) _gDao.getCountBySearch("money.limitToday", search);
        int requestCount = (int) _gDao.getCountBySearch("money.requestCount", search);

        map.put("count", count);
        map.put("requestCount", requestCount);

        return map;
    }

    @RequestMapping(value = "/ajax/limitTodaydeposit")
    @ResponseBody
    public Object limitTodaydeposit(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        DepositSearchVO search = new DepositSearchVO();
        search.setStatus("I");
        search.setUserId(super.getUserSession().getUserId());
        int requestCount = (int) _gDao.getCountBySearch("money.requestCount", search);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("requestCount", requestCount);
        return map;
    }


    /**
     * @param body
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajax/getPopup", method = RequestMethod.POST)
    @ResponseBody
    public Object ajaxGetPopup(@RequestBody(required = false) String body, HttpServletRequest request, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        Map<String, Object> map = new HashMap<String, Object>();
        //PopupSearchVO search = new PopupSearchVO();
        List<PopupVO> list = (List<PopupVO>) _gDao.selectList("popup.selectForMain", null);

        map.put("list", list);

        //logger.debug("맵 : {}", map);
        //logger.debug("맵2 : {}", new Gson().toJson(map));
        //return map;
        //return new Gson().toJson(map);
        return new Gson().toJson(list);
    }


    /**
     * Ajax quick ask proc object.
     *
     * @param body   the body
     * @param vo     the vo
     * @param result the result
     * @param model  the model
     * @return the object
     * @throws Exception the exception
     */
    @RequestMapping(value = "/ajax/quickAskProc", method = RequestMethod.POST)
    @ResponseBody
    public Object ajaxQuickAskProc(@RequestBody(required = false) String body, QuickConsultVO vo, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        String msg;
        try {
            if (vo.getRegUser() == null) {
                vo.setRegUser(vo.getUserName());
                vo.setUseFlag("Y");
            }
            _quickAskService.requestClientMsg(vo);
            msg = "ok";
        } catch (Exception e) {
            msg = e.getMessage();
        }


        return new Gson().toJson(msg);
    }

    /**
     * ajax - 메인게시물 json
     *
     * @param body
     * @param search
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajax/rb.do")
    @ResponseBody
    public Object ajaxRb(@RequestBody(required = false) String body, BoardSearchVO search, BindingResult result, Model model) throws Exception {

        if (result.hasErrors())
            return super.setBindingResult(result, model);

        if (StringUtil.isEmpty(search.getMode()))
            search.setMode("list");
        search.setMode(search.getMode().toLowerCase());

        Map<String, Object> map = new HashMap<String, Object>();

        try {
            RecentBoardVO rbVO = (RecentBoardVO) _gDao.selectByKey("recentBoard.selectByKey", search.getRbseq());

            if (rbVO != null) {
                //최근 게시물 가져오기
                search.setPageIndex(1);
                search.getPaging().setRecordCount(rbVO.getArticleCount());
                search.setBcode(rbVO.getBoardCode());
                search.setBcseq(rbVO.getBcSeq());
                List<BoardInfoVO> list = (List<BoardInfoVO>) _gDao.selectBySearch("boardInfo.selectList", search, "totalCount");

                StringBuffer sb = new StringBuffer();

                sb.append(rbVO.getCodingStart());

                for (BoardInfoVO bi : list) {
                    String sCodingLoop = rbVO.getCodingLoop();

                    //링크 : 링크가 빈 문자열일 경우 링크 없앰
                    String sLink = "#";
                    //이미지 경로
                    String sUrl = "#";

                    //썸네일은 상세가 아니라 다른 사이트로 이동
                    if (bi.getBmVO().getBoardTypeFixedCode().equals("001005")) {
                        sLink = bi.getLinkUrl();

                    } else if (!StringUtil.isEmpty(rbVO.getLinkUrl())) {
                        sLink = "javascript:$.Nav('go', '" + rbVO.getLinkUrl() + "', {bseq: '" + bi.getBoardSeq() + "', bcseq: '" + (rbVO.getBcSeq() == 0 ? "" : rbVO.getBcSeq()) + "', rbseq: '', mode: 'view'});";

                    }

                    sCodingLoop = sCodingLoop.replace("#{LINK}", sLink);

                    //썸네일이나 이미지 게시판일경우 이미지 경로 넣어줌
                    if (bi.getFileVOList().size() > 0 && (bi.getBmVO().getBoardTypeFixedCode().equals("001005") || bi.getBmVO().getBoardTypeFixedCode().equals("001006"))) {
                        sUrl = super.getConfig().getUploadPathVirtual() + bi.getFileVOList().get(0).getSaveFilename();
                        sCodingLoop = sCodingLoop.replace("#{URL}", sUrl);
                    }

                    String sSubject = String.format("<span title=\"%s\">%s</span>"
                            //							, bi.getSubject()
                            , StringEscapeUtils.escapeHtml(bi.getSubject())
                            , bi.getSubject().length() > rbVO.getSubjectCharCount() ? bi.getSubject().substring(0, rbVO.getSubjectCharCount()) + ".." : bi.getSubject()
                    );
                    sCodingLoop = sCodingLoop.replace("#{SUBJECT}", sSubject);

                    //뉴 아이콘
                    String sNew = "";
                    long lPeriod = StringUtil.compareTwoDate(new Date(), bi.getRegDate());
                    if (lPeriod <= rbVO.getBoardMasterVO().getNewPeriod())
                        sNew = "<img src=\"/images/icon/ic_new_16.png\" class=\"vc_middle\" alt=\"new\" />";
                    sCodingLoop = sCodingLoop.replace("#{NEW}", sNew);

                    //날짜
                    String sDate = StringUtil.getDateToString(bi.getRegDate(), "yy.MM.dd");
                    sDate = String.format("<span class=\"dateSns\">%s</span>", sDate);
                    sCodingLoop = sCodingLoop.replace("#{DATE}", sDate);

                    sb.append(sCodingLoop);
                }

                sb.append(rbVO.getCodingEnd());

                map.put("parsedHtml", sb.toString());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw e;
        }

        return map;
    }

    /**
     * ajax - 메인 & 추천 상품 json
     *
     * @param body
     * @param search
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajax/rp.do")
    @ResponseBody
    public Object ajaxRp(@RequestBody(required = false) String body, PrdSearchVO search, BindingResult result, Model model) throws Exception {

        if (result.hasErrors())
            return super.setBindingResult(result, model);

        if (StringUtil.isEmpty(search.getMode()))
            search.setMode("list");
        search.setMode(search.getMode().toLowerCase());

        Map<String, Object> map = new HashMap<String, Object>();

        try {
            RecentPrdVO rpVO = (RecentPrdVO) _gDao.selectByKey("recentPrd.selectByKey", search.getRpseq());

            if (rpVO != null) {
                //최근 게시물 가져오기
                search.setPageIndex(1);
                search.getPaging().setRecordCount(rpVO.getPrdCount());
                //최근등록
                if (rpVO.getListType().equals("A")) {
                    search.setOrderBy("REG_DATE DESC");
                    //추천 상품
                } else if (rpVO.getListType().equals("B")) {
                    search.setRecommendyn("Y");
                    //메인노출
                } else if (rpVO.getListType().equals("C")) {
                    search.setMainyn("Y");
                }

                List<PrdVO> list = (List<PrdVO>) _gDao.selectList("prd.selectList", search);

                StringBuffer sb = new StringBuffer();

                sb.append(rpVO.getCodingStart());

                for (PrdVO pVo : list) {
                    String sCodingLoop = rpVO.getCodingLoop();

                    //링크 : 링크가 빈 문자열일 경우 링크 없앰
                    String sLink = "#";
                    //이미지 경로
                    String sUrl = "#";

                    if (!StringUtil.isEmpty(rpVO.getLinkUrl())) {
                        sLink = "javascript:$.Nav('go', '" + rpVO.getLinkUrl() + "', {prdseq: '" + pVo.getPrdSeq() + "', rpseq: '', mode: 'view'});";
                    }

                    sCodingLoop = sCodingLoop.replace("#{LINK}", sLink);

                    //썸네일이나 이미지 게시판일경우 이미지 경로 넣어줌
                    if (pVo.getPrdImageVO().size() > 0) {
                        sUrl = super.getConfig().getUploadPathVirtual() + pVo.getPrdImageVO().get(0).getListFilename();
                        sCodingLoop = sCodingLoop.replace("#{URL}", sUrl);
                    }

                    String sSubject = String.format("<span title=\"%s\">%s</span>"
                            , StringEscapeUtils.escapeHtml(pVo.getPrdName())
                            , pVo.getPrdName().length() > rpVO.getSubjectCharCount() ? pVo.getPrdName().substring(0, rpVO.getSubjectCharCount()) + ".." : pVo.getPrdName()
                    );
                    sCodingLoop = sCodingLoop.replace("#{SUBJECT}", sSubject);

                    String sSummary = String.format("<span title=\"%s\">%s</span>"
                            , StringEscapeUtils.escapeHtml(pVo.getSummary())
                            , pVo.getSummary().length() > rpVO.getSummaryCharCount() ? pVo.getSummary().substring(0, rpVO.getSummaryCharCount()) + ".." : pVo.getSummary()
                    );
                    sCodingLoop = sCodingLoop.replace("#{SUMMARY}", sSummary);

                    DecimalFormat df = new DecimalFormat("#,###");
                    sCodingLoop = sCodingLoop.replace("#{PRICE}", df.format(pVo.getPrice()));

                    //뉴 아이콘
                    String sNew = "";
                    long lPeriod = StringUtil.compareTwoDate(new Date(), pVo.getRegDate());
                    if (lPeriod <= 2)
                        sNew = "<img src=\"/images/icon/ic_new_16.png\" class=\"vc_middle\" alt=\"new\" />";
                    sCodingLoop = sCodingLoop.replace("#{NEW}", sNew);

                    //날짜
                    String sDate = StringUtil.getDateToString(pVo.getRegDate(), "yyyy-MM-dd");
                    sDate = String.format("<span class=\"dateSns\">%s</span>", sDate);
                    sCodingLoop = sCodingLoop.replace("#{DATE}", sDate);

                    sb.append(sCodingLoop);
                }

                sb.append(rpVO.getCodingEnd());

                map.put("parsedHtml", sb.toString());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw e;
        }

        return map;
    }

    /**
     * ajax - 상품 카테고리 목록
     * 		ajax 요청 시 헤더 추가
     *		xhr.setRequestHeader("apiId", "localhost");
     *		xhr.setRequestHeader("apiKey", "42467d78ffa6777fae84b2fb0ca73452");
     * @param body
     * @param lastLevel
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
	/*@RequestMapping(value = "/ajax/getCategory")
	@ResponseBody
	public Object ajaxGetCategory(PrdSearchVO search, @RequestParam(required = false) String id, HttpServletRequest request, HttpServletResponse response, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		logger.debug(">>>>>>> search : {}", new Gson().toJson(search));
		logger.debug(">>>>>>> id : {}", id);
		
		List<jsTree> list = _prdService.getCategoryListByJsTree(search);
		
		return list;
	}
	*/

    /**
     * Quick Ask Request
     *
     * @param body   the body
     * @param type   the type
     * @param result the result
     * @param model  the model
     * @return object
     * @throws Exception the exception
     */
    @RequestMapping(value = "/ajax/term")
    @ResponseBody
    public Object ajaxGetAgree(@RequestBody(required = false) String body, String type, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        Map<String, Object> map = new HashMap<String, Object>();
        String[] listContentsType = {type};
        MemberSearchVO search = new MemberSearchVO();
        search.setListContentsType(listContentsType);
        CommContentsVO vo = (CommContentsVO) _gDao.selectOne("policies.selectMemberRule", search);
        map.put("contents", vo.getContents());

        return new Gson().toJson(map);
    }

    @RequestMapping(value = "/ajax/getRunTimes")
    @ResponseBody
    public Object getRunTimes(@RequestBody(required = false) String body, String type, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        Map<String, Object> map = new HashMap<String, Object>();
        String[] listContentsType = {type};
        MemberSearchVO search = new MemberSearchVO();
        search.setListContentsType(listContentsType);

        List<RunTimeVO> list = (List<RunTimeVO>) _gDao.selectList("runTime.getTimeSet", search);
        map.put("list", list);

        return new Gson().toJson(map);
    }

    @RequestMapping(value = "/mgr/ajax/addCash")
    @ResponseBody
    public String addCash(@RequestBody(required = false) String userid, String uid, String cash, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        MemberInfoVO mmb = new MemberInfoVO();
        mmb.setUserId(uid);
        mmb.setCash(Integer.parseInt(cash));
        CashVO cashVO = new CashVO();
        _gDao.update("memberInfo.updateCashByUserId", mmb);

        cashVO.setUserId(mmb.getUserId());
        cashVO.setCash(mmb.getCash());
        try {
            _gDao.insert("cash.insertCashByUser", cashVO);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        Integer finalCash = (Integer) _gDao.selectOne("memberInfo.selectByCash", uid);
        return "" + finalCash;

    }

    @RequestMapping(value = "/ajax/getUserCash")
    @ResponseBody
    public String getUserCash(@RequestBody(required = false) String userid, String uid, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);
        MemberInfoVO mmb = new MemberInfoVO();
        mmb.setUserId(uid);
        Integer userCash = (Integer) _gDao.selectOne("memberInfo.selectByCash", uid);
        return "" + userCash;
    }

    @RequestMapping(value = "/ajax/deposit_bigdb.do")
    @ResponseBody
    public String depProcBigdb(HttpServletRequest request) throws Exception {
        String retVal = "error";

        try {
            String[] acptIpAddr = this.getConfig().getAcptIpAddr();
            boolean hasAcpted = false;
            String clientIp = request.getHeader("X-FORWARDED-FOR");
            logger.error("CLIENT IP::" + clientIp);
            for (String ip : acptIpAddr) {
                if (ip.equals(clientIp)) {
                    hasAcpted = true;
                    break;
                }
            }
            if (!hasAcpted)
                return retVal;
            MoneyVO vo = new MoneyVO();
            CommonMdlVO cvo = new CommonMdlVO();
//			String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";
//			DateFormat formatter = new SimpleDateFormat(DEFAULT_PATTERN);

//			vo.setAcceptDate(formatter.parse(request.getParameter("times")));
            vo.setCash(Integer.parseInt(request.getParameter("amount")));
            vo.setAccountNo(request.getParameter("banknum"));
            vo.setBankName(StringEscapeUtils.unescapeJava(request.getParameter("bankname")));
            vo.setUserName(StringEscapeUtils.unescapeJava(request.getParameter("name")));

            Integer moneySeq = (Integer) _gDao.selectOne("money.selectByAccountName", vo);

            cvo.setAmount(request.getParameter("amount"));
            //cvo.setTimes(request.getParameter("times"));
            cvo.setBankName(StringEscapeUtils.unescapeJava(request.getParameter("bankname")));
            cvo.setBankNum(request.getParameter("banknum"));
            cvo.setName(StringEscapeUtils.unescapeJava(request.getParameter("name")));
            if (moneySeq == null || moneySeq == 0) {
                cvo.setFailed("1");
            } else {
                cvo.setFailed("0");
            }
            _depService.insertDepositRequest(cvo);
            if (moneySeq != null && moneySeq != 0) {
                vo.setMoneySeq(moneySeq);
                _paymentService.insertCashByDeposit(vo);
                _depService.updateBigdb(vo);
                _paymentService.updateDepositAccept(vo);
                _memberService.updateByDeposit(vo.getMoneySeq());
                retVal = "ok";
            }

        } catch (Exception e) {
            logger.debug(e.getMessage(), e);
        }
        return retVal;
    }

    /**
     * Ajax check account object.
     *
     * @param body           the body
     * @param accountCheckVO the account check vo
     * @param result         the result
     * @param model          the model
     * @return the object
     * @throws Exception the exception
     */
    @RequestMapping(value = "/ajax/checkAccount")
    @ResponseBody
    public Object ajaxCheckAccount(@RequestBody(required = false) String body, AccountCheckVO accountCheckVO, BindingResult result, Model model) throws Exception {
        if (result.hasErrors())
            return super.setBindingResult(result, model);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String strOrderNo   = sdf.format(new Date()) + (Math.round(Math.random() * 10000000000L) + "");

        String serviceResult = _bankService.checkAccount(accountCheckVO.getService(), accountCheckVO.getStrGbn(), accountCheckVO.getStrResId(), accountCheckVO.getStrNm(), accountCheckVO.getStrBankCode(), accountCheckVO.getStrAccountNo(), accountCheckVO.getSvcGbn(), strOrderNo, accountCheckVO.getSvcCls(), accountCheckVO.getInqRsn());

        String[] results = serviceResult.split("\\|");
        String resultOrderNo = results[0];
        String resultCode    = results[1];
        String resultMsg     = results[2];

        // P000: 정상응답일때 송신되는 코드
        // E999: 시스템이상
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("resultOrderNo", resultOrderNo);
        map.put("resultCode", resultCode);
        map.put("resultMsg", resultMsg);

        return new Gson().toJson(map);
    }
}

