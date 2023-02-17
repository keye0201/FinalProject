package com.multi.campong.camping.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.multi.campong.camping.model.service.CampingService;
import com.multi.campong.camping.model.vo.Camping;
import com.multi.campong.camping.model.vo.CampingContentsReply;
import com.multi.campong.common.util.PageInfo;
import com.multi.campong.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/camping") // 요청 url의 상위 url을 모두 처리할때 사용
@Controller
public class CampingController {
	
	@Autowired
	private CampingService service;
	
	final static private String savePath = "c:\\campong\\upload\\";
//	final static private String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\upload\\";
	
	@GetMapping("/camping-main")
	public String campingMain(Model model,
			@SessionAttribute(name = "mvo", required = false) Member loginMember,
			@RequestParam Map<String, String> paramMap,
			@RequestParam(required = false) List<String> checkedTheme,
			@RequestParam(required = false) List<String> checkedFclty,
			@RequestParam(required = false) String checkedPet,
			@RequestParam(required = false) String sido,
			@RequestParam(required = false) String lctCl) {
//		log.info("리스트 요청, param : " + paramMap);
//		log.info("리스트 요청, checkedTheme : " + checkedTheme);
//		log.info("리스트 요청, checkedFclty : " + checkedFclty);
//		log.info("리스트 요청, checkedPet : " + checkedPet);
//		log.info("리스트 요청, sido : " + sido);
//		log.info("리스트 요청, lctCl : " + lctCl);
		int page = 1;

		// 탐색할 맵을 선언
		Map<String, Object> searchMap = new HashMap<>();
		try {
			String searchSido = paramMap.get("sido");
			String searchGugun = paramMap.get("gugun");
			String searchLctCl = paramMap.get("lctCl");
			String searchValue = paramMap.get("searchValue");
			
			if(searchSido != null && searchSido.length() > 0 && !searchSido.equals("전체")) {
				searchMap.put("sido", searchSido);
			}
			if(searchGugun != null && searchGugun.length() > 0 && !searchGugun.equals("전체")) {
				searchMap.put("gugun", searchGugun);
			}
			if(searchLctCl != null && searchLctCl.length() > 0 && !searchLctCl.equals("전체")) {
				searchMap.put("lctCl", searchLctCl);
			}
			if(searchValue != null && searchValue.length() > 0) {
				searchMap.put("facltNm", searchValue);
			}
			searchMap.put("checkedTheme", checkedTheme);
			if (checkedTheme == null) {
				checkedTheme = new ArrayList<>();
			}
			searchMap.put("checkedFclty", checkedFclty);
			if (checkedFclty == null) {
				checkedFclty = new ArrayList<>();
			}
			searchMap.put("checkedPet", checkedPet);
			if (checkedPet == null) {
				checkedPet = new String();
			}
			if (lctCl == null) {
				lctCl = new String();
			}
			if (sido == null) {
				sido = new String();
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {}
		
		if(loginMember != null) {
			searchMap.put("mNo", ""+loginMember.getMNo());
		}
		
		int campingCount = service.getCampingCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, campingCount, 5);
		List<Camping> list = service.getCampingList(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("campingCount", campingCount);
		model.addAttribute("checkedTheme", checkedTheme);
		model.addAttribute("checkedFclty", checkedFclty);
		model.addAttribute("checkedPet", checkedPet);
		model.addAttribute("selectedSido", sido);
		model.addAttribute("selectedLctCl", lctCl);
		
		return "camping/camping-main";
	}
	
	@RequestMapping("/camping-detail")
	public String campingDetail(Model model,
			@SessionAttribute(name = "mvo", required = false) Member loginMember,
			@RequestParam("contentId") int contentId) {
		int mNo = 0;
		if(loginMember != null) {
			mNo = loginMember.getMNo();
		}
		
		Camping content = service.findByNo(contentId, mNo);
		
//		String dir = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\upload";
//		log.info("위치 : " + dir);
		
		if(content == null) {
			return "redirect:error";
		}
		String[] facilitys = content.getSbrsCl().split(",");
		
		model.addAttribute("content", content);
		model.addAttribute("facilitys", facilitys);
		model.addAttribute("replyList", content.getReplyList());
//		model.addAttribute("upload", savePath);
		return "camping/camping-detail";
	}
	
	@RequestMapping("/reply")
	public String writeReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			@ModelAttribute CampingContentsReply reply,
			@RequestParam("upfile") MultipartFile upfile) {
		// 로그인한 멤버의 정보 입력
		reply.setMNo(loginMember.getMNo());

		// 파일 저장 로직
		if (upfile != null && upfile.isEmpty() == false) {
			String renameFileName = service.saveFile(upfile, savePath);

			if (renameFileName != null) {
				reply.setOriginalFileName(upfile.getOriginalFilename());
				reply.setRenameFileName(renameFileName);
			}
		}
		
		int result = service.saveReply(reply);

		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/camping/camping-detail?contentId=" + reply.getContentId());
		return "common/msg";
	}
	
	@RequestMapping("/replyDel")
	public String deleteReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			int replyNo, int contentId) {
		log.info("댓글 삭제 요청");
		int result = service.deleteReply(replyNo);

		if (result > 0) {
			model.addAttribute("msg", "댓글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/camping/camping-detail?contentId=" + contentId);
		return "/common/msg";
	}
	
	@GetMapping("/file/{fileName}")
	@ResponseBody
	public Resource downloadImage(@PathVariable("fileName") String fileName, Model model) throws IOException {
		return new UrlResource("file:" + savePath + fileName);
	}

	@RequestMapping("/fileDown")
	public ResponseEntity<Resource> fileDown(@RequestParam("oriname") String oriname,
			@RequestParam("rename") String rename, @RequestHeader(name = "user-agent") String userAgent) {
		try {
			Resource resource = new UrlResource("file:" + savePath + rename + "");
			String downName = null;

			// 인터넷 익스플로러 인 경우
			boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;

			if (isMSIE) { // 익스플로러 처리하는 방법
				downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1"); // 크롬
			}
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + downName + "\"")
					.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(resource.contentLength()))
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString()).body(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패했을 경우
	}
	
	
	// 댓글 이미지 관련(수정 또는 삭제 해야할 부분)
	@GetMapping("/display")
	public ResponseEntity<Resource> display(@RequestParam("filename") String filename) {
//		String path = "C:\\campong\\upload\\";
		String folder = "";
		Resource resource = new FileSystemResource(savePath + folder + filename);
		log.info("사진 불러오기 resource : " + resource);
		if(!resource.exists()) 
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		HttpHeaders header = new HttpHeaders();
		Path filePath = null;
		try{
			filePath = Paths.get(savePath + folder + filename);
			header.add("Content-type", Files.probeContentType(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("/images/{filename}")
	public Resource showImage(@PathVariable String filename) throws MalformedURLException {
	    return new UrlResource("file:" + savePath + filename);
	}
	
	@GetMapping("/bookmark") 
	public ResponseEntity<Integer> campBookmark(
			@SessionAttribute(name = "mvo", required = false) Member loginMember,
			int contentId, int isBookmark)
	{
		int result = 0;
		if(isBookmark == 1) {
			result = service.bookmarkCamp(loginMember.getMNo(), contentId);	
		}else {
			result = service.unBookmarkCamp(loginMember.getMNo(), contentId);	
		}
		
		if(result > 0) {
			return ResponseEntity.status(HttpStatus.OK).body(isBookmark);
		}else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
		}
		
	}
}
