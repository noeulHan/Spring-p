package com.spring.javagreenS_hne;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javagreenS_hne.service.ShopService;
import com.spring.javagreenS_hne.vo.Goods3VO;
import com.spring.javagreenS_hne.vo.ProductVO;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopService shopService;
	
	@RequestMapping(value = "/input/productMenu", method = RequestMethod.GET)
	public String productMenuGet(Model model) {
		ArrayList<String> product1s = shopService.getProduct1();
		model.addAttribute("product1s", product1s);
		
		return "shop/input/productInput";
	}
	
	@ResponseBody
	@RequestMapping(value="/input/product2Get", method = RequestMethod.POST)
	public ArrayList<String> product2GetPost(String product1) {
		return shopService.getProduct2(product1);
	}
	
	@ResponseBody
	@RequestMapping(value="/input/product3Get", method = RequestMethod.POST)
	public ArrayList<String> product3GetPost(Goods3VO vo) {
		return shopService.getProduct3(vo.getProduct1(), vo.getProduct2());
	}
	
	@RequestMapping(value = "/input/productMenu", method = RequestMethod.POST)
	public String productMenuPost(ProductVO vo) {
		shopService.setProductInput(vo);
		
		return "redirect:/msg/productInputOk";
	}
	
	@RequestMapping(value = "/list/productList", method = RequestMethod.GET)
	public String productListGet(Model model) {
		ArrayList<ProductVO> vos = shopService.getProductList("");
		model.addAttribute("vos", vos);
		
		return "shop/list/productList";
	}
	
	@RequestMapping(value = "/list/productSearch", method = RequestMethod.GET)
	public String productSearchGet(Model model, String product) {
		ArrayList<ProductVO> vos = shopService.getProductList(product);
		model.addAttribute("vos", vos);
		model.addAttribute("shopSw", "search");
		
		return "shop/list/productList";
	}
	
}
