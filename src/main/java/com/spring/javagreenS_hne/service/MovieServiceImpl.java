package com.spring.javagreenS_hne.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_hne.dao.MovieDAO;
import com.spring.javagreenS_hne.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	MovieDAO movieDAO;

	@Override
	public MovieVO getMovieinfo(String part) {
		return movieDAO.getMovieinfo(part);
	}

}
