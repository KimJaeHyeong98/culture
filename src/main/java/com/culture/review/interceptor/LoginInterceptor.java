package com.culture.review.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session = request.getSession(false);

        // 세션에 로그인 정보 없으면 로그인 페이지로 리다이렉트
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect("/login");
            return false; // 컨트롤러로 진행되지 않음
        }

        return true; // 로그인 된 경우 계속 진행
    }

}
