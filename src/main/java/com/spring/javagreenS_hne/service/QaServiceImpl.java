package com.spring.javagreenS_hne.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_hne.dao.QaDAO;
import com.spring.javagreenS_hne.vo.QaVO;

@Service
public class QaServiceImpl implements QaService {

	@Autowired
	QaDAO qaDAO;

	@Override
	public List<QaVO> getQaList(int startIndexNo, int pageSize) {
		return qaDAO.getQaList(startIndexNo, pageSize);
	}
	
	@Override
	public List<QaVO> getQaList2(int startIndexNo, int pageSize) {
		return qaDAO.getQaList2(startIndexNo, pageSize);
	}

	@Override
	public void setQaInput(QaVO vo) {
		qaDAO.setQaInput(vo);		
	}

	@Override
	public QaVO getQaContent(int idx) {
		return qaDAO.getQaContent(idx);
	}

	@Override
	public List<QaVO> getQaSearch(int startIndexNo, int pageSize, String search, String searchString) {
		return qaDAO.getQaSearch(startIndexNo, pageSize, search, searchString);
	}

	@Override
	public ArrayList<QaVO> getPreNext(int idx) {
		return qaDAO.getPreNext(idx);
	}

	@Override
	public int getMinIdx() {
		return qaDAO.getMinIdx();
	}

	@Override
	public void setQaDelete(int idx) {
		qaDAO.setQaDelete(idx);
	}

	@Override
	public void setQaUpdate(QaVO vo) {
		qaDAO.setQaUpdate(vo);
	}

}






