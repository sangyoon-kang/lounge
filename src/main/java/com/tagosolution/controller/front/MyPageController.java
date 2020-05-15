package com.tagosolution.controller.front;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tagosolution.service.model.*;
import com.tagosolution.service.model.search.DepositSearchVO;
import com.tagosolution.service.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.GenType;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.Util;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.CashServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.impl.PaymentServiceImpl;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PaymentSearchVO;

/**
 * 회원 컨트롤러 
 * @author lhg
 *
 */
@Controller
@RequestMapping(value = "/mypage")
public class MyPageController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	MemberServiceImpl _memberService;
	
	@Resource
	CashServiceImpl _cashService;

	/**
	 * 회원가입 or 마이페이지 - 등록  & 수정 ui
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*public String memberWrite (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());	
//		MemberCompanyVO voc = (MemberCompanyVO) _gDao.selectByKey("memberCompany.selectById", search.getId());	
//		MemberSettingVO configVO = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", super.getSiteSession().getSiteSeq().intValue());
		Byte bt = 1;
		MemberSettingVO configVO = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", (super.getSiteSession() != null ) ? super.getSiteSession().getSiteSeq() : bt);
		
		model.addAttribute("vo", vo);
//		model.addAttribute("voc", voc);
 		model.addAttribute("configVO", configVO);
		model.addAttribute("search", search);
		return "/front/mypage/modify_member";
	}*/
	
	/**
	 * 회원가입 - 등록 & 수정 처리
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_proc.do")
	public String memberProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		String oldUserId = super.getUserSession().getUserID();

		try {
			_memberService.insertMemberInfo(search, vo);
			
			am.setMessage("처리 되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생하였습니다. \\n" + e.getMessage());
		}

		//수정시
		if (search.getMseq() > 0 && vo.getUserId().equals(oldUserId)) {
			super.getUserSession().setBirthDt(vo.getBirthDt());

			am.setScript("$.Nav('go', '/');");

		//회원가입시	
		} else if (search.getMseq() > 0 && !vo.getUserId().equals(oldUserId)){
			am.setScript("$.Nav('go', '/logout');");
		} else {
			am.setScript("$.Nav('go', '/login');");
		}
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	@RequestMapping(value="/about-us")
	public String aboutUs (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);		
		
		model.addAttribute("search", search);
		return "/front/tp_new_pages/about-us";
	}
	
	/**
	 * Search By Email
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/id_search")
	public String IdSearch (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);		
		
		model.addAttribute("search", search);
		return "/front/member/login_popup";
	}
	
	/**
	 * Search By Email
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/search_proc.do")
	public String IdSearchProc (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			
			MemberInfoVO mVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByForgotId", search);
			if(mVo != null){
				switch(search.getStatus()){
					case "id":
						search.setEmails(mVo.getEmail());
						search.setSubject(super.getConfig().get_sSiteNameU() + " 아이디 찾기입니다.");
						search.setBody("아이디 : " + mVo.getUserId());
						break;
					case "pass":
						String newpassword = StringUtil.getRandomValue(GenType.LowerCaseAndNumber, 10);
						String changeUrl = super.getConfig().getHost();
						search.setEmails(mVo.getEmail());					    
						String token = null;
					    try {   
					        token = JWT.create()
					        		.withExpiresAt(new Date(System.currentTimeMillis() + (1440 * 60 * 1000)))
					                .withIssuedAt(new Date()) //
					                .withClaim("userId", mVo.getUserId().toString()) //
					                .sign(Algorithm.HMAC256(Util.SECRET_TOKEN));
					    } catch (Exception e) {
					      
					    }
						mVo.setPassword(Encrypt.SHA256Hash(newpassword));
						_gDao.insert("memberInfo.updateByKeySelective", mVo);
						search.setSubject(super.getConfig().get_sSiteNameU()  + " 아이디 / 비밀번호 찾기입니다.");
						search.setBody("<p>아이디 : " + mVo.getUserId() + "</p><br/><p>새로운 비밀번호 : " + newpassword +"</p><br><br><p>아래의 주소로 접속하여 비밀번호를 변경하세요.</p><br>"
								+ "<p>"+changeUrl+"/pwd_change?id="+token+"</p><br><p>이 주소는 24시간동 안 유효합니다.</p>");
						break;
					default:
						break;
				}
				_memberService.sendTestMailer(search);
				am.setMessage("메일 발송 완료.");
			}else
				am.setMessage("사용자를 찾을 수 없음.");
			
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		am.setScript("if(opener == null){$.Nav('go', '"+ super.getConfig().getFrontLoginURL() +"');} else {self.close();}");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/history_popup")
	public String MemberHistory(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("나의거래내역", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		search.setUserId(super.getUserSession().getUserId());
		List<OrderVO> list = (List<OrderVO>)_gDao.selectBySearch("order.selectUserOrder", search, "totalUserOrder");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "/front/mypage/member_history";
	}
	
	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/order_view_popup")
	public String OrderView(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("나의거래내역", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		OrderVO vo = (OrderVO) _gDao.selectByKey("order.selectUserOrderDetail", search.getOrderSeq());
		OrderDetailVO od = (OrderDetailVO) _gDao.selectByKey("orderDetail.selectByKey", search.getOrderSeq());

		RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", vo);
		runTimeVO.setRunTime(vo.getRunTime());

		RateVO rateVo = (RateVO) _gDao.selectOne("rate.selectByKey", vo);
		rateVo.setRunTime(vo.getRunTime());

		model.addAttribute("rateVo", rateVo);
		model.addAttribute("runTimeVO", runTimeVO);
		model.addAttribute("vo", vo);
		model.addAttribute("od", od);
		model.addAttribute("search", search);
		
		return "/front/mypage/order_form";
	}
	@RequestMapping(value="/order_view_ajax")
	@ResponseBody
	public Object OrderView1(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Map<String, Object> map = new HashMap<String, Object>();
		OrderVO vo = (OrderVO) _gDao.selectByKey("order.selectUserOrderDetail", search.getOrderSeq());
		OrderDetailVO od = (OrderDetailVO) _gDao.selectByKey("orderDetail.selectByKey", search.getOrderSeq());

		RunTimeVO runTimeVO = (RunTimeVO) _gDao.selectOne("runTime.selectRuntime", vo);
		runTimeVO.setRunTime(vo.getRunTime());

		RateVO rateVo = (RateVO) _gDao.selectOne("rate.selectByKey", vo);
		rateVo.setRunTime(vo.getRunTime());

		
		map.put("rateVo", rateVo);
		map.put("runTimeVO", runTimeVO);
		map.put("vo", vo);
		map.put("od", od);
		map.put("search", search);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * Member Out.		
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/out.do")
	public String memberLeaveOut (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		short lowGrade = (short) _gDao.selectByKey("memberGrade.selectMaxLevel", null);
		
		model.addAttribute("lowGrade", lowGrade);
		model.addAttribute("search", search);
		return "/front/mypage/out";
	}
	
	/**
	 * 마이페이지 - 회원탈퇴 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/out_proc.do")
	public String outProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);		

		AlertModel am = new AlertModel();

		boolean isPwdCheck = false;

		try {
			MemberInfoVO mVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", super.getUserSession().getUserId());			
			if (mVo.getUserPwd().equals(Encrypt.SHA256Hash(vo.getUserPwd()))) {
				vo.setUserId(super.getUserSession().getUserId());
				vo.setMemberSeq(super.getUserSession().getMemberSeq());	
					
				
				
				
				_memberService.deleteOwner(vo);
				am.setMessage("처리 되었습니다.");
				isPwdCheck = true;
				

			} else {
				am.setMessage("기존 비밀번호가 틀렸습니다.");
			}
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		
		if (isPwdCheck) {
			am.setScript("$.Nav('go', '" + super.getConfig().getFrontLoginURL() + "', null, null, true);");
			super.getSession().invalidate();
		} else {
			am.setScript("$.Nav('go', './out.do');");
		}
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * Member Transaction.		
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ms_shop")
	public String memberShop(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);	
		
		search.setUserId(super.getUserSession().getUserId());
		
		if(super.getUserSession().getGradeLevel() >= 6 || _memberService.selectBelongUsers(search) == 0){
			return "redirect:" + super.getConfig().getFrontMain();
		}
		CashVO vo = (CashVO) _cashService.selectForUser(search);
		
		if(search.getStartDate() == null || (search.getStartDate() != null && search.getStartDate().isEmpty())) search.setStartDate(StringUtil.getDateToString("yyyy-MM-dd"));
		if(search.getEndDate() == null || (search.getEndDate() != null && search.getEndDate().isEmpty())) search.setEndDate(StringUtil.getDateToString("yyyy-MM-dd"));;
		
		List<CashVO> list = (List<CashVO>)_cashService.selectUserLine(search); 

		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);

		model.addAttribute("trimUserId", search.getUserId().replaceAll("(\r\n|\r|\n|\n\r|\\p{Z}|\\t)", ""));

		return "/front/mypage/ms_shop";
	}
	
	/**
	 * Member Transaction.		
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ms_shop_popup")
	public String shopPopup(PaymentSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);	
		
		if(search.getStartDate() == null || (search.getStartDate() != null && search.getStartDate().isEmpty())) search.setStartDate(StringUtil.getDateToString("yyyy-MM-dd"));
		if(search.getEndDate() == null || (search.getEndDate() != null && search.getEndDate().isEmpty())) search.setEndDate(StringUtil.getDateToString("yyyy-MM-dd"));
		search.setUserId(super.getUserSession().getUserId());
		if(super.getUserSession().getGradeLevel() >= 6 || _memberService.selectBelongUsers(search) == 0){
			return "redirect:" + super.getConfig().getFrontMain();
		}
		List<CashVO> list = _cashService.selectMemPopList(search);
				
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "/front/mypage/ms_member_popup";
	}


	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_history_popup")
	public String MyMemberHistory(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("나의거래내역", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<OrderVO> list = (List<OrderVO>)_gDao.selectBySearch("order.selectUserOrder", search, "totalUserOrder");

		model.addAttribute("list", list);
		model.addAttribute("search", search);

		return super.getConfig().getAdminRoot() + "/member/manage/member_history_popup";
	}


	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deposit_history_view_popup")
	public String depositHistoryView(DepositSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("입출금내역", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<MoneyVO> list = (List<MoneyVO>)_gDao.selectBySearch("order.selectDepositHistoryList", search,"totalDepositHistoryList");

		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("myshop", true);

		return super.getConfig().getAdminRoot() + "/member/manage/deposit_history_view_popup";
	}

	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_support_cash_history_pop")
	public String supportCashHistoryView(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("지원금내역", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<MoneyVO> list = (List<MoneyVO>)_gDao.selectBySearch("order.selectSupportCashHistoryList", search,"totalSupportCashHistoryList");
		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getUserId());
		MoneyVO moneyVO = (MoneyVO) _gDao.selectOne("money.getUserMoneyInfo", search.getUserId());

		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("user", vo);
		model.addAttribute("userMoney",  moneyVO);

		return "/front/mypage/ms_support_cash_history_view_popup";
	}


	/**
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_detail_info_popup")
	public String memberDetailInfo(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("고객정보", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);


		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getUserId());
		MemberCompanyVO voc = new MemberCompanyVO() ;
		voc = (MemberCompanyVO) _gDao.selectByKey("memberCompany.selectByKey", vo);
		short level = (short) _gDao.selectByKey("memberGrade.selectMaxLevel", null);

		List<MemberGradeVO> listGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectListGrade", null);
		List<MemberGradeVO> sameGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.sameGrade", null);
		List<FixedCodeVO> bankList =(List<FixedCodeVO>)_gDao.selectList("fixedCode.selectByBank", null);


		MemberSettingVO setting = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", super.getSiteSession().getSiteSeq());
		//logger.debug("브이오 : {}", new Gson().toJson(vo));

		Map <Integer, String> gradeList = ListUtil.gradeLevelList();

		// 캐쉬입금액총액, 거래수익총액, 꽁머니지급액총액
		MoneyVO moneyVO = (MoneyVO) _gDao.selectOne("money.getUserMoneyInfo", vo.getUserId());

		model.addAttribute("vo", vo);
		model.addAttribute("voc", voc);
		model.addAttribute("grade", listGrade);
		model.addAttribute("search", search);
		model.addAttribute("setting", setting);
		model.addAttribute("lowGrade", level);
		model.addAttribute("bankList", bankList);
		model.addAttribute("listG",  new Gson().toJson(gradeList));
		model.addAttribute("sameGrade",  new Gson().toJson(sameGrade));
		model.addAttribute("userMoney",  moneyVO);


		return "/front/mypage/ms_member_info_popup";
	}



	@RequestMapping(value = "/ajax/addCash")
	@ResponseBody
	public Object addCash(@RequestBody(required = false) String userid, String uid, String cash, String memo, boolean type, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		Map<String, Object> map = new HashMap<String, Object>();
		String message = "";

		MemberInfoVO loginVO = super.getUserSession();

		MemberInfoVO adVO = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", loginVO.getUserId());
		MemberInfoVO targetVO = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", uid);

		int tCash = Integer.parseInt(cash);

		//금액체크
		if(type){
			if(adVO.getCash() < tCash){
				map.put("code",1);
				map.put("message","본인의 보유금이 부족해서 지원해 줄수 없습니다.");
				return new Gson().toJson(map);
			}
		}else{
			if(targetVO.getCash() < tCash){
				map.put("code",1);
				map.put("message",targetVO.getUserName() +" 님의 보유금 보다 큰 금액을 회수 할수 없습니다.");
				return new Gson().toJson(map);
			}
			tCash *= -1;
		}


		MemberInfoVO mmb = new MemberInfoVO();
		mmb.setUserId(uid);
		mmb.setCash(tCash);
		_gDao.update("memberInfo.updateCashByUserId", mmb);

		MemberInfoVO admb = new MemberInfoVO();
		admb.setUserId(loginVO.getUserId());
		admb.setCash(tCash*-1);
		_gDao.update("memberInfo.updateCashByUserId", admb);


		CashVO mCashVO = new CashVO();
		mCashVO.setUserId(mmb.getUserId());
		mCashVO.setCash(mmb.getCash());
		mCashVO.setMemo1(memo);
		mCashVO.setRegUser(loginVO.getUserId());

		CashVO aCashVO = new CashVO();
		aCashVO.setUserId(admb.getUserId());
		aCashVO.setCash(admb.getCash());
		if(type){
			aCashVO.setMemo1("회원 지원");
		}else{
			aCashVO.setMemo1("회원 회수");
		}
		aCashVO.setRegUser(loginVO.getUserId());

		try {
			_gDao.insert("cash.insertCashByUser", mCashVO);
			_gDao.insert("cash.insertCashByUser", aCashVO);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

//		Integer finalCash = (Integer) _gDao.selectOne("memberInfo.selectByCash", uid);

		map.put("code",0);
		map.put("message","처리가 완료 되었습니다.");

		return new Gson().toJson(map);


	}




}