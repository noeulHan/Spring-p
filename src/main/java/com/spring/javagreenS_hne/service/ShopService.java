package com.spring.javagreenS_hne.service;

import java.util.ArrayList;

import com.spring.javagreenS_hne.vo.ProductVO;

public interface ShopService {

	public ArrayList<String> getProduct1();

	public ArrayList<String> getProduct2(String product1);

	public ArrayList<String> getProduct3(String product1, String product2);

	public void setProductInput(ProductVO vo);

	public ArrayList<ProductVO> getProductList(String product);

}
