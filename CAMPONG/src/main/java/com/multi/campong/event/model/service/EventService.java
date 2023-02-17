package com.multi.campong.event.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.campong.event.model.mapper.EventMapper;
import com.multi.campong.event.model.vo.Event;
import com.multi.campong.common.util.PageInfo;

@Service
public class EventService {
	@Autowired
	private EventMapper mapper;
	
	public int getEventCount(Map<String, String> param) {
		return mapper.selectEventCount(param);
	}
	
	public List<Event> getEventList(PageInfo pageInfo, Map<String, String> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectEventList(param);
	}
	@Transactional(rollbackFor = Exception.class)
	public Event findByNo(int contentId) {
		Event event = mapper.selectEventByNo(contentId); 
		return event; 
	}
	
	public List<Event> getRandomEventList() {
		return mapper.selectRandomEventList();
	}
	
}
