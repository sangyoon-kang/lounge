package com.tagosolution.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.CommentVO;
import com.tagosolution.service.model.HistoryHitVO;
import com.tagosolution.service.model.HistoryHostVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.search.BoardSearchVO;


/**
 * 
 * @author Munkhtulga
 *
 */
@Service("dashBoardService")
public class DashBoardServiceImpl extends BaseServiceImpl {
	
	

	/**
	 * DashBoard
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")	
	public List<?> getDashBoardPostLastTen() throws Exception {
		List<BoardInfoVO> list = (List<BoardInfoVO>) super.getDAO().selectList("boardInfo.selectDashboardLast", new BoardInfoVO());
		return list;
	}

	/**
	 * DashBoard
	 * @param 
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings("unchecked")
	public List<?> getDashBoardHistoryHostLastTen() throws Exception {
		List<HistoryHostVO> list = (List<HistoryHostVO>) super.getDAO().selectList("historyHost.selectLastTen", new HistoryHostVO());
		return list;
	}

	/**
	 * DashBoard
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")	
	public List<?> getDashBoardMemberLast() throws Exception {
		List<MemberInfoVO> list = (List<MemberInfoVO>) super.getDAO().selectList("memberInfo.selectDashBoardLast", new MemberInfoVO());
		return list;
	}

	/**
	 * DashBoard
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")	
	public List<?> getDashBoardHistoryHitList() throws Exception {
		List<HistoryHitVO> list = (List<HistoryHitVO>) super.getDAO().selectList("historyHit.selectLastTen", new HistoryHitVO());
		return list;
	}

	/**
	 * DashBoard
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")	
	public List<?> getBashBoardLastTen() throws Exception {
		List<BoardInfoVO> list = (List<BoardInfoVO>) super.getDAO().selectList("boardInfo.selectDashboardChart", new BoardInfoVO());
		return list;
	}

	
}
