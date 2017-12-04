package com.kh.fitnessground.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\git\\KHFinalProject\\FinalWorkspace\\FitnessGround\\src\\main\\webapp\\resources\\images\\myimages\\";

	public List<Map<String, Object>> parseInsertFileInfo(HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String renameFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				renameFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + renameFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("original_fileName", originalFileName);
				listMap.put("rename_fileName", renameFileName);
				list.add(listMap);
			}
		}
		return list;
	}

}