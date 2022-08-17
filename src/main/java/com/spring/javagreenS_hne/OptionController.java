package com.spring.javagreenS_hne;

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

import com.spring.javagreenS_hne.service.MemberService;
import com.spring.javagreenS_hne.vo.MemberVO;

@Controller
@RequestMapping("/option")
public class OptionController {

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventGet(HttpServletRequest request) {
		return "option/event";
	}
	@RequestMapping(value = "/event2", method = RequestMethod.GET)
	public String event2Get(HttpServletRequest request) {
		return "option/event2";
	}
	@RequestMapping(value = "/event1-1", method = RequestMethod.GET)
	public String event11Get(HttpServletRequest request) {
		return "option/event1-1";
	}
	@RequestMapping(value = "/event1-2", method = RequestMethod.GET)
	public String event12Get(HttpServletRequest request) {
		return "option/event1-2";
	}
	@RequestMapping(value = "/event1-3", method = RequestMethod.GET)
	public String event13Get(HttpServletRequest request) {
		return "option/event1-3";
	}
	@RequestMapping(value = "/event1-4", method = RequestMethod.GET)
	public String event14Get(HttpServletRequest request) {
		return "option/event1-4";
	}
	@RequestMapping(value = "/event2-1", method = RequestMethod.GET)
	public String event21Get(HttpServletRequest request) {
		return "option/event2-1";
	}
	@RequestMapping(value = "/event2-2", method = RequestMethod.GET)
	public String event22Get(HttpServletRequest request) {
		return "option/event2-2";
	}
	@RequestMapping(value = "/event2-3", method = RequestMethod.GET)
	public String event23Get(HttpServletRequest request) {
		return "option/event2-3";
	}
	@RequestMapping(value = "/event2-4", method = RequestMethod.GET)
	public String event24Get(HttpServletRequest request) {
		return "option/event2-4";
	}
	@RequestMapping(value = "/event3-1", method = RequestMethod.GET)
	public String event31Get(HttpServletRequest request) {
		return "option/event3-1";
	}
	@RequestMapping(value = "/event3-2", method = RequestMethod.GET)
	public String event32Get(HttpServletRequest request) {
		return "option/event3-2";
	}
}
