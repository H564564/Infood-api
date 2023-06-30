package com.infood.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.infood.demo","com.infood.model","com.infood.repository","com.infood.service","com.infood.controller"})
@EntityScan({"com.infood.demo","com.infood.model","com.infood.repository","com.infood.service"})

public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
