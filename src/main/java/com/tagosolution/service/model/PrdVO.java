package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 상품 모델
 * 
 * @author wimy
 *
 */
public class PrdVO implements GeneralModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = -186453789625556218L;
	
	private Integer prdSeq;
	
	private String category1;
	
	private String prdName;
	
	private String recommendYn;
	
	private String mainYn;
	
	private Integer ordering;
	
	private String productCode;
	
	private Integer price;
	
	private String summary;
	
	private String cssPrefix;
	
	private Integer sizeList;
	
	private Integer sizeSmall;
	
	private Integer sizeDetail;
	
	private Integer sizeLarge;
	
	private String userUrl;
	
	private String adminUrl;
	
	private String regUser;
	
	private Date regDate;
	
	private String modUser;
	
	private Date modDate;
	
	private String useYn;
	
	private String body;
	
	
	private String regUserName;
	
	private String modUserName;
	
	
	private List<PrdSubVO> prdSubVO;
	
	private List<PrdImageVO> prdImageVO;
	
	private PrdCategoryVO prdCategoryVO;
	
	//첨부 파일 리스트
	private List<MultipartFile> fileList;
	
	//이미지 파일 리스트	
	private List<String> prdImageTypeList;
	
	private List<Integer> prdImageSeqList;
	
	private List<MultipartFile> originalFileList;

    private List<MultipartFile> listFileList;

    private List<MultipartFile> smallFileList;

    private List<MultipartFile> detailFileList;

    private List<MultipartFile> largeFileList;

    //상품정보 리스트
    private List<Integer> prdSubSeqList;
    private List<String> headerList;
    private List<String> contentList;
	
    //오더링 수정시 타입 up, down    
    private String type;
    
    private String categoryName;
    
	public List<PrdSubVO> getPrdSubVO() {
		if (this.prdSubVO == null)
			this.prdSubVO = new ArrayList<PrdSubVO>();
		return prdSubVO;
	}
	
	public void setPrdSubVO(List<PrdSubVO> prdSubVO) {
		this.prdSubVO = prdSubVO;
	}
	
	public List<PrdImageVO> getPrdImageVO() {
		if (this.prdImageVO == null)
			this.prdImageVO = new ArrayList<PrdImageVO>();
		return prdImageVO;
	}

	public void setPrdImageVO(List<PrdImageVO> prdImageVO) {
		this.prdImageVO = prdImageVO;
	}

	public PrdCategoryVO getPrdCategoryVO() {
		if (this.prdCategoryVO == null)
			this.prdCategoryVO = new PrdCategoryVO();
		return prdCategoryVO;
	}

	public void setPrdCategoryVO(PrdCategoryVO prdCategoryVO) {
		this.prdCategoryVO = prdCategoryVO;
	}
	

	public Integer getPrdSeq() {
		return prdSeq;
	}
	
	public void setPrdSeq(Integer prdSeq) {
		this.prdSeq = prdSeq;
	}
	
	public String getCategory1() {
		return category1;
	}
	
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	
	public String getPrdName() {
		return prdName;
	}
	
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	
	public String getRecommendYn() {
		return recommendYn;
	}
	
	public void setRecommendYn(String recommendYn) {
		this.recommendYn = recommendYn;
	}
	
	public String getMainYn() {
		return mainYn;
	}
	
	public void setMainYn(String mainYn) {
		this.mainYn = mainYn;
	}
	
	public Integer getOrdering() {
		return ordering;
	}
	
	public void setOrdering(Integer ordering) {
		this.ordering = ordering;
	}
	
	public String getProductCode() {
		return productCode;
	}
	
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	public Integer getPrice() {
		return price;
	}
	
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public String getSummary() {
		return summary;
	}
	
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String getCssPrefix() {
		return cssPrefix;
	}
	
	public void setCssPrefix(String cssPrefix) {
		this.cssPrefix = cssPrefix;
	}
	
	public Integer getSizeList() {
		return sizeList;
	}
	
	public void setSizeList(Integer sizeList) {
		this.sizeList = sizeList;
	}
	
	public Integer getSizeSmall() {
		return sizeSmall;
	}
	
	public void setSizeSmall(Integer sizeSmall) {
		this.sizeSmall = sizeSmall;
	}
	
	public Integer getSizeDetail() {
		return sizeDetail;
	}
	
	public void setSizeDetail(Integer sizeDetail) {
		this.sizeDetail = sizeDetail;
	}
	
	public Integer getSizeLarge() {
		return sizeLarge;
	}
	
	public void setSizeLarge(Integer sizeLarge) {
		this.sizeLarge = sizeLarge;
	}
	
	public String getUserUrl() {
		return userUrl;
	}
	
	public void setUserUrl(String userUrl) {
		this.userUrl = userUrl;
	}
	
	public String getAdminUrl() {
		return adminUrl;
	}
	
	public void setAdminUrl(String adminUrl) {
		this.adminUrl = adminUrl;
	}
	
	public String getRegUser() {
		return regUser;
	}
	
	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getModUser() {
		return modUser;
	}
	
	public void setModUser(String modUser) {
		this.modUser = modUser;
	}
	
	public Date getModDate() {
		return modDate;
	}
	
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	public String getUseYn() {
		return useYn;
	}
	
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	public String getBody() {
		return body;
	}
	
	public void setBody(String body) {
		this.body = body;
	}

	public String getRegUserName() {
		return regUserName;
	}

	public void setRegUserName(String regUserName) {
		this.regUserName = regUserName;
	}

	public String getModUserName() {
		return modUserName;
	}

	public void setModUserName(String modUserName) {
		this.modUserName = modUserName;
	}
		
	/**
	 * 첨부 파일 리스트
	 * @return
	 */
	public List<MultipartFile> getFileList() {
		return fileList;
	}

	/**
	 * 첨부 파일 리스트
	 * @param fileList
	 */
	public void setFileList(List<MultipartFile> fileList) {
		this.fileList = fileList;
	}
	
	/**
	 * 썸네일 적용 여부	
	 * @return
	 */
	public List<String> getPrdImageTypeList() {
		return prdImageTypeList;
	}

	/**
	 * 썸네일 적용 여부
	 * @param prdImageTypeList
	 */
	public void setPrdImageTypeList(List<String> prdImageTypeList) {
		this.prdImageTypeList = prdImageTypeList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @return
	 */
	public List<Integer> getPrdImageSeqList() {
		return prdImageSeqList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @param prdImageSeqList
	 */
	public void setPrdImageSeqList(List<Integer> prdImageSeqList) {
		this.prdImageSeqList = prdImageSeqList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @return
	 */
	public List<MultipartFile> getOriginalFileList() {
		return originalFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @param originalFileList
	 */
	public void setOriginalFileList(List<MultipartFile> originalFileList) {
		this.originalFileList = originalFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @return
	 */
	public List<MultipartFile> getListFileList() {
		return listFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @param listFileList
	 */
	public void setListFileList(List<MultipartFile> listFileList) {
		this.listFileList = listFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @return
	 */
	public List<MultipartFile> getSmallFileList() {
		return smallFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @param smallFileList
	 */
	public void setSmallFileList(List<MultipartFile> smallFileList) {
		this.smallFileList = smallFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @return
	 */
	public List<MultipartFile> getDetailFileList() {
		return detailFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @param detailFileList
	 */
	public void setDetailFileList(List<MultipartFile> detailFileList) {
		this.detailFileList = detailFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @return
	 */
	public List<MultipartFile> getLargeFileList() {
		return largeFileList;
	}

	/**
	 * 상품추가 이미지 파일 등록 리스트
	 * @param largeFileList
	 */
	public void setLargeFileList(List<MultipartFile> largeFileList) {
		this.largeFileList = largeFileList;
	}

	/**
	 * 	상품추가 상품정보 리스트
	 * @return
	 */
	public List<Integer> getPrdSubSeqList() {
		return prdSubSeqList;
	}

	/**
	 * 상품추가 상품정보 리스트
	 * @param prdSubSeqList
	 */
	public void setPrdSubSeqList(List<Integer> prdSubSeqList) {
		this.prdSubSeqList = prdSubSeqList;
	}

	/**
	 * 상품추가 상품정보 리스트
	 * @return
	 */
	public List<String> getHeaderList() {
		return headerList;
	}

	/**
	 * 상품추가 상품정보 리스트
	 * @param headerList
	 */
	public void setHeaderList(List<String> headerList) {
		this.headerList = headerList;
	}

	/**
	 * 상품추가 상품정보 리스트
	 * @return
	 */
	public List<String> getContentList() {
		return contentList;
	}

	/**
	 * 상품추가 상품정보 리스트
	 * @param contentList
	 */
	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}

	/**
	 * 오더링 수정시 타입 up, down    
	 * @return
	 */
	public String getType() {
		return type;
	}

	/**
	 * 오더링 수정시 타입 up, down    
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 카테고리 이름
	 * @return
	 */
	public String getCategoryName() {
		return categoryName;
	}

	/**
	 * 카테고리 이름
	 * @param categoryName
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	
	
}