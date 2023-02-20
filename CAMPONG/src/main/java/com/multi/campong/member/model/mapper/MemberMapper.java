package com.multi.campong.member.model.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.multi.campong.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	public Member registerCheck(String id);
	public int register(Member mvo); //(등록성공시1 실패시0)
	
	int insertMember(Member member);
	int updateMember(Member member);
	public Member registerCheckName(String name);
	
	//로그인
	public Member login(@Param("id")String id,@Param("password")String password);
	public Member loginMember(Member m);
	public Member selectMemberByMno(int mNo);
	public void deleteMember(int mNo);
	public void updatePassword(@Param("mNo")int mNo,@Param("password")String password); 
	
	
	
	Member selectMember(@Param("id") String id);
	Member selectMemberByKakaoToken(String kakaoToken);
	Member selectByNickName(@Param("nickName")String nickName);
	Member loginByID(@Param("id")String id);
	public int updatePwd(Map<String, String> map);
	public Member getInfor(int mNo);
}
