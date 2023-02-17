package com.multi.campong.camping.model.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.multi.campong.bagpacking.model.vo.Bagpacking;
import com.multi.campong.camping.model.mapper.CampingMapper;
import com.multi.campong.camping.model.vo.Camping;
import com.multi.campong.camping.model.vo.CampingContentsReply;
import com.multi.campong.common.util.PageInfo;

@Service
public class CampingService {
	@Autowired
	private CampingMapper mapper;
	
	public int getCampingCount(Map<String, Object> param) {
		return mapper.selectCampingCount(param);
	}
	
	public List<Camping> getCampingList(PageInfo pageInfo, Map<String, Object> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectCampingList(param);
	}

	@Transactional(rollbackFor = Exception.class)
	public Camping findByNo(int contentId, int mNo) {
		Map<String, String> map = new HashMap<>();
		map.put("contentId", ""+ contentId);
		map.put("mNo", ""+ mNo);
		Camping camping = mapper.selectCampingByNo(map); 
		camping.setReadCount(camping.getReadCount() + 1);  
		mapper.updateReadCount(camping);
		return camping;
	}

	@Transactional(rollbackFor = Exception.class)
	public int saveReply(CampingContentsReply reply) {
		Map<String, String> map = new HashMap<>();
		map.put("contentId", ""+ reply.getContentId());
		map.put("mNo", ""+ reply.getMNo());
		Camping camping = mapper.selectCampingByNo(map);
		camping.setReviewCount(camping.getReviewCount() + 1);
		mapper.updateReviewCount(camping);
		return mapper.insertReply(reply);
	}

	@Transactional(rollbackFor = Exception.class)
	public int deleteReply(int no) {
		return mapper.deleteReply(no);
	}
	
	public String saveFile(MultipartFile upFile, String savePath) {
		File folder = new File(savePath);
		
		// 폴더 없으면 만드는 코드
		if(folder.exists() == false) {
			folder.mkdir();
		}
		System.out.println("savePath : " + savePath);
		
		// 파일이름을 랜덤하게 바꾸는 코드, test.txt -> 20221213_1728291212.txt
		String originalFileName = upFile.getOriginalFilename();
		String reNameFileName = 
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"));
		reNameFileName += originalFileName.substring(originalFileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + reNameFileName;
		
		try {
			// 실제 파일이 저장되는 코드
			upFile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}
		return reNameFileName;
	}
	
	public void deleteFile(String filePath) {
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int bookmarkCamp(int mNo, int contentId) {
		Map<String, String> map = new HashMap<>();
		map.put("contentId", ""+ contentId);
		map.put("mNo", ""+ mNo);
		Camping camping = mapper.selectCampingByNo(map);
		camping.setBookmarkCount(camping.getBookmarkCount() + 1);
		mapper.updateBookmarkCount(camping);
		return mapper.bookmarkCamp(map);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int unBookmarkCamp(int mNo, int contentId) {
		Map<String, String> map = new HashMap<>();
		map.put("contentId", ""+ contentId);
		map.put("mNo", ""+ mNo);
		Camping camping = mapper.selectCampingByNo(map);
		if(camping.getBookmarkCount() != 0) {
			camping.setBookmarkCount(camping.getBookmarkCount() - 1);
			mapper.updateBookmarkCount(camping);		
		}
		return mapper.unBookmarkCamp(map);
	}
	
	public List<Camping> getBookmarkList(int mNo) {
		return mapper.selectBookmarkList(mNo);
	}

}
