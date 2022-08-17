package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_hne.dao.Qa2DAO;
import com.spring.javagreenS_hne.vo.Qa2VO;

@Service
public class Qa2ServiceImpl implements Qa2Service {

	@Autowired
	Qa2DAO qa2DAO;

	@Override
	public List<Qa2VO> getQaList(int startIndexNo, int pageSize, String caseone) {
		return qa2DAO.getQaList(startIndexNo, pageSize, caseone);
	}
	
	@Override
	public List<Qa2VO> getQaList2(int startIndexNo, int pageSize, String caseone) {
		return qa2DAO.getQaList2(startIndexNo, pageSize, caseone);
	}

	@Override
	public void setQaInput(Qa2VO vo) {
		qa2DAO.setQaInput(vo);		
	}

	@Override
	public Qa2VO getQaContent(int idx) {
		return qa2DAO.getQaContent(idx);
	}

	@Override
	public List<Qa2VO> getQaSearch(int startIndexNo, int pageSize, String search, String searchString) {
		return qa2DAO.getQaSearch(startIndexNo, pageSize, search, searchString);
	}

	@Override
	public ArrayList<Qa2VO> getPreNext(int idx) {
		return qa2DAO.getPreNext(idx);
	}

	@Override
	public int getMinIdx() {
		return qa2DAO.getMinIdx();
	}

	@Override
	public void setQaDelete(int idx) {
		qa2DAO.setQaDelete(idx);
	}

	@Override
	public void setQaUpdate(Qa2VO vo) {
		qa2DAO.setQaUpdate(vo);
	}

	@Override
	public List<String> getCaseOne() {
		return qa2DAO.getCaseOne();
	}

}






