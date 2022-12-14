package com.spring.javagreenS_hne.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_hne.vo.PdsVO;

public interface PdsService {

	public ArrayList<PdsVO> getPdsList(int startIndexNo, int pageSize, String part);

	public void setPdsInput(MultipartHttpServletRequest file, PdsVO vo);

	public void setPdsDownNum(int idx);

	public PdsVO getPdsContent(int idx);

	public void setPdsDelete(PdsVO vo);

}
