package com.spring.javagreenS_hne;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.spring.javagreenS_hne.service.QaService;
import com.spring.javagreenS_hne.vo.MemberVO;
import com.spring.javagreenS_hne.vo.Qa2VO;
import com.spring.javagreenS_hne.vo.QaVO;


@Controller
@RequestMapping("/qa")
public class QaController {
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	QaService qaService;
	
	@Autowired
	Qa2Service qa2Service;
	
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/qaMain", method = RequestMethod.GET)
	public String qaMainGet(HttpServletRequest request,
		@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
		@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
		@RequestParam(name="caseone", defaultValue = "전체", required = false) String caseone,
		Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "qa2", "", caseone);
		
		//FAQ
	  List<Qa2VO> voss = qa2Service.getQaList2(pageVO.getStartIndexNo(), pageSize, caseone);
	  model.addAttribute("voss", voss);
		 
		model.addAttribute("pageVO",pageVO);
		
		List<String> caseoneVos = qa2Service.getCaseOne();
		model.addAttribute("caseoneVos", caseoneVos);
		
		//공지사항
		List<QaVO> vos = qaService.getQaList2(pageVO.getStartIndexNo(), pageSize);
	  model.addAttribute("vos", vos);
		 
		model.addAttribute("pageVO",pageVO);
		
		return "qa/qaMain";
	}

	@RequestMapping(value = "/qaMain3", method = RequestMethod.GET)
	public String qaMain3(
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "qa", "", "");
		
	
	  List<QaVO> vos = qaService.getQaList(pageVO.getStartIndexNo(), pageSize);
	  model.addAttribute("vos", vos);
		 
		model.addAttribute("pageVO",pageVO);
		
		return "qa/qaMain3";
	}
	@RequestMapping(value = "/qaInput", method = RequestMethod.GET)
	public String qaInputGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		
		return "qa/qaInput";
	}
	@RequestMapping(value = "/qaInput", method = RequestMethod.POST)
	public String qaInputPost(QaVO vo) {
		System.out.println("vo : " + vo);
		
		qaService.setQaInput(vo);
		return "redirect:/msg/qaInputOk";
	}
	@RequestMapping(value = "/qaMain4", method = RequestMethod.GET)
	public String qaMain4Get(HttpServletRequest request) {
		return "qa/qaMain4";
	}
	@RequestMapping(value = "/qaContent", method = RequestMethod.GET)
	public String qaContentGet(int idx, int pag, int pageSize, Model model, HttpSession session) {
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) contentIdx = new ArrayList<String>();
		
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		QaVO vo = qaService.getQaContent(idx);
		
		ArrayList<QaVO> pnVos = qaService.getPreNext(idx);
		int minIdx = qaService.getMinIdx();
		
		model.addAttribute("vo", vo);
		model.addAttribute("pnVos", pnVos);
		model.addAttribute("minIdx", minIdx);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);

		return "qa/qaContent";
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
		
		List<QaVO> vos = qaService.getQaSearch(pageVO.getStartIndexNo(), pageSize, search, searchString);
		
		String searchTitle;
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("name")) searchTitle = "이름";
		else searchTitle = "글내용";
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchString",searchString);
		
		return "qa/qaSearch";
	}
	@RequestMapping(value = "/qaDeleteOk", method = RequestMethod.GET)
	public String qaDeleteOkGet(int idx, int pag, int pageSize, Model model) {
		QaVO vo = qaService.getQaContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1);
		
		qaService.setQaDelete(idx);
		
		model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
		return "redirect:/msg/qaDeleteOk";
	}
	@RequestMapping(value = "/qaUpdate", method = RequestMethod.GET)
	public String qaUpdateGet(int idx, int pag, int pageSize, Model model) {
		QaVO vo = qaService.getQaContent(idx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		
		return "qa/qaUpdate";
	}
	
	@RequestMapping(value = "/qaUpdate", method = RequestMethod.POST)
	public String qaUpdatePost(QaVO vo, int pag, int pageSize, Model model) {
	QaVO oriVo = qaService.getQaContent(vo.getIdx());
	
	if(!oriVo.getContent().equals(vo.getContent()))	{
		System.out.println("공지사항 내용 수정 완료");
	}
	
	qaService.setQaUpdate(vo);
	
	model.addAttribute("flag", "?pag="+pag+"&pageSize="+pageSize);
	
	return "redirect:/msg/qaUpdateOk";
	}
}
