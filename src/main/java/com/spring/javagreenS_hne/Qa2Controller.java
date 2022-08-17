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
import com.spring.javagreenS_hne.service.Qa2Service;
import com.spring.javagreenS_hne.vo.MemberVO;
import com.spring.javagreenS_hne.vo.Qa2VO;


@Controller
@RequestMapping("/qa2")
public class Qa2Controller {
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	Qa2Service qa2Service;
	
	@Autowired
	MemberService memberService;


	@RequestMapping(value = "/qaMain2", method = RequestMethod.GET)
	public String qaMain2(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="caseone", defaultValue = "전체", required = false) String caseone,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "qa2", "", caseone);
		
	
	  List<Qa2VO> vos = qa2Service.getQaList(pageVO.getStartIndexNo(), pageSize, caseone);
	  model.addAttribute("vos", vos);
		 
		model.addAttribute("pageVO",pageVO);
		
		List<String> caseoneVos = qa2Service.getCaseOne();
		model.addAttribute("caseoneVos", caseoneVos);
		
		return "qa2/qaMain2";
	}

	@RequestMapping(value = "/qaInput", method = RequestMethod.GET)
	public String qaInputGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		
		return "qa2/qaInput";
	}
	@RequestMapping(value = "/qaInput", method = RequestMethod.POST)
	public String qaInputPost(Qa2VO vo) {
		System.out.println("vo : " + vo);
		
		qa2Service.setQaInput(vo);
		return "redirect:/msg/qa2InputOk";
	}
	@RequestMapping(value = "/qaContent", method = RequestMethod.GET)
	public String qaContentGet(int idx, int pag, int pageSize, Model model, HttpSession session) {
		
		Qa2VO vo = qa2Service.getQaContent(idx);
		
		ArrayList<Qa2VO> pnVos = qa2Service.getPreNext(idx);
		int minIdx = qa2Service.getMinIdx();
		
		model.addAttribute("vo", vo);
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("minIdx", minIdx);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);

		return "qa2/qaContent";
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
		
		List<Qa2VO> vos = qa2Service.getQaSearch(pageVO.getStartIndexNo(), pageSize, search, searchString);
		
		String searchTitle;
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("name")) searchTitle = "이름";
		else searchTitle = "글내용";
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchString",searchString);
		
		return "qa2/qaSearch";
	}
	@RequestMapping(value = "/qaDeleteOk", method = RequestMethod.GET)
	public String qaDeleteOkGet(int idx, int pag, int pageSize, Model model) {
		Qa2VO vo = qa2Service.getQaContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1);
		
		qa2Service.setQaDelete(idx);
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
		return "redirect:/msg/qa2DeleteOk";
	}
	@RequestMapping(value = "/qaUpdate", method = RequestMethod.GET)
	public String qaUpdateGet(int idx, int pag, int pageSize, Model model) {
		Qa2VO vo = qa2Service.getQaContent(idx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		
		return "qa2/qaUpdate";
	}
	
	@RequestMapping(value = "/qaUpdate", method = RequestMethod.POST)
	public String qaUpdatePost(Qa2VO vo, int pag, int pageSize, Model model) {
	Qa2VO oriVo = qa2Service.getQaContent(vo.getIdx());
	
	if(!oriVo.getContent().equals(vo.getContent()))	{
		System.out.println("공지사항 내용 수정 완료");
	}
	
	qa2Service.setQaUpdate(vo);
	
	model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
	
	return "redirect:/msg/qa2UpdateOk";
	}
}
