package com.tagosolution.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.util.MailUtil;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.FormInfoVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.FormValueVO;
import com.tagosolution.service.model.FormWritingVO;
import com.tagosolution.service.model.MailTmplVO;
import com.tagosolution.service.model.search.FormmailSearchVO;



@Service("formmailService")
public class FormmailServiceImpl extends BaseServiceImpl {
	private static final Logger logger = LoggerFactory.getLogger(FormmailServiceImpl.class);
	
	@Autowired
	UploadFile _upload;
	
	@Autowired
	MailUtil _mailUtil;
	
	/**
	 * 폼메일생성 - 등록 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertFormmail(FormVO vo) throws Exception {
		super.getDAO().insert("form.merge", vo);
		return vo.getFormSeq();
	}
	
	/**
	 * 폼메일생성 - 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deleteFormmail(FormmailSearchVO search) throws Exception {
		super.getDAO().delete("form.deleteByKey", search.getFseq());
		super.getDAO().delete("formInfo.deleteByFormSeq", search.getFseq());
		
		//이미지파일 존재하면 삭제
		search.setTableName("formmail");
		List<FileVO> oldFileList =  (List<FileVO>) super.getDAO().selectList("file.selectByMasterSeq", search);
		if (!oldFileList.isEmpty()) {
			for (FileVO f : oldFileList) {
				File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + f.getSaveFilename()));
				if (oldFile.exists()) {
					oldFile.delete();
				}
				super.getDAO().delete("file.deleteByKey", f.getFileSeq());
			}
		}
	}
	
	/**
	 * 폼메일생성 - 항목 순서 변경
	 * @param vo1
	 * @param vo2
	 * @throws Exception
	 */
	public void updateOrdering(FormInfoVO vo1, FormInfoVO vo2) throws Exception {
		short iOrder1 = vo1.getOrdering();
		short iOrder2 = vo2.getOrdering();
		vo1.setOrdering(iOrder2);
		vo2.setOrdering(iOrder1);
		super.getDAO().update("formInfo.updateOrdering", vo1);
		super.getDAO().update("formInfo.updateOrdering", vo2);
		
	}
	
	/**
	 * 폼메일항목 목록 - 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deleteFormInfo(FormmailSearchVO search) throws Exception {
		super.getDAO().delete("formInfo.deleteByKey", search.getFiseq());
		
		//이미지파일 존재하면 삭제
		search.setTableName("formmail");
		search.setRefSeq(String.valueOf(search.getFiseq()));
		FileVO oldFileVO = (FileVO) super.getDAO().selectOne("file.selectByRefSeq", search);
		if (oldFileVO != null) {
			File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + oldFileVO.getSaveFilename()));
			if (oldFile.exists()) {
				oldFile.delete();
			}
			super.getDAO().delete("file.deleteByKey", oldFileVO.getFileSeq());
		}
	}
	
	/**
	 * 폼메일항목 추가 - 등록 수정
	 * @param search
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertFormInfo(FormmailSearchVO search, FormInfoVO vo) throws Exception {
		super.getDAO().insert("formInfo.merge", vo);
		
		FileVO oldFileVO =  (FileVO) super.getDAO().selectByKey("file.selectByKey", search.getFileSeq());
		
		List<BaseFileVO> bfs = _upload.saveFiles(search.getFormImg(), search.getDeleteFlag(), getConfig().getUploadPathImage() + "/formmail");
		//logger.debug("파일 : {}", new Gson().toJson(bfs));
			for (BaseFileVO b : bfs) {
				if (b.isDeleted())
					super.getDAO().delete("file.deleteByKey", search.getFileSeq());
				if (b.getSize() == 0)
					continue;
				
				FileVO f = new FileVO();
				f.setFileSeq(search.getFileSeq());
				f.setTableName("formmail");
				f.setMimeType(b.getContentType());
				f.setOriginalFilename(b.getFileName());
				f.setFileName(b.getPhysicalName());
				f.setFileSize(StringUtil.getFileSize(b.getSize()));
				f.setRefSeq((long)vo.getFormInfoSeq());
				f.setFileSize(StringUtil.getFileSize(b.getSize()));
				f.setRefUserId(search.getUser());
				f.setOrdering(vo.getOrdering());
				f.setUploadTypeFixedCode("004002");
				f.setMasterSeq(vo.getFormSeq()); 
				
				if (StringUtil.isEmpty(b.getServerSubPath())) {
					f.setSaveFilename("/" + b.getPhysicalName());
				} else {
					f.setSaveFilename(b.getServerSubPath() + "/" + b.getPhysicalName());
				}
				//logger.debug("이전파일 : {}", new Gson().toJson(oldFileVO));
				//logger.debug("생성파일 : {}", new Gson().toJson(f));
				super.getDAO().insert("file.merge", f);
				
				//기존이미지가 존재할때 새로운 이미지 업로드시 기존 이미지 삭제
				if (oldFileVO != null) {
					File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + oldFileVO.getSaveFilename()));
					if (oldFile.exists()) {
						if (!oldFileVO.getOriginalFilename().equals(f.getOriginalFilename()))
							oldFile.delete();
					}
				}
			} 
		return vo.getFormInfoSeq();
	}
	
	/**
	 * 폼메일관리 - 보기 수정, 메일답변
	 * @param search
	 * @param vo
	 * @throws Exception
	 */
	public void updateFormSend(FormmailSearchVO search, FormWritingVO vo) throws Exception {
		vo.setFormWritingSeq(search.getFwseq());
		
		if (search.getAnswerYn().equals("Y")) {

			try {
				String sDate = StringUtil.getDateToString("yyyy-MM-dd");
				MailTmplVO mail = (MailTmplVO) super.getDAO().selectByKey("memberMail.selectByKey", search.getMailseq());
				logger.debug("값 : {}", new Gson().toJson(mail));
				vo.setProcess("C");
				String sSubject = "답변 입니다.";
				String sBody = mail.getBody();
				//sBody = sBody.replaceAll("#\\|writebody\\|", vo.getWritebody());
				sBody = sBody.replaceAll("#\\|message\\|", vo.getBody());
				sBody = sBody.replaceAll("#\\|date\\|", sDate);
				
				this._mailUtil.send(vo.getUserEmail(), sSubject, sBody);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		//logger.debug("브이오 : {}", new Gson().toJson(vo));
		
		super.getDAO().update("formWriting.updateBySelective", vo);
		
	}
	
	/**
	 * 모듈에서 작성된 폼메일
	 * @param search
	 * @param vo
	 * @throws Exception
	 */
	public void insertFormValue(FormmailSearchVO search, FormValueVO vo) throws Exception {
		List<FormInfoVO> list = (List<FormInfoVO>) super.getDAO().selectList("formInfo.selectByForm", search.getFseq());
		FormVO form = (FormVO) super.getDAO().selectByKey("form.selectByKey", search.getFseq());
		int iNum =  (int) super.getDAO().selectOne("formWriting.totalCount", search);
		
		//logger.debug("폼 : {}", new Gson().toJson(form));
		//logger.debug("폼2 : {}", iNum);
		
		//작성폼메일 추가
		FormWritingVO w = new FormWritingVO();
		w.setFormSeq(search.getFseq());
		w.setRegUser(search.getUser());
		w.setSubject(form.getFormName() + (iNum + 1));
		super.getDAO().insert("formWriting.merge", w);
		
		//logger.debug("폼 : {}", new Gson().toJson(w));
		
		int iRadio = 0;
		int iCheck = 0;
		int iSelect = 0;
		int iName = 0;
		int iPhone = 0;
		int iEmail = 0;
		int iAddr = 0;
		FormValueVO vo2 = new FormValueVO();
		vo2.setFormWritingSeq(w.getFormWritingSeq());
		for (FormInfoVO f : list) {
			if (f.getProperty().equals("text")) {
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				
				if (!vo.getTextValue().isEmpty()) {
					//리스트에 텍스트값을 항목 개수 만큼 잘라내 항목내용 테이블에 추가 
					String[] arr = new String[f.getDetailCount()];
					for (int i = 0;  i < f.getDetailCount(); i++)
						arr[i] = vo.getTextValue().get(i).toString();
					vo2.setFormInfoValue(StringUtils.join(arr, "¤"));
					super.getDAO().insert("formValue.insertSelective", vo2);
					//추가된 항목내용 삭제 처리
					for (int i = 0; i < f.getDetailCount(); i++)
						vo.getTextValue().remove(0);
				} else {
					vo2.setFormInfoValue("");
					super.getDAO().insert("formValue.insertSelective", vo2);
				}
				
				//logger.debug("구성된 text 폼 : {}", new Gson().toJson(vo2));
				
			} else if (f.getProperty().equals("radio")) {
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				
				if (!vo.getRadioValue().isEmpty() && vo.getRadioValue().size() > iRadio)
					vo2.setFormInfoValue(vo.getRadioValue().get(iRadio).toString());
				else
					vo2.setFormInfoValue("");
				
				super.getDAO().insert("formValue.insertSelective", vo2);
				iRadio++;
				//logger.debug("구성된 radio 폼 : {}", new Gson().toJson(vo2));
				
			} else if (f.getProperty().equals("textarea")) {
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				
				if (!vo.getTextareaValue().isEmpty()) {
					//리스트에 텍스트영역값을 항목 개수 만큼 잘라내 항목내용 테이블에 추가
					String[] arr = new String[f.getDetailCount()];
					for (int i = 0;  i < f.getDetailCount(); i++)
						arr[i] = vo.getTextareaValue().get(i).toString();
					vo2.setFormInfoValue(StringUtils.join(arr, "¤"));
					
					super.getDAO().insert("formValue.insertSelective", vo2);
					//추가된 항목내용 삭제 처리
					for (int i = 0; i < f.getDetailCount(); i++)
						vo.getTextareaValue().remove(0);
				} else {
					vo2.setFormInfoValue("");
					super.getDAO().insert("formValue.insertSelective", vo2);
				}
				//logger.debug("구성된 textarea 폼 : {}", new Gson().toJson(vo2));

			} else if (f.getProperty().equals("pdate")) {
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				if (!vo.getDateValue().isEmpty()) {
					String[] arr = new String[f.getDetailCount()];
					for (int i = 0;  i < f.getDetailCount(); i++) 
						arr[i] = vo.getDateValue().get(i).toString();
					vo2.setFormInfoValue(StringUtils.join(arr, "¤"));
					
					super.getDAO().insert("formValue.insertSelective", vo2);
					
					for (int i = 0; i < f.getDetailCount(); i++)
						vo.getDateValue().remove(0);
				} else {
					vo2.setFormInfoValue("");
					super.getDAO().insert("formValue.insertSelective", vo2);
				}
				//logger.debug("구성된 date 폼 : {}", new Gson().toJson(vo2));

			} else if (f.getProperty().equals("checkbox")) {
				vo2.setFormInfoName(f.getFormInfoName());
				vo2.setProperty(f.getProperty());
				
				if (!vo.getCheckboxValue().isEmpty()) {
					String[] arr = new String[vo.getChkCount().get(iCheck)];
					for (int i = 0;  i < vo.getChkCount().get(iCheck); i++)
						arr[i] = vo.getCheckboxValue().get(i).toString();
					vo2.setFormInfoValue(StringUtils.join(arr, ','));
				} else {
					vo2.setFormInfoValue("");
				}
				super.getDAO().insert("formValue.insertSelective", vo2);
				
				for (int i = 0; i < vo.getChkCount().get(iCheck); i++)
					vo.getCheckboxValue().remove(0);
				iCheck++;
				//logger.debug("구성된 checkbox 폼 : {}", new Gson().toJson(vo2));

			} else if (f.getProperty().equals("select")) {
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				
				if (vo.getSelectValue().isEmpty())
					vo2.setFormInfoValue("");
				vo2.setFormInfoValue(vo.getSelectValue().get(iSelect).toString());
				super.getDAO().insert("formValue.insertSelective", vo2);
				iSelect++;
				//logger.debug("구성된 select 폼 : {}", new Gson().toJson(vo2));

			} else if (f.getProperty().equals("name")) {
				
				if (!vo.getNameValue().isEmpty() && vo.getNameValue().size() > iName)
					vo2.setFormInfoValue(vo.getNameValue().get(iName).toString());
				
				else
					vo2.setFormInfoValue("");
				
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				super.getDAO().insert("formValue.insertSelective", vo2);
				iName++;
				//logger.debug("구성된 이름 폼 : {}", new Gson().toJson(vo2));

			} else if (f.getProperty().equals("phone")) {

				if (!vo.getPhoneValue().isEmpty() && vo.getPhoneValue().size() > iPhone)
					vo2.setFormInfoValue(vo.getPhoneValue().get(iPhone).toString());
				
				else
					vo2.setFormInfoValue("");
				
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				super.getDAO().insert("formValue.insertSelective", vo2);
				iPhone++;
				//logger.debug("구성된 전화번호 폼 : {}", new Gson().toJson(vo2));

			} else if (f.getProperty().equals("email")) {
				
				if (!vo.getEmailValue().isEmpty() && vo.getEmailValue().size() > iEmail)
					vo2.setFormInfoValue(vo.getEmailValue().get(iEmail).toString());
				else
					vo2.setFormInfoValue("");
				
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				super.getDAO().insert("formValue.insertSelective", vo2);
				iEmail++;
				//logger.debug("구성된 이메일 폼 : {}", new Gson().toJson(vo2));
				
			} else if (f.getProperty().equals("address")) {
				
				if (!vo.getAddressValue().isEmpty() && vo.getAddressValue().size() > iAddr)
					vo2.setFormInfoValue(vo.getAddressValue().get(iAddr).toString());
				else
					vo2.setFormInfoValue("");
				
				vo2.setProperty(f.getProperty());
				vo2.setFormInfoName(f.getFormInfoName());
				super.getDAO().insert("formValue.insertSelective", vo2);
				iAddr++;
				//logger.debug("구성된 주소 폼 : {}", new Gson().toJson(vo2));
				
			}
		}
		List<BaseFileVO> bfs = _upload.saveFiles(vo.getFileValue(), null, getConfig().getUploadPathImage() + "/writeForm");
		//logger.debug("파일 : {}", new Gson().toJson(bfs));
		if(bfs != null){
			for (BaseFileVO b : bfs) {
				if (b.getSize() == 0)
					continue;
				FileVO f = new FileVO();
				f.setTableName("writeForm");
				f.setMimeType(b.getContentType());
				f.setOriginalFilename(b.getFileName());
				f.setFileName(b.getPhysicalName());
				f.setFileSize(StringUtil.getFileSize(b.getSize()));
				f.setRefSeq((long)w.getFormWritingSeq());
				f.setFileSize(StringUtil.getFileSize(b.getSize()));
				f.setRefUserId(search.getUser());
				f.setOrdering((short)0);
				f.setUploadTypeFixedCode("004001");
				f.setMasterSeq(0); 
				
				if (StringUtil.isEmpty(b.getServerSubPath())) {
					f.setSaveFilename("/" + b.getPhysicalName());
				} else {
					f.setSaveFilename(b.getServerSubPath() + "/" + b.getPhysicalName());
				}
				//logger.debug("이전파일 : {}", new Gson().toJson(oldFileVO));
				//logger.debug("생성파일 : {}", new Gson().toJson(f));
				super.getDAO().insert("file.merge", f);
			}
	}
	}
	
	/**
	 * 폼메일관리 - 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deleteWriteForm(FormmailSearchVO search) throws Exception {
		super.getDAO().delete("formWriting.deleteByKey", search.getFwseq());
		super.getDAO().delete("formValue.deleteByWriting", search.getFwseq());
		
		//이미지파일 존재하면 삭제
		search.setTableName("writeForm");
		search.setRefSeq(String.valueOf(search.getFwseq()));
		List<FileVO> oldFileList =  (List<FileVO>) super.getDAO().selectList("file.selectByRefSeq", search);
		if (!oldFileList.isEmpty()) {
			for (FileVO f : oldFileList) {
				File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + f.getSaveFilename()));
				if (oldFile.exists()) {
					oldFile.delete();
				}
				super.getDAO().delete("file.deleteByKey", f.getFileSeq());
			}
		}
		
	}
	
}
