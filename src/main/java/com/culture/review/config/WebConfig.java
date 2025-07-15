package com.culture.review.config;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.culture.review.interceptor.LoginInterceptor;

public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/account/**", "/mypage", "/goodpage") // 보호할 경로
                .excludePathPatterns("/login", "/logindo", "/logoutdo", "/joinMembership", "/resources/**");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/posters/**")
                .addResourceLocations("file:///C:/KJH/upload/posters/");
    }
}
