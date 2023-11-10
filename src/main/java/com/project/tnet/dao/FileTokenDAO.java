package com.project.tnet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.tnet.dto.FileTokenVO;


@Mapper
@Repository
public interface FileTokenDAO {

	public int insert(String token);
	public int updateStatus(FileTokenVO fileTokenVO);
	public List<FileTokenVO> listToken();
	public int deletes(Map<String, Object> map);
	public void deleteByToken(String token);
	
}

