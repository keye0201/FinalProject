package com.multi.campong.moim.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.campong.member.model.mapper.MemberMapper;
import com.multi.campong.moim.model.mapper.MeetingMapper;
import com.multi.campong.moim.model.mapper.MoimMapper;
import com.multi.campong.moim.model.vo.Moim;


@Service
public class MeetingService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MoimMapper moimMapper;
	
	@Autowired
	MeetingMapper meetingMapper;
	
	public List<Integer> MoimListByUserNo(int mNo){
		// 참가한모임 목록 조회
		List<Integer> meetingList = meetingMapper.getMeetingByNo(mNo);
		
		
		return meetingList;
		/*
		 * //참가한 모임의 정보 조회 List<Moim> moim = new ArrayList<Moim>(); // 찜한목록 확인
		 * if(Objects.isNull(meetingList)) { return null; } meetingList.forEach( i-> {
		 * Moim moimVo = moimMapper.MoimContent(i.getMNo()); } );
		 */
	}


	public Moim MoimListByMeetNo(int hasNext) {
		return null;
	}

}
