package com.tagoplus.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

/**
 * 썸네일 이미지 만들기
 * @author lhg
 *
 */
public class ThumbnailUtil {
	
	/**
	 * 이미지 파일 리사이즈 조정후 저장  // 경로는 원본 파일 경로
	 * 저장명 : 파일명_타입길이로 저장 ex) 파일명_H50.jpg 
	 * @param file 파일
	 * @param sType H:높이, W: 너비로 비율 조정
	 * @param map <사이즈(int)> 리스트
	 * @return Map<사이즈(int), 저장된 파일 이름>으로 반환
	 * @throws Exception
	 */
	public static Map<Integer, String> MakeThumbnail(File file, String sType, List<Integer> list) throws Exception {
		return MakeThumbnail(file, sType, list, null);
	}

	/**
	 * 이미지 파일 리사이즈 조정후 저장 
	 * 저장명 : 파일명_타입길이로 저장 ex) 파일명_H50.jpg 
	 * @param file 파일
	 * @param sType H:높이, W: 너비로 비율 조정
	 * @param map <사이즈(int)> 리스트
	 * @param sPath 리사이즈 파일 저장 경로
	 * @return Map<사이즈(int), 저장된 파일 이름>으로 반환
	 * @throws Exception
	 */
	public static Map<Integer, String> MakeThumbnail(File file, String sType, List<Integer> list, String sPath) throws Exception {
		//파일 이름 반환
		Map<Integer, String> fileNameMap = new HashMap<Integer, String>();

		//new File(super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual() + bf.getFullPathName()))
		Image image = ImageIO.read(file);
		
		int iImageWidth = image.getWidth(null);
        int iImageHeight = image.getHeight(null);
        double dRatio = 0;
     
        for (int iSize : list) {	   
        	
        	 //높이 기준으로 비율 설정
        	if (sType.equals("H")) {
		        dRatio = (double)iSize/(double)iImageHeight;
		    //너비 기준으로 비율 설정   
        	} else if (sType.equals("W")){
        		dRatio = (double)iSize/(double)iImageWidth;	
        	}
        	
        	String fileName = StringUtil.getUniqueNumber() + "." + org.springframework.util.StringUtils.getFilenameExtension(file.getName()).toLowerCase();

        	fileNameMap.put(iSize, fileName);
        	
        	if (StringUtil.isEmpty(sPath)) {
        		sPath = file.getPath().substring(0, file.getPath().lastIndexOf("\\"));
        	}
        	
        	String filePath = sPath + "\\" +fileName;

        	File dir = new File(sPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			int w = (int) (iImageWidth * dRatio);
			int h = (int) (iImageHeight * dRatio);

	        // 이미지 리사이즈
	        // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
	        // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
	        // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
	        // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
	        // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
	        Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);
	        
	        // 새 이미지  저장하기
	        BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
	        Graphics g = newImage.getGraphics();
	        g.drawImage(resizeImage, 0, 0, null);
	        g.dispose();	        
	       
	        ImageIO.write(newImage, "jpg", new File(filePath));	        
        }
        
        return fileNameMap;
	}

}
