package com.project.tnet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.tnet.dto.Board;


@Mapper
public interface BoardDAO {

	int totalcount();

	List<Board> getBoardList(Board board);

	
	
}
