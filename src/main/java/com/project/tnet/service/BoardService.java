package com.project.tnet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.BoardDAO;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.City;
import com.project.tnet.dto.District;
import com.project.tnet.dto.TalentHigh;
import com.project.tnet.dto.TalentSmall;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;

	//관리자에서 게시판 리스트 출력	
	public Object GetList(Board board) {
		System.out.println("게시판 전체 목록 서비스");
		
		//1. 전체 건수를 얻는다
		board.setTotalCount(boardDAO.totalcount());
		
		Map<String, Object> map = new HashMap<>();
		map.put("board", board);
		System.out.println("board : "+ board );
		List<Board> list = boardDAO.getBoardList(board);
		System.out.println("boardList : "+list);
		map.put("list", list);
		
		return map;
	}
	
	
	//게시판 리스트 출력
	public Map<String, Object> selectBoardList(Board board){
		System.out.println("board -> "+boardDAO.getTotalCount(board));
		board.setTotalCount(boardDAO.getTotalCount(board));
		
		Map<String, Object> params = new HashMap<>();
		params.put("startNo", board.getStartNo());
		params.put("endNo", board.getEndNo());
		//재능 , 시 검색하는거 나와야함
		params.put("city_code", board.getCity_code());
		params.put("district_code", board.getDistrict_code());
		params.put("high_code", board.getHigh_code());
		params.put("low_code", board.getLow_code());
		
		Map<String, Object> result = new HashMap<>();
		result.put("board", board);
		result.put("boardList", boardDAO.selectBoardList(params));
		System.out.println("boardList ->"+boardDAO.selectBoardList(params));
		return result;
	}
	
	//게시글 삭제
	public int deleteBoard(Board board) {
		return boardDAO.deleteBoard(board);
	}
	
	//시코드 불러오기
	public List<City> getCityCodeList(){
		return boardDAO.getCityCodeList();
	}
	
	//지역 코드 불러오기
	public List<District> getDistrictByCodeList(Board board) {
		return boardDAO.getDistrictByCodeList(board);
	}
	
	//재능 대분류 코드 불러오기
	public List<TalentHigh> getTalentHighList(){
		return boardDAO.getTalentHighList();
	}
	
	//재능 소분류 코드 불러오기
	public List<TalentSmall> getTalentSmallList(Board board){
		return boardDAO.getTalentSmallList(board);
	}
	
	//게시글 하나 가져오기
	public Board getBoard(Board board) {
		return boardDAO.getBoard(board);
	}
	
	//게시글 조회수 업데이트하기
	public int updateReadCount(Board board) {
		return boardDAO.updateReadCount(board);
	}
	
	//게시글 등록 하기
	public void insertBoard(Map<String,Object> params) {
		boardDAO.insertBoard(params);
	}
	
	

}
