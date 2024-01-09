package com.dna.hiveworks.common;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class ErrorTestController {
	
	@GetMapping("/test-503")
	public void handleTest503() {
		throw new ResponseStatusException(HttpStatus.SERVICE_UNAVAILABLE,"Service Unavailable");
	}
	
	@GetMapping("/test-500")
	public void handleTest500() {
		throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,"Internal Server Error");
	}
}
