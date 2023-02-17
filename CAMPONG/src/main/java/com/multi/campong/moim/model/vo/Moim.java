package com.multi.campong.moim.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Moim {
	private int meetNo;
	private int mNo;
	private String nickName;
	private String gender;
	private String contentId;
	private String title;
	private int nowApes;
	private int apes;
	private String introduction;
	private String status;
	private String startDate;
	private String endDate;
	private String ageRange;
	private String expense;
	private String phone;
	private int count;
}
