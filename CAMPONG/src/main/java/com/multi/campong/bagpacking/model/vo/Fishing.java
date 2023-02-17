package com.multi.campong.bagpacking.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Fishing {
	private int fishingNo;
	private String fishingNm;
	private String addr;
	private Double latitude;
	private Double longitude;
	private String usecharge;
	private String phone;
	private String species;
	private List<FishingReply> replyList;
}
