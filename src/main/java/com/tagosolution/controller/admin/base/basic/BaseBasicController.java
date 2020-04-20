package com.tagosolution.controller.admin.base.basic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.CookieUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.AdminServiceImpl;
import com.tagosolution.service.impl.PopupServiceImpl;
import com.tagosolution.service.impl.SiteServiceImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.MenuAuthGroupSettingVO;
import com.tagosolution.service.model.PopupVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.PopupSearchVO;


/**
 * 기본설정 > 기본설정 컨트롤러 
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/base/basic")
public class BaseBasicController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseBasicController.class);
	
	@Resource
	SiteServiceImpl _siteService; 
	
	@Resource
	PopupServiceImpl _popupService;
	
	@Resource
	AdminServiceImpl _adminService;
	
	@Resource
	GeneralDAOImpl _gDao;
	

	/**
	 * 기본설정 > 사이트 정보 - UI 뷰/수정
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/site_info")
	public String siteInfo(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본 설정 &gt; 사이트 정보", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		return super.getConfig().getAdminRoot() + "/base/basic/site_info";
	}
	
	/**
	 * 기본설정 > 사이트 정보 - 처리
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/site_info_proc")
	public String siteInfoProc(SiteVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		//logger.debug(">>>>>> siteVO : {}", new Gson().toJson(vo));
		
		vo.setSiteSeq(super.getSiteSession().getSiteSeq());
		vo.setSiteCertKey("");
		_siteService.update(vo, request);
		
		AlertModel am = new AlertModel("저장되었습니다.", "./site_info", null);
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 기본설정 > 팝업관리 - 리스트
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/popup_list")
	public String basicPopup(PopupSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본설정  &gt; 팝업관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		List<PopupVO> list = (List<PopupVO>) _gDao.selectBySearch("popup.selectList", search, "totalCount");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/basic/popup_list";
	}
	
	
	/**
	 * 기본설정 > 팝업관리 - 글쓰기
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/popup_write")
	public String basicPopupWrite(PopupSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본설정  &gt; 팝업관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		PopupVO vo = (PopupVO) _gDao.selectByKey("popup.selectByKey", search.getPseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/base/basic/popup_write";
	}
	
	/**
	 * 기본설정 > 팝업관리 - 등록수정삭제
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/popup_proc")
	public String basicPopupProc(PopupVO vo, PopupSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		//logger.debug(">>>입력값 : {}", new Gson().toJson(vo));
		try {
			if (search.getStatus().equals("d")) {
				_popupService.deletePopup(search);
				am.setMessage("삭제되었습니다.");
			} else {
				vo.setRegUser(super.getAdminSession().getAdminId());
				vo.setModUser(super.getAdminSession().getAdminId());

				_popupService.insertPopup(vo);
				am.setMessage("저장되었습니다.");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './popup_list', {status:''});");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 기본설정 > 관리자설정 - 목록
	 * @param serach
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin_list")
	public String basicAdminList(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본설정  &gt; 관리자설정", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<AdminVO> list = (List<AdminVO>) _gDao.selectBySearch("admin.selectList", search);
		
		//String sValue = _cookie.getCookie(request, "");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/basic/admin_list";
	}
	
	/**
	 * 기본설정 > 관리자설정 - 등록 수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin_write")
	public String basicAdminWrite(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본설정  &gt; 관리자설정", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AdminVO vo = (AdminVO) _gDao.selectByKey("admin.selectByKey", search.getAid());
		List<MenuAuthGroupSettingVO> listGrade = (List<MenuAuthGroupSettingVO>) _gDao.selectList("menuAuthGroup.selectForAdmin", null);
		
		model.addAttribute("vo", vo);
		model.addAttribute("grade", listGrade);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/basic/admin_write";
	}
	
	/**
	 * 기본설정 > 관리자설정 - 등록 수정 삭제
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin_proc")
	public String basicAdminProc(MemberSearchVO search, AdminVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			if (search.getStatus().equals("d")) {
				_adminService.deleteAdminInfo(search);
				am.setMessage("삭제 완료");
			} else {
				//logger.debug("관리자 : {}", new Gson().toJson(vo));
				vo.setUseYn("Y");
				_adminService.insertAdminInfo(search, vo);
				am.setMessage("저장 완료");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './admin_list');");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	/**
	 * 기본설정 > 사이트 정보 - UI 뷰/수정
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/shop_info")
	public String shopInfo(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("기본 설정 &gt; 사이트 정보", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		return super.getConfig().getAdminRoot() + "/base/basic/site_info";
	}
	
//	/**
//	 * 회원관리 > 등급관리 목록 - UI
//	 * @param search
//	 * @param result
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/grade_list")
//	public String memberManageGradeList(MemberSearchVO search, BindingResult result, Model model) throws Exception {
//		super.setPageSubTitle("회원관리  &gt; 회원등급 관리", model);
//		
//		if(result.hasErrors())
//			return super.setBindingResult(result, model);
//		
//		List<AdminGradeVO> list = (List<AdminGradeVO>) _gDao.selectList("adminGrade.selectList", search);
//		
//		model.addAttribute("list", list);
//		model.addAttribute("search", search);
//		
//		return super.getConfig().getAdminRoot() + "/base/basic/grade_list";
//	}
//	
//	/**
//	 * 회원관리 > 등급관리 등록/수정 - UI
//	 * @param search
//	 * @param result
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/grade_write")
//	public String memberManageGradeWrite(MemberSearchVO search, BindingResult result, Model model) throws Exception {
//		super.setPageSubTitle("회원관리  &gt; 회원등급 관리", model);
//		
//		if(result.hasErrors())
//			return super.setBindingResult(result, model);
//		
//		AdminGradeVO vo = (AdminGradeVO) _gDao.selectByKey("adminGrade.selectByKey", search.getGlevel());
//
//		model.addAttribute("vo", vo);
//		model.addAttribute("search", search);
//		
//		return super.getConfig().getAdminRoot() + "/base/basic/grade_write";
//	}
//	
//	/**
//	 * ajax - 회원등급 중복 검사
//	 * 	- 해당 해원 등급이 있을 경우 해당 등급 리턴
//	 * @param body
//	 * @param id
//	 * @param result
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/ajax/check_grade_level", method = RequestMethod.POST)
//	@ResponseBody
//	public Object ajaxCheckGradeCode(@RequestBody(required = false) String body, short key, BindingResult result, Model model) throws Exception {
//		if (result.hasErrors())
//			return super.setBindingResult(result, model);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		MemberSearchVO search = new MemberSearchVO();
//		search.setGlevel(key);
//		int iCount = (int) _gDao.selectOne("adminGrade.gradeCount", search);
//		
//		if (iCount > 0)
//			map.put("result", key);	
//		else
//			map.put("result", null);
//		
//		//return new Gson().toJson(map);
//		return map;
//	}
//	
//	/**
//	 * 회원관리 > 회원등급 관리 - 등록/수정 처리
//	 * @param vo
//	 * @param search
//	 * @param result
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/grade_proc")
//	public String memberManageGradeProc(AdminGradeVO vo, MemberSearchVO search, BindingResult result, Model model) throws Exception {
//		
//		if(result.hasErrors())
//			return super.setBindingResult(result, model);
//
//		String sStatus = "저장";
//		Integer isUsed = 0;
//		if (search.getStatus().toLowerCase().equals("d")) {
//			isUsed = (int) _gDao.selectOne("admin.totalCount", search);
//			if(isUsed == 0){
//				_gDao.delete("adminGrade.deleteByKey", search.getGlevel());
//				sStatus = "삭제";
//			} else
//				sStatus = isUsed + " Users has been registred on this ";
//		}
//		else	
//			_gDao.insert("adminGrade.merge", vo);
//		
//		AlertModel am = new AlertModel(sStatus + "되었습니다.", null, "$.Nav('go', './grade_list', {glevel:''});");
//		model.addAttribute("alert", am);
//		return super.getConfig().getViewAlert();
//	}
	
}
