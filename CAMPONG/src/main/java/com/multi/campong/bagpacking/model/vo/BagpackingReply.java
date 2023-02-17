package com.multi.campong.bagpacking.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BagpackingReply {
	private int rNo;
	private int contentId;
	private int mNo;
	private String content;
	private String status;
	private Date createDate;
	private String nickName;
}
