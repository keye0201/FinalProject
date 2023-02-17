package com.multi.campong.board.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.multi.campong.board.model.service.BoardService;
import com.multi.campong.board.model.vo.Board;
import com.multi.campong.board.model.vo.Reply;
import com.multi.campong.common.util.PageInfo;
import com.multi.campong.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board") // 요청 url의 상위 url을 모두 처리할때 사용
@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	final static private String savePath = "c:\\campong\\";

	@GetMapping("/board-list")
	public String list(Model model, @RequestParam Map<String, String> paramMap) {
		int page = 1;

		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchValue = paramMap.get("searchValue");
			if (searchValue != null && searchValue.length() > 0) {
				String searchType = paramMap.get("searchType");
				searchMap.put(searchType, searchValue);
			} else {
				paramMap.put("searchType", "title");
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {
		}

		int boardCount = service.getBoardCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 10);
		List<Board> list = service.getBoardList(pageInfo, searchMap);

		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		return "board/board-list";
	}

	@RequestMapping("/board-view")
	public String view(Model model, @RequestParam("no") int no) {
		Board board = service.findByNo(no);
		if (board == null) {
			return "redirect:error";
		}

		model.addAttribute("board", board);
		model.addAttribute("replyList", board.getReplyList());
		return "board/board-view";
	}

	@GetMapping("/error")
	public String error() {
		return "common/error";
	}

	@GetMapping("/board-write")
	public String writeView() {
		return "board/board-write";
	}

	@PostMapping("/board-write")
	public String writeBoard(Model model, HttpSession session,
			@SessionAttribute(name = "mvo", required = false) Member loginMember, @ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile) {
		log.info("게시글 작성 요청");

		board.setUNo(loginMember.getMNo()); // 로그인 적용후 교체
//		board.setUNo(1);
		
		// 파일 저장 로직
		if (upfile != null && upfile.isEmpty() == false) {
			String renameFileName = service.saveFile(upfile, savePath);

			if (renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenameFileName(renameFileName);
			}
		}

		log.debug("board : " + board);
		int result = service.saveBoard(board);
		System.out.println(result);
		if (result > 0) {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("location", "/board/board-list");
		} else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/board-list");
		}

		return "common/msg";
	}

	@RequestMapping("/reply")
	public String writeReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			@ModelAttribute Reply reply) {
		reply.setUNo(loginMember.getMNo()); // 로그인 기능 구현 후 교체할 것
//		reply.setUNo(1); // uNO 1로 테스트
		log.info("리플 작성 요청 Reply : " + reply);

		int result = service.saveReply(reply);

		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/board-view?no=" + reply.getBNo());
		return "common/msg";
	}

	@RequestMapping("/delete")
	public String deleteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "mvo", required = false) Member loginMember, int boardNo) {
		log.info("게시글 삭제 요청 boardNo : " + boardNo);
		int result = service.deleteBoard(boardNo, savePath);

		if (result > 0) {
			model.addAttribute("msg", "게시글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/board-list");
		return "common/msg";
	}

	@RequestMapping("/replyDel")
	public String deleteReply(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			int replyNo, int boardNo) {
		log.info("댓글 삭제 요청");
		int result = service.deleteReply(replyNo);

		if (result > 0) {
			model.addAttribute("msg", "댓글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/board-view?no=" + boardNo);
		return "/common/msg";
	}

	@GetMapping("/board-update")
	public String updateView(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			@RequestParam("no") int no) {
		Board board = service.findByNo(no);
		model.addAttribute("board", board);
		return "board/board-update";
	}

	@PostMapping("/board-update")
	public String updateBoard(Model model, HttpSession session,
			@SessionAttribute(name = "mvo", required = false) Member loginMember, @ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile) {
		log.info("게시글 수정 요청");

		board.setUNo(loginMember.getMNo()); // 로그인 적용 후 교체
//		board.setUNo(1);

		
		// 파일 저장 로직
		if(reloadFile != null && reloadFile.isEmpty() == false) {
			// 기존 파일이 있는 경우 삭제
			if(board.getRenameFileName() != null) {
				service.deleteFile(savePath + "/" +board.getRenameFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenameFileName(renameFileName);
			}
		}

		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if (result > 0) {
			model.addAttribute("msg", "게시글이 수정 되었습니다.");
			model.addAttribute("location", "/board/board-view?no=" + board.getBNo());
		} else {
			model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
			model.addAttribute("location", "/board/board-view?no=" + board.getBNo());
		}

		return "common/msg";
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
	
	
	// 공지게시판
	@GetMapping("/notice-list")
	public String noticeList(Model model, @RequestParam Map<String, String> paramMap) {
		int page = 1;

		// 탐색할 맵을 선언
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchValue = paramMap.get("searchValue");
			if (searchValue != null && searchValue.length() > 0) {
				String searchType = paramMap.get("searchType");
				searchMap.put(searchType, searchValue);
			} else {
				paramMap.put("searchType", "title");
			}
			page = Integer.parseInt(paramMap.get("page"));
		} catch (Exception e) {
		}

		int boardCount = service.getNoticeCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 10);
		List<Board> list = service.getNoticeList(pageInfo, searchMap);

		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("pageInfo", pageInfo);
		return "board/notice-list";
	}

	@RequestMapping("/notice-view")
	public String noticeView(Model model, @RequestParam("no") int no) {
		Board board = service.findByNoticeNo(no);
		if (board == null) {
			return "redirect:error";
		}

		model.addAttribute("board", board);
		return "board/notice-view";
	}
	
	@GetMapping("/notice-write")
	public String noticeWriteView() {
		return "board/notice-write";
	}

	@PostMapping("/notice-write")
	public String noticeWriteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "mvo", required = false) Member loginMember, @ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile) {
		log.info("게시글 작성 요청");

		board.setUNo(loginMember.getMNo()); // 로그인 적용후 어드민으로 교체
//		board.setUNo(1);

		// 파일 저장 로직
		if (upfile != null && upfile.isEmpty() == false) {
			String renameFileName = service.saveFile(upfile, savePath);

			if (renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenameFileName(renameFileName);
			}
		}

		log.debug("board : " + board);
		int result = service.saveNotice(board);

		if (result > 0) {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("location", "/board/notice-list");
		} else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/notice-list");
		}

		return "common/msg";
	}

	@RequestMapping("/noticeDelete")
	public String noticeDeleteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "mvo", required = false) Member loginMember, int boardNo) {
		log.info("게시글 삭제 요청 boardNo : " + boardNo);
		int result = service.deleteBoard(boardNo, savePath);

		if (result > 0) {
			model.addAttribute("msg", "게시글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/notice-list");
		return "common/msg";
	}

	@GetMapping("/notice-update")
	public String noticeUpdateView(Model model, @SessionAttribute(name = "mvo", required = false) Member loginMember,
			@RequestParam("no") int no) {
		Board board = service.findByNoticeNo(no);
		model.addAttribute("board", board);
		return "board/notice-update";
	}

	@PostMapping("/notice-update")
	public String noticeUpdateBoard(Model model, HttpSession session,
			@SessionAttribute(name = "mvo", required = false) Member loginMember, @ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile) {
		log.info("공지사항 게시글 수정 요청");

		board.setUNo(loginMember.getMNo()); // 로그인 적용 후 교체
//		board.setUNo(1);

		// 파일 저장 로직
		if(reloadFile != null && reloadFile.isEmpty() == false) {
			// 기존 파일이 있는 경우 삭제
			if(board.getRenameFileName() != null) {
				service.deleteFile(savePath + "/" +board.getRenameFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenameFileName(renameFileName);
			}
		}

		log.debug("board : " + board);
		int result = service.saveNotice(board);

		if (result > 0) {
			model.addAttribute("msg", "게시글이 수정 되었습니다.");
			model.addAttribute("location", "/board/notice-view?no=" + board.getBNo());
		} else {
			model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
			model.addAttribute("location", "/board/notice-view?no=" + board.getBNo());
		}

		return "common/msg";
	}
	
}
