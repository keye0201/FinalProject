package com.multi.campong.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int rNo;
	private int bNo;
	private int uNo;
	private String content;
	private String status;
	private Date createDate;
	private String nickName;
	private String renamedProfileImage;
}
