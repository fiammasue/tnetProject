package com.project.tnet.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tnet.dao.FileTokenDAO;
import com.project.tnet.dto.FileTokenVO;


@Service
public class FileTokenService {

	@Autowired
	private FileTokenDAO fileTokenDAO;

	@Transactional
	public String getToken() {
		//token은 UUID 문자열?로 생성한다. WHY? -? 유일성이 있다. 한번 생성되면 변경할 수 없다. 		
		final String token = UUID.randomUUID().toString(); 
		fileTokenDAO.insert(token); //UUID로 token을 생성하자마 DB에 insert한다.
		
		return token;
	}
	
	@Transactional
	public int updateUseStatus(String token) {
		FileTokenVO fileTokenVO = new FileTokenVO(token, 1);
		
		return fileTokenDAO.updateStatus(fileTokenVO);
	}

}