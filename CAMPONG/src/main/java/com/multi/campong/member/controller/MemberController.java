package com.multi.campong.member.controller;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.campong.member.model.mapper.MemberMapper;
import com.multi.campong.member.model.service.KaKaoService;
import com.multi.campong.member.model.service.MemberService;
import com.multi.campong.member.model.vo.Member;
import com.multi.campong.moim.model.mapper.MeetingMapper;
import com.multi.campong.moim.model.mapper.MoimMapper;

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
	
	@Autowired
	MeetingMapper meetMapper;
	
	@Autowired
	MoimMapper moimMapper;
	

	@Autowired
	KaKaoService kakaoService;
	
	final static private String savePath = "C:\\campong";
	
	
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
	 

	
	 @GetMapping("/memRegister.do") public String memRegister(@RequestParam("kakaoToKen") String kakaoToKen, Member m,	  RedirectAttributes attr, HttpSession session) { //RedirectAttributes는 값을 한번만 다시전달해줌 
		 if(m.getId()==null || m.getId().equals("") || m.getPassword()==null || m.getPassword().equals("") 
				 ||	  m.getNickName()==null || m.getBirthYear()==null || m.getBirthYear().equals("") || m.getEmail1()==null ||m.getEmail2().equals("") ||
				 m.getPhone()==null || m.getPhone().equals("") || m.getAddress()==null || m.getAddress().equals("")) {
	  attr.addFlashAttribute("msgType","실패 메세지");
	  attr.addFlashAttribute("msg","모든 내용을 입력해주세요"); return "redirect:/sign.up";
	  }
	  //회원 저장 
		 m.setKakaoToKen(kakaoToKen);
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
	 public String myProfile(@SessionAttribute(name = "mvo", required = false)Member mvo) {
		Member mem = mapper.selectMemberByMno(mvo.getMNo());
		System.out.println(mem);
		 return "sign/myprofile";
	 }
	 
	 @PostMapping("/memUpdate")
	 public String updateMember(@SessionAttribute(name = "mvo", required = false)Member mvo,HttpSession session,
			 @RequestParam(value="imageFile", required =false)MultipartFile imageFile,String nickName,String phone,String address,@ModelAttribute Member member,Model model) throws IOException,IllegalStateException, URISyntaxException{
		//URL r= this.getClass().getClassLoader().getResource("upload");
		
		member.setMNo(mvo.getMNo());
		
		//Resource resource = new UrlResource("file:" + savePath + "");
		//System.out.println(resource);
		//String path = r.getPath(); 
//		 //첨부파일
//		 List<UploadFile> list = new ArrayList<>();
//		 UploadFile file = new UploadFile(UUID.randomUUID().toString(),profileImage.getOriginalFilename(),profileImage.getContentType());
//		 list.add(file);
//		 
//		 File newFileName = new File(file.getUuid() + "_" +file.getFileName());

			if(imageFile != null && imageFile.isEmpty() == false) {

				// 기존 파일이 있는 경우 삭제
				if(member.getRenamedProfileImage() != null) {
					service.deleteFile(savePath + "/" +member.getRenamedProfileImage());
				}
			
		 String renameFileName = service.saveFile(imageFile, savePath);
		 System.out.println("renameFileName"+renameFileName);
		 if(renameFileName != null) {
			 member.setProfileImage(imageFile.getOriginalFilename());
			 member.setRenamedProfileImage(renameFileName);
		 		}
			}
			
			int result= service.updateMember(member);
			if(result >0) {
				model.addAttribute("msg", "이미지 등록완료되었습니다");
				model.addAttribute("loacation","redirect:/myprofile");
				 
			}else {
				model.addAttribute("msg", "이미지 등록실패했습니다.");
				model.addAttribute("location", "redirect:/myprofile");
			}
			System.out.println("멤버최종확인"+member);
			session.setAttribute("mvo", member);
			
		   return "redirect:/myprofile";
	 }
	 @GetMapping("/file/{fileName}")
	 @ResponseBody
	 public Resource profileImage(@SessionAttribute("mvo")Member mvo,@PathVariable("fileName")String fileName,Model model)throws IOException{
		 System.out.println(mvo);
		 return new UrlResource("file:"+savePath +"/"+ fileName);
	 }
	 @GetMapping("/delete.member")
	 public String deleteMembers(@SessionAttribute(name = "mvo", required = false)Member mvo,HttpSession session,SessionStatus status,Model model){
		 
		 //자기가 작성자인 모임을 삭제
		moimMapper.deleteMoim(mvo.getNickName());
		 //자기가 참가한 모임을 탈퇴
		 meetMapper.MeetingAllDelete(mvo.getMNo());
		 //회원 삭제
		mapper.deleteMember(mvo.getMNo());
		
		model.addAttribute("msg","회원탈퇴가 완료되었습니다.");
		 
		 
		 session.invalidate();
		 return "redirect:/";
	 }
	 
	 @PostMapping("/update.password")
	 public String updatePassword(@SessionAttribute(name="mvo", required = false)Member mvo,
			 @RequestParam("nowPassword") String nowPassword,@RequestParam("password1") String password1,
			 @RequestParam("password") String password,Model model,HttpSession session) {
		 System.out.println(nowPassword);
		 System.out.println(password1);
		 System.out.println(password);
		 if(!nowPassword.equals(mvo.getPassword())) {
			 model.addAttribute("msg","비밀 번호가 틀렸습니다.");
			 System.out.println("비밀번호가 틀림");
			 return "redirect:/myprofile";
		 }
		 if(!password1.equals(password)) {
			 model.addAttribute("msg", "변경할 비밀번호가 같지않습니다.");

			 System.out.println("비밀번호가 맞지않음");
			 return "redirect:/myprofile";
		 }
		 
		 mapper.updatePassword(mvo.getMNo(),password);
		 System.out.println("성공");

		 model.addAttribute("msg", "변경할 비밀번호가 같지않습니다.");
		 mvo.setPassword(mvo.getPassword());
		 System.out.println(mvo);
		 session.setAttribute("mvo", mvo);
		 
		 return "redirect:/myprofile";
	 }
}
	 


