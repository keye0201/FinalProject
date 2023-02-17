package com.multi.campong.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.campong.member.model.mapper.MemberMapper;
import com.multi.campong.member.model.service.MemberService;
import com.multi.campong.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j // log4j 선언을 대신 선언 해주는 lombok 어노테이션
@SessionAttributes("loginMember") // loginMember를 Model 취급할때 세션으로 처리하도록 도와주는 어노테이션
@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	MemberMapper mapper;

	@GetMapping("/sign.in")
	public String singIn(HttpSession session,Member m) {
		Member mvo = mapper.registerCheck(m.getId());
		System.out.println(m.getId());
		session.setAttribute("mvo", mvo);
		return "sign/sign-in";
	}

	@GetMapping("/sign.up")
	public String singUp() {
		
		return "sign/sign-up";
	}

	
	  @PostMapping("/registerCheck.do") public @ResponseBody int
	  memRegisterCheck(@RequestParam("id") String id) {
		 Member m =	 mapper.registerCheck(id); 
	  if(m !=null || id.equals("") || id.length()<=4) { 
		  return 0;
		  } 
	  return 1;
	  }
	
	  @GetMapping("/registerCheckName.do") public @ResponseBody int
	  memRegisterCheckName(@RequestParam("name") String name) {
		 Member mvo =	 mapper.registerCheckName(name); 
	  if(mvo !=null || name.equals("") || name.length()<=4) {
		  return 0;
	  }
	  return 1;
	  }
	 

	
	 @GetMapping("/memRegister.do") public String memRegister(Member m,	  RedirectAttributes attr, HttpSession session) { //RedirectAttributes는 값을 한번만 다시전달해줌 
		 if(m.getId()==null || m.getId().equals("") || m.getPassword()==null || m.getPassword().equals("") 
				 ||	  m.getNickName()==null || m.getBirthYear()==null || m.getBirthYear().equals("") || m.getEmail1()==null ||m.getEmail2().equals("") ||
				 m.getPhone()==null || m.getPhone().equals("") || m.getAddress()==null || m.getAddress().equals("")) {
	  attr.addFlashAttribute("msgType","실패 메세지");
	  attr.addFlashAttribute("msg","모든 내용을 입력해주세요"); return "redirect:/sign.up";
	  }
	  //회원 저장 
	int result = mapper.register(m);//성공시1
	if(result ==1) {
	  attr.addFlashAttribute("msgType","성공 메세지");
	  attr.addFlashAttribute("msg","회원가입에 성공했습니다."); //로그인 처리
	  session.setAttribute("m", m); //${!empty mvo}로 나중에 체크함
	  Member mvo1 = mapper.login(m);
	  System.out.println(m);
	  System.out.println(mvo1);
	  session.setAttribute("mvo", mvo1);
	  return "redirect:/";
	  }else { attr.addFlashAttribute("msgType","실패 메세지");
	  attr.addFlashAttribute("msg","이미 존재하는 회원입니다."); 
	  return "redirect:/sign.up"; }
	  }
	
	 // 로그아웃 처리
	 @GetMapping("/logout.do")
	 public String logout(HttpSession session) {
		 session.invalidate(); //세션 무효화
		 
		 return "redirect:/";
	 }
	 
	 @PostMapping("/memLogin.do")
	 public String memLogin(Member m,RedirectAttributes rttr, HttpSession session,Model model) {
		 if(m.getId()==null || m.getId().equals("")||
			m.getPassword()==null || m.getPassword().equals("")	) {
			 rttr.addFlashAttribute("msgType", "실패 메세지");
			 rttr.addFlashAttribute("msg", "값을 다시 입력해주세요.");
			 return "redirect:/sign.in";
		 }
		 Member mvo = mapper.login(m);
		 if(mvo!=null) {
			 rttr.addFlashAttribute("msgType", "성공 메세지");
			 rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
			 model.addAttribute("list", m);
			 session.setAttribute("m", m);
			 session.setAttribute("mvo", mvo);
			 System.out.println(mvo);
			 return "redirect:/";
		 }else {
			 rttr.addFlashAttribute("msgType", "실패 메세지");
			 rttr.addFlashAttribute("msg", "다시 로그인 해주세요.");
			 return "redirect:/sign.in";
		 }
	 }
	 
	 @GetMapping("/myprofile")
	 public String myProfile(@RequestParam("mNo")int mNo) {
		Member mem = mapper.selectMemberByMno(mNo);
		System.out.println(mem);
		 return "sign/myprofile";
	 }
	 @GetMapping("/delete.member")
	 public String deleteMember(@RequestParam("mNo")int mNo) {
		 mapper.deleteMember(mNo);
		 return "redirect:/";
	 }
	 
	
	/*
	 * @PostMapping("/memRegister.do") public String create(@Valid @ModelAttribute
	 * Member member, BindingResult result, Model model){
	 * 
	 * if (result.hasErrors()) { return "/sign.up"; }
	 * 
	 * Member members = Member.builder() .id(member.getId())
	 * .password(member.getPassword()) .name(member.getName())
	 * .address(member.getAddress()) .birthYear(member.getBirthYear())
	 * .email1(member.getEmail1()) .email2(member.getEmail2()) .build();
	 * 
	 * mapper.register(members);
	 */

}
