package com.multi.campong.recipe.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.campong.common.util.PageInfo;
import com.multi.campong.recipe.model.mapper.RecipeMapper;
import com.multi.campong.recipe.model.vo.Recipe;

@Service
public class RecipeService {

	@Autowired
	private RecipeMapper mapper;
	
	public List<Recipe> getRecipeList(PageInfo pageInfo, Map<String, Object> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectRecipeList(param);
	}
	
	public List<Recipe> getRandomRecipeList(){
		return mapper.selectRandomRecipeList();
	}
	
	public int getRecipeCount(Map<String, Object> param) {
		return mapper.selectRecipeCount(param);
	}
}
