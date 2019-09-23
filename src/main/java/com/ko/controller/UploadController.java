package com.ko.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ko.domain.Area;
import com.ko.domain.Auth;
import com.ko.domain.Board;
import com.ko.domain.Content;
import com.ko.domain.Guest;
import com.ko.service.GuestService;
import com.ko.util.UploadFileUtils;
import com.ko.util.UploadServerFileUrl;

@RequestMapping("/upload/*")
@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
			
	private String innerUploadPath = "resources/upload";
	
	@Autowired
	private UploadServerFileUrl uploadUrl;
	
	@Resource(name="uploadPath")
	private String outUploadPath;
	
	@Autowired
	private GuestService gService;
	
	
	@RequestMapping(value="/displayFile",method=RequestMethod.GET)
	public @ResponseBody ResponseEntity<byte[]> displayFile(String filename){
		logger.info("----------displayFile,filename="+filename);
		
		String formatName = filename.substring(filename.lastIndexOf(".")+1);//확장자만 뽑아냄
		MediaType mType = null;
		ResponseEntity<byte[]> entity;
		
		if(formatName.equalsIgnoreCase("jpg")) {
			mType=MediaType.IMAGE_JPEG;
		}
		else if(formatName.equalsIgnoreCase("gif")) {
			mType=MediaType.IMAGE_GIF;
		}
		else if(formatName.equalsIgnoreCase("png")) {
			mType=MediaType.IMAGE_PNG;
		}
		InputStream in =null;
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(outUploadPath+"/"+filename);
			headers.setContentType(mType);
			
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED
					);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				if(in !=null)
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return entity;
	}

    // 다중파일업로드
    @RequestMapping(value = "boardUpload", method = RequestMethod.POST)
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
	
	@RequestMapping(value="updateProfileImg",method=RequestMethod.POST)
	public ResponseEntity<String> updateProfileImg(@RequestBody MultipartFile file,HttpSession session ){
		logger.info("-------------------------------updateProfileImg");
		ResponseEntity<String> entity=null;
		try{
			String savedName = UploadFileUtils.uploadFile(
					outUploadPath, 
					file.getOriginalFilename(), 
					file.getBytes(),
					"memberImg"
					);
			Auth auth=(Auth)session.getAttribute("Auth");
			Guest guest = gService.selectById(auth.getUserid());
			guest.setgImage(savedName);
//			gService.updateGuestImg(savedName);
			gService.updateAll(guest);
			auth.setUserimage(savedName);
			return new ResponseEntity<String>(savedName,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	@RequestMapping(value = "insertBoard2", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> insertBoard2(
			List<MultipartFile> files,
			Board board, String hash, @RequestParam("cContents") List<String> cContents,
			Area area,
			HttpSession session) throws IOException, Exception {
		logger.info("------------------insertBoard2");
		
		ResponseEntity<String> entity=null;
		
		ArrayList<String> list = new ArrayList<>();
		System.out.println(board);
		for(String content:cContents) {
			System.out.println(content);
		}
		
		
		for(MultipartFile file : files) {
			String savedName = UploadFileUtils.uploadFile(
					outUploadPath, 
					file.getOriginalFilename(), 
					file.getBytes(),
					"boardImg"
					);
			System.out.println(savedName);
			list.add(savedName);
		}
		for(String test : list) {
			System.out.println("board ImgName:"+test);
		}
		entity=new ResponseEntity<String>("good",HttpStatus.OK);
		return entity;
	}
}
