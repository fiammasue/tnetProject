package com.project.tnet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.MemberDAO;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.dto.NoticeDTO;
import com.project.tnet.exception.ExistMemberException;
import com.project.tnet.exception.NotExistMemberException;

@Service
public class MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;


	public MemberVO findByEmail(String email) {
		return memberDAO.findByEmail(email);
	}
	
	public void insertMember(MemberVO memberVO) throws Exception {
		try {
			if (memberVO == null ||
				Objects.isNull(memberVO.getEmail())) {
				throw new Exception("아이디는 필수 정보입니다");
			} else if (Objects.isNull(memberVO.getOauth()) && Objects.isNull(memberVO.getPwd())) {
				throw new Exception("비밀번호는 필수 정보입니다");
			}
			MemberVO existMember = memberDAO.findByEmail(memberVO.getEmail());
			if (existMember != null && !Objects.isNull(memberVO.getEmail())) {
				throw new ExistMemberException(memberVO.getEmail());
			}
			//비밀번호는 null일경우(카카오API가 아닌 자체 회원가입일 진행한 경우)에만 암호화 한다
			if (Objects.isNull(memberVO.getOauth())) {
				memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
			}
			memberDAO.insertMember(memberVO);	
			System.out.println(memberVO);
		} catch (Exception ex) {
//			ex.printStackTrace();
			throw ex;
		}
	}
	
	public boolean updateMember(MemberVO memberVO)  {
		try {
			if (memberVO == null || Objects.isNull(memberVO.getEmail())) {
				throw new Exception("아이디는 필수 정보입니다");
			} else if (Objects.isNull(memberVO.getPwd())) {
				throw new Exception("비밀번호는 필수 정보입니다");
			}
			MemberVO existMember = memberDAO.findByEmail(memberVO.getEmail());
			if (existMember == null || Objects.isNull(memberVO.getEmail())) {
				throw new NotExistMemberException(memberVO.getEmail());
			}
			
			//비밀번호 암호화 한다
			memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
			
			memberDAO.updateMember(memberVO);
			
			memberVO.setRole(existMember.getRole());
			
			return true;
		} catch (Exception ex) {
//			ex.printStackTrace();
			return false;
		}
	}

	public Map<String, Object> GetList(MemberVO member) {
		System.out.println("회원 전체 목록 서비스");
		
		//1. 전체 건수를 얻는다
		member.setTotalCount(memberDAO.totalcount());
		
		Map<String, Object> map = new HashMap<>();
		map.put("member", member);
		System.out.println("member : "+ member );
		List<MemberVO> list = memberDAO.getMemberList(member);
		System.out.println(list);
		map.put("list", list);
		
		return map;
	}
	
}