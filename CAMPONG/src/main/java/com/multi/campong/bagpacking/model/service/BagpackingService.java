package com.multi.campong.bagpacking.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.campong.bagpacking.model.mapper.BagpackingMapper;
import com.multi.campong.bagpacking.model.vo.Bagpacking;
import com.multi.campong.bagpacking.model.vo.BagpackingReply;
import com.multi.campong.bagpacking.model.vo.Fishing;
import com.multi.campong.bagpacking.model.vo.FishingReply;
import com.multi.campong.common.util.PageInfo;

@Service
public class BagpackingService {
	@Autowired
	private BagpackingMapper mapper;
	
	public int getBagpackingCount(Map<String, String> param) {
		return mapper.selectBagpackingCount(param);
	}
	
	public List<Bagpacking> getBagpackingList(PageInfo pageInfo, Map<String, String> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectBagpackingList(param);
	}
	
	public int getIslandCount(Map<String, String> param) {
		return mapper.selectIslandCount(param);
	}
	
	public List<Bagpacking> getIslandList(PageInfo pageInfo, Map<String, String> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectIslandList(param);
	}
	
	public int getFishingCount(Map<String, String> param) {
		return mapper.selectFishingCount(param);
	}
	
	public List<Fishing> getFishingList(PageInfo pageInfo, Map<String, String> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectFishingList(param);
	}
	
	public List<Bagpacking> getBagpackingBestList(Map<String, String> param){
		return mapper.selectBagpackingBestList(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Bagpacking findByNo(int contentId) {
		Bagpacking bagpacking = mapper.selectBagpackingByNo(contentId); 
//		bagpacking.setReadCount(bagpacking.getReadCount() + 1);  
//		mapper.updateReadCount(bagpacking);
		return bagpacking; 
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Fishing findByNo2(int fishingNo) {
		Fishing fishing = mapper.selectFishingByNo(fishingNo); 
//		bagpacking.setReadCount(bagpacking.getReadCount() + 1);  
//		mapper.updateReadCount(bagpacking);
		return fishing; 
	}

	@Transactional(rollbackFor = Exception.class)
	public int saveBagpackingReply(BagpackingReply reply) {
		return mapper.insertBagpackingReply(reply);
	}

	public int deleteBagpackingReply(int replyNo) {
		return mapper.deleteBagpackingReply(replyNo);
	}

	public int saveFishingReply(FishingReply reply) {
		return mapper.insertFishingReply(reply);
	}

	public int deleteFishingReply(int replyNo) {
		return mapper.deleteFishingReply(replyNo);
	}
}
