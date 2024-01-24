package com.dna.hiveworks;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class HiveWorksApplication {

	public static void main(String[] args) {
		SpringApplication.run(HiveWorksApplication.class, args);
	}

}
