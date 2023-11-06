package com.project.tnet.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.tnet.dao.MemberDAO;
import com.project.tnet.dto.MemberVO;


@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("PrincipalDetailsService : 진입");
		MemberVO member = memberDAO.findByEmail(username);
		
		System.out.println("PrincipalDetailsService : member -> " + member);

		return new PrincipalDetails(member);
	}
}
