package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.javagreenS_hne.vo.Qa2VO;

public interface Qa2Service {

	public List<Qa2VO> getQaList(int startIndexNo, int pageSize, String caseone);
	
	public List<Qa2VO> getQaList2(int startIndexNo, int pageSize, String caseone);

	public void setQaInput(Qa2VO vo);

	public Qa2VO getQaContent(int idx);

	public List<Qa2VO> getQaSearch(int startIndexNo, int pageSize, String search, String searchString);

	public ArrayList<Qa2VO> getPreNext(int idx);

	public int getMinIdx();

	public void setQaDelete(int idx);

	public void setQaUpdate(Qa2VO vo);

	public List<String> getCaseOne();

}
