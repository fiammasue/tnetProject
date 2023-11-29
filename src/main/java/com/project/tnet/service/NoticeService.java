
package com.project.tnet.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tnet.dao.NoticeDAO;
import com.project.tnet.dto.AttachFile;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticedao;
	@Autowired
	private AttachFileService attachefileservice;
	
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

	//공지사항 상세페이지
	public Map<String, Object> getDetail(NoticeDTO notice) {
		System.out.println("공지사항 상세 서비스");
		Map<String, Object> map = new HashMap<>();
		map.put("detail",noticedao.getDetail(notice));
		return map;
	}

	//공지사항 고정하기
	public Map<String, Object> fixAll(NoticeDTO notice) {
		System.out.println("공지사항 고정 서비스");
		int fixcount= 0;
		for(String fix_no : notice.getIds()) {
			notice.setNotice_no(Integer.parseInt(fix_no));
			if(noticedao.fixAll(notice)>0) {
				fixcount++;
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		if (fixcount> 0) {
			map.put("status", true);
			map.put("message", "총 "+fixcount+"건이 고정되었습니다.");
		}else {
			map.put("status", false);
			map.put("message", "고정에 실패했습니다");
		}
		return map;
	}
	
	
	//공지사항 고정해제하기
	public Map<String, Object> nonefixAll(NoticeDTO notice) {
		System.out.println("공지사항 고정 서비스");
		int fixcount= 0;
		for(String fix_no : notice.getIds()) {
			notice.setNotice_no(Integer.parseInt(fix_no));
			if(noticedao.nonefixAll(notice)>0) {
				fixcount++;
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		if (fixcount> 0) {
			map.put("status", true);
			map.put("message", "총 "+fixcount+"건이 고정해제되었습니다.");
		}else {
			map.put("status", false);
			map.put("message", "고정해제에 실패했습니다");
		}
		return map;
	}

	//공지사항 수정
	public Map<String, Object> update(NoticeDTO notice) {
		System.out.println("공지사항 수정하기 서비스");
		Map<String, Object> map = new HashMap<>();
		int update_count = noticedao.update(notice);
		if(update_count>0) {
			map.put("update_notice", noticedao.getDetail(notice));
			map.put("status", true);
			map.put("message", "수정되었습니다");
		}else {
			map.put("status", false);
			map.put("message", "수정에 실패하였습니다");
		}
		return map;
	}
	
	//공지사항 게시글과 파일 등록
	@Transactional
	public boolean insert(NoticeDTO notice, List<AttachFile> fileList) {
		System.out.println("공지사항 등록 서비스");
	    noticedao.insert(notice);
	    int notice_no = notice.getNotice_no();
		
		if(fileList != null) {
			for(AttachFile attachfile : fileList ) {
				attachfile.setNotice_no(notice_no);
				attachefileservice.insert_into_notice(attachfile);
			}
		}
		return true;
	}
	
	//메인페이지 공지사항 jQuery 자동롤링배너 
	public List<NoticeDTO> selectNoticeTOP5() {
		return noticedao.selectNoticeTOP5();
	}
}
