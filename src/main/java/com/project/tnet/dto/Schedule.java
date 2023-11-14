package com.project.tnet.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Schedule {

	private int schedule_id;
	private int course_id;	
	private String schedule_title;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
    private Timestamp start_date;  

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
    private Timestamp end_date;
	
	private String schedule_color;
	
}
