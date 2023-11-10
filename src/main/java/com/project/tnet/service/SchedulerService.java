package com.project.tnet.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tnet.dao.AttachFileDAO;
import com.project.tnet.dao.FileTokenDAO;
import com.project.tnet.dto.AttachFile;
import com.project.tnet.dto.FileTokenVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchedulerService {
	private final FileTokenDAO fileTokenDAO;
	private final AttachFileDAO attachFileDAO;
	
	// fixedDelay: 1/1000초 주기이므로 1초보다 작은 단위를 설정할 수 있다.	
	@Scheduled(fixedDelay = 60000) // 60초마다 실행
	public void run2() {
		System.out.println("60초마다 실행");
	}
	
	//Cron 표현식을 사용하여 작업을 예약할 수 있다.*******************************************************
	/*
	총 6가지 항목이 들어갈 수 있다.
	첫 번째 * 부터
	초(0-59)
	분(0-59)
	시간(0-23)
	일(1-31)
	월(1-12)
	요일(0-6) (0: 일, 1: 월, 2:화, 3:수, 4:목, 5:금, 6:토)
	Spring @Scheduled cron은 6자리 설정만 허용하며 연도 설정을 할 수 없다.
	
	예: (0 * * * * *) : 0초마다 계속 돈다는 뜻이다. / (* 1 * * * *) : 1분마다 계속 돈다는 뜻이다.
	   
	Cron 표현식 :
		* : 모든 조건(매시, 매일, 매주처럼 사용)을 의미
		? : 설정 값 없음 (날짜와 요일에서만 사용 가능)
		- : 범위를 지정할 때
		, : 여러 값을 지정할 때
		/ : 증분값, 즉 초기값과 증가치 설정에 사용
		L : 마지막 - 지정할 수 있는 범위의 마지막 값 설정 시 사용 (날짜와 요일에서만 사용 가능)
		W : 가장 가까운 평일(weekday)을 설정할 때
	 */
	// 매일 오전 04시에 실행
	@Scheduled(cron = "0 0 04 * * *") 
	public void run3() {
		System.out.println("매일 오전 04시에 실행");
	}
	 
	// 매달 10일,20일 04시에 실행
	//,(콤마)를 사용하면 같은 단위를 반복해서 설정할 수 있다.	
	// 	? : 설정 값 없음 (날짜와 요일에서만 사용 가능)	
	@Scheduled(cron = "0 0 04 10,20 * ?") 
	public void run4() {
		System.out.println("매달 10일,20일 04시에 실행");
	}
	 
	// 매달 마지막날 04시에 실행 (예: 월결산작업을할 때 사용할 수 있다.)
	@Scheduled(cron = "0 0 04 L * ?") 
	public void run5() {
		System.out.println("매달 마지막날 04시에 실행");
	}
	 
	// 1시간 마다 실행 ex) 01:00, 02:00, 03:00 ...
	// / : 증분값, 즉 초기값과 증가치 설정에 사용	
	@Scheduled(cron = "0 0 0/1 * * *") 
	public void run6() {
		System.out.println("1시간 마다 실행");
	}
	 
	// 매일 9시00분-9시55분, 18시00분-18시55분 사이에 5분 간격으로 실행
	// 예: 출퇴근 1시간 동안 동작하도록 배치성프로그램을 만들고 싶을 때 사용하면 된다.
	@Scheduled(cron = "0 0/5 9,18 * * *") 
	public void run7() {
		System.out.println("매일 9시00분-9시55분, 18시00분-18시55분 사이에 5분 간격으로 실행");
	}
	 
	// 매일 9시00분-18시55분 사이에 5분 간격으로 실행
	// 	- : 범위를 지정할 때	
	@Scheduled(cron = "0 0/5 9-18 * * *") 
	public void run8() {
		System.out.println("매일 9시00분-18시55분 사이에 5분 간격으로 실행");
	}
	 
	// 매달 1일 10시30분에 실행
	@Scheduled(cron = "0 30 10 1 * *") 
	public void run9() {
		System.out.println("// 매달 1일 10시30분에 실행");
	}
	 
	// 매년 3월내 월-금 04시30분에 실행
	// ? : 설정 값 없음 (날짜와 요일에서만 사용 가능)	
	// - : 범위를 지정할 때	
	@Scheduled(cron = "0 30 04 ? 3 1-5") 
	public void run10() {
		System.out.println("매년 3월내 월-금 04시30분에 실행");
	}
	 
	// 매달 마지막 토요일 10시30분에 실행
	@Scheduled(cron = "0 30 10 ? * 6L") 
	public void run11() {
		System.out.println("매달 마지막 토요일 10시30분에 실행");
	}
	//*******************************************************************************************	
	
	@Transactional
	@Scheduled(fixedDelay = 60000) // 60초마다 실행 
	public void fileTokenAutoDelete() {
		System.out.println("첨부 파일 업로드 중 완료되지 않음 파일을 삭제한다");
		List<FileTokenVO> fileTokenList = fileTokenDAO.listToken();
		if (fileTokenList.size() != 0) {
			System.out.println("fileTokenList : " + fileTokenList);
			Map<String, Object> map = Map.of("list", fileTokenList);
			System.out.println("map : " + map);
			List<AttachFile> attachFileList = attachFileDAO.deleteFileList(map);
			for (AttachFile attachFile : attachFileList) {
				System.out.println("삭제 파일 : " + attachFile.getFile_name_real());
				new File(attachFile.getFile_name_real()).delete();
			}
			attachFileDAO.deleteTokenList(map);
			fileTokenDAO.deletes(map);
		}
	}
	
}
