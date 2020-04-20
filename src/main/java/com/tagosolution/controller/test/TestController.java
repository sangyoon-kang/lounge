package com.tagosolution.controller.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.search.SampleSearchVO;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.model.common.StringPair;
import com.tagoplus.controller.ParentController;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.Encrypt;

@Controller
@RequestMapping(value = "/test")
public class TestController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Resource
	GeneralDAOImpl _gdao;
	
	@Deprecated
	@RequestMapping(value = "/tile")
	public String index(SearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("페이지 타이틀 - 컨트롤러 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		logger.debug(">>>>> SearchVO : {}",	 new Gson().toJson(search));
		
		return "tile";
	}
	
	
	
	@RequestMapping(value = "/locator")
	public String locatorExample(SampleSearchVO search, BindingResult result, Model model) throws Exception {
		//부제 추가 예제
		super.setPageSubTitle("jquery.locator 예제", model);
		
		//et:abbr 테스트용
		model.addAttribute("alphabet", "abcdefghijklmnopqrstuvwxyz");
		model.addAttribute("quot", "abcdefgh'ijk\"lmnopqrs\"tuvw\"xyz'");
		
		//et:select 테스트용
		// 예제를 위해 StringPair 객체를 사용. 모델 객체 적용 가능
		List<StringPair> sps = new ArrayList<StringPair>();
		sps.add(new StringPair("== 게시판 ==", ""));
		sps.add(new StringPair("일반", "00100001"));
		sps.add(new StringPair("계층형", "00100002"));
		sps.add(new StringPair("1:1문의", "00100003"));
		sps.add(new StringPair("댓글형", "00100004"));
		sps.add(new StringPair("이미지형", "00100005"));
		
		model.addAttribute("search", search);
		model.addAttribute("listOpt1", sps);
		
		return "/test/locator";
	}
	
	@RequestMapping(value = "/sample_list")
	public String sampleList(Model model) throws Exception {
		super.setPageSubTitle("jquery.locator 예제", model);
		
		return "/test/locator";
	}
	
	@RequestMapping(value = "/sample_write")
	public String sampleWrite(Model model) throws Exception {
		super.setPageSubTitle("jquery.locator 예제", model);
		
		return "/test/locator";
	}
	
	@RequestMapping(value = "/sample_proc")
	public String sampleProc(Model model) throws Exception {
		super.setPageSubTitle("jquery.locator 예제", model);
		
		//alertModel 사용예
		AlertModel am = new AlertModel();
		am.setMessage("처리 완료");
		am.setScript("$.Nav('go', './locator', null, null, true);");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * jsonView 테스트 - dispatcher-servlet.xml 설정 참조 
	 * 한글이 깨지지 않도록 처리됨. 메서드 파라미터 객체(여기에서는 SampleSearchVO)도 json에 포함됨.
	 * 페이지 결과 참조
	 * @param vo
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/jsonTest", method = RequestMethod.POST)
	public String jsonTestView(SearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//List<Category> list = (List<Category>)this.sampleService.getSampleDAO().selectList("SampleDAO.selectCategory", search);
		search.setGroupCode("SC15");
		//List<TbBasiccodedVO> list = (List<TbBasiccodedVO>)boardService.getBoardDAO().selectList("TbBasiccoded.selectByExample", search);
		
		//model.addAttribute("list", list);
		return "jsonView";
	}
	
	@RequestMapping(value = "/jsonTest3", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public Object jsonTestView3(@RequestBody String body, String txtPwd, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		String sha256hash = Encrypt.SHA256HashHex(txtPwd);
		logger.debug("txtPwd : {}, hash : {}", txtPwd, sha256hash);
		
		return new Gson().toJson(sha256hash);
	}
	
	
	
	@RequestMapping(value = "/fileUpload")
	public String fileUploadWrite(SearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//model.addAttribute("vo", vo);
		
		return "/test/file_upload";
	}
	
	@RequestMapping(value = "/ajaxForm_result", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public Object ajaxFormResult(SearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		
		return new Gson().toJson(search);
	}
	

	@RequestMapping(value = "/ckeditor")
	public String ckeditor(SearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("CKEditor 테스트", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//model.addAttribute("vo", vo);
		
		return "/test/ckeditor";
	}
	
	@RequestMapping(value = "/load_flash")
	public String loadFlash(SearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("플래시 로딩 테스트", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		return "/test/load_flash";
	}
	
	
	@RequestMapping(value = "/bxSlider")
	public String bxSlider(SearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("bxSlider 테스트", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		return "/test/bxSlider";
	}
}
