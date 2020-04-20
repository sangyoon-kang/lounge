package com.tagosolution.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tagoplus.util.MailUtil;
import com.tagosolution.service.model.QuickConsultVO;
import com.tagosolution.service.model.search.QuickConsultSearchVO;

/**
 * Quick Ask Detail
 * @author G.Tenger
 *
 */
@Service("quickAskService")
public class QuickAskServiceImpl extends BaseServiceImpl {
	
	@Autowired
	MailUtil _mailUtil;
	
	/**
	 * Delete Quick Ask
	 * @param search
	 * @throws Exception
	 */
	public void deleteQuickAsk(QuickConsultSearchVO search) throws Exception {
		super.getDAO().delete("quickCon.deleteByKey", search);
	}
	
	/**
	 * CRUD Quick Ask
	 * @param vo
	 * @throws Exception
	 */
	public void insertQuickAsk (QuickConsultSearchVO search) throws Exception {
		super.getDAO().update("quickCon.updateByKey", search);
		String sBody = search.getAnswer();
		String sSubject = search.getContent();
		String arr = search.getEmail();
		_mailUtil.send(arr, sSubject, sBody);
	}
	
	/**
	 * Front Request
	 * @param vo
	 * @throws Exception
	 */
	public void requestClientMsg (QuickConsultVO vo) throws Exception {
		super.getDAO().insert("quickCon.merge", vo);
	}
	
	
}
