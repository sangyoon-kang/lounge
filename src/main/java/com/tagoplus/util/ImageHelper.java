package com.tagoplus.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException;
import org.springframework.web.multipart.MultipartFile;

public class ImageHelper {
	
	/**
	 * 이미지 파일 Base64 인코딩 문자열로 가져오기 <br>
	 * <br>
	 * - data:[image/jpeg];base64,......<br>
	 * - <img> src에 사용할 수 있음
	 * 
	 * @param file
	 *            MultipartFile
	 * @param isSave
	 * @return 파일이 없으면 null 리턴
	 * @throws Exception
	 *             <code>InvalidContentTypeException</code>
	 */
	public static String getImageFileToString(MultipartFile file) throws Exception {
		StringBuffer sb = new StringBuffer();
		// String sHeader = "data:image/jpeg;base64,";
		
		if (file.getSize() <= 0)
			return null;
		
		String sContentType = file.getContentType();
		if (!sContentType.startsWith("image/"))
			throw new InvalidContentTypeException("이미지 형식의 파일만 지원됩니다.");
		byte[] bytes = file.getBytes();
		sb.append(new String(Base64.encodeBase64(bytes)));
		sb.insert(0, "data:" + sContentType + ";base64,");
		
		return sb.toString();
	}
	
//	public static String reduceImage() {
//		BufferedImage image = ImageIO.read(new File("Z:\\workspace\\tagoplusSms1\\src\\main\\uploads\\temp\\주문서_2017-06-18.jpg"));   // new BufferedImage(width, height, imageType);
//		// image.
//		try (ByteArrayOutputStream os = new ByteArrayOutputStream()) {
//			ImageWriter writer = (ImageWriter) ImageIO.getImageWritersByFormatName("jpeg").next();
//			
//			ImageWriteParam param = writer.getDefaultWriteParam();
//			param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
//			param.setCompressionQuality(0.85f); // Change this, float between 0.0 and 1.0
//			
//			writer.setOutput(ImageIO.createImageOutputStream(os));
//			writer.write(null, new IIOImage(image, null, null), param);
//			
//			writer.dispose();
//		}
//	}
	
	// TODO : 코드 수정 필요
	// QRCode 생성기 호출 : StringUtil.qrCodeGenerator("좌석번호 : 132번");
	// public static void qrCodeGenerator(String text) {
	// QRCodeWriter qrCodeWriter = new QRCodeWriter();
	// try {
	// text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
	// BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 300, 300);
	// String filename = EgovProperties.getProperty("Globals.fileStorePath") + EgovProperties.getProperty("Globals.fileCommonStorePath") + "qrcode/" + getTimestamp() + getRandomValue(GenType.Number, 3) + ".png";
	// MatrixToImageWriter.writeToFile(bitMatrix, "png", new File(filename));
	// } catch (WriterException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// } catch (IOException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }
}
