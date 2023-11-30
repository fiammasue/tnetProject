package com.project.tnet.config.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.project.tnet.dao.MemberDAO;



@Component
public class AuthSucessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
    public void onAuthenticationSuccess(
    		HttpServletRequest request
    		, HttpServletResponse response
    		, Authentication authentication //로그인한 사용자 정보가 있는 객체 
    		) throws IOException, ServletException {
        
//		memberDAO.updateMemberLastLogin(authentication.getName());
		memberDAO.loginCountClear(authentication.getName());
		
		System.out.println("authentication 티넷>>>" + authentication);
		
		  String url = "/";
		  String successMessage = "로그인되었습니다."; // 기본적인 성공 메시지

	      System.out.println(">>>>권한 체크 = " + authentication.getAuthorities().toString());
	      for (GrantedAuthority authority : authentication.getAuthorities()) {
	          if (authority.getAuthority().contains("ADMIN")) {
	            System.out.println(">>>관리자 로그인");
	            url = "/admin/home";
	         } else {
	            
	         }
	      }
	      
	      // 성공 메시지를 세션에 저장
	        request.getSession().setAttribute("loginSuccessMessage", successMessage);
	        
        setDefaultTargetUrl(url);
        
        super.onAuthenticationSuccess(request, response, authentication);
    }
	
}
