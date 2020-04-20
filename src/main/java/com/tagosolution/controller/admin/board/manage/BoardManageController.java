package com.tagosolution.controller.admin.board.manage;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.Util;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.BoardCategoryVO;
import com.tagosolution.service.model.CommentVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.GroupVO;
import com.tagosolution.service.model.MemberGradeVO;
import com.tagosolution.service.model.search.BoardSearchVO;

/**
 * 게시판관리 > 게시판관리 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/board/manage")
public class BoardManageController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardManageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BoardServiceImpl _boardService;
	
	/**
	 * 게시판관리 > 게시판관리 - 목록 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_list")
	public String boardManageBoardList(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판관리  &gt; 게시판관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		//게시판 그룹
		search.setGroupType("B");
		List<GroupVO> listGroup = (List<GroupVO>) _gDao.selectList("group.selectList", search);

		List<BoardMasterVO> list = (List<BoardMasterVO>) _gDao.selectBySearch("boardMaster.selectList", search);
		
		model.addAttribute("listGroup", listGroup);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/board_list";
	}
	
	/**
	 * 게시판관리 > 게시판관리 - 등록/수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_write")
	public String boardManageBoardWrite(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판관리  &gt; 게시판관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		//상세 한 건
		BoardMasterVO vo = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		search.setStatus("i");
		if (vo != null)
			search.setStatus("u");
		
		//게시판 그룹
		search.setGroupType("B");
		List<GroupVO> listGroup =  (List<GroupVO>) _gDao.selectList("group.selectList", search);
		
		//회원등급
		List<MemberGradeVO> listGrade =  (List<MemberGradeVO>) _gDao.selectList("memberGrade.selectList", search);
		
		//작성자 표시 형식
		List<FixedCodeVO> writerFormats = (List<FixedCodeVO>) _gDao.selectList("fixedCode.selectByGroup", "002");
		
		//날짜 형식
		List<String> dateFormats = Util.getDateFormats();
		
		//관리자 목록 - json
		List<AdminVO> listAdmin = (List<AdminVO>) _gDao.selectList("admin.selectListForAjax", null);
		
		//게시판 형식 코드
		List<FixedCodeVO> listBoardType = (List<FixedCodeVO>) _gDao.selectList("fixedCode.selectByGroup", "001");
		
		model.addAttribute("listBoardType", listBoardType);
		model.addAttribute("listAdmin", new Gson().toJson(listAdmin));
		model.addAttribute("dateFormats", dateFormats);
		model.addAttribute("writerFormats", writerFormats);
		model.addAttribute("listGroup", listGroup);
		model.addAttribute("listGrade", listGrade);
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/board_write";
	}
	
	/**
	 * 게시판 관리 > 게시판 관리 - 게시판 마스터 저장 처리
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_proc")
	public String boardManageBoardProc(BoardMasterVO vo, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		String sStatus = "저장";

		try {
			
			if (search.getStatus().toLowerCase().equals("d")) {
				//TODO : 게시판 마스터 삭제
				sStatus = "삭제";
			}
			else {
				vo.setRegUser(super.getAdminSession().getAdminId());
				vo.setModUser(super.getAdminSession().getAdminId());
				
				//TODO : 개발 스킵
				vo.setMovieUploadCount((short) 0);
				vo.setPointView(0);
				vo.setPointWrite(0);
				vo.setPointReply(0);
				vo.setPointRecomm(0);
				vo.setPointDownload(0);
				//vo.setPointComment(0);
				
				_boardService.insertBoardMaster(search, vo);
			}
			
			am.setMessage(sStatus + "되었습니다.");
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './board_list', {bcode:''});");
		//am.setScript("$.Nav('go', './board_write', {bcode:'" + vo.getBoardCode() + "'});");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * ajax - 게시판 코드 중복 검사
	 *	- 게시판 코드가 있으면 result: id, 없으면 result: null 	
	 * @param body
	 * @param idType
	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/check_board_code", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxCheckBoardCode(@RequestBody(required = false) String body, String id, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		BoardSearchVO search = new BoardSearchVO();
		search.setId(id);
		int iCount = (int) _gDao.selectOne("boardMaster.totalCount", search);
		
		if (iCount > 0)
			map.put("result", id);	
		else
			map.put("result", null);
		
		return new Gson().toJson(map);
	}
	
	
	
	/**
	 * 게시판관리 > 게시판관리 - 게시판 그룹관리 팝업 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_group_popup")
	public String boardManageBoardGroupPopup(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판 그룹관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setGroupType("B");
		List<GroupVO> list = (List<GroupVO>) _gDao.selectList("group.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/board_group_popup";
	}
	
	/**
	 * 게시판관리 > 게시판관리 - 게시판 그룹관리 등록/수정 팝업 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_group_write")
	public String boardManageBoardGroupWrite(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판 그룹관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		GroupVO vo = (GroupVO) _gDao.selectByKey("group.selectByKey", search.getGseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/board_group_write";
	}
	
	/**
	 * 게시판관리 > 게시판관리 - 게시판 그룹관리 등록/수정 - 처리
	 * 	- 부모 페이지 게시판 그룹 셀렉트 박스 업데이트 포함
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_group_proc")
	public String boardManageBoardGroupProc(GroupVO vo, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		vo.setGroupType("B");
		AlertModel am = new AlertModel();
		String sStatus = "저장";	

		try {
			if (search.getStatus().toLowerCase().equals("d")) {
				_boardService.deleteBoardGroup(search);
				sStatus = "삭제";
			}
			else
				_gDao.insert("group.merge", vo);
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		am.setScript("if (opener == null) {alert('부모 페이지가 없어 상태값을 업데이트할 수 없습니다.');} else { opener.updateGroup(); $.Nav('go', './board_group_popup', {gseq: ''});}");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	/**
	 * ajax - 게시판 그룹 목록 
	 * @param body
	 * @param id
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
		search.setGroupType("B");
		List<GroupVO> list =  (List<GroupVO>) _gDao.selectList("group.selectList", search);
		
		map.put("result", list);	
		//{"result": groupVO}
		return new Gson().toJson(map);
	}
	
	
	/**
	 * 게시판관리 > 게시판관리 - 게시판 카테고리 팝업 - 목록 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_category_popup")
	public String boardManageBoardCategoryPopup(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("카테고리 관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		
		List<BoardCategoryVO> list = (List<BoardCategoryVO>) _gDao.selectList("boardCategory.selectListByBoardCode", search.getBcode());
		
		model.addAttribute("bm", bm);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/board_category_popup";
	}
	
	/**
	 * 게시판관리 > 게시판관리 - 게시판 카테고리 팝업 - 등록/수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_category_write")
	public String boardManageBoardCategoryWrite(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("카테고리 관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		
		BoardCategoryVO vo = (BoardCategoryVO) _gDao.selectByKey("boardCategory.selectByKey", search.getBcseq());
		search.setStatus("i");
		if (vo != null)
			search.setStatus("u");
		
		model.addAttribute("bm", bm);
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/board_category_write";
	}
	
	/**
	 * 게시판관리 > 게시판관리 - 게시판 카테고리 팝업 - 처리
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board_category_proc")
	public String boardManageBoardCategoryProc(BoardCategoryVO vo, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();
		
		try {
			String sStatus = "저장";
			if (search.getStatus().toLowerCase().equals("d")) {
				search.setBcseq(vo.getBcSeq());
				_boardService.deleteBoardCategory(search);
				sStatus = "삭제";
			}
			else
				_gDao.insert("boardCategory.merge", vo);
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}

		am.setScript("if (opener == null) {alert('부모 페이지가 없어 상태값을 업데이트할 수 없습니다.');} else { opener.updateCategory(); $.Nav('go', './board_category_popup', {bcseq: '', bcode: '" + vo.getBoardCode() + "'});}");
		model.addAttribute("alert", am);
		
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * ajax - 게시판 카테고리 셀렉트 박스 업데이트용 json
	 * @param body
	 * @param bcode
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/update_category", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxUpdateCategory(@RequestBody(required = false) String body, String bcode, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardCategoryVO> list =  (List<BoardCategoryVO>) _gDao.selectList("boardCategory.selectListByBoardCode", bcode);
		
		map.put("result", list);	
		return new Gson().toJson(map);
	}
	
	/**
	 * 게시판관리 > 게시판관리 - 목록 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/article_list")
	public String boardManageArticleList(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판관리  &gt; 게시판물 통합관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<BoardInfoVO> list = (List<BoardInfoVO>) _gDao.selectBySearch("boardInfo.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/article_list";
	}

	/**
	 * 게시판관리 > 게시판관리 - 통계 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/statistics_boards")
	public String boardStatistics(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		List<BoardMasterVO> bmList = (List<BoardMasterVO>) _gDao.selectList("boardMaster.selectTotalList", null);

		//해당년도에서 5개만 출력
		List<StringPair> type2s = new ArrayList<StringPair>();
		for (int i = 0; i < 5; i++) {
			String sYear = String.valueOf(Calendar.getInstance().get(Calendar.YEAR) - i);
			type2s.add(new StringPair(sYear, sYear));
		}

		if (search.getType3().length() == 1) {
			search.setType3("0"+search.getType3());
		}
		
		Map<String, String> countMap = (Map<String, String>) _gDao.selectByKey("boardInfo.selectStatistics", search);
		
		model.addAttribute("countMap", countMap);
		model.addAttribute("type2s", type2s);
		model.addAttribute("bmList", bmList);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/statistics_board";
	}
	
	
	/**
	 * 게시판관리 > 게시판관리 - 목록 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_list")
	public String boardManageCommentList(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판관리  &gt; 게시판관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<CommentVO> list = (List<CommentVO>) _gDao.selectBySearch("boardComment.selectList", search);
		List<BoardMasterVO> bmList = (List<BoardMasterVO>) _gDao.selectList("boardMaster.selectTotalList", null);
		model.addAttribute("list", list);
		model.addAttribute("bmList", bmList);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/comment_list";
	}
	
	@RequestMapping(value = "/comment_write")
	public String boardManageCommentWrite(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("게시판 그룹관리", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		CommentVO vo = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", search.getBseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/manage/comment_write";
	}
	
	
	@RequestMapping(value = "/comment_proc")
	public String boardManageBoardCommentProc(CommentVO vo, BoardSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		int infectedRows = 0; 
		try {
			if (search.getStatus().toLowerCase().equals("d")) {
				
				if(vo.getCommentSeq() != null)
					infectedRows = _gDao.delete("boardComment.delete", vo);
				else{
					for(Long seq : search.getBseqs()){
						CommentVO voc = new CommentVO();
						voc.setCommentSeq(seq);
						infectedRows += _gDao.delete("boardComment.delete", voc);
					}
				}
				logger.info("infected Rows {}", infectedRows);
			}
			else{
				vo.setRegUser(super.getAdminSession().getAdminId());
				vo.setIpAddr(request.getRemoteAddr());
				vo.setDisplayYn("Y");
				_gDao.insert("boardComment.merge", vo);
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		if(search.getStatus().toLowerCase().equals("d")){
			am.setScript("$.Nav('go', './comment_list', {bseq:''});");
		}else if(search.getStatus().toLowerCase().equals("u")){
			am.setScript("$.Nav('go', './comment_list', {});");
		}else
			am.setScript("$.Nav('go', '../write/"+ vo.getBoardCode() +"', {bseq:'" + vo.getBoardSeq() + "'});");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	/**
	 * 게시물 - 답글 등록/수정 처리
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_stat.do")
	public String boardReplyProc(BoardSearchVO search, CommentVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		try {
			logger.info("ID+ " + vo.getCommentSeq() );
			_gDao.update("boardComment.updateByFixedKey", vo);
			am.setMessage("저장되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', './comment_list', {bseq : ''});");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}	
}
