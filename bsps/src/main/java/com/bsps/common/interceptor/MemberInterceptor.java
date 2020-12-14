package com.bsps.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bsps.member.Member;

@Component
public class MemberInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		if (null != member) {
			if ('M' == member.getType()) {
				return true;
			} else {
				response.sendRedirect("/main");
				return false;
			}
		} else {
			if (request.getMethod().equals("POST") || request.getMethod().equals("GET")) {

				if (request.getRequestURI().equals("/member") || request.getRequestURI().equals("/member/form")) {
					return true;
				}
			} else {
				response.sendRedirect("/main");
				return false;
			}
		}
		return false;
	}
}
