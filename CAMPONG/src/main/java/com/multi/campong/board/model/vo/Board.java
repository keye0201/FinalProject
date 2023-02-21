package com.multi.campong.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int bNo;
	private int uNo;
	private String nickName;
	private String title;
	private String content;
	private String originalFileName;
	private String renameFileName;
	private String status;
	private Date createDate;
	private int readCount;
	private String type;
	private List<Reply> replyList;
	private int replyCount;
}
