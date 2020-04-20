package com.tagosolution.controller.common;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.util.UploadFile;
import com.tagosolution.controller.BaseController;

/**
 * CKEditor 이미지 업로드  컨트롤러
 * 
 * @author wimy
 *
 */
@Controller
public class CkeditorController extends BaseController {
	
	@Autowired
	UploadFile uploadFile;
	
	/**
	 * CKEditor 업로드 
	 * @param request
	 * @param response
	 * @param upload
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/ckeditor_upload", method = RequestMethod.POST)
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> : " +request);
		//request.
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			
			// String fileName = upload.getOriginalFilename();
			// byte[] bytes = upload.getBytes();
			//
			// String sPath = super.getConfig().getUploadPathFile() + super.getConfig().getUploadPathEditor();
			//
			// File dir = new File(sPath);
			// if (dir.isDirectory() && !dir.exists())
			// dir.mkdir();
			//
			// String uploadPath = sPath + "/" + fileName;
			//
			// out = new FileOutputStream(new File(uploadPath));
			// out.write(bytes);
			// String callback = request.getParameter("CKEditorFuncNum");
			//
			// printWriter = response.getWriter();
			// String fileUrl = super.getConfig().getUploadVirtualPath() + "/" + fileName; //url경로
			
			List<MultipartFile> list = new ArrayList<MultipartFile>();
			list.add(upload);
			List<BaseFileVO> bfiles = uploadFile.saveFiles(list, null, super.getConfig().getUploadPathEditor());
			
			String callback = request.getParameter("CKEditorFuncNum");
			String fileUrl = super.getConfig().getUploadPathVirtual() + bfiles.get(0).getFullPathName();
			
			printWriter = response.getWriter();
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
			printWriter.flush();
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
