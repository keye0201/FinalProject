package com.multi.campong.bagpacking.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.bagpacking.model.vo.Bagpacking;
import com.multi.campong.bagpacking.model.vo.BagpackingReply;
import com.multi.campong.bagpacking.model.vo.Fishing;
import com.multi.campong.bagpacking.model.vo.FishingReply;

@Mapper
public interface BagpackingMapper {
	List<Bagpacking> selectBagpackingList(Map<String, String> map);
	int selectBagpackingCount(Map<String, String> map);
	List<Bagpacking> selectIslandList(Map<String, String> map);
	int selectIslandCount(Map<String, String> map);
	List<Fishing> selectFishingList(Map<String, String> map);
	int selectFishingCount(Map<String, String> map);
	Bagpacking selectBagpackingByNo(int contentId);
	Fishing selectFishingByNo(int fishingNo);
	List<Bagpacking> selectBagpackingBestList(Map<String, String> map);
//	int updateReadCount(Bagpacking bagpacking);
	int insertBagpackingReply(BagpackingReply reply);
	int deleteBagpackingReply(int replyNo);
	int insertFishingReply(FishingReply reply);
	int deleteFishingReply(int replyNo);
	

	//메인에서 쓰는것
	List<Bagpacking> selectByBackpacking();
	List<Bagpacking> selectByBackpacking2(String idCheck);
	//메인에서 쓰는것끝
}
