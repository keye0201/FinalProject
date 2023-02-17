package com.multi.campong.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shopping {
	private int pno;
	private String title;
	private String link;
	private String image;
	private int lprice;
	private int hprice;
	private String mallName;
	private String productId;
	private String productType;
	private String brand;
	private String category1;
	private String category2;
	private String category3;
	private String category4;

	
}