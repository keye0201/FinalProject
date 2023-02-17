package com.multi.campong.event.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.event.model.vo.Event;

@Mapper
public interface EventMapper {
	List<Event> selectEventList(Map<String, String> map);
	int selectEventCount(Map<String, String> map);
	Event selectEventByNo(int no);
	
	List<Event> selectRandomEventList();
}
