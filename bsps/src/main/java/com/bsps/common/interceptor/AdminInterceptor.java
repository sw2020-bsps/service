package com.bsps.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bsps.member.Member;

@Component
public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		if (null != member) {
			if (request.getMethod().equals("GET")) {
				if (request.getRequestURI().equals("/beans")) {
					return true;
				} else {
					if ('A' == member.getType()) {
						return true;
					} else {
						response.sendRedirect("/main");
						return false;
					}
				}
			}
			
			if (request.getMethod().toUpperCase().equals("POST") ||
				request.getMethod().toUpperCase().equals("PUT") ||
				request.getMethod().toUpperCase().equals("DELETE")) {
				
				if ('A' == member.getType()) {
					return true;
				} else {
					response.sendRedirect("/main");
					return false;
				}
			}
		} else {
			if (request.getRequestURI().equals("/beans")) {
				return true;
			} 
			
			response.sendRedirect("/main");
			return false;
		}
		return false;
	}
}
