package com.bsps.common;

import org.springframework.stereotype.Service;

import com.bsps.member.Member;

@Service
public interface LoginService {
	public void login(Member member);
	public boolean loginCheck(Member member);
	public void logout();
}
