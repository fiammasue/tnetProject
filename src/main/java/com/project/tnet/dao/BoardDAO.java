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

	int totalcount();

	List<Board> getBoardList(Board board);

	
	
	
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
	
	//게시글 등록
	public void insertBoard(Map<String, Object> params);
	
	//수강등록을 위한 게시글 정보 가져오기
	public Board getCourseBoard(Board board);
	
	//수강등록을 위한 게시글 정보 가져오기
	public int updateBoardStatus(Board board);
	
	//제목 출력을 위한 게시글 정보 가져오기
	public Board selectBoard(int board_id);
	
	//메인페이지 재능 게시글 TOP6조회
	public List<Board> selectBoardTOP6();
	
	// 아이콘에서 선택한 재능을 가르칠과목으로 TOP6로 정렬시킴.
	public List<Board> selectTeachersTOP6(String give_talent);
}
