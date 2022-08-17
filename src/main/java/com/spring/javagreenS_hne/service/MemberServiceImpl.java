package com.spring.javagreenS_hne.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_hne.dao.MemberDAO;
import com.spring.javagreenS_hne.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemIdCheck(String mid) {
		return memberDAO.getMemIdCheck(mid);
	}

	@Override
	public MemberVO getNameCheck(String name) {
		return memberDAO.getNameCheck(name);
	}


	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		String lastDate = vo.getLastDate().substring(0,10);
			
		int todayCnt = vo.getTodayCnt();
		int newPoint = 0;
		if(strToday.equals(lastDate)) {
			if(todayCnt >= 5) newPoint = 0;
			else newPoint = 10;
			todayCnt++;
		}
		else {
			todayCnt = 1;
			newPoint = 10;
		}
		
		memberDAO.setMemberVisitProcess(vo.getMid(), todayCnt, newPoint);
	}

	

	@Override
	public void setMemDeleteOk(String mid) {
		memberDAO.setMemDeleteOk(mid);
	}

	@Override
	public void setPwdChange(String mid, String pwd) {
		memberDAO.setPwdChange(mid, pwd);
	}

	@Override
	public MemberVO getMemIdEmailCheck(String mid, String toMail) {
		return memberDAO.getMemIdEmailCheck(mid, toMail);
	}

	@Override
	public int totRecCnt() {
		return memberDAO.totRecCnt();
	}

	@Override
	public ArrayList<MemberVO> getMemList(int startIndexNo, int pageSize) {
		return memberDAO.getMemList(startIndexNo, pageSize);
	}

	@Override
	public int setMemUpdateOk(MemberVO vo) {
		return memberDAO.setMemUpdateOk(vo);
	}

	@Override
	public int setMemInputOk(MemberVO vo) {
		return memberDAO.setMemInputOk(vo);
	}

	@Override
	public MemberVO getMemIdSearchOk(String email) {
		return memberDAO.getMemIdSearchOk(email);
	}

	@Override
	public ArrayList<MemberVO> getAdminMemberLevelList(int startIndexNo, int pageSize, int level) {
		return memberDAO.getAdminMemberLevelList(startIndexNo, pageSize, level);
	}
	@Override
	public ArrayList<MemberVO> getAdminMemberMidList(int startIndexNo, int pageSize, String mid) {
		return memberDAO.getAdminMemberMidList(startIndexNo, pageSize, mid);
	}

	@Override
	public void setAdminLevelUpdate(int idx, int level) {
		memberDAO.setAdminLevelUpdate(idx, level);
	}

	@Override
	public MemberVO getMemEmailCheck(String email) {
		return memberDAO.getMemEmailCheck(email);
	}

	@Override
	public String getTodayVisitDate() {
		return memberDAO.getTodayVisitDate();
	}

	@Override
	public void setTodayVisitCountInsert() {
		memberDAO.setTodayVisitCountInsert();
	}

	@Override
	public void setTodayVisitCountUpdate(String strToday) {
		memberDAO.setTodayVisitCountUpdate(strToday);
	}
	
	@Override
	public void setKakaoMemberInputOk(String mid, String pwd, String name, String email) {
		System.out.println(mid + "," + pwd + "," + name + "," + email);
		memberDAO.setKakaoMemberInputOk(mid, pwd, name, email);
	}
}
