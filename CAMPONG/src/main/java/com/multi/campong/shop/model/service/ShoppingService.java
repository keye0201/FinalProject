package com.multi.campong.shop.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.campong.common.util.PageInfo;
import com.multi.campong.shop.model.mapper.ShoppingMapper;
import com.multi.campong.shop.model.vo.Shopping;

@Service
public class ShoppingService {
	
	@Autowired
	private ShoppingMapper mapper;
	
	public int getShoppingCount(Map<String, Object> param) {
		return mapper.selectShoppingCount(param);
	}
	
	public List<Shopping> getShoppingList(PageInfo pageInfo, Map<String, Object> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectShoppingList(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Shopping findByNo(int pno) {
		Shopping Shopping = mapper.selectShoppingByNo(pno); 
		return Shopping; 
	}
	
	public int basketCheck(@Param("mNo")int mNo,@Param("pno")int pno) {
		int result = mapper.basketCheckMnoPno(mNo,pno);
		
		return result;
	}


	public void insertBasket(int mNo, int pno) {
		mapper.basketInsert(mNo,pno);
	}

	public List<Shopping> getShoppingBasket(int mNo) {
		List<Shopping> shop = mapper.getShoppingBasket(mNo);
		return shop;
	}

	public void basketDelete(@Param("mNo")int mNo,@Param("pno")int pno) {
		mapper.basketDelete(mNo,pno);
	}

	public void basketAllDelete(@Param("mNo")int mNo) {
		mapper.allBasketDelete(mNo);
		
	}
	
}
