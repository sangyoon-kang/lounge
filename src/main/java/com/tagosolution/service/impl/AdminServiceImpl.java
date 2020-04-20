package com.tagosolution.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.service.AdminService;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.search.MemberSearchVO;


@Service("adminService")
public class AdminServiceImpl extends BaseServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	UploadFile _upload;
	
	/**
	 * 트랜잭션 테스트
	 * @param adminVo
	 * @return
	 */
	public int insertAdmin(boolean commit) throws Exception {
		
		AdminVO vo1 = new AdminVO();
		vo1.setAdminId("test1");
		if (!commit)
			vo1.setAdminId("test11");
		vo1.setAdminName("테스트1");
		vo1.setAdminPwd(Encrypt.SHA256Hash("1234"));
		vo1.setUseYn("Y");
		getDAO().insert("admin.merge", vo1);
		
		
		AdminVO vo2 = new AdminVO();
		vo2.setAdminId("test2");
		if (!commit)
			vo2.setAdminId("test22");
		vo2.setAdminName("테스트2");
		vo2.setAdminPwd(Encrypt.SHA256Hash("1234"));
		vo2.setUseYn("Y");
		getDAO().insert("admin.merge", vo2);
		
		if (!commit)
			throw new Exception("강제 exception");
		
		return 0;
	}
	
	/**
	 * 관리자설정 - 등록, 수정
	 * @param search
	 * @param vo
	 * @throws Exception
	 */
	public void insertAdminInfo(MemberSearchVO search, AdminVO vo) throws Exception {
		
		AdminVO vo2 = (AdminVO) super.getDAO().selectByKey("admin.selectByKey", search.getAid());
		if (vo2 != null && vo2.getIcon() != null) {
			File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + vo2.getIcon()));
			if (oldFile.exists()) {
				oldFile.delete();
			}
		}
		
		List<BaseFileVO> bfs = _upload.saveFiles(vo.getIconfile(), null, getConfig().getUploadPathImage() + "/admin");
		//logger.debug("파일 : {}", new Gson().toJson(bfs));
		for (BaseFileVO b : bfs) {
			if (b.getSize() == 0)
				continue;
			if (StringUtil.isEmpty(b.getServerSubPath())) {
				vo.setIcon("/" + b.getPhysicalName());
			} else {
				vo.setIcon(b.getServerSubPath() + "/" + b.getPhysicalName());
			}
		}
		if(!vo.getPassword().isEmpty())
			vo.setPassword(Encrypt.SHA256Hash(vo.getPassword()));
		
		if (vo.getPhone().equals(""))
			vo.setPhone(null);
		if (vo.getMobile().equals(""))
			vo.setMobile(null);
		super.getDAO().insert("admin.merge", vo);
		
	}
	
	/**
	 * 관리자설정 - 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deleteAdminInfo(MemberSearchVO search) throws Exception {
		AdminVO vo = (AdminVO) super.getDAO().selectByKey("admin.selectByKey", search.getAid());
		if (vo.getIcon() != null) {
			File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + vo.getIcon()));
			if (oldFile.exists()) {
				oldFile.delete();
			}
		}
		super.getDAO().delete("admin.deleteByKey", search.getAid());
	}
	
}
