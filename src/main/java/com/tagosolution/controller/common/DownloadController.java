package com.tagosolution.controller.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tagoplus.controller.ParentController;
import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;

/**
 * 파일 다운로드 컨트롤러
 * 
 * @author wimy
 *
 */
@Controller
public class DownloadController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);
	
	/**
	 * 브라우저 이름 가져오기
	 * @param request
	 * @return
	 */
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		String sRtn = "FireFox";
		
		if (header.contains("MSIE"))
			sRtn = "MSIE";
		else if (header.contains("Chrome"))
			sRtn = "Chrome";
		else if (header.contains("Opera"))
			sRtn = "Opera";
		
		return sRtn;
	}
	
	/**
	 * 스트림 파일 다운로드
	 * 
	 * @param filename : 하위 경로(DB 컬럼값)를 포함한 다운로드할 파일 URL (서버측 파일)
	 * @param originalName : 원본 파일명 (클라이언트가 다운로드 받을 파일명)
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/download.do")
	public String fileDownload(@RequestParam(required = true) String fileName, String originalName, String filePath, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String uploadPath = super.getConfig().getUploadPathPhysical();
		//String sPath = filename.substring(0, filename.lastIndexOf("/"));
		String sFilename = fileName.substring(fileName.lastIndexOf("/") + 1); 
		
		filePath = filePath.replaceFirst(super.getConfig().getUploadPathVirtual(), "");
		
		//원본 파일명 : 다운로드 요청 브라우저에 보낼 파일명
		if (StringUtils.isEmpty(originalName))
			originalName = sFilename;
		
		//주의 : 브라우저 별 파일명 인코딩이 다름
		String sBrowser = this.getBrowser(request);
		if (sBrowser.equals("MSIE"))
			originalName = java.net.URLEncoder.encode(originalName, "UTF-8").replaceAll("\\+", "%20");
		else
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
		
		//logger.debug(">>>>> originalName : {}", originalName);
		
		BufferedInputStream bis;
		OutputStream output;
		
		try {
			File file = new File(uploadPath + filePath);
			int iFileSize = (int) file.length();
			if (iFileSize > 0) {
				response.setContentType("application/octet-stream");
				response.setContentLength(iFileSize);
				response.setHeader("Content-Transfer-Encoding", "binary");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\"");
				
				int read;
				byte[] bytes = new byte[1024];
				bis = new BufferedInputStream(new FileInputStream(file));
				output = response.getOutputStream();
				
				while ((read = bis.read(bytes, 0, bytes.length)) != -1) {
					output.write(bytes, 0, read);
				}
				
				output.flush();
				output.close();
				bis.close();
				
				return null;
			} else {
				logger.warn("file not exist. filename : {}", fileName);
				AlertModel am = new AlertModel();
				am.setMessage(super.getMessage("common.nofile"));
				am.setScript("history.back();");
				model.addAttribute("alert", am);
				return getConfig().getViewAlert();
			}
		} 
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		} 
		finally {
			output = null;
			bis = null;
		}
	}
	
	/**
	 * 공통 파일 다운로드
	 * 
	 * @param filename
	 *            : 하위 경로(DB 컬럼값)를 포함한 다운로드할 파일 URL
	 * @param originalName
	 *            : 원본 파일명 (클라이언트가 받을 파일명)
	 * @param response
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/common/download")
	public String fileDownload(@RequestParam(required = true) String filename, String originalName, HttpServletResponse response, Model model) throws Exception {
		// EgovFileUploadUtil.downloadFile(response, where, serverSubPath,
		// physicalName, original);
		
		// filename = java.net.URLDecoder.decode(filename, "UTF-8");
		
		String uploadPath = getConfig().getUploadPathVirtual();
		String sPath = filename.substring(0, filename.lastIndexOf("/"));
		String sFilename = filename.substring(filename.lastIndexOf("/") + 1); 
		
		// 한글 파일명 인코딩
		originalName = java.net.URLEncoder.encode(originalName, "UTF-8");
		// 원본 파일명 : 다운로드 요청 브라우저에 보낼 파일명
		if (StringUtils.isEmpty(originalName))
			originalName = sFilename;
		
		BufferedInputStream bis;
		OutputStream output;
		
		try {
			File file = new File(uploadPath + sPath, sFilename);
			int iFileSize = (int) file.length();
			if (iFileSize > 0) {
				response.setContentType("application/unknown");
				response.setContentLength(iFileSize);
				response.setHeader("Content-Transfer-Encoding", "binary");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\"");
				
				int read;
				byte[] bytes = new byte[1024];
				bis = new BufferedInputStream(new FileInputStream(file));
				output = response.getOutputStream();
				
				while ((read = bis.read(bytes, 0, bytes.length)) != -1) {
					output.write(bytes, 0, read);
				}
				
				output.flush();
				output.close();
				bis.close();
				
				return null;
			} else {
				AlertModel am = new AlertModel();
				am.setMessage(super.getMessage("common.nofile"));
				am.setScript("history.back();");
				model.addAttribute("alert", am);
				return getConfig().getViewAlert();
			}
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
			throw ex;
		} finally {
			output = null;
			bis = null;
		}
	}*/
	
}
