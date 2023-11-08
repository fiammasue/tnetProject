package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {

	int totalcount();

	List<NoticeDTO> getNoticeList(NoticeDTO notice);

}
