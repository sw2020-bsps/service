package com.bsps.common.interceptor;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bsps.member.Member;
import com.bsps.member.MemberServiceImpl;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	@Autowired
	private MemberServiceImpl memberService;
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		if (null == member) {
			if (request.getMethod().equals("POST") && request.getRequestURI().equals("/member")) {
				return true;
			}
			
			response.sendRedirect("/login/form");
			return false;
		} else {
			List<Member> memberList = memberService.searchAllMember();
			
			if (null != memberList) {
				Iterator<Member> iterator = memberList.iterator();
				while (iterator.hasNext()) {
					Member targetMember = iterator.next();

					if ((targetMember.getEmailAddress()).equals(member.getEmailAddress())) {
						return true;
					}
				}
			} else {
				response.sendRedirect("/error/500");
				return false;
			}
		}
		return false;
	}
}
