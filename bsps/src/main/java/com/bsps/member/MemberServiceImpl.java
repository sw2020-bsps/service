package com.bsps.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void registerMember(Member member) {
		try {
			if (this.checkEmpty(member)) {
				memberMapper.insert(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Member> searchAllMember() {
		List<Member> memberList = new ArrayList<Member>();
		
		try {
			memberList = memberMapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}

	@Override
	public Member searchMember(String emailAddress) {
		Member member = new Member(emailAddress);
		
		try {
			if (this.checkEmpty(member)) {
				member = memberMapper.select(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public Member modifyMember(Member member) {
		try {
			if (this.checkEmpty(member)) {
				memberMapper.update(member);
				member = memberMapper.select(new Member(member.getEmailAddress()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public boolean deleteMember(Member member) {
		try {
			if (this.checkEmpty(member)) {
				member.setStatus('N');
				memberMapper.update(member);
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@Override
	public boolean checkEmpty(Member member) {
		boolean isNotEmpty = false;
		
		if (null != member) {
			if (null != member.getEmailAddress() && "" != member.getEmailAddress()) {
				isNotEmpty = true;
			}
		}
		
		return isNotEmpty;
	}
}
