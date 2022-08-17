package com.spring.javagreenS_hne.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_hne.dao.DbShopDAO;
import com.spring.javagreenS_hne.vo.DbBaesongVO;
import com.spring.javagreenS_hne.vo.DbCartListVO;
import com.spring.javagreenS_hne.vo.DbOptionVO;
import com.spring.javagreenS_hne.vo.DbOrderVO;
import com.spring.javagreenS_hne.vo.DbProductVO;

@Service
public class DbShopServiceImpl implements DbShopService {

	@Autowired
	DbShopDAO dbShopDAO;

	@Override
	public List<DbProductVO> getCategoryMain() {
		return dbShopDAO.getCategoryMain();
	}

	@Override
	public List<DbProductVO> getCategoryMiddle() {
		return dbShopDAO.getCategoryMiddle();
	}

	@Override
	public List<DbProductVO> getCategorySub() {
		return dbShopDAO.getCategorySub();
	}
	
	@Override
	public List<DbProductVO> getCategoryMiddleName(String categoryMainCode) {
		return dbShopDAO.getCategoryMiddleName(categoryMainCode);
	}

	@Override
	public List<DbProductVO> getCategorySubName(String categoryMainCode, String categoryMiddleCode) {
		return dbShopDAO.getCategorySubName(categoryMainCode, categoryMiddleCode);
	}
	
	@Override
	public DbProductVO getCategoryMainOne(String categoryMainCode, String categoryMainName) {
		return dbShopDAO.getCategoryMainOne(categoryMainCode, categoryMainName);
	}
	
	@Override
	public void categoryMainInput(DbProductVO vo) {
		dbShopDAO.setCategoryMainInput(vo);
	}

	@Override
	public List<DbProductVO> getCategoryMiddleOne(DbProductVO vo) {
		return dbShopDAO.getCategoryMiddleOne(vo);
	}

	@Override
	public void setCategoryMiddleInput(DbProductVO vo) {
		dbShopDAO.setCategoryMiddleInput(vo);
	}

	@Override
	public List<DbProductVO> getCategorySubOne(DbProductVO vo) {
		return dbShopDAO.getCategorySubOne(vo);
	}

	@Override
	public void setCategorySubInput(DbProductVO vo) {
		dbShopDAO.setCategorySubInput(vo);
	}

	@Override
	public void delCategoryMain(String categoryMainCode) {
		dbShopDAO.delCategoryMain(categoryMainCode);
	}

	@Override
	public void delCategoryMiddle(String categoryMiddleCode) {
		dbShopDAO.delCategoryMiddle(categoryMiddleCode);
	}

	@Override
	public List<DbProductVO> getDbProductOne(String categorySubCode) {
		return dbShopDAO.getDbProductOne(categorySubCode);
	}

	@Override
	public void delCategorySub(String categorySubCode) {
		dbShopDAO.delCategorySub(categorySubCode);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void imgCheckProductInput(MultipartFile file, DbProductVO vo) {
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != null && originalFilename != "") {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			  String saveFileName = sdf.format(date) + "_" + originalFilename;
				writeFile(file, saveFileName);	 
				vo.setFName(originalFilename);	
				vo.setFSName(saveFileName);			
			}
			else {
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String content = vo.getContent();
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/dbShop/");
		
		int position = 33;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	
			
			copyFilePath = uploadPath + "product/" + imgFile;	
			
			fileCopyCheck(oriFilePath, copyFilePath);	
			
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
		vo.setContent(vo.getContent().replace("/data/dbShop/", "/data/dbShop/product/"));

		int maxIdx = 0;
		DbProductVO maxVo = dbShopDAO.getProductMaxIdx();
		if(maxVo != null) {
			maxIdx = maxVo.getIdx() + 1;
			vo.setIdx(maxIdx);
		}
		vo.setProductCode(vo.getCategoryMainCode()+vo.getCategoryMiddleCode()+vo.getCategorySubCode()+maxIdx);
		dbShopDAO.setDbProductInput(vo);
	}
	
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream  fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void writeFile(MultipartFile fName, String saveFileName) throws IOException {
		byte[] data = fName.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/product/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);
		fos.close();
	}

	@Override
	public String[] getProductName() {
		return dbShopDAO.getProductName();
	}

	@Override
	public void setDbOptionInput(DbOptionVO vo) {
		dbShopDAO.setDbOptionInput(vo);
	}

	@Override
	public List<DbProductVO> getProductInfor(String productName) {
		return dbShopDAO.getProductInfor(productName);
	}

	@Override
	public List<DbProductVO> getDbShopList(int startIndexNo ,int pageSize,String part) {
		return dbShopDAO.getDbShopList(startIndexNo,pageSize,part);
	}

	@Override
	public List<DbProductVO> getSubTitle() {
		return dbShopDAO.getSubTitle();
	}

	@Override
	public int getOptionSame(int productIdx, String optionName) {
		return dbShopDAO.getOptionSame(productIdx, optionName);
	}

	@Override
	public List<DbOptionVO> getOptionList(int productIdx) {
		return dbShopDAO.getOptionList(productIdx);
	}

	@Override
	public void setOptionDelete(int idx) {
		dbShopDAO.setOptionDelete(idx);
	}

	@Override
	public DbProductVO getDbShopProduct(int idx) {
		return dbShopDAO.getDbShopProduct(idx);
	}

	@Override
	public List<DbOptionVO> getDbShopOption(int productIdx) {
		return dbShopDAO.getDbShopOption(productIdx);
	}

	@Override
	public DbCartListVO getDbCartListProductOptionSearch(String productName, String optionName, String mid) {
		return dbShopDAO.getDbCartListProductOptionSearch(productName, optionName, mid);
	}

	@Override
	public void dbShopCartUpdate(DbCartListVO vo) {
		dbShopDAO.dbShopCartUpdate(vo);
	}

	@Override
	public void dbShopCartInput(DbCartListVO vo) {
		dbShopDAO.dbShopCartInput(vo);
	}

	@Override
	public List<DbCartListVO> getDbCartList(String mid) {
		return dbShopDAO.getDbCartList(mid);
	}

	@Override
	public void dbCartDelete(int idx) {
		dbShopDAO.dbCartDelete(idx);
	}

	@Override
	public void dbCartDeleteAll(int cartIdx) {
		dbShopDAO.dbCartDeleteAll(cartIdx);
	}

	@Override
	public DbCartListVO getCartIdx(int idx) {
		return dbShopDAO.getCartIdx(idx);
	}

	@Override
	public DbOrderVO getOrderMaxIdx() {
		return dbShopDAO.getOrderMaxIdx();
	}

	@Override
	public void setDbOrder(DbOrderVO vo) {
		dbShopDAO.setDbOrder(vo);
	}

	@Override
	public int getOrderOIdx(int orderIdx) {
		return dbShopDAO.getOrderOIdx(orderIdx);
	}

	@Override
	public void setDbBaesong(DbBaesongVO baesongVo) {
		dbShopDAO.setDbBaesong(baesongVo);
	}

	@Override
	public void setMemberPointPlus(int point, String mid) {
		dbShopDAO.setMemberPointPlus(point, mid);
	}

	@Override
	public List<DbBaesongVO> getBaesong(String mid) {
		return dbShopDAO.getBaesong(mid);
	}

	@Override
	public List<DbBaesongVO> getOrderBaesong(String orderIdx) {
		return dbShopDAO.getOrderBaesong(orderIdx);
	}

	@Override
	public List<DbProductVO> getMyOrderList(int startIndexNo, int pageSize, String mid) {
		return dbShopDAO.getMyOrderList(startIndexNo, pageSize, mid);
	}

	@Override
	public List<DbBaesongVO> getMyOrderStatus(int startIndexNo, int pageSize, String mid, String startJumun, String endJumun) {
		return dbShopDAO.getMyOrderStatus(startIndexNo, pageSize, mid, startJumun, endJumun);
	}

	@Override
	public List<DbBaesongVO> getOrderStatus(String mid, String orderStatus, int startIndexNo, int pageSize) {
		return dbShopDAO.getOrderStatus(mid, orderStatus, startIndexNo, pageSize);
	}

	@Override
	public List<DbBaesongVO> getOrderCondition(String mid, int conditionDate, int startIndexNo, int pageSize) {
		return dbShopDAO.getOrderCondition(mid, conditionDate, startIndexNo, pageSize);
	}

	@Override
	public List<DbBaesongVO> getAdminOrderStatus(String startJumun, String endJumun, String orderStatus) {
		//System.out.println("startJumun: " + startJumun + ", endJumun: " + endJumun + ", orderStatus : " + orderStatus);
		return dbShopDAO.getAdminOrderStatus(startJumun, endJumun, orderStatus);
	}

	@Override
	public void setOrderStatusUpdate(String orderIdx, String orderStatus) {
		dbShopDAO.setOrderStatusUpdate(orderIdx, orderStatus);
	}

	@Override
	public List<DbProductVO> getDbShopList2(int startIndexNo, int pageSize, String dbcase) {
		return dbShopDAO.getDbShopList2(startIndexNo, pageSize, dbcase);
	}

	@Override
	public List<String> getDbcase() {
		return dbShopDAO.getDbcase();
	}

	@Override
	public List<DbProductVO> getMainTitle() {
		return dbShopDAO.getMainTitle();
	}

	@Override
	public List<DbProductVO> getDbShopListMain(int startIndexNo, int pageSize, String part) {
		return dbShopDAO.getDbShopListMain(startIndexNo, pageSize, part);
	}

	@Override
	public List<DbProductVO> getSeason1(String brand) {
		return dbShopDAO.getSeason1(brand);
	}

	@Override
	public List<DbProductVO> getSeason2(String brand) {
		return dbShopDAO.getSeason2(brand);
	}

}
