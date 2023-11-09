package com.project.tnet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.project.tnet.dto.AttachFile;
import com.project.tnet.service.AttachFileService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FileDownloadController {
	private final AttachFileService attachFileService;

	@GetMapping("/files/{fileNo}")
	public void downloadFile(@PathVariable("fileNo") int fileNo, HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		
		AttachFile attachFile = attachFileService.findById(fileNo);
		
		if (attachFile == null) {
			response.setStatus(404);
		} else {
			
			String originName = attachFile.getFile_name_org();
			originName = URLEncoder.encode(originName, "UTF-8");
			//다운로드 할 때 헤더 설정
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName="+originName);
			response.setContentLength((int)attachFile.getLength());
			response.setContentType(attachFile.getContent_type());
			
			//파일을 바이너리로 바꿔서 담아 놓고 responseOutputStream에 담아서 보낸다.
			FileInputStream input = new FileInputStream(new File(attachFile.getFile_name_real()));
			
			//outputStream에 8k씩 전달
	        byte[] buffer = new byte[1024*8];
	        
	        while(true) {
	        	int count = input.read(buffer);
	        	if(count<0)break;
	        	out.write(buffer,0,count);
	        }
	        input.close();
	        out.close();
		}
	}	
}
