package com.multi.campong.shop.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.shop.model.vo.Shopping;

@Mapper
public interface ShoppingMapper {
	List<Shopping> selectShoppingList(Map<String, Object> map);
	int selectShoppingCount(Map<String, Object> map);
	Shopping selectShoppingByNo(int pno);
}


