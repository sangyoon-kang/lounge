package com.tagosolution.controller.admin.config.board;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.config.basic.ConfigBasicController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.RecentBoardVO;
import com.tagosolution.service.model.search.BoardSearchVO;

/**
 * 환경설정 > 게시판 설정 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/board")
public class ConfigBoardController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConfigBoardController.class);
	
	@Resource
	GeneralDAOImpl _gdao;
	
	
	/**
	 * 환경설정 > 게시판 > 게시판 설정 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/manage")
	public String boardManage(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		search.setOrderBy("BOARD_NAME, BOARD_CODE");
		
		List<BoardMasterVO> list = (List<BoardMasterVO>) _gdao.selectBySearch("boardMaster.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/board/manage";
	}

	/**
	 * 환경설정 > 게시판 > 메인게시물 설정 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main_manage")
	public String mainManage(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 메인게시물", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<RecentBoardVO> list = (List<RecentBoardVO>) _gdao.selectBySearch("recentBoard.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
			
		return super.getConfig().getAdminRoot() + "/config/board/main_manage";
	}
	
	/**
	 * 환경설정 > 게시판 > 메인게시물 - 등록/수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main_write")
	public String mainWrite(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 메인게시물", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		//게시판 코드 목록
		search.setOrderBy("BOARD_NAME");
		List<BoardMasterVO> bmList = (List<BoardMasterVO>) _gdao.selectList("boardMaster.selectListForLNB", search);
		
		//메인게시물 한 건
		RecentBoardVO vo = (RecentBoardVO) _gdao.selectByKey("recentBoard.selectByKey", search.getRbseq());
		
		model.addAttribute("bmList", bmList);
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
			
		return super.getConfig().getAdminRoot() + "/config/board/main_write";
	}
	
	/**
	 * 환경설정 > 게시판 > 메인게시물 - 처리
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main_proc", method = RequestMethod.POST)
	public String mainProc(BoardSearchVO search, RecentBoardVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		int iAffectedRows = 0;
		
		try {
			if (search.getStatus().equals("d"))	{
				iAffectedRows = _gdao.delete("recentBoard.deleteByKey", search.getRbseq());
			}
			else {
				vo.setLinkUrl(vo.getLinkUrl().trim());
				
				if (search.getRbseq() > 0)
					vo.setRecentBoardSeq(search.getRbseq());
				iAffectedRows = _gdao.insert("recentBoard.merge", vo);
			}
			
			am.setScript("$.Nav('go', './main_manage', {rbseq: ''});");
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("오류 : " + e.getMessage());
			am.setScript("$.Nav('go', './main_write');");
		}
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 환경설정 > 게시판 > 메인게시물  - 메인게시물 미리보기 팝업
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/preview_recent_board_popup")
	public String mainPreview(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("미리보기 - 메인게시물", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		//logger.debug(">>>>> search : {}", new Gson().toJson(search));
		
		return super.getConfig().getAdminRoot() + "/config/board/preview_recent_board_popup";
	}
	
}
