package com.project.tnet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.NoticeDAO;
import com.project.tnet.dto.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticedao;
	
	//전체 페이지 목록 데려오기
	public Map<String, Object> GetList(NoticeDTO notice){
		System.out.println("공지사항 전체 목록 서비스");
		
		//1. 전체 건수를 얻는다
		notice.setTotalCount(noticedao.totalcount());
		
		Map<String, Object> map = new HashMap<>();
		map.put("notice", notice);
		System.out.println("notice : "+ notice );
		List<NoticeDTO> list = noticedao.getNoticeList(notice);
		System.out.println(list);
		map.put("list", list);
		
		return map;
	}
	

}
