package com.project.tnet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling //해당 어노테이션이 있어야 스케줄링에 관한 어노테이션을 찾아서 스레드로 동작시킬 수 있다. 
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class TnetProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TnetProjectApplication.class, args);
	}

}
