package com.multi.campong.car.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Train {
	private int ticketNo;
	private int mNo;
	private String arrPlaceNm;		//대전복합
	private String arrPlandTime;	//202112010800
	private String charge;			//15100
	private String depPlaceNm;		//서울경부
	private String depPlandTime;	//202112010600
	private String gradeNm;			//KTX
}
