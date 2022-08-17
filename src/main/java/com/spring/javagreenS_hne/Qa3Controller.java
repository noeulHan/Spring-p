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

import com.spring.javagreenS_hne.pagination.PageProcess;
import com.spring.javagreenS_hne.pagination.PageVO;
import com.spring.javagreenS_hne.service.MemberService;
import com.spring.javagreenS_hne.service.Qa3Service;
import com.spring.javagreenS_hne.vo.Qa3VO;


@Controller
@RequestMapping("/qa3")
public class Qa3Controller {
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	Qa3Service qa3Service;
	
	@Autowired
	MemberService memberService;


	@RequestMapping(value = "/qaMain5", method = RequestMethod.GET)
	public String qaMain5(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="caseone", defaultValue = "전체", required = false) String caseone,
			HttpSession session,
			Model model) {
		String email = (String)session.getAttribute("sEmail");
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "qa3", email, caseone);
		
		int cnt=qa3Service.getCnt(email);
		int cnt2=qa3Service.getCnt2(email);
	  List<Qa3VO> vos = qa3Service.getQaList(pageVO.getStartIndexNo(), pageSize, caseone, email);
	  model.addAttribute("vos", vos);
		 
		model.addAttribute("pageVO",pageVO);
		
		List<String> caseoneVos = qa3Service.getCaseOne();
		model.addAttribute("caseoneVos", caseoneVos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt2);
		
		return "qa/qaMain5";
	}
	
	@RequestMapping(value = "/qaList", method = RequestMethod.GET)
	public String qaList(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="caseone", defaultValue = "전체", required = false) String caseone,
			HttpSession session,
			Model model) {
		String idx = (String)session.getAttribute("sIdx");
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "qa33", caseone, "");
		
		int cnt=qa3Service.getCnt3(idx);
		int cnt2=qa3Service.getCnt23(idx);
		
		List<Qa3VO> vos = qa3Service.getQaList3(pageVO.getStartIndexNo(), pageSize, caseone, idx);
		model.addAttribute("vos", vos);
		System.out.println("pageVO"+pageVO);
		System.out.println("vos"+vos);
		model.addAttribute("pageVO",pageVO);
		
		List<String> caseoneVos = qa3Service.getCaseOne();
		model.addAttribute("caseoneVos", caseoneVos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt2);
		
		System.out.println("pageVO : " + pageVO);
		System.out.println("caseoneVos : " + caseoneVos);
		
		return "qa3/qaList";
	}

  @RequestMapping(value = "/qaInput", method = RequestMethod.GET)
  public String qaMain5Get(String qnaSw, HttpSession session, Model model) {
  	String mid = (String) session.getAttribute("sMid");
  	String email = qa3Service.getEmail(mid);
  	
  	model.addAttribute("qnaSw", qnaSw);
  	model.addAttribute("email", email);
  	
  	return "qa3/qaInput";
  }
  
  @RequestMapping(value = "/qaInput", method = RequestMethod.POST)
  public String qaMain5Post(Qa3VO vo, HttpSession session) {
  	int level = (int) session.getAttribute("sLevel");
  	
  	int newIdx = qa3Service.getMaxIdx() + 1;
  	vo.setIdx(newIdx);
  	
  	String qnaIdx = "";
  	if(newIdx < 10) qnaIdx = "0"+ newIdx + "_2";
  	else qnaIdx = newIdx + "_2";
  	
  	if(vo.getQnaSw().equals("a")) {  
  		qnaIdx = vo.getQnaIdx().split("_")[0]+"_1";
  		if(level == 0) vo.setTitle(vo.getTitle().replace("(Re)", "<font color='#c39869;'>(Re)</font>"));
  	}
  	vo.setQnaIdx(qnaIdx);
  	
  	
  	qa3Service.qnaInputOk(vo);
  	
  	return "redirect:/msg/qa3InputOk";
  }
	@RequestMapping(value = "/qaContent", method = RequestMethod.GET)
	public String qaContentGet(int idx, int pag, int pageSize, Model model, HttpSession session) {
		
		Qa3VO vo = qa3Service.getQaContent(idx);
		
		ArrayList<Qa3VO> pnVos = qa3Service.getPreNext(idx);
		int minIdx = qa3Service.getMinIdx();
		
		model.addAttribute("vo", vo);
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("minIdx", minIdx);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);

		return "qa3/qaContent";
	}
	
	 @RequestMapping(value = "/qnaContent", method = RequestMethod.GET)
	  public String qnaListGet(int idx, String title, int pag, HttpSession session, Model model) {
	  	String mid = (String) session.getAttribute("sMid");
	  	String email = qa3Service.getEmail(mid);
	  	
	  	Qa3VO vo = qa3Service.getQnaContent(idx);
	  	model.addAttribute("email", email);
	  	model.addAttribute("title", title);
	  	model.addAttribute("pag", pag);
	  	model.addAttribute("vo", vo);
	  	
	  	return "qa3/qnaContent";
	  }
	
	@RequestMapping(value = "/qaSearch", method = RequestMethod.POST)
	public String qasSearchPost(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			String search,
			String searchString,
			Model model) {
		pageSize = 100;
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "board", search, searchString);
		
		List<Qa3VO> vos = qa3Service.getQaSearch(pageVO.getStartIndexNo(), pageSize, search, searchString);
		
		String searchTitle;
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("name")) searchTitle = "이름";
		else searchTitle = "글내용";
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchString",searchString);
		
		return "qa3/qaSearch";
	}
	@RequestMapping(value = "/qaDeleteOk", method = RequestMethod.GET)
	public String qaDeleteOkGet(int idx, int pag, int pageSize, Model model) {
		Qa3VO vo = qa3Service.getQaContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1);
		
		qa3Service.setQaDelete(idx);
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
		return "redirect:/msg/qa3DeleteOk";
	}
	@RequestMapping(value = "/qaUpdate", method = RequestMethod.GET)
	public String qaUpdateGet(int idx, int pag, int pageSize, Model model) {
		Qa3VO vo = qa3Service.getQaContent(idx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		
		return "qa3/qaUpdate";
	}
	
	@RequestMapping(value = "/qaUpdate", method = RequestMethod.POST)
	public String qaUpdatePost(Qa3VO vo, int pag, int pageSize, Model model) {
	Qa3VO oriVo = qa3Service.getQaContent(vo.getIdx());
	
	if(!oriVo.getContent().equals(vo.getContent()))	{
		System.out.println("공지사항 내용 수정 완료");
	}
	
	qa3Service.setQaUpdate(vo);
	
	model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
	
	return "redirect:/msg/qa3UpdateOk";
	}
}
