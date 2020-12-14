package com.bsps.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsps.member.Member;
import com.bsps.member.MemberServiceImpl;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	public MemberServiceImpl memberService;
	@Autowired
	public HttpSession session;

	@Override
	public void login(Member member) {
		Member targetMember = new Member();
		targetMember = memberService.searchMember(member.getEmailAddress());
		
		session.setAttribute("member", targetMember);
		session.setAttribute("type", targetMember.getType());
		session.setMaxInactiveInterval(30 * 60);
	}
	
	@Override
	public boolean loginCheck(Member member) {
		Member targetMember = new Member();
		
		try {
			targetMember = memberService.searchMember(member.getEmailAddress());

			if (memberService.checkEmpty(targetMember)) {
				if (member.getPassword().equals(targetMember.getPassword()) && targetMember.getStatus() == 'Y') {
					
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public void logout() {
		Member member = (Member) session.getAttribute("member");
		
		try {
			if(memberService.checkEmpty(member)) {
				session.invalidate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
