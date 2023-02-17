package com.multi.campong.event.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
	private int contentId;
	private String contenttypeId;
	private String title;
	private String eventstartDate;
	private String eventendDate;
	private String areacode;
	private String mapx;
	private String mapy;
	private String firstimage;
	private String firstimage2;
	private String addr1;
}
