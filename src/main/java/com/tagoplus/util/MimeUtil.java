package com.tagoplus.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * file mime type 체크 클래스 
 * @author wimy
 *
 */
public class MimeUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(MimeUtil.class);
	
	public MimeUtil() {}
	
	/**
	 * 파일의 mime type 리턴
	 * @param file 실제 파일
	 * @return 파일의 mime
	 * @throws IOException
	 */
	public String getMimeType(File file) throws IOException {
		String sMimeType = "";
		
		if (file.exists()) {
			InputStream is = new BufferedInputStream(new FileInputStream(file));
			sMimeType = URLConnection.guessContentTypeFromStream(is);
		}
		
		return sMimeType;
	}
	
	/**
	 * 업로드 파일 리스트의 mime type 리턴
	 * @param files
	 * @return
	 * @throws IOException
	 */
	public List<String> getMimeTypes(List<MultipartFile> files) throws IOException {
		List<String> list = new ArrayList<>();
		
		for (MultipartFile f : files) {
			if (f.getSize() == 0)
				list.add("");
			else {
				String sMimeType = URLConnection.guessContentTypeFromStream(f.getInputStream());
				list.add(StringUtil.getString(sMimeType));
			}
		}
		return list;
	}
	
	/**
	 * 업로드 파일 리스트의 mime type을 허용 가능한 mime type 접두사 배열과 비교한 결과 리턴 <br>
	 *   - 파일 하나라도 맞지 않으면 false 리턴 
	 * @param files List<MultipartFile>
	 * @param prefixes 허용할 MimeType 접두어 
	 * @return 
	 * @throws IOException
	 */
	public boolean isEnableMimeTypes(List<MultipartFile> files, String... prefixes) throws IOException {
		boolean isEnable = true;
		for (MultipartFile f : files) {
			if (f.getSize() == 0)
				continue;
			
			String sMimeType = URLConnection.guessContentTypeFromStream(f.getInputStream());
			logger.debug(">>>> mime type : {}", sMimeType);
			if (StringUtil.isEmpty(sMimeType)) {
				isEnable = false;
				break;
			}
			else {	
				for (String prefix : prefixes)
					if (!sMimeType.toLowerCase().startsWith(prefix))
						isEnable = false;
					else {
						isEnable = true;
						break;
					}
				if (!isEnable)
					break;
			}
		}		
		return isEnable;
	}
}
