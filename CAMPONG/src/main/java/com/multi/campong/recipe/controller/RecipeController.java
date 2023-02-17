package com.multi.campong.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.campong.common.util.PageInfo;
import com.multi.campong.recipe.model.service.RecipeService;
import com.multi.campong.recipe.model.vo.Recipe;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/recipe") // 요청 url의 상위 url을 모두 처리할때 사용
@Controller
public class RecipeController {
	
	@Autowired
	public RecipeService service;
	
	@GetMapping("/recipe")
	public String list(Model model, @RequestParam Map<String, String> paramMap,
			@RequestParam(required = false) List<String> Item) {
		int page = 1;

		// 탐색할 맵을 선언
		Map<String, Object> searchMap = new HashMap<>();
		try {
			String searchValue = paramMap.get("searchValue");
			if (searchValue != null && searchValue.length() > 0) {
				searchMap.put("title", searchValue);
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {
		}
		
		searchMap.put("Item", Item);
		if (Item == null) {
			Item = new ArrayList<>();
		}
		
		int recipeCount = service.getRecipeCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, recipeCount, 9);
		List<Recipe> list = service.getRecipeList(pageInfo, searchMap);
		List<Recipe> randomList = service.getRandomRecipeList();
		
		model.addAttribute("Item", Item);
		model.addAttribute("list", list);
		model.addAttribute("randomList", randomList);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		
		return "recipe/recipe";
	}
}
