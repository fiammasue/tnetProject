package com.project.tnet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.tnet.dto.AttachFile;
import com.project.tnet.dto.NoticeDTO;

@Mapper
@Repository
public interface AttachFileDAO {

	public void insert(AttachFile attachFile);
	public AttachFile findById(int fileNo);
	public AttachFile findById(AttachFile attache);
//	아래 4가지 메서드(정확히는 2개 2개)에 대해서 구분이 잘 안됨.
	
	
	//게시물 완료 시 token관련 첨부 파일 목록을 얻는다  
	public List<AttachFile> getAttachFileList(String token);
	//게시물 완료 시 이전에 편집 중 삭제한 목록을 삭제한다  
	public int deleteTemplateFile(Map<String, Object> map);
	
	//스케줄러에서 임시 파일 삭제를 위한 목록(파일 삭제을 목록)을 얻는다  
	public List<AttachFile> deleteFileList(Map<String, Object> map);
	//스케줄러에서 임시 파일의 정보를 삭제을 삭제한다  
	public int deleteTokenList(Map<String, Object> map);
	
	//board_id 값 등록
	public int updateBoardId(Map<String, Object> map);
	
	//notice 첨부파일 등록
	public void notice_insert(AttachFile attache);
	
	// 파일가져오기
	public List<AttachFile> getList(NoticeDTO notice);
	
	
}

