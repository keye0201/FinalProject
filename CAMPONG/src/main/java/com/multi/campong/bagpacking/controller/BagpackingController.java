package com.multi.campong.bagpacking.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.multi.campong.bagpacking.model.service.BagpackingService;
import com.multi.campong.bagpacking.model.vo.Bagpacking;
import com.multi.campong.bagpacking.model.vo.BagpackingReply;
import com.multi.campong.bagpacking.model.vo.Fishing;
import com.multi.campong.bagpacking.model.vo.FishingReply;
import com.multi.campong.common.util.PageInfo;
import com.multi.campong.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/bagpacking") // 요청 url의 상위 url을 모두 처리할때 사용
@Controller
public class BagpackingController {
//	public static final String KEY = "600HKvYx3k3yVfXB9rmgBe8aCOjxmdMoTJeWCLjDuYkB1UejuuY4zR5fp1dPexNfDUO0I2G9G2gH3MuApz8wTA%3D%3D";
	public static final String KEY = "600HKvYx3k3yVfXB9rmgBe8aCOjxmdMoTJeWCLjDuYkB1UejuuY4zR5fp1dPexNfDUO0I2G9G2gH3MuApz8wTA==";
	public static final String API_URL1 = "http://apis.data.go.kr/B551011/KorService/detailCommon";
	public static final String API_URL2 = "http://apis.data.go.kr/B551011/KorService/detailIntro";
	
	@Autowired
	private BagpackingService service;
	
	@GetMapping("/bagpacking-main")
	public String bagpackingMain(Model model, @RequestParam Map<String, String> paramMap) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		List<Bagpacking> bestList = service.getBagpackingBestList(searchMap);
		
		model.addAttribute("bestList", bestList);
		model.addAttribute("paramMap", paramMap);
		
		return "bagpacking/bagpacking-main";
	}
	
	@GetMapping("/mountain-list")
	public String bagpackingList(Model model, @RequestParam Map<String, String> paramMap) {
		log.info("리스트 요청, param : " + paramMap);
		int page = 1;

		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchSido = paramMap.get("sido");
			String searchGugun = paramMap.get("gugun");
			String searchValue = paramMap.get("searchValue");
			
			if(searchSido != null && searchSido.length() > 0) {
				searchMap.put("sido", searchSido);
			}
			if(searchGugun != null && searchGugun.length() > 0 && !searchGugun.equals("전체")) {
				searchMap.put("gugun", searchGugun);
			}
			if(searchValue != null && searchValue.length() > 0) {
				searchMap.put("title", searchValue);
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {}
		
		int bagpackingCount = service.getBagpackingCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, bagpackingCount, 9);
		List<Bagpacking> list = service.getBagpackingList(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("bagpackingCount", bagpackingCount);
		
		return "bagpacking/mountain-list";
	}
	
	@GetMapping("/island-list")
	public String islandList(Model model, @RequestParam Map<String, String> paramMap) {
		log.info("리스트 요청, param : " + paramMap);
		int page = 1;
		
		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchSido = paramMap.get("sido");
			String searchGugun = paramMap.get("gugun");
			String searchValue = paramMap.get("searchValue");
			
			if(searchValue != null && searchValue.length() > 0) {
				searchMap.put("title", searchValue);
			}
			if(searchSido != null && searchSido.length() > 0) {
				searchMap.put("sido", searchSido);
			}
			if(searchGugun != null && searchGugun.length() > 0 && !searchGugun.equals("전체")) {
				searchMap.put("gugun", searchGugun);
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {}
		
		int islandCount = service.getIslandCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, islandCount, 9);
		List<Bagpacking> list = service.getIslandList(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("bagpackingCount", islandCount);
		
		return "bagpacking/island-list";
	}
	
	@GetMapping("/fishing-list")
	public String fishingList(Model model, @RequestParam Map<String, String> paramMap) {
		log.info("리스트 요청, param : " + paramMap);
		int page = 1;
		
		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchSido = paramMap.get("sido");
			String searchGugun = paramMap.get("gugun");
			String searchValue = paramMap.get("searchValue");
			
			if(searchValue != null && searchValue.length() > 0) {
				searchMap.put("fishingNm", searchValue);
			}
			if(searchSido != null && searchSido.length() > 0) {
				searchMap.put("sido", searchSido);
			}
			if(searchGugun != null && searchGugun.length() > 0 && !searchGugun.equals("전체")) {
				searchMap.put("gugun", searchGugun);
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {}
		
		int fishingCount = service.getFishingCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, fishingCount, 9);
		List<Fishing> list = service.getFishingList(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("bagpackingCount", fishingCount);
		
		return "bagpacking/fishing-list";
	}
	
	@RequestMapping("/bagpacking-detail")
	public String bagpackingDetail(Model model, @RequestParam("contentId") int contentId) {
		Bagpacking content = service.findByNo(contentId);
		String overview = parsingOverview(contentId);
		String infocenter = parsingInfocenter(contentId);
		
//		log.info("상세 요청, content : " + content);
//		log.info("상세 요청, overview : " + overview);
//		log.info("상세 요청, infocenter : " + infocenter);
		if(content == null) {
			return "redirect:error";
		}
		
		model.addAttribute("content", content);
		model.addAttribute("overview", overview);
		model.addAttribute("infocenter", infocenter);
		model.addAttribute("replyList", content.getReplyList());
		
		return "bagpacking/bagpacking-detail";
	}
	
	@RequestMapping("/fishing-detail")
	public String fishingDetail(Model model, @RequestParam("fishingNo") int fishingNo) {
		Fishing content = service.findByNo2(fishingNo);
		String[] speciesList = content.getSpecies().split("\\+");
		
		
		log.info("상세 요청, content : " + content);
		log.info("상세 요청, species : " + speciesList[0]);
		if(content == null) {
			return "redirect:error";
		}
		
		model.addAttribute("content", content);
		model.addAttribute("speciesList", speciesList);
		model.addAttribute("replyList", content.getReplyList());
		
		return "bagpacking/fishing-detail";
	}
	
	@RequestMapping("/bagpackingReply")
	public String writeBagpackingReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			@ModelAttribute BagpackingReply reply) {
		// 로그인한 멤버의 정보 입력
		reply.setMNo(loginMember.getMNo());

		int result = service.saveBagpackingReply(reply);

		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/bagpacking/bagpacking-detail?contentId=" + reply.getContentId());
		return "common/msg";
	}
	
	@RequestMapping("/bagpackingReplyDel")
	public String deleteBagpackingReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			int replyNo, int contentId) {
		log.info("댓글 삭제 요청");
		int result = service.deleteBagpackingReply(replyNo);

		if (result > 0) {
			model.addAttribute("msg", "댓글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/bagpacking/bagpacking-detail?contentId=" + contentId);
		return "/common/msg";
	}
	@RequestMapping("/fishingReply")
	public String writeFishingReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			@ModelAttribute FishingReply reply) {
		// 로그인한 멤버의 정보 입력
		reply.setMNo(loginMember.getMNo());
		
		int result = service.saveFishingReply(reply);
		
		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/bagpacking/fishing-detail?fishingNo=" + reply.getFishingNo());
		return "common/msg";
	}
	
	@RequestMapping("/fishingReplyDel")
	public String deleteFishingReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			int replyNo, int fishingNo) {
		log.info("댓글 삭제 요청");
		int result = service.deleteFishingReply(replyNo);
		
		if (result > 0) {
			model.addAttribute("msg", "댓글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/bagpacking/fishing-detail?fishingNo=" + fishingNo);
		return "/common/msg";
	}
	
	
	
	// 산의 상세설명 파싱
	public static String parsingOverview(int contentId){
		String overview="";
		
		try {
			StringBuilder urlBuilder = new StringBuilder(API_URL1);
			urlBuilder.append("?" + "serviceKey=" + KEY);
			urlBuilder.append("&" + "MobileOS=ETC&MobileApp=AppTest&_type=json&contentTypeId=12&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&contentId=" + contentId);
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			int code = conn.getResponseCode();
			if (code < 200 || code >= 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return overview;
			}
	
			InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			
	
			JSONParser jsonParser = new JSONParser();
			JSONObject rootObj = (JSONObject) jsonParser.parse(br);
			JSONObject childObj1 = (JSONObject) rootObj.get("response");
			JSONObject childObj2 = (JSONObject) childObj1.get("body");
			JSONObject childObj3 = (JSONObject) childObj2.get("items");
			JSONArray array1 = (JSONArray) childObj3.get("item");
			
			JSONObject obj = (JSONObject) array1.get(0);
			overview = getStrData(obj, "overview");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return overview;
	}
	
	// 산의 전화번호 파싱
	public static String parsingInfocenter(int contentId){
		String infocenter="";
		
		try {
			StringBuilder urlBuilder = new StringBuilder(API_URL2);
			urlBuilder.append("?" + "serviceKey=" + KEY);
			urlBuilder.append("&" + "MobileOS=ETC&MobileApp=AppTest&_type=json&contentTypeId=12&contentId=" + contentId);
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			int code = conn.getResponseCode();
			if (code < 200 || code >= 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return infocenter;
			}
	
			InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			
	
			JSONParser jsonParser = new JSONParser();
			JSONObject rootObj = (JSONObject) jsonParser.parse(br);
			JSONObject childObj1 = (JSONObject) rootObj.get("response");
			JSONObject childObj2 = (JSONObject) childObj1.get("body");
			JSONObject childObj3 = (JSONObject) childObj2.get("items");
			JSONArray array1 = (JSONArray) childObj3.get("item");
			
			JSONObject obj = (JSONObject) array1.get(0);
			infocenter = getStrData(obj, "infocenter");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return infocenter;
	}
	
	private static String getStrData(JSONObject obj, String key) {
		String str = (String) obj.get(key);
		if (str == null) {
			return "-";
		} else {
			return str;
		}
	}
}
