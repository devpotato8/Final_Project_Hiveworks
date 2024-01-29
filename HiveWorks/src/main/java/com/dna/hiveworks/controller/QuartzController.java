package com.dna.hiveworks.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.dna.hiveworks.service.QuartzService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class QuartzController {
		
		private final QuartzService service;
		// 배치처리하기
		//@Scheduled(cron = "0 0 1 * * MON-FRI")  매월 1일 0시 0분에 실행되도록
		// 월-금 매월 매일 07시 00분 00초에 실행
		@Scheduled(cron = "0 0 7 ? * MON-FRI")
		public void insertQuartzWork() {
			try {
				service.insertQuartzWork(1);
			} catch (RuntimeException e) {
			}
			try {
				service.insertQuartzWork(120);
			} catch (RuntimeException e) {
			}
		}
		 // 매년 매월 매일 매시 1분마다 0초에 실행
//		@Scheduled(cron = "0 0/1 * * * MON-FRI")
//		public void insertQuartzWork() {
//			for(int i =4; i<5; i++) {
//				service.insertQuartzWork(i);
//			}
//		}
}
