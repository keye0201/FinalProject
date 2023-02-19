package com.multi.campong.moim.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.multi.campong.moim.model.vo.MeetingMember;
import com.multi.campong.moim.model.vo.Moim;


@Mapper
public interface MeetingMapper {/*
								 * //가입하기 public int insertMoim(MeetingMember vo);
								 */
	//가입된 모임불러오기
	public List<Integer> getMeetingByNo(int mNo);
	//아이디로 가입된 모임 불러오기
	public void insertMoim(MeetingMember mt);
	//모임 넘버로 그모임에 대한 정보 가져옴
	public List<Moim> getMeetingByMeetNo(int meetNo);
	//mNo,meetNo값 받아서 모임에 가입되어있는지 체크함
	public MeetingMember moimRegisterCheck(@Param("mNo") int mNo,@Param("meetNo") int meetNo);
	//모임에 가입된 회원 수 가져오기
	public int moimCountMember(int meetNo);
	public Moim meetingCountByMeetNo(int meetNo);
	public List<Moim> meetingCount();
	public int moimCheck(@Param("meetNo") int meetNo,@Param("mNo") int mNo);
	public int deleteMeeting(@Param("mNo") int mNo,@Param("meetNo") int meetNo);
	public int deleteMeetingMoim(@Param("nickName")String nickName,@Param("meetNo") int meetNo);
	public int deleteMoimFirst(@Param("meetNo")int meetNo);
	public int modifyMoim(String nickName, int meetNo);
	public int MeetingAllDelete(int mNo);
}
