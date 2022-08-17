package com.spring.javagreenS_hne.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_hne.vo.Qa2VO;
import com.spring.javagreenS_hne.vo.QaVO;

public interface Qa2DAO {

	public int totRecCnt();

	public List<Qa2VO> getQaList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("caseone") String caseone);
	
	public List<Qa2VO> getQaList2(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("caseone") String caseone);

	public void setQaInput(@Param("vo") Qa2VO vo);

	public Qa2VO getQaContent(@Param("idx") int idx);

	public int totSearchRecCnt(@Param("caseone") String caseone);

	public List<Qa2VO> getQaSearch(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString);

	public ArrayList<Qa2VO> getPreNext(@Param("idx") int idx);

	public int getMinIdx();

	public void setQaDelete(@Param("idx") int idx);

	public void setQaUpdate(@Param("vo") Qa2VO vo);

	public String maxLevelOrder(@Param("boardIdx") int boardIdx);

	public List<String> getCaseOne();

}
