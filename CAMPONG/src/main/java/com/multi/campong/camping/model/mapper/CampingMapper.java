package com.multi.campong.camping.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.camping.model.vo.Camping;
import com.multi.campong.camping.model.vo.CampingContentsReply;

@Mapper
public interface CampingMapper {
	List<Camping> selectCampingList(Map<String, Object> map);
	int selectCampingCount(Map<String, Object> map);
	Camping selectCampingByNo(Map<String, String> map);
	int insertReply(CampingContentsReply reply);
	int deleteReply(int no);
	void updateReadCount(Camping camping);
	void updateReviewCount(Camping camping);
	void updateBookmarkCount(Camping camping);
	int bookmarkCamp(Map<String, String> map);
	int unBookmarkCamp(Map<String, String> map);
}
