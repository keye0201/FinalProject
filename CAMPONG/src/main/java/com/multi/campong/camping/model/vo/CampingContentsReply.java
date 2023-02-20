package com.multi.campong.camping.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampingContentsReply {
	private int rNo;
	private int contentId;
	private int mNo;
	private String content;
	private String status;
	private String originalFileName;
	private String renameFileName;
	private Date createDate;
	private String nickName;
	private String profileImage;
	private String renamedProfileImage;
}
