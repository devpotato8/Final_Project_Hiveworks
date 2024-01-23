package com.dna.hiveworks.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.stereotype.Component;

@Component
public class WebServerCustomConfig implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory>{

	 @Override
	    public void customize(ConfigurableServletWebServerFactory factory) {
//	        ErrorPage custom404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/not-found");
//	        ErrorPage custom500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,"/error-500");
//	        factory.addErrorPages(custom404Page,custom500Page);
	        ErrorPage customErrorPage = new ErrorPage("/error");
	        factory.addErrorPages(customErrorPage);
	    }
}
