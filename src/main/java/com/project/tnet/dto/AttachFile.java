package com.project.tnet.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttachFile {
	private int file_no;
	private String file_name_org;
	private String file_name_real;
	private long length;
	private String content_type;
	private int board_id;
	private String token;
	
	// static of함수로 매개변수를 받을 수 있도록 만듦.	
	public static AttachFile of(String token, String real_filename, MultipartFile file) {
		return AttachFile.builder()
				.file_name_org(file.getOriginalFilename())
				.file_name_real(real_filename)
				.content_type(file.getContentType())
				.length(file.getSize())
				.token(token)
				.build();
	}
}
