package com.dna.hiveworks.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

@Component
public class WebServerCustomConfig implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory>{

	 @Override
	    public void customize(ConfigurableServletWebServerFactory factory) {
	        ErrorPage custom404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/not-found");
	        
	        factory.addErrorPages(custom404Page);
	        
	    }
}
