package com.tagosolution.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import com.tagosolution.service.model.MemberSettingVO;

/**
 * Member Setting service
 * 
 * @author G.Tenger
 *
 */
@Service("configMemberService")
public class ConfigMemberServiceImpl extends BaseServiceImpl {

	/**
	 * Merge Member Config
	 * 
	 * @param search
	 * @throws Exception
	 */
	public void mergeMemberConfig(MemberSettingVO vo)
			throws Exception {
		if (vo.getMemRegUrl() != null && !vo.getMemRegUrl().isEmpty()) {
			doGet(vo.getMemRegUrl(), "<jsp:include page=\"/module/join\" flush=\"true\" />");
		}
		if (vo.getMemInfoUrl() != null && !vo.getMemInfoUrl().isEmpty()) {
			doGet(vo.getMemInfoUrl(), "<jsp:include page=\"/module/member_edit\" flush=\"true\" />");
		}
		if (vo.getMemLoginUrl() != null && !vo.getMemLoginUrl().isEmpty()) {
			doGet(vo.getMemLoginUrl(), "<jsp:include page=\"/module/login\" flush=\"true\" />");
		}
		if (vo.getMemFindUrl() != null && !vo.getMemFindUrl().isEmpty()) {
			doGet(vo.getMemFindUrl(), "<jsp:include page=\"/module/findidpw\" flush=\"true\" />");
		}
		super.getDAO().insert("memberSetting.merge", vo);
	}

	/**
	 * Update Member Config
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateSns(MemberSettingVO vo) throws Exception {
		super.getDAO().insert("memberSetting.updateByKeySelective", vo);
	}

	protected void doGet(String jspName, String module)
			throws ServletException, IOException {
		File root = new File(getServletContext().getRealPath("/"));
		if(!new File(getServletContext().getRealPath("/"+ jspName)).exists()){
			String main = module;
			write(main, new File(root, jspName));
		}
//		request.getRequestDispatcher(jspName + ".jsp").forward(request, response);
	}

	private static void write(String content, File file) throws IOException {
		BufferedWriter writer = null;
		try {
			writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
			writer.write(content);
		} finally {
			if (writer != null)
				try {
					writer.close();
				} catch (IOException ignore) {
				}
		}
	}
}
