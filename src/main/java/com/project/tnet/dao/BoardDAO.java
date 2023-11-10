package com.project.tnet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.Board;
import com.project.tnet.dto.City;
import com.project.tnet.dto.District;
import com.project.tnet.dto.TalentHigh;
import com.project.tnet.dto.TalentSmall;

@Mapper
public interface BoardDAO {

	
	//마이페이지 본인 게시글 모집중리스트
	//public List<Board> getKanbanList(Member loginMember) throws Exception;
	
	
	//게시글 리스트 출력
	public List<Board> selectBoardList(Map<String, Object> params);
	
	//게시글 삭제
	public int deleteBoard(Board board);
	
	//시코드 가져오기
	public List<City> getCityCodeList();

	//지역구 코드 가져오기 시코드에 따른
	public List<District> getDistrictByCodeList(Board board);

	//재능 대분류 코드 가져오기
	public List<TalentHigh> getTalentHighList();

	//재능 소분류코드 가져오기
	public List<TalentSmall> getTalentSmallList(Board board);
	
	//게시글 총 갯수
	public Integer getTotalCount(Board board);
	
	//게시글 하나 가져오기
	public Board getBoard(Board board);
	
	//게시글 조회수 업데이트
	public int updateReadCount(Board board);
}
