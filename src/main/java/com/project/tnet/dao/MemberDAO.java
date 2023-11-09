package com.project.tnet.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.tnet.dto.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {

	public int updateMemberLastLogin(String email);
	public MemberVO findByEmail(String email);
	public void loginCountInc(MemberVO member);
	public void loginCountClear(String email);
	public void insertMember(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
	
}

