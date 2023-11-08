package com.project.tnet.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.Board;

@Mapper
public interface BoardDAO {

	int totalcount();

	List<Board> getBoardList(Board board);

	
	//마이페이지 본인 게시글 모집중리스트
	//public List<Board> getKanbanList(Member loginMember) throws Exception;
	
}
