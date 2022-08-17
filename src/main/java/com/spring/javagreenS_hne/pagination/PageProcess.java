package com.spring.javagreenS_hne.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS_hne.dao.AdminDAO;
import com.spring.javagreenS_hne.dao.BoardDAO;
import com.spring.javagreenS_hne.dao.DbShopDAO;
import com.spring.javagreenS_hne.dao.GuestDAO;
import com.spring.javagreenS_hne.dao.MemberDAO;
import com.spring.javagreenS_hne.dao.PdsDAO;
import com.spring.javagreenS_hne.dao.Qa2DAO;
import com.spring.javagreenS_hne.dao.Qa3DAO;
import com.spring.javagreenS_hne.dao.QaDAO;

@Service
public class PageProcess {
	@Autowired
	GuestDAO guestDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	PdsDAO pdsDAO;
	
	@Autowired
	QaDAO qaDAO;
	
	@Autowired
	Qa2DAO qa2DAO;
	
	@Autowired
	Qa3DAO qa3DAO;
	
	@Autowired
	DbShopDAO dbShopDAO;

	@Autowired
	AdminDAO adminDAO;
	

	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		int blockSize = 5;
		
		if(section.equals("member")) {
			totRecCnt = memberDAO.totRecCnt();
		}
		else if(section.equals("guest")) {
			totRecCnt = guestDAO.totRecCnt();
		}
		else if(section.equals("qa")) {
			if(searchString.equals("")) {
  			totRecCnt = qaDAO.totRecCnt();
			}
			else {
				String search = part;
				totRecCnt = qaDAO.totSearchRecCnt(search, searchString);
			}
		}
		else if(section.equals("qa2")) {
			if(searchString.equals("전체")) {
				totRecCnt = qa2DAO.totRecCnt();
			}
			else {
				totRecCnt = qa2DAO.totSearchRecCnt(searchString);
			}
		}
		else if(section.equals("qa3")) {
			if(searchString.equals("전체")) {
				totRecCnt = qa3DAO.totRecCnt(part);
			}
			else {
				totRecCnt = qa3DAO.totSearchRecCnt(part,searchString);
			}
		}
		else if(section.equals("qa33")) {
			if(searchString.equals("전체")) {
				totRecCnt = qa3DAO.totRecCnt3(part);
			}
			else {
				totRecCnt = qa3DAO.totSearchRecCnt3(part,searchString);
			}
		}
		else if(section.equals("pds")) {
			totRecCnt = pdsDAO.totRecCnt(part);
		}
		else if(section.equals("dbShopMyOrderCondition")) {
			totRecCnt = dbShopDAO.totRecCnt2(part, Integer.parseInt(searchString));
		}
		else if(section.equals("myOrderStatus")) {
			String[] searchStringArr = searchString.split("@");
			totRecCnt = dbShopDAO.totRecCntMyOrderStatus(part, searchStringArr[0],searchStringArr[1]);
		}
		else if(section.equals("dbshopList")) {
			if(part.equals("전체")) {
				totRecCnt = dbShopDAO.totRecCnt();
			}
			else {
				if(part.length() == 3) totRecCnt = dbShopDAO.totSearchRecCnt(part);
				else totRecCnt = dbShopDAO.totSearchRecCnt2(part);
			}
		}
		
		int totPage = (totRecCnt%pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize)+1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) - 1 : (totPage / blockSize);
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setCurBlock(curBlock);
		pageVO.setLastBlock(lastBlock);
		
		return pageVO;
	}
	
	
}
