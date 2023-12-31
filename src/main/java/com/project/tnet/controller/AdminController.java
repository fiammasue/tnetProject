package com.project.tnet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.opencsv.CSVWriter;
import com.project.tnet.dto.AttachFile;
import com.project.tnet.dto.Board;
import com.project.tnet.dto.ChartDTO;
import com.project.tnet.dto.MemberVO;
import com.project.tnet.dto.NoticeDTO;
import com.project.tnet.service.AttachFileService;
import com.project.tnet.service.BoardService;
import com.project.tnet.service.ChartService;
import com.project.tnet.service.MemberService;
import com.project.tnet.service.NoticeService;

//각종 리스트 출력해주는 컨트롤러..
@Controller
public class AdminController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private NoticeService noticeservice;
	
	@Autowired
	private ChartService chartService;
	
	@Autowired
	private AttachFileService attachefileservice;
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	
	
	//관리자 대시보드 페이지로 가기
	@RequestMapping("/admin/home")
	public ModelAndView  GetChart(ChartDTO chart, Model model) throws Exception {
    	System.out.println("main-chart-controller");

    	ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("admin/dashboard");

		//파이차트 데이터 가져오기
		Map<String, Object> result = chartService.getChartData(chart);
		Map<String, Object> line_result = chartService.getLineChart(chart);
		
		
		System.out.println("result : " + result);
		System.out.println("line_result : " + line_result.get("line_datas"));
		modelAndView.addObject("strlist", result.get("str"));
		modelAndView.addObject("titlelist", result.get("title"));
//		modelAndView.addObject("line_data_class", line_result.get("line_data_class"));
//		modelAndView.addObject("line_data_user", line_result.get("line_data_user"));
		modelAndView.addObject("line_datas",  line_result.get("line_datas"));
		modelAndView.addObject("count", chartService.getCounts(chart));
		

		return modelAndView;		
	} 		
	
	
	//관리자 게시판 목록 페이지
	@RequestMapping("/admin/boardlist")
	public String admin_boardlist(Board board, Model model) {
		System.out.println("게시판 리스트 출력");
		System.out.println("검색 단어 : "+ board.getSearchWord());
		System.out.println("검색 종류 : "+ board.getSearch_kind());
		
		long startTime = System.currentTimeMillis();  // 메서드 시작 시간 기록

		board.getStartNo();
		board.getEndNo();
		model.addAttribute("result", boardservice.GetList(board));
		
		
		long endTime = System.currentTimeMillis();  // 메서드 종료 시간 기록
	    long elapsedTime = endTime - startTime;  // 실행 시간 계산
	    System.out.println("메서드 실행 시간: " + elapsedTime + " 밀리초");
	    
	    return "admin/board-list";
	}
	
	//관리자 공지사항 목록 페이지
	@RequestMapping("/admin/noticelist")
	public String admin_noticelist(NoticeDTO notice, Model model) {
		System.out.println("공지사항 리스트 출력");
		System.out.println("현재페이지 : " + notice.getPageNo());

		notice.getStartNo();
		notice.getEndNo();
		model.addAttribute("result", noticeservice.GetList(notice));
		return "admin/notice-list";
	}
	
	// 관리자 공지사항 상세 페이지
	@RequestMapping("/admin/detail_notice")
	public String detail_notice(NoticeDTO notice, Model model) {
		System.out.println("공지사항 상세");
		
		
		@SuppressWarnings("unchecked")
		List<AttachFile> filelist = (List<AttachFile>) attachefileservice.getFiles(notice).get("files");
		System.out.println("filelist : "+ filelist);
		if(filelist.isEmpty()) {
			model.addAttribute("attache_bool", false);
		}else{
			model.addAttribute("attache_bool", true);
			model.addAttribute("filelist", filelist );
		}
		
		model.addAttribute("notice", noticeservice.getDetail(notice).get("detail"));
		return "notice/noticeDetail";
	}
	
	// 관리자 로그인 페이지
	@RequestMapping("/admin/memberlist")
	public String admin_login(MemberVO member,  Model model) {
		System.out.println("회원 리스트 출력");
		System.out.println("현재페이지 : " + member.getPageNo());
		member.getStartNo();
		member.getEndNo();
		model.addAttribute("result", memberservice.GetList(member));
		return "admin/memberlist";
	}
	
	//관리자 공지사항 체크삭제
	@ResponseBody
	@RequestMapping("/del/notice")
	public Map<String, Object> delete(@RequestBody NoticeDTO notice) {
		System.out.println("관리자 전체 삭제");		
		System.out.println("ids" + notice.getIds());
		return noticeservice.deleteAll(notice);
	}
	
	
	//관리자 공지사항 고정
	@ResponseBody
	@RequestMapping("/fix/notice")
	public Map<String, Object> fix(@RequestBody NoticeDTO notice) {
		System.out.println("관리자 공지사항 고정");
		return noticeservice.fixAll(notice);
	}
	
	//관리자 공지사항 고정해제
	@ResponseBody
	@RequestMapping("/nonefix/notice")
	public Map<String, Object> nonefix(@RequestBody NoticeDTO notice) {
		System.out.println("관리자 공지사항 고정해제");
		return noticeservice.nonefixAll(notice);
	}
	
	
	//관리자 공지사항 수정하기
	@ResponseBody
	@RequestMapping("/update/notice")
	public Map<String, Object> update(@RequestBody NoticeDTO notice) {
		System.out.println("관리자 공지사항 수정하기");
		return noticeservice.update(notice);
	}
	
	//공지사항 등록
	@ResponseBody
	@RequestMapping("/notice/insert.do")
	public boolean insert(NoticeDTO notice, MultipartHttpServletRequest multipartRequest) throws Exception {
		System.out.println("공지사항 등록 컨트롤러 ");
		 List<AttachFile> fileList = fileProcess(multipartRequest);
		 boolean status =  noticeservice.insert (notice, fileList);
		return status;
		}
	
	//파일 업로드
	@ResponseBody
	private List<AttachFile> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		System.out.println("파일 업로드 컨트롤러");
		
		List<AttachFile> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("\\yyyy\\MM\\dd");
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String fileNameOrg = mFile.getOriginalFilename();
			String realFolder = sdf.format(now.getTime());
			
			File file = new File(CURR_IMAGE_REPO_PATH + realFolder);
			if (file.exists() == false) {
				file.mkdirs();
			}

			String fileNameReal = UUID.randomUUID().toString();
			
			//파일 저장 
			mFile.transferTo(new File(file, fileNameReal)); //임시로 저장된 multipartFile을 실제 파일로 전송

			
			fileList.add(AttachFile.builder()
					.file_name_org(fileNameOrg)
					.file_name_real(CURR_IMAGE_REPO_PATH +"\\" + realFolder + "\\" + fileNameReal)
					.length((int) mFile.getSize())
					.content_type(mFile.getContentType())
					.build()); 
			
		}
		
		System.out.println(fileList);
		return fileList;
	}	
	
	//파일 다운로드 
	@RequestMapping("/download/file/{fileNo}")
    public void downloadFile(@PathVariable int fileNo, HttpServletResponse response) throws IOException {
		AttachFile attache = new AttachFile();
		attache.setFile_no(fileNo);
		AttachFile attachFile = attachefileservice.findById(attache);

        if (attachFile != null) {
            // 파일명이 한글 또는 특수문자를 포함할 수 있으므로 인코딩을 해줍니다.
            String fileName = URLEncoder.encode(attachFile.getFile_name_org(), StandardCharsets.UTF_8.toString());

            // Content-Disposition 헤더를 설정하여 브라우저가 파일을 다운로드하도록 합니다.
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            response.setContentType("application/octet-stream");

            // 파일을 읽어와서 브라우저로 전송합니다.
            try (FileInputStream inputStream = new FileInputStream(attachFile.getFile_name_real());
                 ServletOutputStream outputStream = response.getOutputStream()) {
                IOUtils.copy(inputStream, outputStream);
            }
        }
    }
	
	// CSV파일 다운로드
	@RequestMapping(value = "/download/csvfile", method = RequestMethod.POST)
	public ResponseEntity<String> csvDown(@RequestParam("kind_of_download") String kind_of_download) throws IOException {
		System.out.println("CSV다운로드 컨트롤러");
		System.out.println("kind_of_download : "+kind_of_download);
	    Map<String, Object> result = chartService.getCSVlist(kind_of_download);
	    List<String[]> csv_data = (List<String[]>) result.get("csv");
	    String name = (String) result.get("name");

	    // CSV 데이터를 저장할 임시 파일 생성
	    Path tempFile = Files.createTempFile("temp", ".csv");

	    try (CSVWriter csvWriter = new CSVWriter(Files.newBufferedWriter(tempFile, StandardOpenOption.WRITE))) {
	        csvWriter.writeAll(csv_data);
	    }

	    // 응답 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "text/csv; charset=MS949");

        // 파일 이름을 UTF-8로 URL 인코딩
        // String encodedName = URLEncoder.encode(name, StandardCharsets.UTF_8.toString());
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + name + "\"");

        // 임시 파일을 Resource 객체로 변환
//        Resource resource = new FileSystemResource(tempFile.toFile());

        // ResponseEntity에 헤더와 Resource 설정 후 반환
        return new ResponseEntity<String>(setContent(csv_data), headers, HttpStatus.CREATED);
//        return ResponseEntity.ok()
//                .headers(headers)
//                .body(resource);
    }

	private String setContent(List<String[]> csvData) {
	    StringBuilder content = new StringBuilder();

	    // CSV 데이터를 문자열로 변환
	    for (String[] row : csvData) {
	        for (int i = 0; i < row.length; i++) {
	            content.append(row[i]);
	            if (i < row.length - 1) {
	                content.append(",");
	            }
	        }
	        content.append("\n");
	    }

	    return content.toString();
	}

}
	
	
