package com.tagosolution.controller.admin.formmail.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang.StringUtils;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.StringPair;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.FormmailServiceImpl;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.FormInfoVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.FormWritingVO;
import com.tagosolution.service.model.search.FormmailSearchVO;

/**
 * 폼메일관리 - 폼메일생성 컨트롤러
 * @author kky
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/formmail/manage")
public class FormmailManageController extends BaseController {
	
private static final Logger logger = LoggerFactory.getLogger(FormmailManageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	FormmailServiceImpl _formmailService;
	
	
	/**
	 * 폼메일관리 - 목록
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public String formList(FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("폼메일관리 &gt; 폼메일관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<StringPair> type = new ArrayList<StringPair>();
		type.add(new StringPair("대기중", "W"));
		type.add(new StringPair("처리중", "P"));
		type.add(new StringPair("처리완료", "C"));
		List<StringPair> type1 = new ArrayList<StringPair>();
		type1.add(new StringPair("제목", "subject"));
		type1.add(new StringPair("내용", "value"));
		type1.add(new StringPair("작성자", "regUser"));
		List<FormWritingVO> list = (List<FormWritingVO>) _gDao.selectBySearch("formWriting.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("type1s", type);
		model.addAttribute("type2s", type1);
		return super.getConfig().getAdminRoot() + "/formmail/list/list";
	}
	
	/**
	 * 폼메일생성 - 목록
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/formmail_list")
	public String FormmailList(FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("폼메일관리 &gt; 폼메일생성", model);
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<FormVO> list = (List<FormVO>) _gDao.selectBySearch("form.selectListForm", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/formmail/manage/formmail_list";
	}
	
	/**
	 * 폼메일생성 - 등록 수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/formmail_write")
	public String FormmailWrite(FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("폼메일관리 &gt; 폼메일생성", model);
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		FormVO vo = (FormVO) _gDao.selectByKey("form.selectByKey", search.getFseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/formmail/manage/formmail_write";
	}
	
	/**
	 * 폼메일생성 - 등록 수정 삭제
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/form_proc")
	public String FormmailProc(FormmailSearchVO search, FormVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
		return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		logger.debug("브이오 : {}", new Gson().toJson(vo));
		//sms 임시
		vo.setSmsReceiveYn("Y");
		vo.setSmsReceive("");
		
		vo.setBoardReceiveYn("Y");
		vo.setFormSeq(search.getFseq());
		//logger.debug("브이오 : {}", new Gson().toJson(vo));
		int iFormSeq = 0;
		String sUrl = "";
		try {
			if (search.getStatus().equals("d")) {
				_formmailService.deleteFormmail(search);
				sUrl = "list";
			} else {
				vo.setTermsBody(vo.getTermsBody().replace("\r\n", "<br>"));
				vo.setRegUser(super.getAdminSession().getUserID());
				iFormSeq = _formmailService.insertFormmail(vo);
				sUrl = "write";
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './formmail_" + sUrl + "', {fseq:" + iFormSeq + "});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 폼메일생성 - 항목추가 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/formmail_popup_write")
	public String FormmailPopupWrite(FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("폼메일 설정", model);
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<StringPair> type = new ArrayList<StringPair>();
		type.add(new StringPair("text", "text"));
		type.add(new StringPair("select", "select"));
		type.add(new StringPair("radio", "radio"));
		type.add(new StringPair("checkbox", "checkbox"));
		type.add(new StringPair("textarea", "textarea"));
		type.add(new StringPair("file", "file"));
		type.add(new StringPair("이름", "name"));
		type.add(new StringPair("전화번호", "phone"));
		type.add(new StringPair("이메일", "email"));
		type.add(new StringPair("달력", "pdate"));
		type.add(new StringPair("주소찾기", "address"));
		
		FormInfoVO vo = (FormInfoVO) _gDao.selectByKey("formInfo.selectByKey", search.getFiseq());
		FormInfoVO info = (FormInfoVO) _gDao.selectByKey("formInfo.selectByForm", search.getFseq());
		
		int iMax = 0;
		if (info != null)
			iMax = (int) _gDao.selectOne("formInfo.selectByMaxOrdering", search.getFseq());
		
		//세부항목
		List<String> list = new ArrayList<String>();
		if (vo != null) {
			search.setFseq(vo.getFormSeq());
			String[] arr = vo.getDetailName().split("\\¤", vo.getDetailCount());
			for (String s : arr)
				list.add(s);
		}
		
		search.setTableName("formmail");
		search.setRefSeq(String.valueOf(search.getFiseq()));
		FileVO file =  (FileVO) _gDao.selectOne("file.selectByRefSeq", search);
			
		model.addAttribute("max", iMax);
		model.addAttribute("file", file);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("type1s", type);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/formmail/manage/formmail_popup_write";
	}
	
	/**
	 * 폼메일생성 - 항목추가 팝업 등록 수정 삭제
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/formmail_popup_proc")
	public String FormmailPopupProc(FormmailSearchVO search, FormInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		//logger.debug("배열 : {}", new Gson().toJson(vo.getDetailNameArray()));
		
		String sDetail = StringUtils.join(vo.getDetailNameArray(), "¤");
	
		vo.setDetailName(sDetail);
		vo.setFormInfoSeq(search.getFiseq());
		vo.setFormSeq(search.getFseq());
		//logger.debug("입력 vo : {}", new Gson().toJson(sDetail));
		
		
		AlertModel am = new AlertModel();
		search.setUser(super.getAdminSession().getUserID());
		try {
			_formmailService.insertFormInfo(search, vo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("if (opener == null) {alert('부모 페이지가 없어 상태값을 업데이트할 수 없습니다.');} else { opener.updateFormInfo(); $.Nav('go', './formmail_popup_write', {fiseq:'', fseq:" + vo.getFormSeq() +"});}");
		//am.setScript("$.Nav('go', './formmail_popup_write', {fiseq:" + iSeq + "});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 세부항목 가져오기
	 * @param body
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getFormmailDetail")
	@ResponseBody
	public Object ajaxDetailJson(@RequestBody(required = false) String body, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map map = new HashMap();
		//logger.debug("서치 : {}", search.getFiseq());
		FormInfoVO vo = (FormInfoVO) _gDao.selectByKey("formInfo.selectByKey", search.getFiseq());
		List<String> list = new ArrayList<String>();
		if (vo != null) {
			String[] arr = vo.getDetailName().split("\\¤");
			for (String s : arr)
				list.add(s);
		}
		//logger.debug("리스트1 : {}", new Gson().toJson(list));
		//logger.debug("리스트 크기 : {}", list.size());
		//logger.debug("세부 개수 : {}", search.getNum());
		int iSize = list.size();
		if (list.size() > search.getNum()) {
			for (int i = search.getNum(); i <  iSize; i++)
				list.remove(list.size()-1);
		}
		for (int i = list.size(); i < search.getNum(); i++)
			list.add(new String());
		
		map.put("detail", list);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * 항목 목록 - 가져오기
	 * @param body
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getFormInfo")
	@ResponseBody
	public Object ajaxGetFormInfo(@RequestBody(required = false) String body, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		List<FormInfoVO> list = (List<FormInfoVO>) _gDao.selectList("formInfo.selectByForm", search.getFseq());
		//logger.debug("인포 :{}", new Gson().toJson(list));
		//항목 목록
		if (!list.isEmpty()) {
			for (FormInfoVO f : list) {
				List<String> listString = new ArrayList<String>();
				String[] sArr = f.getDetailName().split("\\¤", f.getDetailCount());
				for (String s : sArr)
					listString.add(s);
				f.setDetailNameArray(listString);
			}
		}
		
		map.put("info", list);
		//logger.debug("리스트 : {}", new Gson().toJson(list));
		return map;
	}
	
	/**
	 * 항목 순서변경, 삭제
	 * @param body
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/changeState")
	@ResponseBody
	public Object ajaxChangeState(@RequestBody(required = false) String body, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Map<String, Object> map = new HashMap<String, Object>();
		FormInfoVO vo1 = (FormInfoVO) _gDao.selectByKey("formInfo.selectByKey", search.getPreSeq());
		FormInfoVO vo2 = (FormInfoVO) _gDao.selectByKey("formInfo.selectByKey", search.getNextSeq());
		
		String sResult = "";
		
		try {
			if (search.getStatus().equals("d")) {
				_formmailService.deleteFormInfo(search);
				sResult = "삭제";
			} else {
				if (search.getNextSeq() != 0)
					_formmailService.updateOrdering(vo1, vo2);
				sResult = "변경";
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		map.put("result", sResult);
		return map;
	}

	
//	/**
//	 * 항목 순서 변경
//	 * @param body
//	 * @param search
//	 * @param result
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/UpdateOrdering")
//	@ResponseBody
//	public Object ajaxUpdateOrdering(@RequestBody(required = false) String body, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
//		if (result.hasErrors())
//			return super.setBindingResult(result, model);
//		
//		FormInfoVO vo1 = (FormInfoVO) _gDao.selectByKey("formInfo.selectByKey", search.getPreSeq());
//		FormInfoVO vo2 = (FormInfoVO) _gDao.selectByKey("formInfo.selectByKey", search.getNextSeq());
//		
//		try {
//			if (search.getNextSeq() != 0)
//				_formmailService.updateOrdering(vo1, vo2);
//		} catch (Exception e) {
//			logger.error(e.getMessage(), e);
//		}
//		
//		return "";
//	}
//	
//	/**
//	 * 항목 삭제
//	 * @param body
//	 * @param search
//	 * @param result
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/deleteFormInfo")
//	@ResponseBody
//	public Object ajaxDeleteInfo(@RequestBody(required = false) String body, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
//		if (result.hasErrors())
//			return super.setBindingResult(result, model);
//		try {
//			_formmailService.deleteFormInfo(search);
//		} catch (Exception e) {
//			logger.error(e.getMessage(), e);
//		}
//	
//		return "";
//	}
	
	
}
