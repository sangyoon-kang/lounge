package com.tagosolution.controller.admin.prd.manage;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagosolution.service.util.SeqGeneratorUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.ProductServiceImpl;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.PrdCategoryVO;
import com.tagosolution.service.model.PrdVO;
import com.tagosolution.service.model.search.PrdSearchVO;

/**
 * 상품관리 > 상품관리 컨트롤러
 * @author wimy
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/prd/manage")
public class PrdManageController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PrdManageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	ProductServiceImpl _productService;
	
	/**
	 * 상품관리 > 상품관리 목록 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd_list")
	public String prdList(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품관리  &gt; 상품관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<PrdVO> list = (List<PrdVO>) _gDao.selectBySearch("prd.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/prd/manage/prd_list";
	}
	
	/**
	 * 상품 관리 - 상품 목록 - 진열 순서 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prd_ordering_update")
	public String prdOrderingUpdate(PrdSearchVO search, PrdVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		String sUser = super.getAdminSession().getUserID();
		
		try {			
			_productService.updateOrdering(vo, sUser);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
				
		am.setScript("$.Nav('go', '" + super.getConfig().getAdminRoot() + "/prd/manage/prd_list');");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 상품관리 > 상품추가 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd_write")
	public String prdWrite(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품관리  &gt; 상품추가", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		PrdVO vo = (PrdVO) _gDao.selectByKey("prd.selectByKey", search.getPrdseq());
		
		search.setTableName("TS_PRD");
		search.setRefSeq(String.valueOf(search.getPrdseq()));
		List<FileVO> fileList = (List<FileVO>) _gDao.selectList("file.selectByRefSeq", search);
		
		search.setSrcDepth(1);
		List<PrdCategoryVO> prdCategoryList = (List<PrdCategoryVO>) _gDao.selectList("prdCategory.selectAll", search);
		
		model.addAttribute("prdCateList", prdCategoryList);
		//model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("search",search);
		return super.getConfig().getAdminRoot() + "/prd/manage/prd_write";
	}
	
	/**
	 * 상품관리 - 상품추가 - 이미지 사이즈 설정 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prd_img_size_popup")
	public String prdImgSizePopup(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		PrdVO vo = (PrdVO) _gDao.selectByKey("prd.selectByKey", search.getPrdseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/prd/manage/prd_img_size_popup";
	}

	/**
	 * 상품관리 - 상품추가 - 이미지 사이즈 설정 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prd_img_size_proc")
	public String prdImgSizeProc(PrdSearchVO search, PrdVO vo, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		vo.setPrdSeq(search.getPrdseq());
		String sUser = super.getAdminSession().getUserID();
		
		try {			
			_productService.updatePrdVo(vo, sUser);
			am.setMessage("처리 되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
		
		am.setScript("self.close();");
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 이미지 삭제
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value="/prd_img_proc")
	public String prdImgProc(PrdSearchVO search, PrdVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			_productService.deletePrdImgDelete(vo);
			am.setMessage("처리 되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', '" + super.getConfig().getAdminRoot() + "/prd/manage/prd_write', {prdImageSeqList: ''});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 첨부파일 삭제
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prd_file_proc")
	public String prdFileProc(PrdSearchVO search, FileVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			_productService.deletePrdFileDelete(vo);
			am.setMessage("처리 되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', '" + super.getConfig().getAdminRoot() + "/prd/manage/prd_write', {fileSeq:'', saveFilename: ''});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 상품관리 > 상품추가 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd_proc")
	public String prdProc(PrdSearchVO search, PrdVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		AlertModel am = new AlertModel();
		String sUser = super.getAdminSession().getUserID();
		vo.setPrdSeq(search.getPrdseq());
		try {
			if (search.getStatus().equals("d")) {
				_productService.deletePrdDelete(search);
			} else {
				_productService.insertPrdProc(vo, sUser);
			}
			
			am.setMessage("처리 되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
		
		am.setScript("$.Nav('go', '" + super.getConfig().getAdminRoot() + "/prd/manage/prd_list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}

	/**
	 * 상품관리 > 카테고리 관리 UI 
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cate_list")
	public String categoryList(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("상품관리  &gt; 카테고리 관리", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setCount(_gDao.getCountBySearch("prdCategory.totalCount", search));
		List<PrdCategoryVO>list = (List<PrdCategoryVO>) _gDao.selectList("prdCategory.selectList", search);
		List<PrdCategoryVO>parentlist = (List<PrdCategoryVO>) _gDao.selectBySearch("prdCategory.parentList", search);
		List<PrdCategoryVO>childList = (List<PrdCategoryVO>) _gDao.selectBySearch("prdCategory.maincate", search);
		model.addAttribute("childList", new Gson().toJson(childList));
		model.addAttribute("maincate", childList);
		model.addAttribute("list", list);
		model.addAttribute("parentlist", parentlist);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/prd/manage/category_list";
	}
	
	/**
	 * MENU CREATE
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cate_proc")
	public String regionProc(PrdCategoryVO vo, PrdSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		Integer maxLevel = 0;
		String sortNum = "";
		String pid = "";
	    try {
	    	if(vo.getCateIdx().isEmpty()){
				search.setCateLevel(vo.getCateLevel());
				maxLevel = (Integer) _gDao.getCountBySearch("prdCategory.maxIdBylevel", search);
				sortNum = (String) _gDao.selectOne("prdCategory.maxSortNumBylevel", search);
				if(!vo.getParentIdx().isEmpty() && vo.getParentIdx() != null)
					pid = (vo.getCateLevel() == 2) ? vo.getParentIdx().substring(0, 2) : vo.getParentIdx().substring(0, 4);
				vo.setCateIdx(SeqGeneratorUtil.genMenuId(search.getCateLevel(), maxLevel, pid));
				vo.setSortNum(sortNum);
			}
			/*vo.setSortNum(0);*/
			vo.setRegUser(super.getAdminSession().getAdminId());
			vo.setModUser(super.getAdminSession().getAdminId());
			_gDao.insert("prdCategory.merge", vo);
			am.setMessage("저장 완료");
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		am.setScript("$.Nav('go', './cate_list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	/**
	 * ajax - 카테고리 CRUD
	 * @param body
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	//@RequestMapping(value = "/crud_category", method = RequestMethod.POST)
/*	public Object crudCategory(@RequestBody Object body, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		LinkedHashMap node = (LinkedHashMap) body;
		int iAffectedRows = 0;
		if (((String)node.get("type")).equals("delete"))
			iAffectedRows = _productService.deleteCategory(node);
		else if (((String)node.get("type")).equals("create"))
			iAffectedRows = _productService.insertCategory(node);
		else
			iAffectedRows = _productService.updateCategory(node);
		
 		JsonResult json = new JsonResult();
 		
 		if (iAffectedRows > 0) {
	 		json.setSuccess(true);
 		}
		return json;
	}
	*/
	/**
	 * Category Ordering
	 * @param body
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cate_ordering_update")
	public String prdOrderingUpdate(PrdSearchVO search,PrdCategoryVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {			
			String iOrdering1 = vo.getSortNum();
			
			List<PrdCategoryVO> list = (List<PrdCategoryVO>) _gDao.selectBySearch("prdCategory.selectOrderingForUpdate", search);
			PrdCategoryVO vo2 = new PrdCategoryVO();
			List<String> menus = new ArrayList<String>();
			if (list != null && list.size() > 0) {
				String iOrdering2 = list.get(0).getSortNum();
				if(vo.getCateLevel() != 3){
					for(PrdCategoryVO menu : list){
						menus.add(menu.getCateIdx());	
					}
					vo2.setCateIds(menus);		
					
				}else{
					vo2.setCateIdx(list.get(0).getCateIdx());
				}
				vo2.setSortNum(iOrdering1);
				vo2.setCateLevel(vo.getCateLevel());
				
				_gDao.update("prdCategory.updateOrdering", vo2);
				List<PrdCategoryVO> seclist = new ArrayList<PrdCategoryVO>();
				menus = new ArrayList<String>();
				if(vo.getCateLevel() == 2)
					seclist  = (List<PrdCategoryVO>) _gDao.selectList("prdCategory.selectOrderingSecondLevel", vo.getCateIdx());
				else if(vo.getCateLevel() == 1)
					seclist  = (List<PrdCategoryVO>) _gDao.selectList("prdCategory.selectByLnb", vo.getCateIdx());
				for(PrdCategoryVO menu : seclist){
					menus.add(menu.getCateIdx());	
				}
				if(menus.size() == 0){
					menus.add(vo.getCateIdx());
				}
				vo.setSortNum(iOrdering2);
				vo.setCateIds(menus);
				_gDao.update("prdCategory.updateOrdering", vo);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생 하였습니다. \\n" + e.getMessage());
		}
				
		am.setScript("$.Nav('go', './cate_list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
}
