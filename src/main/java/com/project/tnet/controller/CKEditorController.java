package com.project.tnet.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.tnet.config.auth.PrincipalDetails;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.service.AttachFileService;
import com.project.tnet.service.BoardService;
import com.project.tnet.service.FileTokenService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class CKEditorController {
	// 생성자를 통해 의존성을 주입하는 방법	
	private final FileTokenService fileTokenService;
	private final AttachFileService fileUploadService;
	private final BoardService boardService;
	
//	@GetMapping(value={"/ckeditorForm"})
	@RequestMapping(value={"/ckeditorForm.do"})
	public String ckeditorForm(Model model,Board board) throws IOException {
		final String token = fileTokenService.getToken();	//게시글 작성페이지로 넘어가기전에 token부터 만들어준다.
		log.debug("token = ", token);
		model.addAttribute("token", token); //UUID로 생성한 token을 JSP로 보내준다. 
		model.addAttribute("cityList", boardService.getCityCodeList());
		model.addAttribute("districtList",boardService.getDistrictByCodeList(board));
		model.addAttribute("talentHighList", boardService.getTalentHighList());
		model.addAttribute("talentSmallList", boardService.getTalentSmallList(board));
		return "board/boardWrite";
	}

	@PostMapping(value = "/imageUpload")
	@ResponseBody
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception {
    
		// ckeditor는 이미지 업로드 후 이미지 표시하기 위해 uploaded 와 url을 json 형식으로 받아야 함
		// ckeditor 에서 파일을 보낼 때 upload : [파일] 형식으로 해서 넘어옴, upload라는 키 이용하여 파일을 저장 한다
		MultipartFile file = request.getFile("upload");
		String token = request.getParameter("token");
		
		System.out.println("token = " + token);

		//이미지 첨부 파일을 저장한다 
		int file_id = fileUploadService.fileUploadProcess(token, file);
		

		// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
		String uploadPath = request.getServletContext().getContextPath() + "/files/" + file_id;

		Map<String, Object> result = new HashMap<>();
		// uploaded와 url이라는 key값으로 보내주면 jsp에서 ckfinder가 찾는다.		
		result.put("uploaded", true); // 업로드 완료
		result.put("url", uploadPath); // 업로드 파일의 경로

		return result;
	}
	// TODO : 추후 작업을 해야  하는 것은 아래 설명 함 
	// 만약 게시글 작성 중 서버에 이미지를 업로드한 후 작성중인 게시글을 저장하지 않고 취소 하고 나가는 경우 업로드한 이미지가 존재하게 된다 
	// 이런 경우 발생하면 서버에 의미 없어 업로드된 이미지가 존재하게 된다  
	// token 값은 시작시 발급 받고 
	// 이미지 저장 시 token 값도 같이 이미지 저장시 사용한다.
	// 최종으로 작업이 완료될 때 token을 이용 마무리 작업을 처리한다 
	// 만약 마지막 작업이 완료 되지 않은 경우 스토리지 서버에 저장된 파일을 삭제 할 수 있게 구현 해야 한다(현재는 사용하지 않음)
	@PostMapping(value = "/ckeditorWrite")
	@ResponseBody
	public Map<String, Object> ckeditorWrite(@RequestBody Map<String, Object> param,Authentication authentication) throws Exception {
		
		// jsp에서 불러온 data가 정상적으로 컨트롤러로 넘어왔는지 확인하기 위해 출력문으로 찍어봄.		
		System.out.println(param);
		
		//실제 전달된 값을 서버에 저장 하면 됨 
		//현재는 구현하지 않고 로그로 출력함 함
		//해당 token값만 디비에  상태 변경함  
		//boardInser할때 boardNum -> 
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			MemberVO member= (MemberVO)userDetails.getUser();
			param.put("writer_nickname",member.getNickName());
		}
		
		
		
		
		boardService.insertBoard(param);
		System.out.println("param 값을 넣고 난후  -> "+ param);
		
		fileUploadService.updateUseStatus(param);//boardId
		
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료

		return result;
	}
	
	
}
