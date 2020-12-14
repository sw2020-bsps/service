package com.bsps.member;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	public void registerMember(Member member);
	public List<Member> searchAllMember();
	public Member searchMember(String emailAddress);
	public Member modifyMember(Member member);
	public boolean deleteMember(Member member);
	public boolean checkEmpty(Member member);
}
