package com.bsps;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@MapperScan("com.bsps")
@ComponentScan("com.bsps")
public class BspsApplication {
	public static void main(String[] args) {
		SpringApplication.run(BspsApplication.class, args);
	}
}
