package com.uhygeramgr.file.web;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.uhygeramgr.file.web.FileController;

import egovframework.util.CommonUtils;
import egovframework.util.Globals;

import com.uhygeramgr.cmm.CmmInterface;
import com.uhygeramgr.file.model.FileVO;
import com.uhygeramgr.file.service.FileService;

/**
 * 시스템      : 코어
 * 단위 시스템 :
 * 프로그램 명 : 엑셀 업로드 및 DB저장, 다운로드, 삭제
 * 파일명      : File.java
 * 설명        : 파일관련 모음
 
 * 이력사항
 * 송혜미  : 2022.01.04
 */
@Controller
public class FileController extends CmmInterface{
	
	
	Logger logger = LogManager.getLogger(FileController.class);

	@Resource(name="FileService")
	private FileService fileService;


		@RequestMapping({"/file/ajaxUploadAndSaveFile.do"})
		public ModelAndView ajaxUploadAndSaveFile(MultipartHttpServletRequest mtfRequest, ModelAndView mv) throws Exception {
		this.logger.info("===============ajaxUploadAndSaveFile ====================");
		String result = "OK";
		String src = mtfRequest.getParameter("src");
		MultipartFile mf = mtfRequest.getFile("fileList");
		   
		String filePath = Globals.FILE_PATH;
		   
		String originFileName = mf.getOriginalFilename();
		   
		Iterator<String> iterator = mtfRequest.getFileNames();
		   
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		File file = new File(filePath);
		   
		if (!file.exists())
		     file.mkdirs(); 
		   while (iterator.hasNext()) {
		     multipartFile = mtfRequest.getFile(iterator.next());
		     
		     if (!multipartFile.isEmpty()) {
		    	 
		       originalFileName = multipartFile.getOriginalFilename();
		       originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		   storedFileName = String.valueOf(CommonUtils.getRandomString()) + originalFileExtension;
		   file = new File(String.valueOf(filePath) + storedFileName);
		   
		   multipartFile.transferTo(file);
		   
		   String str = String.valueOf(filePath) + storedFileName;
		   
		   this.logger.info("------------- file start -------------");
		   this.logger.info("name : " + multipartFile.getName());
		   this.logger.info("src value : " + src);
		   this.logger.info("filePath : " + str);
		   this.logger.info("originFileName : " + originalFileName);
		   this.logger.info("storedFileName : " + storedFileName);
		   this.logger.info("fileSize : " + multipartFile.getSize());
		   this.logger.info("-------------- file end --------------\n");
		 
		   }
       } 
       String safeFile = String.valueOf(filePath) + storedFileName;
       
       FileVO vo = new FileVO();
       vo.setFileNm(originalFileName);
       vo.setFileTitle(storedFileName);
       vo.setFilePath(safeFile);
       vo.setFileSize(multipartFile.getSize());
       
       this.fileService.insertFile(vo);
       int fileSeq = 0;
       fileSeq = this.fileService.selectFileSeq(vo);
       
       try {
         mf.transferTo(new File(safeFile));
       } catch (IllegalStateException e) {
         e.printStackTrace();
       } catch (IOException e) {
         e.printStackTrace();
       } 
       mv.addObject("fileSeq", Integer.valueOf(fileSeq));
       mv.addObject("OriginalFileName", originalFileName);
       mv.addObject("result", result);
       mv.setViewName("jsonView");
       return mv;
     }
     
     //파일을 다운로드한다.
     @RequestMapping("/file/ajaxFileDown.do")
     public void fileDown(@ModelAttribute FileVO fileVO, ModelMap model, HttpServletRequest request,
          HttpServletResponse response, HttpSession session) throws Exception {

        String fileId =  "" + request.getParameter("fileId");
        String fileNm =  "" + request.getParameter("fileNm");

         String path = fileService.selectFilePath( fileVO );
        
         File file = new File(path);
         
         String userAgent = request.getHeader("User-Agent");
         boolean ie = userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("rv:11") > -1;
         String fileName = null;
         
         if (ie) {
            fileName = URLEncoder.encode( fileNm , "utf-8");
         } else {
            fileName = new String(fileNm.getBytes("utf-8"),"iso-8859-1");
         }
         
         response.setContentType("application/octet-stream");
         response.setHeader("Content-Disposition","attachment;filename=\"" +fileName+"\";");
         
         FileInputStream fis=new FileInputStream(file);
         BufferedInputStream bis=new BufferedInputStream(fis);
         ServletOutputStream so=response.getOutputStream();
         BufferedOutputStream bos=new BufferedOutputStream(so);
         
         byte[] data=new byte[2048];
         int input=0;
         while((input=bis.read(data))!=-1){
            bos.write(data,0,input);
            bos.flush();
         }
         
        if(bos!=null) bos.close();
        if(bis!=null) bis.close();
        if(so!=null) so.close();
        if(fis!=null) fis.close();
        
     }
     
     @RequestMapping(value = "/file/ajaxfileDelete.do")
     public ModelAndView ajaxfileDelete(@ModelAttribute FileVO fileVO, ModelAndView mv,
           HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        
        String result = "OK";      
        
        int seq = Integer.parseInt(request.getParameter("seq"));
        logger.info("=====seq====" + seq );
        
        fileVO.setSeq(seq);
        
        try {
           fileService.fileDelete(fileVO);
           
           
        } catch (Exception e) {
           result = "FAIL";
           logger.debug("ajaxfileDelete=====================> Error" + e);
        }
        mv.addObject("result", result);
        mv.setViewName("jsonView");
        return mv;
     }


}
