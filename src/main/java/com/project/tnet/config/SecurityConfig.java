package com.project.tnet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.project.tnet.config.auth.AuthFailureHandler;
import com.project.tnet.config.auth.AuthSucessHandler;
import com.project.tnet.config.auth.PrincipalDetailsService;


@Configuration
@EnableWebSecurity // 시큐리티 필터 등록
@EnableGlobalMethodSecurity(prePostEnabled = true) 
// 특정 페이지에 특정 권한이 있는 유저만 접근을 허용할 경우 권한 및 
// 인증을 미리 체크하겠다는 설정을 활성화한다.
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private PrincipalDetailsService principalDetailsService;
	@Autowired
	private AuthSucessHandler authSucessHandler;
	@Autowired
	private AuthFailureHandler authFailureHandler;
	
	// BCryptPasswordEncoder는 Spring Security에서 제공하는 비밀번호 암호화 객체 (BCrypt라는 해시 함수를 이용하여 패스워드를 암호화 한다.)
	// 회원 비밀번호 등록시 해당 메서드를 이용하여 암호화해야 로그인 처리시 동일한 해시로 비교한다.
	// 의존성 주입을 위한 함수를 Bean 객체로 리턴할 수 있게 함수를 구현한다 
	@Bean
	public BCryptPasswordEncoder encryptPassword() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public HttpFirewall defaultHttpFirewall() {
		return new DefaultHttpFirewall();
	}

	@Override
	public void configure(WebSecurity web) throws Exception{ 
		web.httpFirewall(defaultHttpFirewall());
	}
	
	// 시큐리티가 로그인 과정에서 password를 가로챌때 해당 해쉬로 암호화해서 비교한다.
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		                                       //아래 부분은 의존성 주입 함수를 호출함        
		auth.userDetailsService(principalDetailsService).passwordEncoder(encryptPassword());
	}
	
	//url 설정 
	@Override
    protected void configure(HttpSecurity http) throws Exception {
		
        http.csrf().disable()	// csrf 토큰을 비활성화
        	.authorizeRequests() // 요청 URL에 따라 접근 권한을 설정
			.antMatchers("/", "/auth/**", "/api/auth/**", "/scripts/**","/styles/**","/assets/**", "/**").permitAll() // 해당 경로들은 접근을 허용
			 //여러개의 권한 중 하나라도 있으면 성공 
			.antMatchers("/manager/**").hasAnyAuthority("ROLE_MANAGER","ROLE_ADMIN") //MANAGER, ADMIN 권한만 허가 됨 
			.antMatchers("/admin/**").hasAnyAuthority("ROLE_ADMIN") //ADMIN 권한만 허가  
			.anyRequest() // 다른 모든 요청은
			.authenticated() // 인증된 유저만 접근을 허용
		.and()
			.formLogin() // 로그인 폼은
			.usernameParameter("username")	// 이거 해주면 뭐가 다르나?
            .passwordParameter("password")	// 이거 해주면 뭐가 다르나?
			.loginPage("/") // 해당 주소로 로그인 페이지를 호출한다. ajax로 구현하면 이거 필요없지않나?
			.loginProcessingUrl("/auth/login.do") // 해당 URL로 요청이 오면 스프링 시큐리티가 가로채서 로그인처리를 한다. -> loadUserByName
			.successHandler(authSucessHandler) // 성공시 요청을 처리할 핸들러
			.failureHandler(authFailureHandler) // 실패시 요청을 처리할 핸들러
		.and()
			.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout.do")) // 로그아웃 URL
		    .logoutSuccessUrl("/") // 성공시 리턴 URL
		    .invalidateHttpSession(true) // 인증정보를 지우하고 세션을 무효화
		    .deleteCookies("JSESSIONID") // JSESSIONID 쿠키 삭제
			.permitAll()
		.and()
        	.sessionManagement()
            .maximumSessions(1) // 세션 최대 허용 수 1, -1인 경우 무제한 세션 허용
            .maxSessionsPreventsLogin(false) // true면 중복 로그인을 막고, false면 이전 로그인의 세션을 해제
            .expiredUrl("/auth/loginForm.do?error=true&exception=Have been attempted to login from a new place. or session expired")  // 세션이 만료된 경우 이동 할 페이지를 지정
        .and()
	        .and().rememberMe() // 로그인 유지
	        .alwaysRemember(false) // 항상 기억할 것인지 여부
	        .tokenValiditySeconds(43200) // in seconds, 12시간 유지
	        .rememberMeParameter("remember-me");
    }
	
//	public static void main(String [] args) {
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		System.out.println("user1@aaa.com->[" + encoder.encode("123456"));
//		System.out.println("j100642@hanmail.net->[" + encoder.encode("1234"));
//	}
}
