package com.spring.javagreenS_hne;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value="/msg/{msgFlag}", method=RequestMethod.GET)
	public String msgGet(HttpSession session,
			@PathVariable String msgFlag, Model model,
			@RequestParam(value="flag", defaultValue = "", required=false) String flag,
			@RequestParam(value="name", defaultValue = "", required=false) String name,
			@RequestParam(value="mid", defaultValue = "", required=false) String mid,
			@RequestParam(value="idx", defaultValue = "0", required=false) int idx) {
		if(name.equals("")) name = (String) session.getAttribute("sName");
		
		if(msgFlag.equals("guestInputOk")) {
			model.addAttribute("msg", "방명록에 글이 등록 되었습니다.");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("memberLogout")) {
			model.addAttribute("msg", name + "님 로그아웃 되었습니다.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("operatorCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다. 다시 입력하세요.");
			model.addAttribute("url", "study/password2/operatorMenu");
		}
		else if(msgFlag.equals("paymentResultOk")) {
			model.addAttribute("msg", "결제가 완료되었습니다. 주문내역 창으로 이동합니다.");
			model.addAttribute("url", "dbShop/dbMyOrder?mid" + mid);
		}
		else if(msgFlag.equals("operatorInputOk")) {
			model.addAttribute("msg", "새로운 운영자로 등록되었습니다.");
			model.addAttribute("url", "study/password2/operatorMenu");
		}
		else if(msgFlag.equals("productInputOk")) {
			model.addAttribute("msg", "상품이 등록되었습니다.");
			model.addAttribute("url", "shop/input/productMenu");
		}
		else if(msgFlag.equals("mailSendOk")) {
			model.addAttribute("msg", "메일이 전송되었습니다.");
			model.addAttribute("url", "study/mail/mailForm");
		}
		else if(msgFlag.equals("memIdCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다. 체크하세요.");
			model.addAttribute("url", "member/memJoin");
		}
		else if(msgFlag.equals("memNickCheckNo")) {
			model.addAttribute("msg", "닉네임이 중복되었습니다. 체크하세요.");
			model.addAttribute("url", "member/memJoin");
		}
		else if(msgFlag.equals("memNickCheckNo2")) {
			model.addAttribute("msg", "닉네임이 중복되었습니다. 체크하세요.");
			model.addAttribute("url", "member/memPwdCheck");
		}
		else if(msgFlag.equals("memInputOk")) {
			model.addAttribute("msg", "회원 가입을 완료하였습니다.");
			model.addAttribute("url", "member/memJoin3");
		}
		else if(msgFlag.equals("memInputNo")) {
			model.addAttribute("msg", "회원 가입 실패~~");
			model.addAttribute("url", "member/memJoin");
		}
		else if(msgFlag.equals("fileUploadOk")) {
			model.addAttribute("msg", "파일이 업로드 되었습니다.");
			model.addAttribute("url", "study/fileUpload/fileUpload");
		}
		else if(msgFlag.equals("fileUploadNo")) {
			model.addAttribute("msg", "파일이 업로드 실패~~");
			model.addAttribute("url", "study/fileUpload/fileUpload");
		}
		else if(msgFlag.equals("memLoginOk")) {
			model.addAttribute("msg", name + "님 반갑습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memLoginOk1")) {
			model.addAttribute("msg", name + "님 반갑습니다.\\n카카오 첫 로그인시 초기 비밀번호는 0000 입니다.\\n마이페이지->회원정보수정을 통해 정보를 수정해주세요.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memLoginNo")) {
			model.addAttribute("msg", "일치하는 회원정보가 없습니다.\\n로그인을 재시도 해주세요.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("memLogout")) {
			model.addAttribute("msg", name+"님 로그아웃 되셨습니다.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("lelvelMemberNo")) {
			model.addAttribute("msg", "로그인후 사용하세요.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("lelvelMemberNo")) {
			model.addAttribute("msg", "로그인후 사용하세요.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("lelvelConfirmNo")) {
			model.addAttribute("msg", "현재 등급으로는 사용하실수 없습니다.");
			model.addAttribute("url", "member/memMain");
		}
		else if(msgFlag.equals("memPwdCheckNo")) {
			model.addAttribute("msg", "비밀번호가 일치하지않습니다. \\n다시 입력해주세요.");
			model.addAttribute("url", "member/memPwdCheck");
		}
		else if(msgFlag.equals("memUpdateOk")) {
			model.addAttribute("msg", "회원정보가 수정되었습니다.");
			model.addAttribute("url", "member/memPwdCheck");
		}
		else if(msgFlag.equals("memUpdateNo")) {
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.\\n다시 시도해주세요.");
			model.addAttribute("url", "member/memPwdCheck");
		}
		else if(msgFlag.equals("memDeleteOk")) {
			model.addAttribute("msg", mid + "회원님! 탈퇴 되셨습니다.\\n같은 아이디로 1개월동안 다시 가입하실수 없습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("memIdPwdSearchPOk")) {
			model.addAttribute("msg", "작성하신 메일 주소로 임시 비밀번호를 발급해드렸습니다.\\n메일함을 확인하세요. ");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("memIdPwdSearchPNo")) {
			model.addAttribute("msg", "입력하신 정보를 확인해 주세요.");
			model.addAttribute("url", "member/memLogin");
		}
		else if(msgFlag.equals("qaInputOk")) {
			model.addAttribute("msg", "공지사항이 등록되었습니다.");
			model.addAttribute("url", "qa/qaMain3");
		}
		else if(msgFlag.equals("qa3InputOk")) {
			model.addAttribute("msg", "1:1문의가 등록되었습니다.");
			model.addAttribute("url", "qa3/qaMain5");
		}
		else if(msgFlag.equals("qaUpdateOk")) {
			model.addAttribute("msg", "공지사항이 수정되었습니다.");
			model.addAttribute("url", "qa/qaMain3"+flag);
		}
		else if(msgFlag.equals("qaDeleteOk")) {
			model.addAttribute("msg", "공지사항이 삭제되었습니다.");
			model.addAttribute("url", "qa/qaMain3"+flag);
		}
		else if(msgFlag.equals("qa2InputOk")) {
			model.addAttribute("msg", "FAQ가 등록되었습니다.");
			model.addAttribute("url", "qa2/qaMain2");
		}
		else if(msgFlag.equals("qa2UpdateOk")) {
			model.addAttribute("msg", "FAQ가 수정되었습니다.");
			model.addAttribute("url", "qa2/qaMain2"+flag);
		}
		else if(msgFlag.equals("qa2DeleteOk")) {
			model.addAttribute("msg", "FAQ가 삭제되었습니다.");
			model.addAttribute("url", "qa2/qaMain2"+flag);
		}
		else if(msgFlag.equals("qa3InputOk")) {
			model.addAttribute("msg", "1:1 문의답변이 등록되었습니다.");
			model.addAttribute("url", "qa3/qaMain5");
		}
		else if(msgFlag.equals("qa3UpdateOk")) {
			model.addAttribute("msg", "1:1 문의가 수정되었습니다.");
			model.addAttribute("url", "qa3/qaMain5"+flag);
		}
		else if(msgFlag.equals("qa3DeleteOk")) {
			model.addAttribute("msg", "1:1 문의가 삭제되었습니다.");
			model.addAttribute("url", "qa3/qaMain5"+flag);
		}
		else if(msgFlag.equals("boardInputOk")) {
			model.addAttribute("msg", "게시글이 등록되었습니다.");
			model.addAttribute("url", "board/boList");
		}
		else if(msgFlag.equals("boardDeleteOk")) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			model.addAttribute("url", "board/boList"+flag);
		}
		else if(msgFlag.equals("boUpdateOk")) {
			model.addAttribute("msg", "게시글이 수정되었습니다.");
			model.addAttribute("url", "board/boList"+flag);
		}
		else if(msgFlag.equals("pdsInputOk")) {
			model.addAttribute("msg", "자료파일이 등록 되었습니다.");
			model.addAttribute("url", "pds/pdsList");
		}
		else if(msgFlag.equals("personInputOk")) {
			model.addAttribute("msg", "인적자원 정보가 등록 되었습니다.");
			model.addAttribute("url", "study/personList");
		}
		else if(msgFlag.equals("sessionCartNo")) {
			model.addAttribute("msg", "장바구니가 비어있습니다. 물건을 담아주세요.");
			model.addAttribute("url", "sessionShop/shopList");
		}
		else if(msgFlag.equals("dbProductInputOk")) {
			model.addAttribute("msg", "상품등록 완료");
			model.addAttribute("url", "dbShop/dbOption");
		}
		else if(msgFlag.equals("dbOptionInputOk")) {
			model.addAttribute("msg", "옵션등록 완료");
			model.addAttribute("url", "dbShop/dbProduct");
		}
		else if(msgFlag.equals("cartInputOk")) {
			model.addAttribute("msg", "장바구니에 상품이 담겼습니다.\\n다시 상품정보창으로 이동합니다.");
			model.addAttribute("url", "dbShop/dbProductContent?idx=" + idx);
		}
		else if(msgFlag.equals("memDeleteOk")) {
			model.addAttribute("msg", mid + "회원님 탈퇴되셨습니다. \\n(같은 아이디로 1개월동안 다시 가입하실수 없습니다.)");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("cartOrderOk")) {
			model.addAttribute("msg", "장바구니에 상품이 담겼습니다.\\n장바구니로 이동합니다.");
			model.addAttribute("url", "dbShop/dbCartList");
		}
		
		return "include/message";
	}
	
}
