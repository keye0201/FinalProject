package com.multi.campong.car.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.campong.car.model.service.CarService;
import com.multi.campong.car.model.vo.Bus;
import com.multi.campong.car.model.vo.Car;
import com.multi.campong.car.model.vo.Train;
import com.multi.campong.common.util.PageInfo;
import com.multi.campong.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/car") // 요청 url의 상위 url을 모두 처리할때 사용
@Controller
public class CarController {
	public static final String KEY = "600HKvYx3k3yVfXB9rmgBe8aCOjxmdMoTJeWCLjDuYkB1UejuuY4zR5fp1dPexNfDUO0I2G9G2gH3MuApz8wTA==";
	public static final String API_URL = "http://apis.data.go.kr/1613000/ExpBusInfoService";
	public static final String API_URL1 = "http://apis.data.go.kr/1613000/TrainInfoService";

	@Autowired
	private CarService service;
	
	//이미지 랜덤 인덱스 생성
	public int[] createRdImgIdx(int length, int range) {
		Random rd = new Random();
		int[] idx = new int[length];
		
		for (int i=0; i<idx.length; i++) {
			idx[i] = rd.nextInt(range) + 1;
			for (int j=0; j<i; j++) {
				if (idx[i] == idx[j]) {
					i--;
					break;
				}
			}
		}
		return idx;
	}

	@GetMapping("/traffic-car")
	public String car(Model model, @RequestParam Map<String, String> paramMap,@RequestParam(required= false) String date,@RequestParam(required= false)String time) {
//		String searchValue = null;
		int page = 1;
		
		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String city1 = paramMap.get("city");
			if (city1 != null) {
				searchMap.put("city", city1);
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {}

		int carCount = service.getCarCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, carCount, 4);
		List<Car> list = service.getCarList(pageInfo, searchMap);
		System.out.println(list);
		//업체 랜덤 이미지
		int[] imgIdx = createRdImgIdx(4, 18);
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("carCount", carCount);
		model.addAttribute("imgIdx", imgIdx);
		model.addAttribute("time", time);
		model.addAttribute("date", date);
		log.info("searchMap : " + searchMap.toString());
		log.info("paramMap : " + paramMap.toString());
//		log.info(Integer.toString(carCount));
		
		return "car/traffic-car";
	}
	@PostMapping("/trafficGo")
	public String trafficGo(Model model,@RequestParam(required = false)String date,@RequestParam(required= false)String time) {
		System.out.println(date);
		System.out.println(time);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		
		return "/car/traffic-car";
	}
	
	@GetMapping("/booking-confirm")
	public String bookingConfirm(Model model, @RequestParam("rentNo") int rentNo) {
		Car content = service.findByNo(rentNo);
		
		model.addAttribute("content", content);
		
		log.info(Integer.toString(rentNo));
		log.info(content.toString());
		
		return "car/booking-confirm";
	}
	
	
	//버스
	@GetMapping("/traffic-bus")
	public String trafficBus(Model model, @RequestParam Map<String, String> paramMap) {
		log.info("리스트 요청, param : " + paramMap);
		
		List<Bus> list = null;
		
		try {
			String arrPlaceNm = paramMap.get("addressKindD2");
			String depPlaceNm = paramMap.get("addressKindD");
			String inputDepPlandTime = paramMap.get("startDay");
			String[] dayArr = inputDepPlandTime.split(" ");
			inputDepPlandTime = "2022"+monthToNum(dayArr[1])+dayArr[0];
			
			if((arrPlaceNm != null && !arrPlaceNm.equals("")) && (depPlaceNm != null && !depPlaceNm.equals(""))) {
				list = parsingBus(depPlaceNm, arrPlaceNm, inputDepPlandTime, "");
			}
			log.info("리스트 있나?, list : " + list.size());
			if(list.size() == 0) {
				list = null;
			}
		} catch (Exception e) {}

		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		
		return "car/traffic-bus";
	}
	
	// 열차
	@GetMapping("/traffic-train")
	public String trafficTrain(Model model, @RequestParam Map<String, String> paramMap) {
		log.info("리스트 요청, param : " + paramMap);
		
		List<Train> list = null;
		
		try {
			String arrPlaceNm = paramMap.get("addressKindD2");
			String depPlaceNm = paramMap.get("addressKindD");
			String inputDepPlandTime = paramMap.get("startDay");
			String[] dayArr = inputDepPlandTime.split(" ");
			inputDepPlandTime = "2022"+monthToNum(dayArr[1])+dayArr[0];
			
			if((arrPlaceNm != null && !arrPlaceNm.equals("")) && (depPlaceNm != null && !depPlaceNm.equals(""))) {
				list = parsingTrain(depPlaceNm, arrPlaceNm, inputDepPlandTime, "");
			}
			log.info("리스트 있나?, list : " + list.size());
			if(list.size() == 0) {
				list = null;
			}
		} catch (Exception e) {}

		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		
		return "car/traffic-train";
	}
	
	@GetMapping("/bookingBus") 
	public String bookingBus(Model model, @RequestParam Map<String, String> paramMap,
			@SessionAttribute(name = "mvo", required = false) Member loginMember) {
		log.info("리스트 요청, param : " + paramMap);
		
		String arrPlaceNm = paramMap.get("arrPlaceNm");
		String arrPlandTime = paramMap.get("arrPlandTime");
		arrPlandTime = arrPlandTime.substring(0, 3) + "3" + arrPlandTime.substring(4);
		String charge = paramMap.get("charge");
		String depPlaceNm = paramMap.get("depPlaceNm");
		String depPlandTime = paramMap.get("depPlandTime");
		depPlandTime = depPlandTime.substring(0, 3) + "3" + depPlandTime.substring(4);
		String gradeNm = paramMap.get("gradeNm");

		Bus bus = new Bus();
		bus.setMNo(loginMember.getMNo());
		bus.setArrPlaceNm(arrPlaceNm);
		bus.setArrPlandTime(arrPlandTime);
		bus.setCharge(charge);
		bus.setDepPlaceNm(depPlaceNm);
		bus.setDepPlandTime(depPlandTime);
		bus.setGradeNm(gradeNm);
		
		int result = service.bookingBus(bus);
		
		if (result > 0) {
			model.addAttribute("msg", "예약이 완료 되었습니다.");
			model.addAttribute("location", "/car/traffic-bus");
		} else {
			model.addAttribute("msg", "예약에 실패하였습니다.");
			model.addAttribute("location", "/car/traffic-bus");
		}

		return "common/msg";
	}
	
	@GetMapping("/bookingTrain") 
	public String bookingTrain(Model model, @RequestParam Map<String, String> paramMap,
			@SessionAttribute(name = "mvo", required = false) Member loginMember) {
		log.info("리스트 요청, param : " + paramMap);
		
		String arrPlaceNm = paramMap.get("arrPlaceNm");
		String arrPlandTime = paramMap.get("arrPlandTime");
		arrPlandTime = arrPlandTime.substring(0, 3) + "3" + arrPlandTime.substring(4);
		String charge = paramMap.get("charge");
		String depPlaceNm = paramMap.get("depPlaceNm");
		String depPlandTime = paramMap.get("depPlandTime");
		depPlandTime = depPlandTime.substring(0, 3) + "3" + depPlandTime.substring(4);
		String gradeNm = paramMap.get("gradeNm");

		Train train = new Train();
		train.setMNo(loginMember.getMNo());
		train.setArrPlaceNm(arrPlaceNm);
		train.setArrPlandTime(arrPlandTime);
		train.setCharge(charge);
		train.setDepPlaceNm(depPlaceNm);
		train.setDepPlandTime(depPlandTime);
		train.setGradeNm(gradeNm);
		
		int result = service.bookingTrain(train);
		
		if (result > 0) {
			model.addAttribute("msg", "예약이 완료 되었습니다.");
			model.addAttribute("location", "/car/traffic-train");
		} else {
			model.addAttribute("msg", "예약에 실패하였습니다.");
			model.addAttribute("location", "/car/traffic-train");
		}

		return "common/msg";
	}
	
	@GetMapping("/traffic-mybook")
	 public String myBookmark(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember) {
		 List<Bus> list = service.getBookingBusList(loginMember.getMNo());
		 List<Train> list1 = service.getBookingTrainList(loginMember.getMNo());
		 
		 model.addAttribute("list", list);
		 model.addAttribute("list1", list1);
		 
		 return "car/traffic-mybook";
	 }
	
	@GetMapping("/deleteBusTicket")
	 public String deleteBusTicket(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			 int ticketNo) {
		 
		 int result = service.deleteBusTicket(ticketNo);
		 
		 if (result > 0) {
				model.addAttribute("msg", "예약이 해제되었습니다.");
			} else {
				model.addAttribute("msg", "예약 해제에 실패하였습니다.");
			}
		 
		model.addAttribute("location", "/car/traffic-mybook");
		return "/common/msg";
	 }
	
	@GetMapping("/deleteTrainTicket")
	public String deleteTrainTicket(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			int ticketNo) {
		
		int result = service.deleteTrainTicket(ticketNo);
		
		if (result > 0) {
			model.addAttribute("msg", "예약이 해제되었습니다.");
		} else {
			model.addAttribute("msg", "예약 해제에 실패하였습니다.");
		}
		
		model.addAttribute("location", "/car/traffic-mybook");
		return "/common/msg";
	}

	
	
	public static List<Bus> parsingBus(String inputDepTerminalId, String inputArrTerminalId, String inputDepPlandTime, String inputBusGradeId){
		List<Bus> list = new ArrayList<>();

		try {
			StringBuilder urlBuilder = new StringBuilder(API_URL);
			urlBuilder.append("/getStrtpntAlocFndExpbusInfo?" + "serviceKey=" + KEY);
			urlBuilder.append("&" + "pageNo=1&numOfRows=100&_type=json");
			urlBuilder.append("&" + "depTerminalId=" + inputDepTerminalId);
			urlBuilder.append("&" + "arrTerminalId=" + inputArrTerminalId);
			urlBuilder.append("&" + "depPlandTime=" + inputDepPlandTime); // 20221231
			urlBuilder.append("&" + "busGradeId=" + inputBusGradeId); // 1 2 3 4 5 6
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			int code = conn.getResponseCode();
			if (code < 200 || code >= 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return list;
			}

			InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			

			JSONParser jsonParser = new JSONParser();
			JSONObject rootObj = (JSONObject) jsonParser.parse(br);
			JSONObject childObj1 = (JSONObject) rootObj.get("response");
			JSONObject childObj2 = (JSONObject) childObj1.get("body");
			JSONObject childObj3 = (JSONObject) childObj2.get("items");
			JSONArray array1 = (JSONArray) childObj3.get("item");
			
			for(int i=0; i<array1.size();i++) {
				JSONObject obj = (JSONObject) array1.get(i);
				String arrPlaceNm = getStrData(obj, "arrPlaceNm");
//				String arrPlandTime = getDateData(obj, "arrPlandTime");
				String arrPlandTime = obj.get("arrPlandTime").toString();
				String charge = obj.get("charge").toString();
				String depPlaceNm = getStrData(obj, "depPlaceNm");
				String depPlandTime = obj.get("depPlandTime").toString();
//				String depPlandTime = getDateData(obj, "depPlandTime");
				String gradeNm = getStrData(obj, "gradeNm");
				
				Bus businfo = new Bus();
				businfo.setArrPlaceNm(arrPlaceNm);
				businfo.setArrPlandTime(arrPlandTime);
				businfo.setCharge(charge);
				businfo.setDepPlaceNm(depPlaceNm);
				businfo.setDepPlandTime(depPlandTime);
				businfo.setGradeNm(gradeNm);
				
				list.add(businfo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Train> parsingTrain(String inputDepPlaceId, String inputArrPlaceId, String inputDepPlandTime, String inputTrainGradeCode){
		List<Train> list = new ArrayList<>();

		try {
			StringBuilder urlBuilder = new StringBuilder(API_URL1);
			urlBuilder.append("/getStrtpntAlocFndTrainInfo?" + "serviceKey=" + KEY);
			urlBuilder.append("&" + "pageNo=1&numOfRows=200&_type=json");
			urlBuilder.append("&" + "depPlaceId=" + inputDepPlaceId);
			urlBuilder.append("&" + "arrPlaceId=" + inputArrPlaceId);
			urlBuilder.append("&" + "depPlandTime=" + inputDepPlandTime); // 2022123100
//			urlBuilder.append("&" + "trainGradeCode=" + inputTrainGradeCode); // 00 01 02 03 04 05 06
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			int code = conn.getResponseCode();
			if (code < 200 || code >= 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return list;
			}

			InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			

			JSONParser jsonParser = new JSONParser();
			JSONObject rootObj = (JSONObject) jsonParser.parse(br);
			JSONObject childObj1 = (JSONObject) rootObj.get("response");
			JSONObject childObj2 = (JSONObject) childObj1.get("body");
			JSONObject childObj3 = (JSONObject) childObj2.get("items");
			JSONArray array1 = (JSONArray) childObj3.get("item");
			
			for(int i=0; i<array1.size();i++) {
				JSONObject obj = (JSONObject) array1.get(i);
				String arrPlaceNm = getStrData(obj, "arrplacename");
//				String arrPlandTime = getDateData(obj, "arrPlandTime");
				String arrPlandTime = obj.get("arrplandtime").toString();
//				String charge = obj.get("adultcharge").toString();
				String charge = "50000";
				String depPlaceNm = getStrData(obj, "depplacename");
				String depPlandTime = obj.get("depplandtime").toString();
//				String depPlandTime = getDateData(obj, "depPlandTime");
				String gradeNm = getStrData(obj, "traingradename");
				
				
//				Train trainInfo = new Train(arrPlaceNm, arrPlandTime, charge, depPlaceNm, depPlandTime, gradeNm);
				Train trainInfo = new Train();
				trainInfo.setArrPlaceNm(arrPlaceNm);
				trainInfo.setArrPlandTime(arrPlandTime);
				trainInfo.setCharge(charge);
				trainInfo.setDepPlaceNm(depPlaceNm);
				trainInfo.setDepPlandTime(depPlandTime);
				trainInfo.setGradeNm(gradeNm);
				
				list.add(trainInfo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	private static String getStrData(JSONObject obj, String key) {
		String str = (String) obj.get(key);
		if (str == null) {
			return "-";
		} else {
			return str;
		}
	}
	
	private static String monthToNum(String str) {
		String result = null;
		
		if(str.equalsIgnoreCase("Jan")) {
			result = "01";
		}else if(str.equalsIgnoreCase("Feb")) {
			result = "02";
		}else if(str.equalsIgnoreCase("Mar")) {
			result = "03";
		}else if(str.equalsIgnoreCase("Apr")) {
			result = "04";
		}else if(str.equalsIgnoreCase("May")) {
			result = "05";
		}else if(str.equalsIgnoreCase("Jun")) {
			result = "06";
		}else if(str.equalsIgnoreCase("Jul")) {
			result = "07";
		}else if(str.equalsIgnoreCase("Aug")) {
			result = "08";
		}else if(str.equalsIgnoreCase("Sep")) {
			result = "09";
		}else if(str.equalsIgnoreCase("Oct")) {
			result = "10";
		}else if(str.equalsIgnoreCase("Nov")) {
			result = "11";
		}else if(str.equalsIgnoreCase("Dec")) {
			result = "12";
		}
		
		return result;
	}
}