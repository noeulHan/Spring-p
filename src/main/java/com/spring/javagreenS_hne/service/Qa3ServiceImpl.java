package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_hne.dao.Qa3DAO;
import com.spring.javagreenS_hne.vo.Qa3VO;

@Service
public class Qa3ServiceImpl implements Qa3Service {

	@Autowired
	Qa3DAO qa3DAO;

	@Override
	public String getEmail(String mid) {
		return qa3DAO.getEmail(mid);
	}
	
	
	@Override
	public List<Qa3VO> getQaList2(int startIndexNo, int pageSize, String caseone) {
		return qa3DAO.getQaList2(startIndexNo, pageSize, caseone);
	}

	@Override
	public void setQaInput(Qa3VO vo) {
		qa3DAO.setQaInput(vo);		
	}

	@Override
	public Qa3VO getQaContent(int idx) {
		return qa3DAO.getQaContent(idx);
	}

	@Override
	public List<Qa3VO> getQaSearch(int startIndexNo, int pageSize, String search, String searchString) {
		return qa3DAO.getQaSearch(startIndexNo, pageSize, search, searchString);
	}

	@Override
	public ArrayList<Qa3VO> getPreNext(int idx) {
		return qa3DAO.getPreNext(idx);
	}

	@Override
	public int getMinIdx() {
		return qa3DAO.getMinIdx();
	}

	@Override
	public void setQaDelete(int idx) {
		qa3DAO.setQaDelete(idx);
	}

	@Override
	public void setQaUpdate(Qa3VO vo) {
		qa3DAO.setQaUpdate(vo);
	}

	@Override
	public List<String> getCaseOne() {
		return qa3DAO.getCaseOne();
	}

	@Override
	public Qa3VO getQnaContent(int idx) {
		return qa3DAO.getQnaContent(idx);
	}
	
	@Override
	public void qnaInputOk(Qa3VO vo) {
		qa3DAO.qnaInputOk(vo);
	}
	
	@Override
	public int getMaxIdx() {
		return qa3DAO.getCountIdx() == 0 ? 0 : qa3DAO.getMaxIdx();
	}

	@Override
	public int getCnt(String email) {
		return qa3DAO.getCnt(email);
	}
	
	@Override
	public int getCnt2(String email) {
		return qa3DAO.getCnt2(email);
	}
	
	@Override
	public int getCnt3(String email) {
		return qa3DAO.getCnt3(email);
	}
	
	@Override
	public int getCnt23(String email) {
		return qa3DAO.getCnt23(email);
	}

	@Override
	public List<Qa3VO> getQaList(int startIndexNo, int pageSize, String caseone, String email) {
		return qa3DAO.getQaList(startIndexNo, pageSize, caseone, email);
	}
	
	@Override
	public List<Qa3VO> getQaList3(int startIndexNo, int pageSize, String caseone, String email) {
		return qa3DAO.getQaList3(startIndexNo, pageSize, caseone, email);
	}
}






