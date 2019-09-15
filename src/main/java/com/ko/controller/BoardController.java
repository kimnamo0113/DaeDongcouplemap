package com.ko.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ko.domain.Board;
import com.ko.service.BoardService;
import com.ko.util.UploadFileUtils;
import com.ko.util.UploadServerFileUrl;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//내부 서버경로로 올리기
	private String innerUploadPath = "resources/imgUpload";
	
	@Resource(name="uploadPath")
	private String outUploadPath;
	
	@Autowired
	BoardService service;
	
	
	@RequestMapping(value="write",method=RequestMethod.GET)
	public void writeGET() {
		logger.info("--------------------board/write");
	}
	
	
	@RequestMapping(value = "coding")
	public String coding() {
		logger.info("------------------coding");
	    return "index";
	 }
	
	@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
    public String insertBoard(String editor,Board board,String hash) {
		logger.info("------------------insertBoard");
		logger.info("board : "+ board);
		logger.info("hash : "+ hash);
		
        System.err.println("저장할 내용 : " + editor);
        
        board.setbContent(editor);
        
//        service.insertBoard(board);
        return "redirect:/board/coding";
    }
 
	@Autowired
	UploadServerFileUrl uploadUrl;
	
    // 다중파일업로드
    @RequestMapping(value = "imgUpload", method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
    	logger.info("------------------imgUpload");
    	String root_path = request.getSession().getServletContext().getRealPath("/");
//    	SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
//        Date date = new Date();
        
    	File dir = new File(root_path+"/"+innerUploadPath);
		if(dir.exists()==false) {
			dir.mkdir();
		}
    	
//    	UploadServerFileUrl.getInstance().calcPath(uploadPath);
    	String datePath=uploadUrl.calcPath(root_path+innerUploadPath);
    	System.out.println(datePath);
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            /*String filePath = "C:\\Users\\USER\\Desktop\\webComponent\\DaeDongcouplemap\\src\\main\\webapp\\resources\\imageUpload\\";*/
            //기존의 SE2꺼
            String saveName = sb/*.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))*/
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();

            
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(root_path+"/"+innerUploadPath+"/"+datePath+"/"+saveName);
            
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
//            String saveName = UploadFileUtils.uploadFile(outUploadPath+"/", oldName, b);
            os.flush();
            os.close();
            
            // 정보 출력
            
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
//              .append("&sFileURL=").append("http://localhost:8080/picture")
              .append("&sFileURL=").append("http://localhost:8080/daedong/"+innerUploadPath+datePath+"/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
