package com.spring.javagreenS_hne.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_hne.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemIdCheck(String mid);

	public MemberVO getNameCheck(String name);

	public int setMemInputOk(MemberVO vo);

	public void setMemberVisitProcess(MemberVO vo);

	public ArrayList<MemberVO> getMemList(int startIndexNo, int pageSize);

	public int setMemUpdateOk(MemberVO vo);

	public void setMemDeleteOk(String mid);

	public void setPwdChange(String mid, String pwd);

	public MemberVO getMemIdEmailCheck(String mid, String toMail);

	public int totRecCnt();

	public MemberVO getMemIdSearchOk(String email);

	public ArrayList<MemberVO> getAdminMemberLevelList(int startIndexNo, int pageSize, int level);

	public ArrayList<MemberVO> getAdminMemberMidList(int startIndexNo, int pageSize, String mid);

	public void setAdminLevelUpdate(int idx, int level);

	public MemberVO getMemEmailCheck(String email);

	public String getTodayVisitDate();

	public void setTodayVisitCountInsert();

	public void setTodayVisitCountUpdate(String strToday);

	public void setKakaoMemberInputOk(String mid, String pwd, String name, String email);

}
