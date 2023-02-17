package com.multi.campong.member.model.vo;

import java.util.Date;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int mNo;
	private String id;
	private String password;
	private String birthYear;
	private String role;
	private String nickName;
	private String phone;
	private String email1;
	private String email2;
	private String address;
	private String kakaoToken;
	private String status;
	private Date enrollDate;
	private Date modifyDate;
	private String profileImage;
	
}
