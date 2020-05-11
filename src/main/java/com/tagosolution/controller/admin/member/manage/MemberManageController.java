package com.tagosolution.controller.admin.member.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tagosolution.service.model.*;
import com.tagosolution.service.model.search.DepositSearchVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.StringPair;
import com.tagoplus.util.ExcelDownloadUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PageSearchVO;
import com.tagosolution.service.model.search.PaymentSearchVO;
import com.tagosolution.service.util.ListUtil;

/**
 * 회원관리 > 회원 관리 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/member/manage")
public class MemberManageController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberManageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	MemberServiceImpl _memberService;
	
	/**
	 * 회원관리 > 회원 목록 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/member_list")
	public String memberManageMemberList(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원목록", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<StringPair> type = new ArrayList<StringPair>();
		type.add(new StringPair("고객명", "userName"));
		type.add(new StringPair("추천인", "recommUserId"));
		type.add(new StringPair("아이디", "userId"));
		type.add(new StringPair("이메일", "email"));
		type.add(new StringPair("전화번호", "phone"));
		type.add(new StringPair("휴대폰", "mobile"));
		
		search.setWyn("N");
		List<MemberInfoVO> list = (List<MemberInfoVO>) _gDao.selectBySearch("memberInfo.selectBySearch", search);
		List<MemberGradeVO> listGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectListGrade", null);
		List<HistoryLoginVO> counter = (List<HistoryLoginVO>) _gDao.selectList("historyLogin.totalLoginUserCount", null);
		
		int iCount = (int) _gDao.selectOne("memberInfo.totalCountMember", null);
		
		model.addAttribute("counter", counter);
		model.addAttribute("count", iCount);
		model.addAttribute("type2s", type);
		model.addAttribute("search", search);
		model.addAttribute("grade", listGrade);
		model.addAttribute("list", list);
		return super.getConfig().getAdminRoot() + "/member/manage/member_list";
	}
	
	/**
	 * 회원관리 > 회원 등록 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/member_write")
	public String memberManageMemberWrite(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원등록", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByKey", search.getMseq());
		MemberCompanyVO voc = new MemberCompanyVO() ;
		voc = (MemberCompanyVO) _gDao.selectByKey("memberCompany.selectByKey", vo);
		short level = (short) _gDao.selectByKey("memberGrade.selectMaxLevel", null);

		List<MemberGradeVO> listGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectListGrade", null);
		List<MemberGradeVO> sameGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.sameGrade", null);
		List<FixedCodeVO> bankList =(List<FixedCodeVO>)_gDao.selectList("fixedCode.selectByBank", null);


		MemberSettingVO setting = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", super.getSiteSession().getSiteSeq());
		//logger.debug("브이오 : {}", new Gson().toJson(vo));

		Map <Integer, String> gradeList = ListUtil.gradeLevelList();


		model.addAttribute("vo", vo);
		model.addAttribute("voc", voc);
		model.addAttribute("grade", listGrade);
		model.addAttribute("search", search);
		model.addAttribute("setting", setting);
		model.addAttribute("lowGrade", level);
		model.addAttribute("bankList", bankList);
		model.addAttribute("listG",  new Gson().toJson(gradeList));
		model.addAttribute("sameGrade",  new Gson().toJson(sameGrade));

		return super.getConfig().getAdminRoot() + "/member/manage/member_write";
	}

	/**
	 * 회원관리 > 회원 등록 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/member_info_popup")
	public String memberInfo(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원등록", model);

		if(result.hasErrors())
			return super.setBindingResult(result, model);

		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByKey", search.getMseq());
		MemberCompanyVO voc = new MemberCompanyVO() ;
		voc = (MemberCompanyVO) _gDao.selectByKey("memberCompany.selectByKey", vo);
		short level = (short) _gDao.selectByKey("memberGrade.selectMaxLevel", null);

		List<MemberGradeVO> listGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectListGrade", null);
		List<MemberGradeVO> sameGrade = (List<MemberGradeVO>) _gDao.selectList("memberGrade.sameGrade", null);
		List<FixedCodeVO> bankList =(List<FixedCodeVO>)_gDao.selectList("fixedCode.selectByBank", null);


		MemberSettingVO setting = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", super.getSiteSession().getSiteSeq());
		//logger.debug("브이오 : {}", new Gson().toJson(vo));

		Map <Integer, String> gradeList = ListUtil.gradeLevelList();


		model.addAttribute("vo", vo);
		model.addAttribute("voc", voc);
		model.addAttribute("grade", listGrade);
		model.addAttribute("search", search);
		model.addAttribute("setting", setting);
		model.addAttribute("lowGrade", level);
		model.addAttribute("bankList", bankList);
		model.addAttribute("listG",  new Gson().toJson(gradeList));
		model.addAttribute("sameGrade",  new Gson().toJson(sameGrade));

		return super.getConfig().getAdminRoot() + "/member/manage/member_info_popup";
	}

	/**
	 * 회원관리 > 회원등록 - 등록 수정
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/member_proc")
	public String memberManageMemberProc(MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		//logger.debug("회원 {}", new Gson().toJson(vo));
		try {
			if (search.getStatus().equals("d")) {
				_memberService.deleteMemberInfo(search);
				am.setMessage("삭제 완료");
			} else {
				_memberService.insertMemberInfo(search, vo);
				
				am.setMessage("저장 완료");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './member_list', {glevel:" + search.getGlevel() + " ,status:'' });");
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
	@RequestMapping(value="/member_history_popup")
	public String MemberHistory(MemberSearchVO search, BindingResult result, Model model) throws Exception {
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
	@RequestMapping(value="/history_view_popup")
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
		
		return super.getConfig().getAdminRoot() + "/member/manage/history_view_popup";
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

		return super.getConfig().getAdminRoot() + "/member/manage/deposit_history_view_popup";
	}
	
	/**
	 * 회원관리 - 엑셀 저장
	 * @param search
	 * @param result
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/member_excel")
	public String ListExcel(MemberSearchVO search, BindingResult result, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		if(result.hasErrors()) return super.setBindingResult(result, model);
		
		search.setCpage(1);
		search.setRecordCount(Integer.MAX_VALUE);
		
		search.setWyn("N");
		List<MemberInfoVO> list = (List<MemberInfoVO>) _gDao.selectBySearch("memberInfo.selectBySearch", search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		ExcelDownloadUtil.downloadExcel(request, response, map, "", "member_list.xlsx");
		
		return null;
	}
	
	/**
	 * 회원관리 > 탈퇴 회원 - 목록
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdrawal_list")
	public String memberManageWithdrawalList(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 탈퇴 회원", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<StringPair> type = new ArrayList<StringPair>();
		type.add(new StringPair("고객명", "userName"));
		type.add(new StringPair("아이디", "userId"));
		
		search.setWyn("Y");
		List<MemberInfoVO> list = (List<MemberInfoVO>) _gDao.selectBySearch("memberInfo.selectBySearch", search);
		
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("type2s", type);
		
		return super.getConfig().getAdminRoot() + "/member/manage/withdrawal_list";
	}
	
	/**
	 * 회원관리 > 탈퇴 회원 - 삭제
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdrawal_proc")
	public String memberManageWithdrawalProc(MemberSearchVO search,  BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			if (search.getStatus().equals("d")) {
				_memberService.deleteWithdrawal(search);
				am.setMessage("삭제 완료");
				search.setStatus(null);
			} else {
				//등록수정 대기
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './withdrawal_list');");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 회원관리 > 이메일 설정 - 목록
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mail_list")
	public String memberManageMailList(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 이메일 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<MailTmplVO> list = (List<MailTmplVO>) _gDao.selectList("memberMail.selectByList", search);
		
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/member/manage/mail_list";
	}
	
	/**
	 * 회원관리 > 이메일 설정 - 등록,수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mail_write")
	public String memberManageMailWrite(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 이메일 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		MailTmplVO vo = (MailTmplVO) _gDao.selectByKey("memberMail.selectByKey", search.getEmseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/member/manage/mail_write";
	}
	
	/**
	 * 회원관리 > 이메일 설정 - 등록,수정,삭제
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mail_proc")
	public String memberManageMailProc(MemberSearchVO search, MailTmplVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			if (search.getStatus().equals("d")) {
				_memberService.deleteMail(search);
				am.setMessage("삭제 완료");
			} else {
				vo.setMailSeq(search.getEmseq());
				_memberService.insertMail(vo);
				am.setMessage("저장 완료");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './mail_list');");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 회원관리 > 가입약관 및 개인정보 보호정책
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping(value = "/terms")
	public String memberManageTerms(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 가입약관 및 개인정보 보호정책", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//임시
		byte bSeq = super.getSiteSession().getSiteSeq();
		TermsVO vo = (TermsVO) _gDao.selectByKey("terms.selectByKey", bSeq);
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/member/manage/terms";
	}*/

	/**
	 * 회원관리 > 가입약관 및 개인정보 보호정책 - 등록
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping(value = "/terms_proc.do")
	public String memberManageTermsProc(MemberSearchVO search, TermsVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			if (vo.getSiteSeq() == 0) {
				vo.setSiteSeq(super.getSiteSession().getSiteSeq());
			}				
			_memberService.insertTerms(vo);
			am.setMessage("저장 완료");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './terms');");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
		
	}*/
	
	/**
	 * 회원관리 > 이메일발송 - 팝업
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mailer_test")
	public String memberManageSendMail(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("메일 발송", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<MemberInfoVO> list = new ArrayList<MemberInfoVO>();
		
		//logger.debug("순번 : {}", new Gson().toJson(search.getChkseq()));
		
		/*for (int i : search.getChkseq()) {
			MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByKey", i);
			list.add(vo);
		}*/
		//관리자 목록 - json
		List<MemberInfoVO> listMember = (List<MemberInfoVO>) _gDao.selectList("memberInfo.selectListForAjax", null);
		
		model.addAttribute("listMember", new Gson().toJson(listMember));
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/member/manage/mail_test";
	}
	
	@RequestMapping(value = "/mailer_proc")
	public String memberManageMailerProc(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			//메일보내기
			_memberService.sendTestMailer(search);
			am.setMessage("메일 발송 완료");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("history.back();");
		model.addAttribute("alert", am);
				
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 회원관리 > 이메일발송 - 팝업
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mail_send_popup")
	public String memberManageSendMailPopup(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("메일 발송", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<MemberInfoVO> list = new ArrayList<MemberInfoVO>();
		
		//logger.debug("순번 : {}", new Gson().toJson(search.getChkseq()));
		
		for (int i : search.getChkseq()) {
			MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByKey", i);
			list.add(vo);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/member/manage/mail_send_popup";
	}
	
	/**
	 * 회원관리 > 이메일발송 - 발송
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mail_send_proc")
	public String memberManageSendMailProc(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			//메일보내기
			_memberService.insertSendMail(search);
			am.setMessage("메일 발송 완료");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("history.back();");
		model.addAttribute("alert", am);
				
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 회원관리 > 등급관리 목록 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grade_list")
	public String memberManageGradeList(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원등급 관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		//관리자 등급 유무 확인 - 없으면 자동 등록
		MemberSearchVO mSearch = new MemberSearchVO();
		mSearch.setGlevel((short) 1);
		int iCount =  (int) _gDao.selectOne("memberGrade.gradeCount", mSearch);
		if (iCount == 0) {
			MemberGradeVO vo = new MemberGradeVO();
			vo.setGradeLevel((short) 1);
			vo.setGradeName("관리자");
			vo.setGradeMemo("관리자 등급 자동 등록");
			_gDao.insert("memberGrade.merge", vo);
		}
		
		List<MemberGradeVO> list = (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/member/manage/grade_list";
	}
	
	/**
	 * 회원관리 > 등급관리 등록/수정 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grade_write")
	public String memberManageGradeWrite(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("회원관리  &gt; 회원등급 관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberGradeVO vo = (MemberGradeVO) _gDao.selectByKey("memberGrade.selectByKey", search.getGlevel());

		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/member/manage/grade_write";
	}
	
	/**
	 * ajax - 회원등급 중복 검사
	 * 	- 해당 해원 등급이 있을 경우 해당 등급 리턴
	 * @param body
	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/check_grade_level", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxCheckGradeCode(@RequestBody(required = false) String body, short key, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		MemberSearchVO search = new MemberSearchVO();
		search.setGlevel(key);
		int iCount = (int) _gDao.selectOne("memberGrade.gradeCount", search);
		
		if (iCount > 0)
			map.put("result", key);	
		else
			map.put("result", null);
		
		//return new Gson().toJson(map);
		return map;
	}
	
	/**
	 * 회원관리 > 회원등급 관리 - 등록/수정 처리
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grade_proc")
	public String memberManageGradeProc(MemberGradeVO vo, MemberSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		String sStatus = "저장";
		if (search.getStatus().toLowerCase().equals("d")) {
			_gDao.delete("memberGrade.deleteByKey", search.getGlevel());
			sStatus = "삭제";
		}
		else	
			_gDao.insert("memberGrade.merge", vo);
		
		AlertModel am = new AlertModel(sStatus + "되었습니다.", null, "$.Nav('go', './grade_list', {glevel:''});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * Member Point
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mempoint_proc")
	public String memberPointManage(MemberCMomeyVO vo, MemberSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		String sStatus = "저장";
		vo.setOrderUid(0);
		if (search.getStatus().toLowerCase().equals("d")) {
			_gDao.delete("memberCmomey.deleteByKey", vo.getiDx());
			sStatus = "삭제";
		}
		else {
			vo.setEditorName(super.getAdminSession().getAdminId());
			_gDao.insert("memberCmomey.merge", vo);
		}
			
		
		AlertModel am = new AlertModel(sStatus + "되었습니다.", null, "$.Nav('go', './member_write', {mseq:"+ search.getMseq() +"});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}
