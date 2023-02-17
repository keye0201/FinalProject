package com.multi.campong.recipe.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Recipe {
	private int rNo;
	private String category1;
	private String category2;
	private String title;
	private String content;
	private String url;
	private String imageUrl;
}
