package com.ko.util;

import java.io.File;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component
public class UploadServerFileUrl {
	
	public static String calcPath(String uploadPath) {
		
		// 년 월 일 폴더
		Calendar cal = Calendar.getInstance();

		// 2019
		String yearPath = "/" + cal.get(Calendar.YEAR);

		// 2019/09
		String monthPath = String.format("%s/%02d", yearPath, cal.get(Calendar.MONTH) + 1);

		// 2019/09/11
		String datePath = String.format("%s/%02d", monthPath, cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;
	}
	
	public static void makeDir(String uploadPath, String... paths) {
		for (String path : paths) {
			File dir = new File(uploadPath + path);
			if (dir.exists() == false) {
				dir.mkdir();
			}
		}
	}

}
