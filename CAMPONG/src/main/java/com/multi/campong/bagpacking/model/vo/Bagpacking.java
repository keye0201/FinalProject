package com.multi.campong.bagpacking.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bagpacking {
	private int contentId;
	private String title;
	private String cat3;
	private String firstimage;
	private Double mapx;
	private Double mapy;
	private String addr1;
	private String addr2;
	private int readCount;
	private List<BagpackingReply> replyList;
}
