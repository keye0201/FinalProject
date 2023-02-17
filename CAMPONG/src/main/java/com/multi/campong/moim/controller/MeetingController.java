package com.multi.campong.moim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.campong.moim.model.mapper.MeetingMapper;
import com.multi.campong.moim.model.service.MeetingService;
import com.multi.campong.moim.model.vo.MeetingMember;


@Controller
public class MeetingController {
	@Autowired
	MeetingService service;
	
	@Autowired
	MeetingMapper mapper;
	

	@GetMapping("/moim.my")
	public String moimMy(@RequestParam("mNo") int mNo,Model model) {
		System.out.println(mNo);
		List<Integer> myMoim = service.MoimListByUserNo(mNo);
		System.out.println(myMoim);
		model.addAttribute("myMoim", myMoim);
		return "moim/moim-my";
	}
	@PostMapping("/insertMeeting")
	public String insertMeeting(MeetingMember mt,@RequestParam(value="mNo") int mNo,@RequestParam(value="meetNo") int meetNo,Model model) {
		System.out.println(mt);
		MeetingMember m = mapper.moimRegisterCheck(mNo, meetNo);
		if(m== null) {
		mapper.insertMoim(mt);
		model.addAttribute("message","가입이완료 되었습니다.");
		}else {
			model.addAttribute("message","이미 가입된 모임입니다.");
		}
		return "redirect:/moim";
	}

	@GetMapping("/moimRegisterCheck")
	public ResponseEntity<Integer> moimCheck(int mNo, int meetNo) {
		System.out.println("mNo : " + mNo);
		System.out.println("meetNo : + " + meetNo);
		MeetingMember m = new MeetingMember(meetNo,mNo);
		System.out.println(mNo);
		System.out.println(meetNo);
		int result = mapper.moimCheck(meetNo, mNo);
		if (result == 1) {
			return new ResponseEntity<Integer>(1, HttpStatus.OK);
		} else {
			MeetingMember mvo = mapper.moimRegisterCheck(mNo, meetNo);
			if(mvo==null) {
				mapper.insertMoim(m);
				return new ResponseEntity<Integer>(0, HttpStatus.OK);
			}else {
				return new ResponseEntity<Integer>(1, HttpStatus.OK);
			}
		}
	}
	
	  @GetMapping("/moimOut") 
	  public ResponseEntity<Integer> moimOut(@RequestParam("mNo")int mNo,@RequestParam("meetNo")int meetNo) {
		 int row = mapper.deleteMeeting(mNo,meetNo);
		  if(row ==1) {

				return new ResponseEntity<Integer>(1, HttpStatus.OK);
		  }else {
				return new ResponseEntity<Integer>(0, HttpStatus.OK);
		  }
	  }
	  @GetMapping("/moimOutDeleted")
			  public ResponseEntity<Integer> moimOutDelete(@RequestParam("mNo")int mNo,@RequestParam("meetNo")int meetNo,@RequestParam("nickName")String nickName) {

			 int row = mapper.deleteMoimFirst(meetNo);
			 int rows = mapper.deleteMeetingMoim(nickName,meetNo);
			  if(rows ==1) {

					return new ResponseEntity<Integer>(1, HttpStatus.OK);
			  }else {
					return new ResponseEntity<Integer>(0, HttpStatus.OK);
			  }
		  }
	  @GetMapping("/moimModify")
	  	public ResponseEntity<Integer> moimModify(@RequestParam("mNo")int mNo,@RequestParam("meetNo")int meetNo,@RequestParam("nickName")String nickName){
		  
		  int row = mapper.modifyMoim(nickName,meetNo);
		  
					return new ResponseEntity<Integer>(1, HttpStatus.OK);
	  	}
	
	 
	
}
