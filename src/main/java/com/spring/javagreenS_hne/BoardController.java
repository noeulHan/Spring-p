package com.spring.javagreenS_hne;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_hne.pagination.PageProcess;
import com.spring.javagreenS_hne.pagination.PageVO;
import com.spring.javagreenS_hne.service.BoardService;
import com.spring.javagreenS_hne.service.MemberService;
import com.spring.javagreenS_hne.vo.BoardReplyVO;
import com.spring.javagreenS_hne.vo.BoardVO;
import com.spring.javagreenS_hne.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/boList", method = RequestMethod.GET)
	public String boListGet(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "board", "", "");
		
		List<BoardVO> vos = boardService.getBoardList(pageVO.getStartIndexNo(), pageSize);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO",pageVO);
		
		return "board/boList";
	}
	
	@RequestMapping(value = "/boInput", method = RequestMethod.GET)
	public String boInputGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		
		return "board/boInput";
	}
	
	@RequestMapping(value = "/boInput", method = RequestMethod.POST)
	public String boInputPost(BoardVO vo, MultipartHttpServletRequest file) {
		System.out.println("vo : " + vo);
		boardService.imgCheck(vo.getContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/")); 
		boardService.setBoardInput(vo, file);
		
		return "redirect:/msg/boardInputOk";
	}
	
	@RequestMapping(value = "/boContent", method = RequestMethod.GET)
	public String boContentGet(int idx, int pag, int pageSize, Model model, HttpSession session) {
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) contentIdx = new ArrayList<String>();
		
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			boardService.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		BoardVO vo = boardService.getBoardContent(idx);
		
		ArrayList<BoardVO> pnVos = boardService.getPreNext(idx);
		int minIdx = boardService.getMinIdx();
		
		model.addAttribute("vo", vo);
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("minIdx", minIdx);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);

		ArrayList<BoardReplyVO> replyVos = boardService.getBoardReply(idx);
		model.addAttribute("replyVos", replyVos);
		
		return "board/boContent";
	}
	
	@RequestMapping(value = "/boSearch", method = RequestMethod.POST)
	public String boSearchPost(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			String search,
			String searchString,
			Model model) {
		pageSize = 100;
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "board", search, searchString);
		
		List<BoardVO> vos = boardService.getBoardSearch(pageVO.getStartIndexNo(), pageSize, search, searchString);
		
		String searchTitle;
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("nickName")) searchTitle = "닉네임";
		else searchTitle = "글내용";
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchString",searchString);
		
		return "board/boSearch";
	}
	
	@RequestMapping(value = "/boDeleteOk", method = RequestMethod.GET)
	public String boDeleteOkGet(int idx, int pag, int pageSize, Model model) {
		BoardVO vo = boardService.getBoardContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgDelete(vo.getContent());
		
		boardService.setBoardDelete(idx);
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
		return "redirect:/msg/boardDeleteOk";
	}
	
	@RequestMapping(value = "/boUpdate", method = RequestMethod.GET)
	public String boUpdateGet(int idx, int pag, int pageSize, Model model) {
		BoardVO vo = boardService.getBoardContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgCheckUpdate(vo.getContent());
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		
		return "board/boUpdate";
	}
	
	@RequestMapping(value = "/boUpdate", method = RequestMethod.POST)
	public String boUpdatePost(BoardVO vo, int pag, int pageSize, Model model) {
		BoardVO oriVo = boardService.getBoardContent(vo.getIdx());
		
		if(!oriVo.getContent().equals(vo.getContent()))	{
			System.out.println("라이브 내용 수정 완료");
			if(oriVo.getContent().indexOf("src=\"/") != -1) boardService.imgDelete(oriVo.getContent());
			
			vo.setContent(vo.getContent().replace("/data/ckeditor/board/", "/data/ckeditor/"));
			
			boardService.imgCheck(vo.getContent());
			
			vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
		}
		
		boardService.setBoardUpdate(vo);
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
		
		return "redirect:/msg/boUpdateOk";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyInput", method = RequestMethod.POST)
	public String boardReplyInputPost(BoardReplyVO replyVo) {
		int levelOrder = 0;
		
		String strLevelOrder = boardService.maxLevelOrder(replyVo.getBoardIdx());
		if(strLevelOrder != null) levelOrder =  Integer.parseInt(strLevelOrder) + 1;
		replyVo.setLevelOrder(levelOrder);
		
		boardService.setBoardReplyInput(replyVo);
		
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyInput2", method = RequestMethod.POST)
	public String boardReplyInput2Post(BoardReplyVO replyVo) {
		boardService.levelOrderPlusUpdate(replyVo);				
		replyVo.setLevel(replyVo.getLevel()+1);  				
		replyVo.setLevelOrder(replyVo.getLevelOrder()+1);	
		
		boardService.setBoardReplyInput2(replyVo);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boReplyDeleteOk", method = RequestMethod.POST)
	public String boReplyDeleteOkPost(int idx) {
		boardService.setBoardReplyDeleteOk(idx);
		return "";
	}
}
