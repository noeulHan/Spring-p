package com.spring.javagreenS_hne.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_hne.vo.QaVO;

public interface QaDAO {

	public int totRecCnt();

	public List<QaVO> getQaList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public List<QaVO> getQaList2(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public void setQaInput(@Param("vo") QaVO vo);

	public QaVO getQaContent(@Param("idx") int idx);

	public int totSearchRecCnt(@Param("search") String search, @Param("searchString") String searchString);

	public List<QaVO> getQaSearch(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString);

	public ArrayList<QaVO> getPreNext(@Param("idx") int idx);

	public int getMinIdx();

	public void setQaDelete(@Param("idx") int idx);

	public void setQaUpdate(@Param("vo") QaVO vo);

	public String maxLevelOrder(@Param("boardIdx") int boardIdx);

}
