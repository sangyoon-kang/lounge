package com.tagosolution.controller.admin.config.prd;

import java.util.ArrayList;
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
import com.tagoplus.model.common.StringPair;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.config.basic.ConfigBasicController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.RecentBoardVO;
import com.tagosolution.service.model.RecentPrdVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.PrdSearchVO;

/**
 * 환경설정 > 게시판 설정 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/config/prd")
public class ConfigPrdController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConfigPrdController.class);
	
	@Resource
	GeneralDAOImpl _gdao;
	
	
	/**
	 * 환경설정 > 상품 관리 > 상품 리스트 설정 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/manage")
	public String boardManage(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 상품 관리 &gt; 상품 리스트", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);

		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/config/prd/manage";
	}

	/**
	 * 환경설정 > 상품 > 메인 & 추천 상품 설정 - UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main_manage")
	public String mainManage(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 상품 관리 &gt; 상품 & 추천 상품", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<RecentPrdVO> list = (List<RecentPrdVO>) _gdao.selectBySearch("recentPrd.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);		
		return super.getConfig().getAdminRoot() + "/config/prd/main_manage";
	}
		
	/**
	 * 환경설정 > 상품 관리 > 메인 추천 상품 - 등록/수정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main_write")
	public String mainWrite(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 메인게시물", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<StringPair> type1 = new ArrayList<StringPair>();
		type1.add(new StringPair("최근 등록", "A"));
		type1.add(new StringPair("추천 상품", "B"));
		type1.add(new StringPair("메인 노출", "C"));
				
		//메인게시물 한 건
		RecentPrdVO vo = (RecentPrdVO) _gdao.selectByKey("recentPrd.selectByKey", search.getRpseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("type1", type1);
		model.addAttribute("search", search);			
		return super.getConfig().getAdminRoot() + "/config/prd/main_write";
	}
	
	/**
	 * 환경설정 > 상품관리 > 메인 추천 상품 - 처리
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main_proc")
	public String mainProc(PrdSearchVO search, RecentPrdVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		int iAffectedRows = 0;
		
		try {
			if (search.getStatus().equals("d"))	{
				iAffectedRows = _gdao.delete("recentPrd.deleteByKey", search.getRpseq());
			}
			else {
				vo.setLinkUrl(vo.getLinkUrl().trim());
				
				if (search.getRpseq() > 0)
					vo.setRpSeq(search.getRpseq());
				iAffectedRows = _gdao.insert("recentPrd.merge", vo);
			}
			
			am.setScript("$.Nav('go', './main_manage', {rpseq: ''});");
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
	@RequestMapping(value = "/preview_recent_prd_popup")
	public String mainPreview(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("미리보기 - 상품", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		//logger.debug(">>>>> search : {}", new Gson().toJson(search));
		
		return super.getConfig().getAdminRoot() + "/config/prd/preview_recent_prd_popup";
	}
	
}
