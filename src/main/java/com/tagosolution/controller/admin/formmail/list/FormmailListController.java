package com.tagosolution.controller.admin.formmail.list;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.StringPair;
import com.tagoplus.util.ExcelDownloadUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.FormmailServiceImpl;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.FormValueVO;
import com.tagosolution.service.model.FormWritingVO;
import com.tagosolution.service.model.search.FormmailSearchVO;

/**
 * 폼메일관리 - 컨트롤러
 * @author kky
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/formmail")
public class FormmailListController extends BaseController  {
	private static final Logger logger = LoggerFactory.getLogger(FormmailListController.class);
	
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
	@RequestMapping(value="/list/{formSeq}")
	public String formmailList(@PathVariable Integer formSeq, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("폼메일목록 &gt; 폼메일관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<StringPair> type = new ArrayList<StringPair>();
		type.add(new StringPair("대기중", "W"));
		type.add(new StringPair("처리중", "P"));
		type.add(new StringPair("처리완료", "C"));
		search.setFseq(formSeq);
		List<FormWritingVO> list = (List<FormWritingVO>) _gDao.selectBySearch("formWriting.selectList", search);
		
		//List<FormVO> list = (List<FormVO>) _gDao.selectBySearch("form.selectListForm", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("type1s", type);
		
		return super.getConfig().getAdminRoot() + "/formmail/list/list";
	}
	
	/**
	 * 폼메일관리 - 보기
	 * @param formSeq
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/write/{formSeq}")
	public String formmailWrite(@PathVariable Integer formSeq, FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("폼메일관리 &gt; 폼메일관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//search.setFseq(formSeq);
		
		FormWritingVO vo = (FormWritingVO) _gDao.selectByKey("formWriting.selectByKey", search.getFwseq());
		
		search.setTableName("writeForm");
		search.setRefSeq(String.valueOf(search.getFwseq()));
		List<FileVO> fileList = (List<FileVO>) _gDao.selectList("file.selectByRefSeq", search);
		
		//if (vo != null) {
		//작성내용 배열을 구분자로 나누어 리스트에 추가
		for (FormValueVO f : vo.getValueVO()) {
			List<String> listString2 = new ArrayList<String>();
			String[] sArr2 = null;
			if (f.getProperty().equals("text") || f.getProperty().equals("pdate") || f.getProperty().equals("textarea")) {
				if (!StringUtils.isEmpty(f.getFormInfoValue())) {
					sArr2 = f.getFormInfoValue().split("\\¤");
					for (String s2 : sArr2)
						listString2.add(s2);
					f.setFormInfoValueArr(listString2);
				}
			} else {
				listString2.add(f.getFormInfoValue());
				f.setFormInfoValueArr(listString2);
			}
		}
		//}
				
		logger.debug("보기값 : {}", new Gson().toJson(vo));
		
		List<StringPair> type = new ArrayList<StringPair>();
		type.add(new StringPair("대기중", "W"));
		type.add(new StringPair("처리중", "P"));
		type.add(new StringPair("처리완료", "C"));
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		model.addAttribute("type1s", type);
		
		return super.getConfig().getAdminRoot() + "/formmail/list/write";
	}
	
	/**
	 * 폼메일관리 수정, 삭제, 답변
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/proc")
	public String formmailProc(FormmailSearchVO search, FormWritingVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		
		try {
			if (search.getStatus().equals("d")) {
				_formmailService.deleteWriteForm(search);
			} else {
				_formmailService.updateFormSend(search, vo);
				if (search.getAnswerYn().equals("Y"))
					am.setMessage("메일 전송 완료");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}

		if (search.getFseq() > 0)
			am.setScript("$.Nav('go', './list/" + search.getFseq()  + "', {fwseq:" + search.getFwseq() +"});");
		else
			am.setScript("$.Nav('go', './manage/list');");
		
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 폼메일관리 작성내용 등록
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/valueProc")
	public String valueProc(FormmailSearchVO search, FormValueVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		//logger.debug("입력 값 : {} ", new Gson().toJson(vo));
		search.setUser(super.getAdminSession().getUserID());
		
		try {
			_formmailService.insertFormValue(search, vo);
			am.setMessage("저장 완료");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		am.setScript("history.back();");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 폼메일관리 목록 - 엑셀저장
	 * @param search
	 * @param result
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/form_excel")
	public String ListExcel(FormmailSearchVO search, BindingResult result, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		if(result.hasErrors()) return super.setBindingResult(result, model);
		
		search.setCpage(1);
		search.setRecordCount(Integer.MAX_VALUE);
		
		List<FormWritingVO> list = (List<FormWritingVO>) _gDao.selectBySearch("formWriting.selectList", search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		ExcelDownloadUtil.downloadExcel(request, response, map, "", "form_list.xlsx");
		
		return null;
	}
}
