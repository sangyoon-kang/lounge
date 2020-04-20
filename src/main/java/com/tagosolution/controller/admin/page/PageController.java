package com.tagosolution.controller.admin.page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.PageServiceImpl;
import com.tagosolution.service.model.GroupVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.PageSearchVO;

/**
 * 페이지관리 > 페이지관리 컨트롤러
 * @author kky
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/page")
public class PageController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	PageServiceImpl _pageService;
	
	/**
	 * 페이지관리 - 리스트
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list_pages")
	public String PageList(PageSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("페이지관리 &gt; 페이지관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<PageVO> list = (List<PageVO>) _gDao.selectBySearch("page.selectList", search, "totalCount");
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/page/page_list";
	}
	
	/**
	 * 페이지관리 - 등록 수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page_write/{pageSeq}")
	public String PageWrite(@PathVariable Short pageSeq, PageSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("페이지관리 &gt; 페이지관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		search.setPseq(pageSeq);
		//게시판 그룹
		search.setGroupType("P");
		List<GroupVO> listGroup =  (List<GroupVO>) _gDao.selectList("group.selectList", search);
		
		PageVO vo = (PageVO) _gDao.selectByKey("page.selectByKey", pageSeq);
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		model.addAttribute("listGroup", listGroup);
		
		return super.getConfig().getAdminRoot() + "/page/page_write";
	}
	
	/**
	 * 페이지관리 - 등록 수정 수행
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page_proc")
	public String pageProc(PageVO vo, PageSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		//logger.debug(">>>브이오 : {}", new Gson().toJson(vo));
		AlertModel am = new AlertModel();
		
		vo.setPageSeq(search.getPseq());
		try {
			if (search.getStatus().equals("d")) {
				_pageService.deletePage(search);
			} else {
				vo.setRegUser(super.getAdminSession().getAdminId());
				_pageService.insertPage(vo);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("$.Nav('go', './list_pages', {pseq:'', status:''});");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 페이지관리 > 그룹관리 - 윈도우팝업 리스트
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page_group_popup")
	public String PageGroup(PageSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("페이지 그룹관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		search.setGroupType("P");
		List<GroupVO> list = (List<GroupVO>) _gDao.selectList("group.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/page/page_group_popup";
	}
	
	/**
	 * 페이지관리 > 그룹관리 - 윈도우팝업 등록,수정
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page_group_write")
	public String PageGroupWrite(PageSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("페이지 그룹관리", model);
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		GroupVO vo = (GroupVO) _gDao.selectByKey("group.selectByKey", search.getGseq());
	
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/page/page_group_write";
	}
	
	/**
	 * 페이지관리 > 그룹관리 - 등록수정수행
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page_group_proc")
	public String PageGroupProc(GroupVO vo, PageSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();
		
		vo.setGroupType("P");
		try {
			if (search.getStatus().toLowerCase().equals("d")) {
				_pageService.deletePageGroup(search);
			} else {
				_pageService.insertPageGroup(vo);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		am.setScript("if (opener == null) {alert('부모 페이지가 없어 상태값을 업데이트할 수 없습니다.');} else { opener.updateGroup(); $.Nav('go', './page_group_popup', {gseq: ''});}");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 페이지관리 - 그룹등록 페이지그룹 구성 ajax
	 * @param body
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/update_group", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxUpdateGroup(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		BoardSearchVO search = new BoardSearchVO();
		search.setGroupType("P");
		List<GroupVO> list =  (List<GroupVO>) _gDao.selectList("group.selectList", search);
		
		map.put("result", list);	
		//{"result": groupVO}
		return new Gson().toJson(map);
	}
	
	
}
