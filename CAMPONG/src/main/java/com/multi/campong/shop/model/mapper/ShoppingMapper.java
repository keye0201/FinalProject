package com.multi.campong.shop.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.multi.campong.shop.model.vo.Shopping;

@Mapper
public interface ShoppingMapper {
	List<Shopping> selectShoppingList(Map<String, Object> map);
	int selectShoppingCount(Map<String, Object> map);
	Shopping selectShoppingByNo(int pno);
	int basketCheckMnoPno(@Param("mNo")int mNo,@Param("pno") int pno);
	void basketInsert(@Param("mNo")int mNo,@Param("pno") int pno);
	List<Shopping> getShoppingBasket(int mNo);
	void basketDelete(@Param("mNo")int mNo,@Param("pno")int pno);
	void allBasketDelete(@Param("mNo")int mNo);
}


