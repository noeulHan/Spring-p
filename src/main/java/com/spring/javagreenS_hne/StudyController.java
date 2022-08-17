package com.spring.javagreenS_hne;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javagreenS_hne.service.MemberService;
import com.spring.javagreenS_hne.service.StudyService;
import com.spring.javagreenS_hne.vo.ChartVO;

@Controller
@RequestMapping("/study")
public class StudyController {
	
	@Autowired
	StudyService studyService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/googleChart2", method=RequestMethod.GET)
	public String googleChartGet2(Model model,
			@RequestParam(name="part", defaultValue="bar", required=false) String part) {
		model.addAttribute("part", part);
		return "study/chart2/chart";
	}
	
	@RequestMapping(value="/googleChart2", method=RequestMethod.POST)
	public String googleChart2Post(Model model,
			ChartVO vo) {
		model.addAttribute("vo", vo);
		return "study/chart2/chart";
	}
	
	@RequestMapping(value="/googleChart2Recently", method=RequestMethod.GET)
	public String googleChart2RecentlyGet(Model model,
			@RequestParam(name="part", defaultValue="line", required=false) String part) {
		List<ChartVO> vos = null;
		if(part.equals("lineChartVisitCount")) {
			vos = studyService.getRecentlyVisitCount();
			String[] visitDates = new String[7];
			int[] visitDays = new int[7];
			int[] visitCounts = new int[7];
			for(int i=0; i<7; i++) {
				visitDates[i] = vos.get(i).getVisitDate();
				visitDays[i] = Integer.parseInt(vos.get(i).getVisitDate().toString().substring(8));
				visitCounts[i] = vos.get(i).getVisitCount();
			}
			
			model.addAttribute("title", "최근 7일간 방문횟수");
			model.addAttribute("subTitle", "최근 7일동안 방문한 해당일자 방문자 총수를 표시합니다.");
			model.addAttribute("visitCount", "방문횟수");
			model.addAttribute("legend", "일일 방문 총횟수");
			model.addAttribute("part", part);
			model.addAttribute("visitDates", visitDates);
			model.addAttribute("visitDays", visitDays);
			model.addAttribute("visitCounts", visitCounts);
		}
		
		return "study/chart2/chart";
	}
}







