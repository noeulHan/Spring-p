package com.spring.javagreenS_hne.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_hne.vo.MovieVO;

public interface MovieDAO {

	public MovieVO getMovieinfo(@Param("part") String part);
}
