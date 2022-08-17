package com.spring.javagreenS_hne.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS_hne.vo.Qa3VO;

public interface Qa3DAO {

	public int totRecCnt(@Param("email") String email);
	
	public int totRecCnt3(@Param("email") String idx);

	public List<Qa3VO> getQaList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("caseone") String caseone,@Param("email") String email);
	
	public List<Qa3VO> getQaList3(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("caseone") String caseone,@Param("email") String email);
	
	public List<Qa3VO> getQaList2(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("caseone") String caseone);

	public void setQaInput(@Param("vo") Qa3VO vo);

	public Qa3VO getQaContent(@Param("idx") int idx);

	public int totSearchRecCnt(@Param("email") String email, @Param("caseone") String caseone);
	
	public int totSearchRecCnt3(@Param("email") String idx, @Param("caseone") String caseone);

	public List<Qa3VO> getQaSearch(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString);

	public ArrayList<Qa3VO> getPreNext(@Param("idx") int idx);

	public int getMinIdx();

	public void setQaDelete(@Param("idx") int idx);

	public void setQaUpdate(@Param("vo") Qa3VO vo);

	public String maxLevelOrder(@Param("boardIdx") int boardIdx);

	public List<String> getCaseOne();

	public String getEmail(@Param("mid") String mid);

	public Qa3VO getQnaContent(@Param("idx") int idx);

	public int getMaxIdx();

	public int getCountIdx();

	public void qnaInputOk(@Param("vo") Qa3VO vo);

	public int getCnt(@Param("email") String email);

	public int getCnt2(@Param("email") String email);
	
	public int getCnt3(@Param("email") String email);
	
	public int getCnt23(@Param("email") String email);

}
