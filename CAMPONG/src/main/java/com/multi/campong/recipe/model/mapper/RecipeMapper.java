package com.multi.campong.recipe.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.recipe.model.vo.Recipe;

@Mapper
public interface RecipeMapper {
	List<Recipe> selectRecipeList(Map<String, Object> map);
	List<Recipe> selectRandomRecipeList();
	int selectRecipeCount(Map<String, Object> map);
}
