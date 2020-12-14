package com.bsps.member;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {
	public List<Member> selectAll() throws Exception;
	public Member select(Member member) throws Exception;
	public void insert(Member member) throws Exception;
	public void update(Member member) throws Exception;
}