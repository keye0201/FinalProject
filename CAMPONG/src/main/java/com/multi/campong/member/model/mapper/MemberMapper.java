package com.multi.campong.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	public Member registerCheck(String id);
	public int register(Member mvo); //(등록성공시1 실패시0)
	int insertMember(Member member);
	int updateMember(Member member);
	public Member registerCheckName(String name);
	
	//로그인
	public Member login(Member member);
	public Member selectMemberByMno(int mNo);
	public void deleteMember(int mNo); 
}
