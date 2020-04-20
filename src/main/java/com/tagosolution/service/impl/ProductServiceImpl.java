package com.tagosolution.service.impl;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.util.ThumbnailUtil;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.controller.admin.prd.manage.PrdManageController;
import com.tagosolution.service.UploadSubDir;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.PrdCategoryVO;
import com.tagosolution.service.model.PrdImageVO;
import com.tagosolution.service.model.PrdSubVO;
import com.tagosolution.service.model.PrdVO;
import com.tagosolution.service.model.search.PrdSearchVO;

@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(PrdManageController.class);
	
	@Autowired
	UploadFile _upload;
	
	public List<PrdCategoryVO> getCategoryList(PrdSearchVO search) throws Exception {
		return (List<PrdCategoryVO>) getDAO().selectList("prdCategory.selectAll", search);
	} 
	
	/*public List<jsTree> getCategoryListByJsTree(PrdSearchVO search) throws Exception {
		List<PrdCategoryVO> list = this.getCategoryList(search);
		List<jsTree> trees = new ArrayList<jsTree>();
		
		for (PrdCategoryVO vo : list) {
			jsTree t = new jsTree();
			t.setId(vo.getCateCode());
			t.setText(vo.getCateName());
			
			if (StringUtil.isEmpty(vo.getpCateCode()))
				t.setParent("#");
			else
				t.setParent(vo.getpCateCode());
			
			t.getLi_attr().put("ordering", vo.getOrdering());
			//t.getLi_attr().put("isLast", vo.getIsLast());
			t.getLi_attr().put("prdCount", vo.getPrdCount());
			trees.add(t);
		}
		return trees;
	}*/
	
/*	public int insertCategory(LinkedHashMap node) throws Exception {
		int iAffectedRows = 0;
		
		String sParent = (String)node.get("parent");
		if (sParent.equals("#"))
			sParent = "";
		String sName = (String)node.get("text"); 
		
		PrdCategoryVO vo = new PrdCategoryVO();
		String sMaxCateSuffix = (String) super.getDAO().selectByKey("prdCategory.selectMaxCode", sParent);
		vo.setCateCode(sParent + sMaxCateSuffix);
		vo.setCateName(sName);
		//vo.setOrdering(vo.getCateCode());
		iAffectedRows = super.getDAO().insert("prdCategory.merge", vo);
		
		return iAffectedRows;
	}
	*/
	/*public int updateCategory(LinkedHashMap node) throws Exception {

		String sType = (String)node.get("type");
		String sCateCode = (String)node.get("id");
		
		int iAffectedRows = 0;
		if (sType.equals("rename")) {
			String sCateName = (String)node.get("text");
			String sOldName = (String)node.get("old");
			String sOrdering = (String)node.get("ordering");
			PrdCategoryVO vo = new PrdCategoryVO();
			vo.setCateCode(sCateCode);
			vo.setCateName(sCateName);
			iAffectedRows = super.getDAO().update("prdCategory.merge", vo);
		}
		else if (sType.equals("order")) {
			
		}
		 
		return iAffectedRows;
	}*/
	
	public int deleteCategory(LinkedHashMap node) throws Exception {
		String sCateCode = (String)node.get("id");
		
		int iAffectedRows = super.getDAO().delete("prdCategory.deleteByKey", sCateCode);
		return iAffectedRows;
	}

	/**
	 * 상품 관리 - 상품 추가 처리 
	 * @param vo
	 * @throws Exception
	 */
	public void insertPrdProc(PrdVO vo, String sUser) throws Exception {		
		Integer iPrdSeq = vo.getPrdSeq();
		
		updatePrdVo(vo, sUser);
		
		//인서트 일때만 seq값 가져옴
		if (iPrdSeq == null || iPrdSeq == 0) {
			iPrdSeq = vo.getPrdSeq();
		}

		for (int i = 0; i < vo.getPrdSubSeqList().size() ; i++) {
			//내용이 있을 시 저장 
			if (vo.getHeaderList().size() > 0 && !StringUtil.isEmpty(vo.getHeaderList().get(i))) {
				PrdSubVO psVo = new PrdSubVO();
				psVo.setPrdSeq(iPrdSeq);
				//리스트 유지(null값이면 리스트 사이즈가 유지하지 못함) 하기 위해 0값을 넣음 - 0이면 null값으로 유지
				if (vo.getPrdSubSeqList().get(i) != 0) {
					psVo.setPrdSubSeq(vo.getPrdSubSeqList().get(i));
				}
				psVo.setHeader(vo.getHeaderList().get(i));
				psVo.setContent(vo.getContentList().get(i));
				super.getDAO().insert("prdSub.merge", psVo);
			
			//내용이 없는데 시퀀스가 있을 시 삭제	
			} else if (vo.getPrdSubSeqList().get(i) != 0) {
				PrdSubVO psVo = new PrdSubVO();
				psVo.setPrdSeq(iPrdSeq);
				psVo.setPrdSubSeq(vo.getPrdSubSeqList().get(i));
				super.getDAO().insert("prdSub.deleteByKey", psVo);
			}
		}

		//사이즈 가져오기위해 셀렉트 - 팝업창 지움
		//PrdVO prdSizeVo = (PrdVO) super.getDAO().selectByKey("prd.selectByKey", iPrdSeq);
		
		//파일 사이즈 저장
		List<Integer> sizeList = new ArrayList<Integer>();
		sizeList.add(vo.getSizeList());
		sizeList.add(vo.getSizeSmall());
		sizeList.add(vo.getSizeDetail());
		sizeList.add(vo.getSizeLarge());
		
		//이미지 파일		
		String sImagePath = super.getConfig().getUploadPathImage() + UploadSubDir.SUB_DIR_PRD;
		List<BaseFileVO> bfs = _upload.saveFiles(vo.getOriginalFileList(), null, sImagePath);
		
		for (int i = 0; i < vo.getPrdImageSeqList().size(); i++) {
			//신규등록시에 원본 파일이 있을 경우 그 수 만큼 저장 하거나 리사이즈 지정시 덮어 씌움
			if (!StringUtil.isEmpty(bfs.get(i).getFileName()) && (vo.getPrdImageSeqList().get(i) == 0 || vo.getPrdImageTypeList().get(i).equals("Y"))) {

				//리사이즈 지정시 기존 파일 삭제
				if (vo.getPrdImageSeqList().get(i) != 0) {
					//기존 파일 삭제용 정보
					PrdImageVO prdImgVo = (PrdImageVO) super.getDAO().selectByKey("prdImage.selectByKey", vo.getPrdImageSeqList().get(i));
					//삭제용 
					List<String> prdImgPath = new  ArrayList<String>();								
					prdImgPath.add(prdImgVo.getSaveFilename());			
					prdImgPath.add(prdImgVo.getListFilename());				
					prdImgPath.add(prdImgVo.getSmallFilename());			
					prdImgPath.add(prdImgVo.getDetailFilename());
					prdImgPath.add(prdImgVo.getLargeFilename());
														
					//파일 삭제
					for (String sPath : prdImgPath) {
						deleteFile(sPath);
					}
				}
				
				//원본 파일
				File file = new File(super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual() + bfs.get(i).getFullPathName()));
				
				//이미지 파일 사이즈 조정
				Map<Integer, String> fileSizeMap = ThumbnailUtil.MakeThumbnail(file, "H", sizeList);
					
				//db저장
				PrdImageVO piVo = new PrdImageVO();
				piVo.setPrdSeq(iPrdSeq);
				
				if (vo.getPrdImageSeqList().get(i) != 0) {
					piVo.setPrdImageSeq(vo.getPrdImageSeqList().get(i));
				}
				
				piVo.setOriginalFilename(bfs.get(i).getFileName());
				piVo.setSaveFilename(bfs.get(i).getFullPathName());
	
				//리사이즈 된 파일 
				for (int iSizeKey : fileSizeMap.keySet()) {
					if (iSizeKey == vo.getSizeList()) {
						piVo.setListFilename(sImagePath + "/" + fileSizeMap.get(iSizeKey));
				
					} else if (iSizeKey == vo.getSizeSmall()) {
						piVo.setSmallFilename(sImagePath + "/" + fileSizeMap.get(iSizeKey));
					
					} else if (iSizeKey == vo.getSizeDetail()) {
						piVo.setDetailFilename(sImagePath + "/" + fileSizeMap.get(iSizeKey));
					
					} else if (iSizeKey == vo.getSizeLarge()) {
						piVo.setLargeFilename(sImagePath + "/" + fileSizeMap.get(iSizeKey));
					}							
				}
	
				super.getDAO().insert("prdImage.merge", piVo);
			
			//수정시 세부 파일만 등록한 경우
			} else if (vo.getPrdImageSeqList().get(i) != 0) {
				//기존 파일 삭제용 정보
				PrdImageVO prdImgVo = (PrdImageVO) super.getDAO().selectByKey("prdImage.selectByKey", vo.getPrdImageSeqList().get(i));
				//삭제용 
				List<String> prdImgPath = new  ArrayList<String>();
				
				//지정 파일 경로 저장
				Map<String, String> filePathMap = new HashMap<String, String>();
				
				//파일 저장
				if (vo.getOriginalFileList().size() > i && !StringUtil.isEmpty(vo.getOriginalFileList().get(i).getOriginalFilename())) {
					List<MultipartFile> originalFileList = new ArrayList<MultipartFile>();
					originalFileList.add(vo.getOriginalFileList().get(i));
					List<BaseFileVO> originalFileBfs = _upload.saveFiles(originalFileList, null, sImagePath);
					//db 저장용 추가
					filePathMap.put("original", originalFileBfs.get(0).getFullPathName());
					//삭제용 추가
					prdImgPath.add(prdImgVo.getSaveFilename());
				}
				
				if (vo.getListFileList().size() > i && !StringUtil.isEmpty(vo.getListFileList().get(i).getOriginalFilename())) {
					List<MultipartFile> listFileList = new ArrayList<MultipartFile>();
					listFileList.add(vo.getListFileList().get(i));
					List<BaseFileVO> listFileBfs = _upload.saveFiles(listFileList, null, sImagePath);
					//db저장 용 추가
					filePathMap.put("list", listFileBfs.get(0).getFullPathName());
					//삭제용 추가
					prdImgPath.add(prdImgVo.getListFilename());
				}
	
				if (vo.getSmallFileList().size() > i && !StringUtil.isEmpty(vo.getSmallFileList().get(i).getOriginalFilename())) {
					List<MultipartFile> smallFileList = new ArrayList<MultipartFile>();
					smallFileList.add(vo.getSmallFileList().get(i));
					List<BaseFileVO> smallFileBfs = _upload.saveFiles(smallFileList, null, sImagePath);
					//db저장 용 추가
					filePathMap.put("small", smallFileBfs.get(0).getFullPathName());
					//삭제용 추가
					prdImgPath.add(prdImgVo.getSmallFilename());
				}
				
				if (vo.getDetailFileList().size() > i && !StringUtil.isEmpty(vo.getDetailFileList().get(i).getOriginalFilename())) {
					List<MultipartFile> detailFileList = new ArrayList<MultipartFile>();
					detailFileList.add(vo.getDetailFileList().get(i));
					List<BaseFileVO> detailFileBfs = _upload.saveFiles(detailFileList, null, sImagePath);
					//db저장 용 추가
					filePathMap.put("detail", detailFileBfs.get(0).getFullPathName());
					//삭제용 추가
					prdImgPath.add(prdImgVo.getDetailFilename());
				}
				
				if (vo.getLargeFileList().size() > i && !StringUtil.isEmpty(vo.getLargeFileList().get(i).getOriginalFilename())) {
					List<MultipartFile> largeFileList = new ArrayList<MultipartFile>();
					largeFileList.add(vo.getLargeFileList().get(i));
					List<BaseFileVO> largeFileBfs = _upload.saveFiles(largeFileList, null, sImagePath);
					//db저장 용 추가
					filePathMap.put("large", largeFileBfs.get(0).getFullPathName());
					//삭제용 추가
					prdImgPath.add(prdImgVo.getLargeFilename());
				}
								
				//파일 삭제
				for (String sPath : prdImgPath) {
					deleteFile(sPath);
				}

				//수정한 파일이 있을 시 저장
				if (prdImgPath.size() > 0) {
					//db 저장
					//지정한 파일
					for (String key : filePathMap.keySet()) {
						if (key.equals("original")) {
							prdImgVo.setOriginalFilename(vo.getOriginalFileList().get(i).getOriginalFilename());
							prdImgVo.setSaveFilename(filePathMap.get(key));						
						} else if (key.equals("list")) {
							prdImgVo.setListFilename(filePathMap.get(key));
					
						} else if (key.equals("small")) {
							prdImgVo.setSmallFilename(filePathMap.get(key));
						
						} else if (key.equals("detail")) {
							prdImgVo.setDetailFilename(filePathMap.get(key));
						
						} else if (key.equals("large")) {
							prdImgVo.setLargeFilename(filePathMap.get(key));
						}
					}
					
					super.getDAO().insert("prdImage.merge", prdImgVo);
				}
			}
		}
		
		String sPath = super.getConfig().getUploadPathFiles();
		//첨부파일
		List<BaseFileVO> bfs5 = _upload.saveFiles(vo.getFileList(), null, sPath);
		for (BaseFileVO bfVo : bfs5) {
			if (!StringUtil.isEmpty(bfVo.getFileName())) {
				FileVO fileVo = new FileVO();
				fileVo.setTableName("TS_PRD");
				fileVo.setOriginalFilename(bfVo.getFileName());
				fileVo.setSaveFilename(bfVo.getFullPathName());
				fileVo.setMimeType(bfVo.getContentType());
				fileVo.setRefSeq(iPrdSeq);
				fileVo.setOrdering((short)1);
				fileVo.setRefUserId(sUser);			
				fileVo.setFileSize(StringUtil.getFileSize(bfVo.getSize()));			
				super.getDAO().update("file.merge", fileVo);
			}
		}
	}
	
	/**
	 * 상품 업데이트
	 * @param vo
	 */
	public void updatePrdVo(PrdVO vo, String sRegUser) throws Exception {
		//신규 등록일 경우 기본 값 셋팅
		if (vo.getPrdSeq() == null || vo.getPrdSeq() == 0) {
			vo.setRegUser(sRegUser);
		} else {
			vo.setRegUser(sRegUser);
			vo.setModUser(sRegUser);
		}
		
		super.getDAO().update("prd.merge", vo);
	}
		
	/**
	 * 파일 삭제
	 * @param sPath 경로
	 */
	public void deleteFile(String sPath) {
		if (!StringUtil.isEmpty(sPath)) {
			try {
				File oldFile = new File(super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual() +  sPath));
				if (oldFile.exists())
					oldFile.delete();
			}
			catch (Exception e) {
				logger.warn("[차량관리-제작정보 수정] 파일 없음 - 경로 : {}", super.getConfig().getUploadPathVirtual() + sPath);
				logger.error(e.getMessage(), e);	
			}
		}		
	}

	/**
	 * 오더링 순서 처리
	 * @param vo
	 * @param sUser
	 */
	public void updateOrdering(PrdVO vo1, String sUser) {
		//서로 오더링을 바꿔 등록
		int iOrdering1 = vo1.getOrdering();
		
		PrdVO vo2 = (PrdVO) super.getDAO().selectByKey("prd.selectOrderingForUpdate", vo1);
		
		if (vo2 != null) {
			int iOrdering2 = vo2.getOrdering();
					
			vo2.setOrdering(iOrdering1);
			vo1.setOrdering(iOrdering2);
			
			super.getDAO().update("prd.updateByKeySelective", vo1);
			super.getDAO().update("prd.updateByKeySelective", vo2);
		}
	}

	
	/**
	 * 상품 삭제 (use_yn = N 처리)
	 * @param search
	 */
	public void deletePrdDelete(PrdSearchVO search) {
				
		if (search.getPrdseq() != 0) {
			PrdVO vo = new PrdVO();
			vo.setPrdSeq(search.getPrdseq());
			vo.setUseYn("N");
			super.getDAO().update("prd.updateByKeySelective", vo);
			
		} else {
			for (int i : search.getPrdseqs()) {
				PrdVO vo = new PrdVO();
				vo.setPrdSeq(i);
				vo.setUseYn("N");
				super.getDAO().update("prd.updateByKeySelective", vo);
			}
		}		
	}

	/**
	 * 첨부 파일 삭젠
	 */
	public void deletePrdFileDelete(FileVO vo) {
		deleteFile(vo.getSaveFilename());		
		super.getDAO().delete("file.deleteByKey", vo);
	}

	/**
	 * 이미지 파일 삭제
	 * @param vo
	 */
	public void deletePrdImgDelete(PrdVO vo) {
				
		for (int iPiSeq : vo.getPrdImageSeqList()) {
			if (iPiSeq != 0){
				PrdImageVO prdImgVo = (PrdImageVO) super.getDAO().selectByKey("prdImage.selectByKey", iPiSeq);
			
				//삭제용 
				List<String> prdImgPath = new  ArrayList<String>();			
				prdImgPath.add(prdImgVo.getSaveFilename());	
				prdImgPath.add(prdImgVo.getListFilename());		
				prdImgPath.add(prdImgVo.getSmallFilename());
				prdImgPath.add(prdImgVo.getDetailFilename());
				prdImgPath.add(prdImgVo.getLargeFilename());			
								
				//파일 삭제
				for (String sPath : prdImgPath) {
					deleteFile(sPath);
				}
				
				super.getDAO().delete("prdImage.deleteByKey", iPiSeq);
			}
		}
	}	
	
}
