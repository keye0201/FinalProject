package com.multi.campong.car.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.car.model.vo.Bus;
import com.multi.campong.car.model.vo.Car;
import com.multi.campong.car.model.vo.Train;

@Mapper
public interface CarMapper {
	List<Car> selectCarList(Map<String, String> map);
	int selectCarCount(Map<String, String> map);
	Car selectCarByNo(int no);
	
	// 버스
	List<Bus> selectBusTicketList(int mNo);
	int insertBookingBus(Bus bus);
	
	// 열차
	List<Train> selectTrainTicketList(int mNo);
	int insertBookingTrain(Train train);
}
