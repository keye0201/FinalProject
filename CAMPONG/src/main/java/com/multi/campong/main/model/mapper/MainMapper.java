package com.multi.campong.main.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.bagpacking.model.vo.Bagpacking;
import com.multi.campong.camping.model.vo.Camping;


@Mapper
public interface MainMapper {
	List<Camping> selectByDONM(String donm);
	List<Camping> selectByDONM2(String idCheck);
}
