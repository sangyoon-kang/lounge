package com.tagosolution.controller.admin.board.quick;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagosolution.service.util.ListUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.QuickAskServiceImpl;
import com.tagosolution.service.model.QuickConsultVO;
import com.tagosolution.service.model.search.QuickConsultSearchVO;

/**
 * Quick Ask Controller
 * 
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/board")
public class QuickAskController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(QuickAskController.class);

	@Resource
	GeneralDAOImpl _gDao;

	@Resource
	QuickAskServiceImpl _quickService;

	/**
	 * List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quick_list")
	public String quicklist(QuickConsultSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		List<QuickConsultVO> list = (List<QuickConsultVO>) _gDao.selectBySearch("quickCon.selectList", search);

		model.addAttribute("type1s", ListUtil.typeQuickAsk());
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/quick/list";
	}

	/**
	 * Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quick_proc.do")
	public String quickproc(QuickConsultSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		try {
			if (search.getStatus().toLowerCase().equals("d")) {
				_quickService.deleteQuickAsk(search);
				am.setMessage("삭제");
			} else {
				search.setModUser(super.getAdminSession().getAdminId());
				_quickService.insertQuickAsk(search);
				am.setMessage("삭제");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("오류 : " + e.getMessage());
		}
		am.setScript("$.Nav('go', './quick_list', {Idx:''});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}

	/**
	 * Detail
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quick_write")
	public String quickwrite(QuickConsultSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		QuickConsultVO vo = (QuickConsultVO) _gDao.selectByKey("quickCon.selectByKey", search);

		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/board/quick/write";
	}

}
