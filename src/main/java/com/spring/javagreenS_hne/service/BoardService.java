package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_hne.vo.BoardReplyVO;
import com.spring.javagreenS_hne.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> getBoardList(int startIndexNo, int pageSize);

	public void imgCheck(String content);

	public void setBoardInput(BoardVO vo, MultipartHttpServletRequest file);

	public void setReadNum(int idx);

	public BoardVO getBoardContent(int idx);

	public List<BoardVO> getBoardSearch(int startIndexNo, int pageSize, String search, String searchString);

	public ArrayList<BoardVO> getPreNext(int idx);

	public int getMinIdx();

	public void imgDelete(String content);

	public void setBoardDelete(int idx);

	public void imgCheckUpdate(String content);

	public void setBoardUpdate(BoardVO vo);

	public String maxLevelOrder(int boardIdx);

	public void setBoardReplyInput(BoardReplyVO replyVo);

	public ArrayList<BoardReplyVO> getBoardReply(int idx);

	public void levelOrderPlusUpdate(BoardReplyVO replyVo);

	public void setBoardReplyInput2(BoardReplyVO replyVo);

	public void setBoardReplyDeleteOk(int idx);

}
