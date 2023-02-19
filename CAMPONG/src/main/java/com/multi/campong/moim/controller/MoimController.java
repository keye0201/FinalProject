package com.multi.campong.moim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.campong.member.model.vo.Member;
import com.multi.campong.moim.model.mapper.MeetingMapper;
import com.multi.campong.moim.model.mapper.MoimMapper;
import com.multi.campong.moim.model.vo.MeetingMember;
import com.multi.campong.moim.model.vo.Moim;


@Controller
public class MoimController {

	@Autowired
	MoimMapper mapper;
	
	@Autowired
	MeetingMapper meetMapper;
	
	@GetMapping("/moim")
	public String moimMain(Model model,@SessionAttribute(name="mvo",required = false)Member mvo) {
		List<Moim> list = meetMapper.meetingCount();
		System.out.println();
		model.addAttribute("list", list);
		return "moim/moim";
	}

	@GetMapping("/moim.create")
	public String moimCreate() {

		return "moim/moim-create";
	}
	
	@GetMapping("/moim.modify")
	public String moimModify( int meetNo,Model model) {
		Moim m = mapper.MoimContent(meetNo);
		System.out.println(m);
		model.addAttribute("m", m);
		return "moim/moim-modify";
	}
	
	@PostMapping("/moim.modify2")
	public String modify(@RequestParam("mNo") int mNo,@RequestParam("meetNo")int meetNo,Moim m) {
		System.out.println("hi");
		System.out.println(m);
		m.setMeetNo(meetNo);
		mapper.modifyMoim(m);
		return "redirect:/moim?mNo="+mNo;
	}
	
	@GetMapping("/moim.detail")
	public String moimDetail(@RequestParam("meetNo") int meetNo,@RequestParam("mNo") int mNo,Model model) {
		Moim m = mapper.MoimContent(meetNo);
		Moim mvo = meetMapper.meetingCountByMeetNo(meetNo);
		System.out.println(m);
		System.out.println(mvo);
		model.addAttribute("vo", m);
		model.addAttribute("mvo", mvo);
		System.out.println("meetNo"+meetNo);
		System.out.println("mNo"+mNo);
		int result = meetMapper.moimCheck(meetNo, mNo);
		System.out.println("result:"+result);
		if(result==1) {
			model.addAttribute("viewPhone", 1);
		}else {
			model.addAttribute("viewPhone", 0);
		}
		return "/moim/moim-detail";
	}


	@PostMapping("/moim.insert")
	public String moimInsert(Moim m,@RequestParam("mNo") int mNo) {
		System.out.println(mNo);
		mapper.moimInsert(m);
		MeetingMember mvo = new MeetingMember();
		mvo.setMeetNo(m.getMeetNo());
		mvo.setMNo(mNo);
		meetMapper.insertMoim(mvo);
		return "redirect:/moim?mNo="+mNo;
	}

}
