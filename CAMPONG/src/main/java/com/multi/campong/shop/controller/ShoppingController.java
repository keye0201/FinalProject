package com.multi.campong.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.campong.common.util.PageInfo;
import com.multi.campong.shop.model.service.ShoppingService;
import com.multi.campong.shop.model.vo.Shopping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/shop")
@Controller
public class ShoppingController {

	@Autowired
	private ShoppingService service;

	@GetMapping("/shopping")
	public String shopping(Model model, @RequestParam Map<String, String> paramMap,
			@RequestParam(required = false) List<String> Item, 
			@RequestParam(required = false) List<String> Brand,
			@RequestParam(required = false) List<String> OtherBrand) {
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

		searchMap.put("Brand", Brand);
		if (Brand == null) {
			Brand = new ArrayList<>();
		}

		searchMap.put("OtherBrand", OtherBrand);
		if (OtherBrand == null) {
			OtherBrand = new ArrayList<>();
		}
		
		if(paramMap.get("lPrice") == null) {
			paramMap.put("lPrice", "5000");
		}
		searchMap.put("lPrice", paramMap.get("lPrice"));
		
		if(paramMap.get("hPrice") == null) {
			paramMap.put("hPrice", "500000");
		}
		searchMap.put("hPrice", paramMap.get("hPrice"));

		int shoppingCount = service.getShoppingCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, shoppingCount, 12);
		List<Shopping> list = service.getShoppingList(pageInfo, searchMap);

		model.addAttribute("Item", Item);
		model.addAttribute("Brand", Brand);
		model.addAttribute("OtherBrand", OtherBrand);
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("shoppingCount", shoppingCount);

		return "shop/shopping";
	}

	@GetMapping("/shopping.basket")
	public String shopping(int mNo,Model model) {
			List<Shopping> basket = service.getShoppingBasket(mNo);
			model.addAttribute("basket", basket);
		return "shop/shopping-basket";
	}
	@PostMapping("/shopping.basket2")
	public String shoppingBasketInsert(int mNo,@RequestParam("pno")int pno,Model model) {
				int result = service.basketCheck(mNo, pno);
				System.out.println(result);
				if(result==0) {
					service.insertBasket(mNo,pno);

					model.addAttribute("msg", "장바구니에 추가했습니다.");
					model.addAttribute("location", "/shop/shopping");
					return "common/msg";
				}
				model.addAttribute("msg", "이미등록된상품입니다.");
				model.addAttribute("location", "/shop/shopping");
		return "common/msg";
	}
	@GetMapping("/deleteBasket")
	public String deleteBasket(int mNo,int pno) {
		System.out.println(mNo);
		System.out.println(pno);
		service.basketDelete(mNo,pno);
		return "redirect:/shop/shopping.basket?mNo="+mNo;
	}
	@GetMapping("/deleteAllBasket")
	public String deleteAllBasket(int mNo) {
		System.out.println(mNo);
		service.basketAllDelete(mNo);
		return "redirect:/shop/shopping.basket?mNo="+mNo;
	}
}
