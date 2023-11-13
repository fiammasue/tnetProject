package com.project.tnet.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.tnet.dao.AttachFileDAO;
import com.project.tnet.dao.FileTokenDAO;
import com.project.tnet.dto.AttachFile;
import com.project.tnet.dto.FileTokenVO;


@Service
@PropertySource("classpath:application.properties")
public class AttachFileService {
	
	@Value("${spring.servlet.multipart.location}")
	private String CURR_IMAGE_REPO_PATH;

	@Autowired
	private FileTokenDAO fileTokenDAO;
	
	@Autowired
	private AttachFileDAO attachFileDAO;
	
	@Autowired
	private ServletContext application;

	//파일 저장
	public int fileUploadProcess(String token, MultipartFile file) throws Exception {
		Calendar now = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat(File.separator + "YYYY" + File.separator + "MM" + File.separator + "dd");
		 HashMap<String, String> map = new HashMap<>();
		String realFolder = format.format(now.getTime());
		
		File realPath = new File(CURR_IMAGE_REPO_PATH + realFolder);
		
		if(!realPath.exists()) {
			realPath.mkdirs();
		}
		String fileNameReal = UUID.randomUUID().toString();
		File realFile = new File(realPath, fileNameReal);
		
		file.transferTo(realFile);

		AttachFile attachFile = AttachFile.of(token, realFile.getAbsolutePath(), file); 

		attachFileDAO.insert(attachFile);
		
		return attachFile.getFile_no();
	}
	
	public AttachFile findById(int file_id) {
		return attachFileDAO.findById(file_id);
	}

	@Transactional
	public void updateUseStatus(Map<String, Object> param) {
		// 실제 DB에 저장될 data		
		String token = (String) param.get("token");
		String editor = (String) param.get("contents");
		int board_id = (int)param.get("board_id");

		//파일 다운로드  URL을 구성한다
		String filesURL = application.getContextPath() + "/files/";
		
		//token 관련 첨부 파일 목록을 얻는다 
		List<AttachFile> attachFiles = attachFileDAO.getAttachFileList(token);
		List<AttachFile> deleteImageList = attachFiles.stream().filter(
			attachFile -> !editor.contains(filesURL + attachFile.getFile_no())
		).toList();

		//편집 중 삭제된 이미지를 삭제한다
		deleteImageList.stream().forEach(attachFile -> new File(attachFile.getFile_name_real()).delete());
		
		
		//첨부 파일의 token사용 상태로 변경한다
		fileTokenDAO.updateStatus(FileTokenVO.builder().token(token).status(1).build());
		
		updateBoard(param);
		
		//Map.of 에는  key와 value를 최대 10개 까지 넣을 수 있는 메소드를 지원한다. -> 교수님은 왜 map.put으로 안해주고 왜 map.of로 했을까?
		//게시물 완료 시 이전에 편집 중 삭제한 목록을 삭제한다 -> 이걸하기 위해 map.put 대신에 Map.of를 사용해준건가!?
		if(deleteImageList.size() != 0) {
			attachFileDAO.deleteTemplateFile(Map.of("list", deleteImageList));
		}

	}
	//첨부파일 board_id등록하기
	public int updateBoard(Map<String, Object> map) {
		
		
		return attachFileDAO.updateBoardId(map);
	}

}