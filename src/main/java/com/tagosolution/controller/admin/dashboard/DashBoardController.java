package com.tagosolution.controller.admin.dashboard;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.tagoplus.model.common.SearchVO;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.config.sitemeta.SiteMetaController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.DashBoardServiceImpl;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.HistoryHitVO;
import com.tagosolution.service.model.HistoryHostVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.RecentBoardVO;
import com.tagosolution.service.model.CommentVO;;



@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/dashboard")
public class DashBoardController extends BaseController  {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteMetaController.class);
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	DashBoardServiceImpl _dashBoardService; 
	
	
	
	@RequestMapping(value = "/stat_user_list")
	public String statListDashboard(SearchVO search, BindingResult result, Model model) throws Exception {
	
	
		List<BoardInfoVO> listBoardInfoPost  = (List<BoardInfoVO>)  _dashBoardService.getDashBoardPostLastTen();
		List<HistoryHostVO> historyHostList  = (List<HistoryHostVO>) _dashBoardService.getDashBoardHistoryHostLastTen();
		List<MemberInfoVO> listMemberInfo  =  (List<MemberInfoVO>) _dashBoardService.getDashBoardMemberLast();
		List<HistoryHitVO> historyHitList  = (List<HistoryHitVO>) _dashBoardService.getDashBoardHistoryHitList();
		List<BoardInfoVO> listBoardInfo  =  (List<BoardInfoVO>)_dashBoardService.getBashBoardLastTen();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);

		search.setWithdrawalDt(reportDate);
		search.setSubject(reportDate);
		int Leavetoday  =  (int) _gDao.getCountBySearch("memberInfo.selectLeavetoday", search);		
		int LeaveTotal  =  (int) _gDao.getCountBySearch("memberInfo.selectLeaveTotal", search);		
		int jointoday  =  (int) _gDao.getCountBySearch("memberInfo.selectJointoday", search);
		int joinTotal  =  (int) _gDao.getCountBySearch("memberInfo.selectJoinTotal", search);
		
		int selectBulletinBoardsTotal  =  (int) _gDao.getCountBySearch("boardMaster.totalCount", search);
		int boardCommentTotalCount  =  (int) _gDao.getCountBySearch("boardComment.selectCountToday", search);		
		int boardInfoTotalCount  =  (int) _gDao.getCountBySearch("boardInfo.totalCountForDash", search);
		int selectPosttoday  =  (int) _gDao.getCountBySearch("boardInfo.selectPosttoday", search);		
		
		
		
		model.addAttribute("hBoard", new Gson().toJson(listBoardInfo));
		model.addAttribute("hostData", new Gson().toJson(historyHitList));
		
		
		List<HistoryHostVO> hData = historyHostList;
		model.addAttribute("hData", hData);
		model.addAttribute("hBoardInfoPost", listBoardInfoPost);
		model.addAttribute("hMemberInfo", listMemberInfo);
		model.addAttribute("hLeavetoday", Leavetoday);
		model.addAttribute("hjointoday", jointoday);
		model.addAttribute("hLeaveTotal", LeaveTotal);
		model.addAttribute("hjoinTotal", joinTotal);

		model.addAttribute("hboardCommentTotalCount", boardCommentTotalCount);
		model.addAttribute("hboardInfoTotalCount", boardInfoTotalCount);
		model.addAttribute("hselectPosttoday", selectPosttoday);
		model.addAttribute("hselectBulletinBoardsTotal", selectBulletinBoardsTotal);


		
		
		
		
		return super.getConfig().getAdminRoot() + "/dashboard";
		
	}
}
