package com.spring.javagreenS_hne;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_hne.pagination.PageProcess;
import com.spring.javagreenS_hne.service.DbShopService;
import com.spring.javagreenS_hne.service.MemberService;
import com.spring.javagreenS_hne.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	DbShopService dbShopService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value = "/magazine", method = RequestMethod.GET)
	public String magazineGet(HttpServletRequest request) {
		return "member/magazine";
	}
	@RequestMapping(value = "/magazine2", method = RequestMethod.GET)
	public String magazine2Get(HttpServletRequest request) {
		return "member/magazine2";
	}
	@RequestMapping(value = "/magazine2-1", method = RequestMethod.GET)
	public String magazine21Get(HttpServletRequest request) {
		return "member/magazine2-1";
	}
	@RequestMapping(value = "/magazine2-2", method = RequestMethod.GET)
	public String magazine22Get(HttpServletRequest request) {
		return "member/magazine2-2";
	}
	@RequestMapping(value = "/magazine2-3", method = RequestMethod.GET)
	public String magazine23Get(HttpServletRequest request) {
		return "member/magazine2-3";
	}
	@RequestMapping(value = "/magazine2-4", method = RequestMethod.GET)
	public String magazine24Get(HttpServletRequest request) {
		return "member/magazine2-4";
	}
	@RequestMapping(value = "/magazine2-5", method = RequestMethod.GET)
	public String magazine25Get(HttpServletRequest request) {
		return "member/magazine2-5";
	}
	@RequestMapping(value = "/magazine2-6", method = RequestMethod.GET)
	public String magazine26Get(HttpServletRequest request) {
		return "member/magazine2-6";
	}
	@RequestMapping(value = "/magazine2-7", method = RequestMethod.GET)
	public String magazine27Get(HttpServletRequest request) {
		return "member/magazine2-7";
	}
	@RequestMapping(value = "/magazine2-8", method = RequestMethod.GET)
	public String magazine28Get(HttpServletRequest request) {
		return "member/magazine2-8";
	}
	@RequestMapping(value = "/magazine2-9", method = RequestMethod.GET)
	public String magazine29Get(HttpServletRequest request) {
		return "member/magazine2-9";
	}
	@RequestMapping(value = "/magazine3", method = RequestMethod.GET)
	public String magazine3Get(HttpServletRequest request) {
		return "member/magazine3";
	}
	@RequestMapping(value = "/magazine3-1", method = RequestMethod.GET)
	public String magazine31Get(HttpServletRequest request) {
		return "member/magazine3-1";
	}
	@RequestMapping(value = "/magazine3-2", method = RequestMethod.GET)
	public String magazine32Get(HttpServletRequest request) {
		return "member/magazine3-2";
	}
	@RequestMapping(value = "/magazine3-3", method = RequestMethod.GET)
	public String magazine33Get(HttpServletRequest request) {
		return "member/magazine3-3";
	}
	@RequestMapping(value = "/magazine3-4", method = RequestMethod.GET)
	public String magazine34Get(HttpServletRequest request) {
		return "member/magazine3-4";
	}
	@RequestMapping(value = "/magazine3-5", method = RequestMethod.GET)
	public String magazine35Get(HttpServletRequest request) {
		return "member/magazine3-5";
	}
	@RequestMapping(value = "/magazine3-6", method = RequestMethod.GET)
	public String magazine36Get(HttpServletRequest request) {
		return "member/magazine3-6";
	}
	@RequestMapping(value = "/magazine3-7", method = RequestMethod.GET)
	public String magazine37Get(HttpServletRequest request) {
		return "member/magazine3-7";
	}
	@RequestMapping(value = "/magazine3-8", method = RequestMethod.GET)
	public String magazine38Get(HttpServletRequest request) {
		return "member/magazine3-8";
	}
	@RequestMapping(value = "/magazine3-9", method = RequestMethod.GET)
	public String magazine39Get(HttpServletRequest request) {
		return "member/magazine3-9";
	}
	@RequestMapping(value = "/magazine3-10", method = RequestMethod.GET)
	public String magazine310Get(HttpServletRequest request) {
		return "member/magazine3-10";
	}
	@RequestMapping(value = "/magazine3-11", method = RequestMethod.GET)
	public String magazine311Get(HttpServletRequest request) {
		return "member/magazine3-11";
	}
	@RequestMapping(value = "/magazine3-12", method = RequestMethod.GET)
	public String magazine312Get(HttpServletRequest request) {
		return "member/magazine3-12";
	}
	@RequestMapping(value = "/magazine3-13", method = RequestMethod.GET)
	public String magazine313Get(HttpServletRequest request) {
		return "member/magazine3-13";
	}
	@RequestMapping(value = "/magazine3-14", method = RequestMethod.GET)
	public String magazine314Get(HttpServletRequest request) {
		return "member/magazine3-14";
	}
	@RequestMapping(value = "/magazine3-15", method = RequestMethod.GET)
	public String magazine315Get(HttpServletRequest request) {
		return "member/magazine3-15";
	}
	@RequestMapping(value = "/magazine3-16", method = RequestMethod.GET)
	public String magazine316Get(HttpServletRequest request) {
		return "member/magazine3-16";
	}
	
	@RequestMapping(value = "/memLogin2", method = RequestMethod.GET)
	public String memLogin2Get(HttpServletRequest request) {
		
		return "member/memLogin2";
	}
	
	@RequestMapping(value = "/memJoin", method = RequestMethod.GET)
	public String memJoinGet(HttpServletRequest request) {
		
		return "member/memJoin";
	}
	
	@RequestMapping(value = "/memJoin", method = RequestMethod.POST)
	public String memJoinPost(HttpServletRequest request) {
		
		return "member/memJoin";
	}
	
	@RequestMapping(value = "/memJoin2", method = RequestMethod.GET)
	public String memJoin2Get(HttpServletRequest request) {
		
		return "member/memJoin2";
	}
	@RequestMapping(value = "/memJoin3", method = RequestMethod.GET)
	public String memJoin3Get(HttpServletRequest request) {
		
		return "member/memJoin3";
	}
	
	@RequestMapping(value = "/memJoin3", method = RequestMethod.POST)
	public String memJoin3Post(MemberVO vo) {
		System.out.println("vo = "+vo);
		if(memberService.getMemIdCheck(vo.getMid()) != null) {
			return "redirect:/msg/memIdCheckNo";
		}
		
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		int res = memberService.setMemInputOk(vo);
		
		if(res == 1) return "redirect:/msg/memInputOk";
		else return "redirect:/msg/memInputNo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	public String memIdCheckPos(String mid) {
		String res = "0";
		MemberVO vo = memberService.getMemIdCheck(mid);
		if(vo != null) res = "1";
		
		return res;
	}
	
	@RequestMapping(value = "/memLogin", method = RequestMethod.GET)
	public String memLoginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String mid = "";
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		return "member/memLogin";
	}
	
	@RequestMapping(value = "/memMain", method = RequestMethod.GET)
	public String memMain(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		
		return "member/memMain";
	}
	
	@RequestMapping(value = "/memInfor", method = RequestMethod.GET)
	public String memInforGet(Model model, String mid) {
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		System.out.println("vo : "+vo);
		return "member/memInfor";
	}
	
	@RequestMapping(value = "/memPwdCheck", method = RequestMethod.GET)
	public String memPwdCheckGet() {
		return "member/memPwdCheck";
	}
	
	@RequestMapping(value = "/memPwdCheck", method = RequestMethod.POST)
	public String memPwdCheckPost(String pwd, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getMemIdCheck(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd())) {
			session.setAttribute("sPwd", pwd);
			model.addAttribute("vo", vo);
			return "member/memUpdate";
		}
		else {
			return "redirect:/msg/memPwdCheckNo";
		}
	}
	
	@RequestMapping(value = "/memUpdateOk", method = RequestMethod.POST)
	public String memUpdateOkPost(MultipartFile fName, MemberVO vo, HttpSession session) {
		// 닉네임 체크
		String Name = (String) session.getAttribute("sName");
		if(memberService.getNameCheck(vo.getName()) != null && !Name.equals(vo.getName())) {
			return "redirect:/msg/memNameCheckNo2";
		}
		
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		int res = memberService.setMemUpdateOk(vo);
		
		if(res == 1) {
			session.setAttribute("sName", vo.getName());
			return "redirect:/msg/memUpdateOk";
		}
		else return "redirect:/msg/memUpdateNo";
	}
	
	@RequestMapping(value = "/memDeleteOk", method = RequestMethod.GET)
	public String memDeleteOkGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		memberService.setMemDeleteOk(mid);
		
		session.invalidate();
		model.addAttribute("mid", mid);
		
		return "redirect:/msg/memDeleteOk";
	}
	
	@RequestMapping(value = "/memLogin", method = RequestMethod.POST)
	public String memLoginPost(
		Model model,
		// RedirectAttributes redirect,
		HttpServletRequest request, HttpServletResponse response,
		String mid,
		String pwd,
		@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck,
		HttpSession session) {
	
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "운영자";
		else if(vo.getLevel() == 1) strLevel = "일반회원";
		else if(vo.getLevel() == 2) strLevel = "탈퇴회원";
		
		String name = vo.getName();
		
		session.setAttribute("sEmail", vo.getEmail());
		session.setAttribute("sName", name);
		session.setAttribute("sMid", mid);
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sStrLevel", strLevel);
		
		if(idCheck.equals("on")) {
			Cookie cookie = new Cookie("cMid", mid);
			cookie.setMaxAge(60*60*24*7);		
			response.addCookie(cookie);
		}
		else {
			Cookie[] cookies = request.getCookies();
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					cookies[i].setMaxAge(0);		
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
		
		memberService.setMemberVisitProcess(vo);
		
		model.addAttribute("name", name);
		
		return "redirect:/msg/memLoginOk";
		}
		else {
			return "redirect:/msg/memLoginNo";
		}
	}
		
	
	@RequestMapping(value = "/memIdPwdSearch", method = RequestMethod.GET)
	public String memIdPwdSearchGet() {
		return "member/memIdPwdSearch";
	}
		
	@RequestMapping(value = "/memIdPwdSearchP", method = RequestMethod.GET)
	public String memIdPwdSearchPGet() {
		return "member/memIdPwdSearchP";
	}
	
	
   @ResponseBody
   @RequestMapping(value = "/memIdSearchOk", method = RequestMethod.POST) 
   public String memIdSearchOkPost(String email) {
    MemberVO vo = memberService.getMemIdSearchOk(email);
    System.out.println("vo : "+vo);
    if(vo != null) {
       return vo.getMid();
   }   
    return "";
   }
	
	@RequestMapping(value = "/memIdPwdSearchPOk", method = RequestMethod.GET)
	public String memIdPwdSearchPOkGet(String mid, String toMail) {
		MemberVO vo = memberService.getMemIdEmailCheck(mid, toMail);
		if(vo != null) {
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			
			memberService.setPwdChange(mid, passwordEncoder.encode(pwd));
			
			String content = pwd;
			String res = mailSend(toMail, content);
			
			if(res.equals("1")) return "redirect:/msg/memIdPwdSearchPOk";
			else return "redirect:/msg/memIdPwdSearchPNo";
		}
		else {
			return "redirect:/msg/memIdPwdSearchPNo";
		}
	}
	
	public String mailSend(String toMail, String content) {
		try {
			String title = "신규 비밀번호가 발급되었습니다.";
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			content = "<hr>신규 비밀번호는 : <font color='red'><b>" + content + "</b></font>";
			content += "<br><hr>아래 주소로 다시 로그인하셔서 비밀번호를 변경하시기 바랍니다.<hr><br>";
			content += "<p><img src=\"cid:mailtest.jpg\" width='500px'></p><hr>";
			content += "<p>바로가기 : <a href='http://192.168.50.119:8080/javagreenS_hne'>E FASHION MALL</a></p>";
			content += "<hr>";
			messageHelper.setText(content, true);
			
			FileSystemResource file = new FileSystemResource("D:\\springframework\\works2\\javagreenS_hne\\src\\main\\webapp\\resources\\images\\mailtest.jpg");
			messageHelper.addInline("mailtest.jpg", file);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "1";
	}

	@RequestMapping(value = "/memLogout", method = RequestMethod.GET)
	public String memLogoutGet(HttpSession session, Model model) {
		String name = (String) session.getAttribute("sName");
		session.invalidate();
		
		model.addAttribute("name", name);
		return "redirect:/msg/memLogout";
	}
	
	@RequestMapping(value = "/memKakaoLogin", method = RequestMethod.GET)
	public String memKakaoLoginGet(
			Model model,
			HttpSession session) {
		String email = (String) session.getAttribute("sEmail");
		System.out.println("email : " + email);
		
		MemberVO vo = memberService.getMemEmailCheck(email);
		
		if(vo != null && vo.getUserDel().equals("NO")) {
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "운영자";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			else if(vo.getLevel() == 3) strLevel = "정회원";
			else if(vo.getLevel() == 4) strLevel = "준회원";
			
			session.setAttribute("sMid", vo.getMid());
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			
			memberService.setMemberVisitProcess(vo);
			
			String visitDate = memberService.getTodayVisitDate();
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);
			
			if(!strToday.equals(visitDate)) {	
				memberService.setTodayVisitCountInsert();
			}
			else {		
				memberService.setTodayVisitCountUpdate(strToday);
			}
			
			model.addAttribute("mid", vo.getMid());
			return "redirect:/msg/memLoginOk1";
		}
		else if(vo != null && !vo.getUserDel().equals("NO")) {  
			return "redirect:/msg/memLoginNo";
		}
		else {	
			String mid = email.substring(0,email.indexOf("@"));
			String name = (String) session.getAttribute("name");
			String pwd = (passwordEncoder.encode("0000"));
			
			memberService.setKakaoMemberInputOk(mid,pwd,name,email);
			
			model.addAttribute("email", email);
			return "redirect:/member/memKakaoLogin";
		}
	}
}
