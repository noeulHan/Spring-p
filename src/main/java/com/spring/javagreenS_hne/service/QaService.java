package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.javagreenS_hne.vo.QaVO;

public interface QaService {

	public List<QaVO> getQaList(int startIndexNo, int pageSize);
	
	public List<QaVO> getQaList2(int startIndexNo, int pageSize);

	public void setQaInput(QaVO vo);

	public QaVO getQaContent(int idx);

	public List<QaVO> getQaSearch(int startIndexNo, int pageSize, String search, String searchString);

	public ArrayList<QaVO> getPreNext(int idx);

	public int getMinIdx();

	public void setQaDelete(int idx);

	public void setQaUpdate(QaVO vo);

}
