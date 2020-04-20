package com.tagosolution.controller.admin.board.list;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.RSAUtil;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.AdminServiceImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.BoardCategoryVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.BoardSearchVO;

/**
 * 게시판 관리 > 게시물 목록/등록/수정/삭제 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/board")
public class BoardListController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardListController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BoardServiceImpl _boardService;
	
	
	/**
	 * 게시판 관리 > 게시판 목록 - 게시판별 목록 UI
	 * 	- ?? TODO : iframe으로 변경 필요 : 프론트에서 보는 환경과 동일하게 처리
	 * @param search
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/list/{boardCode}")
	public String boardList(@PathVariable String boardCode, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setBcode(boardCode);
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		List<BoardInfoVO> list = (List<BoardInfoVO>) _boardService.getList(search, bm);
		
		super.setPageSubTitle("게시판관리  &gt; " + ((bm != null) ? bm.getBoardName() : ""), model);
		
		model.addAttribute("bm", bm);
		model.addAttribute("list", list);
		model.addAttribute("listBCs", bm.getBoardCategoryVO());
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/list/list";
	}
	
	/**
	 * 게시물 상세 보기
	 *  - ?? TODO : iframe으로 변경 필요 : 프론트에서 보는 환경과 동일하게 처리
	 * @param boardCode
	 * @param bseq
	 * @param search
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/{boardCode}/{bseq}")
	public String boardView(@PathVariable String boardCode, @PathVariable long bseq, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", boardCode);
		super.setPageSubTitle("게시판관리  &gt; " + ((bm != null) ? bm.getBoardName() : ""), model);
		
		search.setBcode(boardCode);
		BoardInfoVO vo = (BoardInfoVO) _gDao.selectByKey("boardInfo.selectByVo", search);
		
		model.addAttribute("bm", bm);
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/list/view";
	}
	
	/**
	 * 게시물 등록/수정 - UI
	 * @param boardCode
	 * @param search
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/write/{boardCode}")
	public String boardWrite(@PathVariable String boardCode, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", boardCode);
		super.setPageSubTitle("게시판관리  &gt; " + ((bm != null) ? bm.getBoardName() : ""), model);
		
		search.setBcode(boardCode);
		BoardInfoVO vo = (BoardInfoVO) _gDao.selectByKey("boardInfo.selectByVo", search);
		if (StringUtil.isEmpty(search.getStatus()))
			search.setStatus("i");
		
		if (vo != null)
			search.setStatus("u");
		
		//답글 등록일 경우
		BoardInfoVO prVO = null;
		if (search.getPrSeq() > 0) {
			search.setStatus("reply");
			prVO = (BoardInfoVO) _gDao.selectOne("board.selectParent", search.getPrSeq());
		}
		
		//logger.debug(">>>>>>>>>>> super.getConfig().getUploadPathEditor() : {}", super.getConfig().getUploadPathEditor());
				
		//첨부 파일 갯수에 따라 생성	
		if (vo != null && vo.getFileVOList().size() < bm.getFileUploadCount()) {

			for (int i = 0; i < bm.getFileUploadCount() - vo.getFileVOList().size(); i++) {
				FileVO fileVo = new FileVO();
				fileVo.setFileSeq(0l);
				vo.getFileVOList().add(fileVo);
			}			
		}		
		
		model.addAttribute("bm", bm);
		model.addAttribute("vo", vo);
		model.addAttribute("prVO", prVO);
		search.setBcode(boardCode);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/list/write";
	}
	
	/**
	 * 게시물 - 등록/수정 처리
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/proc.do")
	public String boardProc(BoardSearchVO search, BoardInfoVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		vo.setBoardSeq(search.getBseq());
		vo.setBoardCode(search.getBcode());
		vo.setIpAddr(request.getRemoteAddr());
		
		try {
			if (search.getStatus().equals("d"))
				_boardService.delete(search);
			else {
				if (StringUtil.isEmpty(vo.getUserName())) {
					vo.setUserName(super.getAdminSession().getAdminName());
				}
				vo.setNickname(super.getAdminSession().getNickname());
				
				if (StringUtil.isEmpty(vo.getRegUser()))	{
					vo.setRegUser(super.getAdminSession().getAdminId());
				}
				
				if (StringUtil.isEmpty(vo.getModUser()))	{
					vo.setModUser(super.getAdminSession().getAdminId());
				}
 				_boardService.insert(search, vo);
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("오류 : " + e.getMessage());
		}
		
		if (!StringUtil.isEmpty(search.getBcode())) {
			am.setScript("$.Nav('go', './list/" + search.getBcode() + "', {bseq : '', status: ''});");
		} else {
			am.setScript("$.Nav('go', './manage/article_list', {bseq : '', status: ''});");
		}
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
		
	
	/**
	 * 게시판관리 - 게시판 목록 - 선택된 게시판이 카테고리 이동 또는 복사 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/board_toCategory_proc")
	public String boardToCategoryProc (BoardSearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		String sUser = super.getAdminSession().getUserID();
		String sIpAddr = 	request.getRemoteAddr();
		
		try {
			_boardService.updateBoardInfo(search, sUser, sIpAddr);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		
		/*am.setScript("opener.parent.location=$.Nav('go', '../list/" + search.getBcode() + "', null, true); self.close();");*/
		am.setScript("opener.parent.location.reload(); self.close();");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();		
	}	
}
