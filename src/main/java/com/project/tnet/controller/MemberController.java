package com.project.tnet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.KakaoProfile;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.dto.OAuthToken;
import com.project.tnet.exception.ExistMemberException;
import com.project.tnet.service.MemberService;


// 카카오로그인과 연동할 때 필요한 컨트롤러 
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
//	@GetMapping("/")
//	public String main(Model model) {
//		return "index";
//	}
	
	//로그인 양식 
	@GetMapping("/auth/loginForm.do")
	public String loginForm(Model model,
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "exception", required = false) String exception) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
//		return "member/loginForm";
		return "redirect:/";
	}
	

	//회원 가입 양식 
	@GetMapping("/auth/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	//회원 정보 수정 양식
	@GetMapping("/user/updateForm.do")
	public String updateForm() {	
		return "member/updateForm";
	}
	
	// 카카오와 연동하는 부분	시작---------------------------------------------------------------------------
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code) { // Data를 리턴해주는 컨트롤러 함수
		
		System.out.println("code: " + code);
		
		// 클라이언트에서 자바로 데이터를 요청할 수있는방법 4가지
		// POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		// Retrofit2(플러그인) 장점： Ios, Android, 스프링에서 사용할 수 있다. 
		// OkHttp(플러그인): 
		
		// RestTemplate(내장되어 있음): 스프링에서 가장 많이 사용
		RestTemplate restTemplate = new RestTemplate();
		
		// HttpHeader 오브젝트 생성(헤더로 요청)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
// ************************************ 이곳에 추가로 헤더에 대한 데이터를 요청할 수 있다. ***********************************		
		// HttpBody 오브젝트 생성(바디로 요청)
		// MultiValueMap: 여러개의 키(동일한 키)를 map으로 설정할 수 있다.
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "5837fcd202ac37e5ba6e78d6f6b575ed");
		params.add("redirect_uri", "http://127.0.0.1:8090/auth/kakao/callback");
		params.add("code", code);
// *********************************** 이곳에 추가로 바디에 대한 데이터를 요청할 수 있다. ***********************************	
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담는것은 HttpEntity이다.
		// params: body로 들어갈 data, headers: header로 들어갈 data		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		// exchange: 클라이언트에서 서버로 데이터를 전송할때 사용하는 함수.		
		//		
		ResponseEntity<String> response = restTemplate.exchange(
				"https://kauth.kakao.com/oauth/token",	//url
				HttpMethod.POST,						//전송방법:GET방식일때는 GET으로 POST방식일때는 POST로.
				kakaoTokenRequest,
				String.class							//결과데이터는 문자열로 받기때문에 String으로 선언해준다.
		);
		
		//응답 결과 body 출력
		//서버에서 응답받은 데이터는 2개(header, body)를 JSON으로 읽어온다. -> 우리는 body를 읽어서 확인해본 것이다.		
		System.out.println("https://kauth.kakao.com/oauth/token의 body = " + response.getBody());
		
		// 서버에서 받은 카카오data는 JSON형태인데 ObjectMapper를 통해 객체로 변형시킨다.		
		// Gson, Json Simple, ObjectMapper를 통해 객체를 생성할 수 있다.
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token()); //JSON으로 읽어온 data가 객체로 변경되었다.
		
		RestTemplate rt2 = new RestTemplate();
		
// ?????????????위에서 한번 해준내용을 똑같은거를 왜 1번더 해주지????????????????????????????????????????????????
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token()); //Bearer : 반드시 공백한칸이 포함되야 한다.
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class	// String으로 사용자의 상세정보가 나온다.
		);
		System.out.println("response2.getBody(): " + response2.getBody());
		
		ObjectMapper objectMapper2 = new ObjectMapper();
//	제일 전체를 카카오프로필로 만들었다.	
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
//		// User 오브젝트 : username, password, email
//		// DB에 기록하기 위해 다음 작업을 한다.		
		System.out.println("카카오 닉네임 : "+kakaoProfile.getKakao_account().getProfile().getNickname());
		System.out.println("카카오 아이디(번호) : "+kakaoProfile.getId());
		System.out.println("카카오 이메일 : "+kakaoProfile.getKakao_account().getEmail());
		System.out.println("카카오 썸네일 이미지 : "+kakaoProfile.getKakao_account().getProfile().thumbnail_image_url);
		System.out.println("카카오 연령대 : "+kakaoProfile.getKakao_account().getAge_range());
		System.out.println("카카오 성별 : "+kakaoProfile.getKakao_account().getGender());
		
// 카카오API로 로그인한 계정의 정보를 DB에 저장하지 않아도 되지만 할 수도 있다.	
		MemberVO kakaoMember = MemberVO.builder()
				.nickName(kakaoProfile.getKakao_account().getProfile().getNickname())
				.email(kakaoProfile.getKakao_account().getEmail())
				.profileImage(kakaoProfile.getKakao_account().getProfile().thumbnail_image_url)
				.age_range(kakaoProfile.getKakao_account().getAge_range())
				.gender(kakaoProfile.getKakao_account().getGender())
				.role("USER")
				.pwd("")
				.oauth("kakao")
				.build();
		
		// 가입자 혹은 비가입자 체크 해서 처리
	 	// memberService호출을 통해 DB에 기록한다.		
		try {
			
			memberService.insertMember(kakaoMember);
			System.out.println("기존 회원이 아니기에 자동 회원가입을 진행함");
		} catch (ExistMemberException e) {
			System.out.println("기존에 회원 가입된 경우 다음으로 진행함");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("자동 로그인을 진행합니다.");

//		 로그인 처리 
		PrincipalDetails principalDetails = new PrincipalDetails(kakaoMember);
		Authentication authentication = new UsernamePasswordAuthenticationToken(
				principalDetails, // 나중에 컨트롤러에서 DI해서 쓸 때 사용하기 편함.
				null, // 토큰 인증시 패스워드는 알수 없어 null 값을 전달하는 것임  
				principalDetails.getAuthorities()); //사용자가 소유한 역할 권한을 전달한다 

		// 강제로 시큐리티의 세션에 접근하여 값 저장
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
		return "redirect:/";
	}
	
	// 카카오와 연동하는 부분	끝---------------------------------------------------------------------------
}