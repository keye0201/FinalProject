package com.multi.campong.camping.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Camping {
	private int contentId;
	private String facltNm;
	private String lineIntro;
	private String intro;
	private String manageSttus;
	private String featureNm;
	private String induty;
	private String lctCl;
	private String doNm;
	private String sigunguNm;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Double mapX;
	private Double mapY;
	private String direction;
	private String tel;
	private String homepage;
	private String resveCl;
	private String gnrlSiteCo;
	private String autoSiteCo;
	private String glampSiteCo;
	private String caravSiteCo;
	private String indvdlCaravSiteCo;
	private String tooltip;
	private String glampInnerFclty;
	private String caravInnerFclty;
	private String operDeCl;
	private String toiletCo;
	private String swrmCo;
	private String wtrplCo;
	private String brazierCl;
	private String sbrsCl;
	private String posblFcltyCl;
	private String themaEnvrnCl;
	private String eqpmnLendCl;
	private String animalCmgCl;
	private String firstImageUrl;
	
	private int readCount;
	private int reviewCount;
	private int bookmarkCount;
	
	private List<CampingContentsReply> replyList;
	
	private int isBookmark;
}
