package com.tagosolution.service.impl;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.service.BoardService;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.service.UploadSubDir;
import com.tagosolution.service.model.CommentVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.search.BoardSearchVO;

/**
 * 게시판 서비스
 * @author wimy
 *
 */
@Service("boardService")
public class BoardServiceImpl extends BaseServiceImpl implements BoardService {

	@Autowired
	UploadFile _upload;
	
	@Resource
	ProductServiceImpl _productSerivce;
	
	/**
	 * 게시물 - 목록 가져오기
	 * @param search
	 * @param bm
	 * @return
	 * @throws Exception
	 */
	public List<?> getList(BoardSearchVO search, BoardMasterVO bm) throws Exception {
		search.getPaging().setBlockCount(bm.getPagerBlockCount());
		if (bm.getPagerBlockCount()!=null) {
			search.getPaging().setRecordCount(bm.getPagerRowCount());
		}
		List<BoardInfoVO> list = (List<BoardInfoVO>) getDAO().selectBySearch("boardInfo.selectList", search, "totalCount");
		return list;
		
	}

	/**
	 * 게시물 - 상세 한 건
	 *  - 조회 수 증가 처리 여부 포함
	 * @param search
	 * @param increaseReadCount
	 * @return
	 * @throws Exception
	 */
	public BoardInfoVO getDetail(BoardSearchVO search, boolean increaseReadCount) throws Exception {
		//조회수 1 증가
		// TODO : 조회 수 증가 루틴 고도화 필요
		//if (increaseReadCount && !StringUtil.isEmpty(search.getIpAddr())) {
		if (increaseReadCount ) {
			getDAO().update("boardInfo.updateReadCount", search.getBseq());
		}
		BoardInfoVO vo = (BoardInfoVO) getDAO().selectByKey("boardInfo.selectByVo", search);
		return vo;
	}
	
	
	/**
	 * 게시물 - 등록/수정
	 *   - 계층형 게시판 처리 포함
	 * @param search
	 * @param vo
	 * @return
	 */
	public int insert(BoardSearchVO search, BoardInfoVO vo) throws Exception {
		
		//계층형
		// group : 그룹 - pk와 동일한 값 부여
		// order : 정렬 - 같은 그룹 내 정렬 번호 - 부모 order + 1
		// depth : 깊이 - 답글 깊이 - 부모 depth + 1
		//
		// 답글일 경우
		// 1. 위의 값대로 게시물 등록
		// 2. 같은 그룹 내 등록한 게시물의 order 값보다 큰 게시물 모두 + 1
		
		BoardInfoVO prVO = null;
		if (search.getStatus().equals("reply") && search.getPrSeq() > 0) {
			prVO = (BoardInfoVO) getDAO().selectOne("boardInfo.selectParent", search.getPrSeq());
			vo.sethGroup(prVO.gethGroup());
			vo.sethOrder(prVO.gethOrder() + 1);
			vo.sethDepth(prVO.gethDepth() + 1);
		}
		else if (search.getStatus().equals("i")) {
			vo.sethOrder(1);
			vo.sethDepth(1);
			
			if (vo.getStar() == null)
				vo.setStar((short)0);
			
			if (vo.getReadCount() == null)
				vo.setReadCount(0);
		}
		else if (search.getStatus().equals("u")) {
			BoardInfoVO selfVO = (BoardInfoVO) getDAO().selectByKey("boardInfo.selectByKey", search.getBseq());
			vo.sethGroup(selfVO.gethGroup());
			vo.sethOrder(selfVO.gethOrder());
			vo.sethDepth(selfVO.gethDepth());
			vo.setStar(selfVO.getStar());
		}
		
		int iAffectedRows = getDAO().insert("boardInfo.merge", vo);
		//등록 시 : H_GROUP 컬럼 업데이트
		if (search.getStatus().equals("i"))
			getDAO().update("boardInfo.updateHGroup", vo);
			
		if (prVO != null) {
			getDAO().update("boardInfo.updateHOrder", vo);
		}
		String sPath = UploadSubDir.SUB_DIR_BOARD + "/" + vo.getBoardCode();
		List<BaseFileVO> bfs = _upload.saveFiles(vo.getFileList(), null, sPath);
		
		if (bfs != null) {
			for (int i = 0; i < bfs.size(); i++) {
				if (!StringUtil.isEmpty(bfs.get(i).getFileName())) {
					FileVO fileVo = new FileVO();
	
					if (vo.getFileSeqList().get(i) != 0) {
						fileVo.setFileSeq(vo.getFileSeqList().get(i));
						
						FileVO oldFileVo = (FileVO) getDAO().selectByKey("file.selectByKey", vo.getFileSeqList().get(i));
						_productSerivce.deleteFile(oldFileVo.getSaveFilename());
					}
					
					fileVo.setTableName("TS_BOARD_INFO");
					fileVo.setOriginalFilename(bfs.get(i).getFileName());
					fileVo.setSaveFilename(bfs.get(i).getFullPathName());
					fileVo.setMimeType(bfs.get(i).getContentType());
					fileVo.setRefSeq(vo.getBoardSeq());
					fileVo.setOrdering((short)1);
					fileVo.setRefUserId(vo.getRegUser());
					fileVo.setFileSize(StringUtil.getFileSize(bfs.get(i).getSize()));
					super.getDAO().update("file.merge", fileVo);
				}
			}
		}

		return iAffectedRows;
	}
	
	/**
	 * 게시판 마스터 - 등록/수정
	 * @param search
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertBoardMaster(BoardSearchVO search, BoardMasterVO vo) throws Exception {
		
		return getDAO().insert("boardMaster.merge", vo);
	}
	
	/**
	 * 게시판 카테고리로 이동/복사
	 * @param search
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void updateBoardInfo(BoardSearchVO search, String sUser, String sIpAddr) throws Exception {
		//게시물 카테고리 이동
		if (search.getMode().equals("move")) {
			for (long lBseq : search.getBseqs()) {
				BoardInfoVO vo = new BoardInfoVO();
				vo.setBoardSeq(lBseq);
				vo.setBcSeq(search.getBcseq());
				getDAO().update("boardInfo.updateByKeySelective", vo);
			}

		//게시판물을 선택 카테고리로 복사 - boardInfo, file // 등록자, star, count관련, 댓글 복사 하지 않음
		} else if (search.getMode().equals("copy")) {
			for (long lBseq : search.getBseqs()) {
				BoardInfoVO vo = new BoardInfoVO();
				vo.setBoardSeq(lBseq);
				vo.setBcSeq(search.getBcseq());
				vo.setRegUser(sUser);
				vo.setIpAddr(sIpAddr);
				getDAO().update("boardInfo.insertSelectByKey", vo);

				//복사할 파일리스트
				search.setRefSeq(String.valueOf(lBseq));
				search.setTableName("TS_BOARD_INFO");
				List<FileVO> fileVoList = (List<FileVO>) getDAO().selectList("file.selectByRefSeq", search);

				for (FileVO fVo : fileVoList) {
					String sPath = super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual());					
					String sCopyFilename = StringUtil.getUniqueNumber() + "." + org.springframework.util.StringUtils.getFilenameExtension(fVo.getOriginalFilename()).toLowerCase();

					fileCopy(sPath + fVo.getSaveFilename(), sPath + UploadSubDir.SUB_DIR_BOARD + "/" + search.getBcode() + "/" + sCopyFilename);
					
					FileVO fileVo = new FileVO();
					fileVo.setFileSeq(fVo.getFileSeq());
					fileVo.setSaveFilename(UploadSubDir.SUB_DIR_BOARD + "/" + search.getBcode() + "/" + sCopyFilename);
					fileVo.setRefSeq(vo.getBoardSeq());
					fileVo.setRefUserId(sUser);
					getDAO().update("file.insertSelectByKey", fileVo);
				}
			}
		}
	}
	
	/**
	 * 게시물 삭제
	 * @param search
	 * @return
	 * @throws Exception
	 */
	public int delete(BoardSearchVO search) throws Exception {
		int iAffectedRows = 0;
		
		if (search.getBseq() != 0) {
			BoardInfoVO vo = new BoardInfoVO();
			vo.setBoardSeq(search.getBseq());
			vo.setUseYn("N");
			iAffectedRows = getDAO().delete("boardInfo.updateByKeySelective", vo);
		
		} else {
			for (Long lBseq : search.getBseqs()) {
				BoardInfoVO vo = new BoardInfoVO();
				vo.setBoardSeq(lBseq);
				vo.setUseYn("N");
				iAffectedRows += getDAO().delete("boardInfo.updateByKeySelective", vo);
			}
		}
		
		return iAffectedRows;
	}
	
	/**
	 * 게시판 그룹 삭제
	 * 	- 그룹 삭제, 삭제되는 게시판 그룹 순번을 가지고 있는 모든 게시판 업데이트
	 * @param search
	 * @return
	 */
	public int deleteBoardGroup(BoardSearchVO search) throws Exception {
		
		//1. 게시판 그룹 삭제
		int iAffectedRows = getDAO().delete("group.deleteByKey", search.getGseq());
		
		//2. 해당 게시판 그룹을 가지고 있는 모든 게시판 업데이트
		iAffectedRows += getDAO().update("boardMaster.updateGroupSeq", search);
		
		return iAffectedRows;
	}
	
	/**
	 * 게시판 카테고리 삭제
	 * @param search
	 * @return
	 * @throws Exception
	 */
		public int deleteBoardCategory(BoardSearchVO search) throws Exception {
				
				//1. 게시판 카테고리 삭제
				int iAffectedRows = getDAO().delete("boardCategory.deleteByKey", search.getBcseq());
				
				return iAffectedRows;
			}
		
		
		

	/**
	 * 저장 되어 있는 파일 복사 
	 * @param inFileName 기존 파일의 저장 경로
	 * @param outFileName 복사 되어질 파일의 경로
	 * @throws Exception
	 */	
	public void fileCopy(String inFileName, String outFileName) throws Exception {
		FileInputStream fis = new FileInputStream(inFileName);
		FileOutputStream fos = new FileOutputStream(outFileName);

		int data = 0;
		while ((data = fis.read()) != -1) {
			fos.write(data);
		}
		fis.close();
		fos.close();
	}

	/**
	 * 게시판 답변 등록
	 * @param vo
	 */
	public void updateBoardAnswer(BoardInfoVO vo) {
		getDAO().update("boardInfo.updateByKeySelective", vo);
	}

	
	public List<?> getCommentList(BoardSearchVO search) throws Exception {
		List<CommentVO> list = (List<CommentVO>) getDAO().selectBySearch("boardComment.selectByBseq", search);
		return list;
	}

	

}
