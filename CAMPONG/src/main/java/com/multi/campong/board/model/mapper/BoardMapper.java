package com.multi.campong.board.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.campong.board.model.vo.Board;
import com.multi.campong.board.model.vo.Reply;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(Map<String, String> map);
	int selectBoardCount(Map<String, String> map);
	Board selectBoardByNo(int no);
	int replyCount(int no);
	int insertBoard(Board board);
	int insertReply(Reply reply);
	int updateBoard(Board board);
	int updateReadCount(Board board);
	int deleteBoard(int no);
	int deleteReply(int no);
	
	//공지 게시판
	List<Board> selectNoticeList(Map<String, String> map);
	int selectNoticeCount(Map<String, String> map);
	Board selectNoticeByNo(int no);
	int insertNotice(Board board);
	int updateNotice(Board board);
}
