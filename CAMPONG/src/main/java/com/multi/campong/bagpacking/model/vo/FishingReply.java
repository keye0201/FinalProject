package com.multi.campong.bagpacking.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FishingReply {
	private int rNo;
	private int fishingNo;
	private int mNo;
	private String content;
	private String status;
	private Date createDate;
	private String nickName;
}
