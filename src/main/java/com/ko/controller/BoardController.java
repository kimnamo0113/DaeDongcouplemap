package com.ko.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="board/write",method=RequestMethod.GET)
	public void writeGET() {
		logger.info("--------------------board/write");
	}
	
	
	 @RequestMapping(value = "/coding.do")
	    public String coding() {
		 logger.info("------------------coding");
	        return "coding";
	 }
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insertBoard(String editor) {
		logger.info("------------------insert");
		
        System.err.println("저장할 내용 : " + editor);
        return "redirect:/coding.do";
    }
 
    // 다중파일업로드
    @RequestMapping(value = "imgUpload", method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
    	logger.info("------------------imgUpload");
    	
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:\\Users\\USER\\Desktop\\webComponent\\DaeDongcouplemap\\src\\main\\webapp\\resources\\imageUpload\\";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/daedong/resources/imageUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
