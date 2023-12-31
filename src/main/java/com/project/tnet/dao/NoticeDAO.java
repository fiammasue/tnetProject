package com.project.tnet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {

	int totalcount();

	List<NoticeDTO> getNoticeList(NoticeDTO notice);

	int deleteAll();

	int deleteAll(NoticeDTO notice);

	NoticeDTO getDetail(NoticeDTO notice);

	int fixAll(NoticeDTO notice);
	
	int nonefixAll(NoticeDTO notice);

	int update(NoticeDTO notice);

	int insert(NoticeDTO notice);

	//메인페이지 공지사항 jQuery 자동롤링배너 
	public List<NoticeDTO> selectNoticeTOP5();
}
