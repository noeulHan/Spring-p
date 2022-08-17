package com.spring.javagreenS_hne.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_hne.dao.StudyDAO;
import com.spring.javagreenS_hne.vo.ChartVO;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	StudyDAO studyDAO;

	
	@Override
	public List<ChartVO> getRecentlyVisitCount() {
		return studyDAO.getRecentlyVisitCount();
	}

}

























