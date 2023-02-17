package com.multi.campong.car.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.car.model.vo.Car;

@Mapper
public interface CarMapper {
	List<Car> selectCarList(Map<String, String> map);
	int selectCarCount(Map<String, String> map);
	Car selectCarByNo(int no);
}
