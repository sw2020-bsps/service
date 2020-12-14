package com.bsps.common.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bsps.common.interceptor.AdminInterceptor;
import com.bsps.common.interceptor.LoggerInterceptor;
import com.bsps.common.interceptor.LoginInterceptor;
import com.bsps.common.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	private LoginInterceptor loginInterceptor;
	@Autowired
	private LoggerInterceptor loggerInterceptor;
	@Autowired
	private AdminInterceptor adminInterceptor;
	@Autowired
	private MemberInterceptor memberInterceptor;
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
        		.addPathPatterns("/**")
                .excludePathPatterns("/main", "/beans", "/beans/picture/**", "/beans/**")
        		.excludePathPatterns("/member/form", "/login", "/login/form", "/login/check")
        		.excludePathPatterns("/error", "/error/**")
				.excludePathPatterns("/css/**", "/fonts/**", "/plugin/**",
			 			 			 "/scripts/**", "/images/**", "/js/**",
			 			 			 "/favicon.ico", "/js/swiper.min.js.map");
        
        registry.addInterceptor(loggerInterceptor)
        		.addPathPatterns("/**")
				.excludePathPatterns("/css/**", "/fonts/**", "/plugin/**",
			 			 			 "/scripts/**", "/images/**", "/js/**",
			 			 			 "/favicon.ico", "/js/swiper.min.js.map");
    
        registry.addInterceptor(adminInterceptor)
        		.addPathPatterns("/beans", "/beans/*/form", "/beans/form")
				.excludePathPatterns("/error", "/error/**")
				.excludePathPatterns("/css/**", "/fonts/**", "/plugin/**",
			 			 			 "/scripts/**", "/images/**", "/js/**",
			 			 			 "/favicon.ico", "/js/swiper.min.js.map");
				
        registry.addInterceptor(memberInterceptor)
        		.addPathPatterns("/payment", "/payment/**", "/order/**", "/cart")
        		.addPathPatterns("/ordersheet", "/ordersheet/**")
        		.addPathPatterns("/member", "/member/**")
				.excludePathPatterns("/error", "/error/**")
				.excludePathPatterns("/css/**", "/fonts/**", "/plugin/**",
			 			 			 "/scripts/**", "/images/**", "/js/**",
			 			 			 "/favicon.ico", "/js/swiper.min.js.map");
	}
}
