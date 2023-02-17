package com.multi.campong.car.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {
	private int rentNo;
	private String entrpsNm;	 //업체명
	private String rdnmadr;      //소재지도로명주소
	private String latitude;	 //위도
	private String longitude;	 //경도
	private String phoneNumber;	 //전화번호
	private String homepageUrl;	 //홈페이지주소
}
