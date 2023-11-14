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

	//관리자 공지사항 체크 삭제
	public Map<String, Object> deleteAll(NoticeDTO notice) {
		int delcount= 0;
		for(String del_no : notice.getIds()) {
			notice.setNotice_no(Integer.parseInt(del_no));	
			System.out.println("입력 노티스 번호 : "+ del_no );
			if(noticedao.deleteAll(notice)>0) {
				delcount++;
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		if (delcount> 0) {
			map.put("status", true);
			map.put("message", "총 "+delcount+"건이 삭제되었습니다.");
		}else {
			map.put("status", false);
			map.put("message", "삭제에 실패했습니다");
		}
		return map;
	}

	public Map<String, Object> getDetail(NoticeDTO notice) {
		System.out.println("공지사항 상세 서비스");
		Map<String, Object> map = new HashMap<>();
		map.put("detail",noticedao.getDetail(notice));
		return map;
	}
	

}
