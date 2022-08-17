package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.javagreenS_hne.vo.Qa3VO;

public interface Qa3Service {

	public String getEmail(String mid);
	
	public List<Qa3VO> getQaList(int startIndexNo, int pageSize, String caseone, String email);
	
	public List<Qa3VO> getQaList3(int startIndexNo, int pageSize, String caseone, String email);
	
	public List<Qa3VO> getQaList2(int startIndexNo, int pageSize, String caseone);

	public void setQaInput(Qa3VO vo);
	
	public void qnaInputOk(Qa3VO vo);

	public Qa3VO getQaContent(int idx);

	public List<Qa3VO> getQaSearch(int startIndexNo, int pageSize, String search, String searchString);

	public ArrayList<Qa3VO> getPreNext(int idx);

	public int getMinIdx();

	public void setQaDelete(int idx);

	public void setQaUpdate(Qa3VO vo);

	public List<String> getCaseOne();
	
	public Qa3VO getQnaContent(int idx);

	public int getMaxIdx();

	public int getCnt(String email);
	
	public int getCnt2(String email);
	
	public int getCnt3(String email);
	
	public int getCnt23(String email);
}
