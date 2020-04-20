package com.tagosolution.service.impl;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.service.UploadSubDir;
import com.tagosolution.service.model.BannerInfoVO;
import com.tagosolution.service.model.BannerMasterVO;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.search.BannerSearchVO;


/**
 * 배너관리 서비스
 * @author kky
 *
 */
@Service("bannerService")
public class BannerServiceImpl extends BaseServiceImpl {
	
	private static final Logger logger =  LoggerFactory.getLogger(BannerServiceImpl.class);
	
	
	@Autowired
	UploadFile _upload;
	
	/**
	 * 배너그룹관리 등록수정
	 * @param vo
	 * @throws Exception
	 */
	public void insertBannerMaster(BannerMasterVO vo) throws Exception {
		super.getDAO().insert("bannerMaster.merge", vo);
	}
	
	/**
	 * 배너그룹관리 삭제
	 * @param search
	 * @throws Exception
	 */
	public void deleteBannerMaster(BannerSearchVO search) throws Exception {
		List<BannerInfoVO> list = (List<BannerInfoVO>) super.getDAO().selectList("bannerInfo.selectByBanner", search.getBseq());
		
		//logger.debug("배너  : {}", new Gson().toJson(list));
		
		super.getDAO().delete("bannerMaster.deleteByKey", search);
		
		search.setTableName("banner");
		for (BannerInfoVO v : list) {
			search.setRefSeq(String.valueOf(v.getBannerSeq()));
			FileVO oldFileVO = (FileVO) super.getDAO().selectByKey("file.selectByRefSeq", search);
			if (oldFileVO != null) {
				File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + oldFileVO.getSaveFilename()));
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		super.getDAO().delete("file.deleteByBanner", search.getBseq());
		super.getDAO().delete("bannerInfo.deleteByMaster", search.getBseq());
	}
	
	/**
	 * 배너관리 등록수정
	 * @param vo
	 * @param request
	 * @param search
	 * @throws Exception
	 */
	public Short insertBannerInfo(BannerInfoVO vo, BannerSearchVO search) throws Exception {
		
		super.getDAO().insert("bannerInfo.merge", vo);
		
		BannerMasterVO bm = (BannerMasterVO) super.getDAO().selectOne("bannerMaster.selectByKey", vo.getBmSeq());
		

		FileVO oldFileVO =  (FileVO) getDAO().selectByKey("file.selectByKey", search.getFseq());
		//logger.debug("서치 : {}", new Gson().toJson(search));
		//logger.debug("올드파일 : {}", new Gson().toJson(oldFileVO));
		
		
		List<BaseFileVO> bfs = _upload.saveFiles(search.getImgFile(), search.getDeleteFlag(), UploadSubDir.SUB_DIR_BANNER);
		//logger.debug("파일 : {}", new Gson().toJson(bfs));
			for (BaseFileVO b : bfs) {
				if (b.isDeleted())
					super.getDAO().delete("file.deleteByKey", search.getFseq());
				if (b.getSize() == 0)
					continue;
				
				FileVO f = new FileVO();
				f.setFileSeq(search.getFseq());
				f.setTableName("banner");
				f.setMimeType(b.getContentType());
				f.setOriginalFilename(b.getFileName());
				f.setFileName(b.getPhysicalName());
				f.setFileSize(StringUtil.getFileSize(b.getSize()));
				f.setRefSeq((long)vo.getBannerSeq());
				f.setFileSize(StringUtil.getFileSize(b.getSize()));
				f.setRefUserId(search.getUser());
				f.setOrdering(vo.getOrdering());
				f.setUploadTypeFixedCode("004002");
				f.setMasterSeq(vo.getBmSeq()); 
				
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
		if (oldFileVO != null) {
			//배너 그룹 이동시 그룹마스터seq 수정
			if (search.getBseq() != bm.getBmSeq()) {
				//logger.debug(">>그룹이동 {}", search.getBseq());
				FileVO f = new FileVO();
				f.setMasterSeq(vo.getBmSeq());
				f.setFileSeq(oldFileVO.getFileSeq());
				
				super.getDAO().update("file.updateForMaster", f);
			}
		}
		return bm.getBmSeq();
	}
	
	/**
	 * 배너관리 삭제/이미지삭제
	 * @param search
	 * @throws Exception
	 */
	public void deleteBannerInfo(BannerSearchVO search) throws Exception {
		super.getDAO().delete("bannerInfo.deleteByKey", search.getBiseq());
		
		FileVO oldFileVO = (FileVO) getDAO().selectByKey("file.selectByKey", search.getFseq());
		
//		logger.debug(">>>삭제11: {}", oldFileVO.getSaveFilename());
//		logger.debug(">>>삭제1: {}", getConfig().getUploadPathVirtual() + oldFileVO.getSaveFilename());
		if (oldFileVO != null) {
			File oldFile = new File(super.getServletContext().getRealPath(getConfig().getUploadPathVirtual() + oldFileVO.getSaveFilename()));
			if (oldFile.exists()) {
				oldFile.delete();
				super.getDAO().delete("file.deleteByKey", search.getFseq());
			}
		}
	}
	
}
