package com.multi.campong.member.model.service;


import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.multi.campong.member.model.mapper.MemberMapper;
import com.multi.campong.member.model.vo.Member;

@Service
public class MemberService {

	  @Autowired private MemberMapper mapper;
	 
	 
	  private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();


	public String saveFile(MultipartFile imageFile, String savePath) {
		File folder = new File(savePath);
		
		//폴더 없으면 생성
		if(folder.exists() == false) {
			folder.mkdir();
		}
		System.out.println("savePath: " + savePath);
		
		// 파일이름을 랜덤하게 바꾸는 코드, test.txt -> 20221213_1728291212.txt
				String originalFileName = imageFile.getOriginalFilename();
				String reNameFileName = 
							LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"));
				reNameFileName += originalFileName.substring(originalFileName.lastIndexOf("."));
				String reNamePath = savePath + "/" + reNameFileName;
				
				try {
					imageFile.transferTo(new File(reNamePath));
				}catch(Exception e) {
					return null;
				}
				System.out.println("리네임 파일네임"+reNameFileName);
				return reNameFileName;
		
		
	}


	public void deleteFile(String filePath) {
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
		
	}


	public int updateMember(Member member) {
		int result = 0;
		if(member.getMNo() ==0) {
			result = mapper.register(member);
		}else {
			result =mapper.updateMember(member);
		}
		return result;
	}
	
	public Member loginKaKao(String kakaoToKen) {
		Member member = mapper.selectMemberByKakaoToken(kakaoToKen);
		if (member != null) {
			// 성공일때!
			return member;
		} else {
			// 인증 실패했을때
			return null;
		}
		
		
		
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int save(Member member) {
		int result = 0;
		if (member.getMNo() == 0) { // 회원가입
			String encodePW = pwEncoder.encode(member.getPassword());
			member.setPassword(encodePW);
			result = mapper.insertMember(member);
		} else { // 회원 수정
			result = mapper.updateMember(member);
		}
		return result;
	}
	
	
	// @Transactional : DB 트랜잭션 관리를 위한 AOP 어노테이션. 만일 오류가 발생하면 롤백. 아니면 커밋
		// (rollbackFor = Exception.class) : 사용하지 않은 경우 트랜잭션 코드가 정상적으로 작동하지 않을수 있다.
	
//	  @Transactional(rollbackFor = Exception.class) public int save(Member member)
//	 { int result = 0; if(member.getMNo() == 0) { // 회원가입 String encodePW =
//	 pwEncoder.encode(member.getPassword()); member.setPassword(encodePW); result
//	 = mapper.insertMember(member); }else { // 회원 수정 result =
//	 mapper.updateMember(member); } return result; }
	 

//		 public void updateProfile(Member member, MultipartFile file) throws
//		 Exception{ String projectPath = System.getProperty("user.dir") +
//		 "\\src\\main\\resources\\static\\upload";
//		 
//		 UUID uuid = UUID.randomUUID();
//		 
//		 String fileName = uuid + "-" + file.getOriginalFilename();
//		 
//		 File saveFile = new File(projectPath, fileName);
//		 
//		 file.transferTo(saveFile);
//		 
//		 }
		 

}
