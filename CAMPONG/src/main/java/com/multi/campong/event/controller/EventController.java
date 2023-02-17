package com.multi.campong.event.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.campong.event.model.service.EventService;
import com.multi.campong.event.model.vo.Event;
import com.multi.campong.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/event") // 요청 url의 상위 url을 모두 처리할때 사용
@Controller
public class EventController {

	@Autowired
	private EventService service;

	@GetMapping("/event")
	public String event(Model model, @RequestParam Map<String, String> paramMap) {
		
//		String searchValue = null;
		int page = 1;
		
		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchValue = paramMap.get("searchValue");
			if (searchValue != null && searchValue.length() > 0) {
				searchMap.put("searchValue", searchValue);
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {}

		int eventCount = service.getEventCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, eventCount, 6);
		List<Event> list = service.getEventList(pageInfo, searchMap);

		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("eventCount", eventCount);
		
		log.info("searchMap : " + searchMap.toString());
		log.info("paramMap : " + paramMap.toString());
		log.info(Integer.toString(eventCount));
		
		return "event/event";
	}
	
	@GetMapping("/event-detail")
	public String eventDetail(Model model, @RequestParam("id") int contentId) {
		Event content = service.findByNo(contentId);
//		String overview = parsingOverview(contentId);
		
		model.addAttribute("content", content);
//		model.addAttribute("overview", overview);
		
		log.info(Integer.toString(contentId));
		log.info(content.toString());
		
		//유사행사
		List<Event> list = service.getRandomEventList();
		model.addAttribute("list", list);
		
		return "event/event-detail";
	}
}
