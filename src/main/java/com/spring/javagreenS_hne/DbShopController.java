package com.spring.javagreenS_hne;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_hne.pagination.PageProcess;
import com.spring.javagreenS_hne.pagination.PageVO;
import com.spring.javagreenS_hne.service.DbShopService;
import com.spring.javagreenS_hne.service.MemberService;
import com.spring.javagreenS_hne.service.MovieService;
import com.spring.javagreenS_hne.vo.DbBaesongVO;
import com.spring.javagreenS_hne.vo.DbCartListVO;
import com.spring.javagreenS_hne.vo.DbOptionVO;
import com.spring.javagreenS_hne.vo.DbOrderVO;
import com.spring.javagreenS_hne.vo.DbProductVO;
import com.spring.javagreenS_hne.vo.MemberVO;
import com.spring.javagreenS_hne.vo.MovieVO;
import com.spring.javagreenS_hne.vo.PayMentVO;

@Controller
@RequestMapping("/dbShop")
public class DbShopController {
	String msgFlag = "";
	
	@Autowired
	DbShopService dbShopService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/dbCategory", method = RequestMethod.GET)
	public String dbCategoryGet(Model model) {
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		List<DbProductVO> middleVos = dbShopService.getCategoryMiddle();
		List<DbProductVO> subVos = dbShopService.getCategorySub();
		
		model.addAttribute("mainVos", mainVos);
		model.addAttribute("middleVos", middleVos);
		model.addAttribute("subVos", subVos);
		
		return "admin/dbShop/dbCategory";
	}
	
	@ResponseBody
	@RequestMapping(value="/categoryMiddleName", method = RequestMethod.POST)
	public List<DbProductVO> categoryMiddleNamePost(String categoryMainCode) {
		return dbShopService.getCategoryMiddleName(categoryMainCode);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/categorySubName", method = RequestMethod.POST)
	public List<DbProductVO> categorySubNamePost(String categoryMainCode, String categoryMiddleCode) {
		return dbShopService.getCategorySubName(categoryMainCode, categoryMiddleCode);
	}
	
	@ResponseBody
	@RequestMapping(value="/categoryMainInput", method = RequestMethod.POST)
	public String categoryMainInputPost(DbProductVO vo) {
		DbProductVO imsiVo  = dbShopService.getCategoryMainOne(vo.getCategoryMainCode(), vo.getCategoryMainName());
		
		if(imsiVo != null) return "0";
		dbShopService.categoryMainInput(vo);	
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/categoryMiddleInput", method = RequestMethod.POST)
	public String categoryMiddleInputPost(DbProductVO vo) {	
		List<DbProductVO> vos = dbShopService.getCategoryMiddleOne(vo);
		if(vos.size() != 0) return "0";
		
		dbShopService.setCategoryMiddleInput(vo);	
		
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/categorySubInput", method = RequestMethod.POST)
	public String categorySubInputPost(DbProductVO vo) {
		List<DbProductVO> vos = dbShopService.getCategorySubOne(vo);
		if(vos.size() != 0) return "0";
		dbShopService.setCategorySubInput(vo);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/delCategoryMain", method = RequestMethod.POST)
	public String delCategoryMainPost(DbProductVO vo) {
		List<DbProductVO> vos = dbShopService.getCategoryMiddleOne(vo);
		if(vos.size() != 0) return "0";
		dbShopService.delCategoryMain(vo.getCategoryMainCode());
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/delCategoryMiddle", method = RequestMethod.POST)
	public String delCategoryMiddlePost(DbProductVO vo) {
		List<DbProductVO> vos = dbShopService.getCategorySubOne(vo);
		if(vos.size() != 0) return "0";
		dbShopService.delCategoryMiddle(vo.getCategoryMiddleCode());
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/delCategorySub", method = RequestMethod.POST)
	public String delCategorySubPost(DbProductVO vo) {
		List<DbProductVO> vos = dbShopService.getDbProductOne(vo.getCategorySubCode());
		if(vos.size() != 0) return "0";
		dbShopService.delCategorySub(vo.getCategorySubCode());
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFilename = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		
		byte[] bytes = upload.getBytes();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);		// 서버에 업로드시킨 그림파일이 저장된다.
		
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/dbShop/" + originalFilename;
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");       /* "atom":"12.jpg","uploaded":1,"": */
		
		out.flush();
		outStr.close();
	}
	
	@RequestMapping(value="/dbProduct", method = RequestMethod.GET)
	public String dbProductGet(Model model) {
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		return "admin/dbShop/dbProduct";
	}
	
	@RequestMapping(value="/dbProduct", method = RequestMethod.POST)
	public String dbProductPost(MultipartFile file, DbProductVO vo) {
		dbShopService.imgCheckProductInput(file, vo);
		
		msgFlag = "dbProductInputOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	@RequestMapping(value="/dbShopList", method = RequestMethod.GET)
	public String dbShopListGet(@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "12", required = false) int pageSize,
			@RequestParam(name="part", defaultValue="전체", required=false) String part,
			Model model) {
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "dbshopList", part, part);
		
		List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
		List<DbProductVO> mainTitleVos = dbShopService.getMainTitle();

		model.addAttribute("subTitleVos", subTitleVos);
		model.addAttribute("mainTitleVos", mainTitleVos);
		model.addAttribute("part", part);
		model.addAttribute("pageVO",pageVO);
		
		List<DbProductVO> productVos = dbShopService.getDbShopList(pageVO.getStartIndexNo(),pageSize,part);
		List<DbProductVO> productVos2 = dbShopService.getDbShopListMain(pageVO.getStartIndexNo(),pageSize,part);
		model.addAttribute("productVos", productVos);
		model.addAttribute("productVos2", productVos2);
		return "admin/dbShop/dbShopList";
	}
	
	@RequestMapping(value="/dbOption", method=RequestMethod.GET)
	public String dbOptionGet(Model model) {
		String[] productNames = dbShopService.getProductName();
		model.addAttribute("productNames", productNames);
		
		return "admin/dbShop/dbOption";
	}
	
	@ResponseBody
	@RequestMapping(value="/getProductInfor", method = RequestMethod.POST)
	public List<DbProductVO> getProductInforPost(String productName) {
		return dbShopService.getProductInfor(productName);
	}
	
	@ResponseBody
	@RequestMapping(value="/getOptionList", method = RequestMethod.POST)
	public List<DbOptionVO> getOptionListPost(int productIdx) {
		return dbShopService.getOptionList(productIdx);
	}
	
	@RequestMapping(value="/dbOption", method=RequestMethod.POST)
	public String dbOptionPost(DbOptionVO vo, String[] optionName, int[] optionPrice) {
		for(int i=0; i<optionName.length; i++) {
			int optionCnt = dbShopService.getOptionSame(vo.getProductIdx(), optionName[i]);
			if(optionCnt != 0) continue;
			
			vo.setProductIdx(vo.getProductIdx());
			vo.setOptionName(optionName[i]);
			
			vo.setOptionPrice(optionPrice[i]);
			dbShopService.setDbOptionInput(vo);		
		}
		
		msgFlag = "dbOptionInputOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	@ResponseBody
	@RequestMapping(value="/optionDelete", method = RequestMethod.POST)
	public String optionDeletePost(int idx) {
		dbShopService.setOptionDelete(idx);
		return "";
	}
	
	@RequestMapping(value="/dbShopContent", method=RequestMethod.GET)
	public String dbShopContentGet(int idx, Model model) {
		DbProductVO productVo = dbShopService.getDbShopProduct(idx); 			
		List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx); 	
		
		model.addAttribute("productVo", productVo);
		model.addAttribute("optionVos", optionVos);
		
		return "admin/dbShop/dbShopContent";
	}
	
	
	@RequestMapping(value="/dbProductList", method = RequestMethod.GET)
	public String dbProductListGet(@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "20", required = false) int pageSize,
			@RequestParam(name="caseone", defaultValue = "전체", required = false) String caseone,
			@RequestParam(name="part", defaultValue="전체", required=false) String part,
			Model model) {
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "dbshopList", part, caseone);
		
		MovieVO movieVos = movieService.getMovieinfo(part);
		model.addAttribute("movieVos", movieVos);
		
		List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
		model.addAttribute("subTitleVos", subTitleVos);
		List<DbProductVO> mainTitleVos = dbShopService.getMainTitle();
		model.addAttribute("mainTitleVos", mainTitleVos);
		model.addAttribute("part", part);
		model.addAttribute("pageVO",pageVO);
		List<DbProductVO> productVos = dbShopService.getDbShopList(pageVO.getStartIndexNo(),pageSize,part);
		List<DbProductVO> productVos2 = dbShopService.getDbShopListMain(pageVO.getStartIndexNo(),pageSize,part);
		
		model.addAttribute("productVos2", productVos2);
		model.addAttribute("productVos", productVos);
		return "dbShop/dbProductList";
	}
	
	@RequestMapping(value="/dbProductList2", method = RequestMethod.GET)
	public String dbProductList2Get(@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "20", required = false) int pageSize,
			@RequestParam(name="caseone", defaultValue = "전체", required = false) String caseone,
			@RequestParam(name="part", defaultValue="전체", required=false) String part,
			Model model) {
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "dbshopList", part, caseone);
		
		List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
		model.addAttribute("subTitleVos", subTitleVos);
		List<DbProductVO> mainTitleVos = dbShopService.getMainTitle();
		model.addAttribute("mainTitleVos", mainTitleVos);
		model.addAttribute("part", part);
		model.addAttribute("pageVO",pageVO);
		List<DbProductVO> productVos = dbShopService.getDbShopList(pageVO.getStartIndexNo(),pageSize,part);
		List<DbProductVO> productVos2 = dbShopService.getDbShopListMain(pageVO.getStartIndexNo(),pageSize,part);
		
		model.addAttribute("productVos2", productVos2);
		model.addAttribute("productVos", productVos);
		return "dbShop/dbProductList2";
	}
	
	@RequestMapping(value="/dbProductContent", method=RequestMethod.GET)
	public String dbProductContentGet(int idx, Model model) {
		DbProductVO productVo = dbShopService.getDbShopProduct(idx); 		
		List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx); 	
		
		model.addAttribute("productVo", productVo);
		model.addAttribute("optionVos", optionVos);
		
		return "dbShop/dbProductContent";
	}
	
	@RequestMapping(value="/dbProductContent", method=RequestMethod.POST)
	public String dbProductContentPost(DbCartListVO vo, HttpSession session, String flag, Model model) {
		String mid = (String) session.getAttribute("sMid");
		DbCartListVO resVo = dbShopService.getDbCartListProductOptionSearch(vo.getProductName(), vo.getOptionName(), mid);
		if(resVo != null) {		
			String[] voOptionNums = vo.getOptionNum().split(",");    
			String[] resOptionNums = resVo.getOptionNum().split(",");
			int[] nums = new int[99];		
			String strNums = "";								
			for(int i=0; i<voOptionNums.length; i++) {		
				nums[i] += (Integer.parseInt(voOptionNums[i]) + Integer.parseInt(resOptionNums[i]));
				strNums += nums[i];		
				if(i < nums.length - 1) strNums += ",";	
			}
			vo.setOptionNum(strNums);
			dbShopService.dbShopCartUpdate(vo);
		}
		else {		
			dbShopService.dbShopCartInput(vo);
		}
		
		if(flag.equals("order")) {
			return "redirect:/msg/cartOrderOk";
		}
		else {
			model.addAttribute("idx", vo.getIdx());
			return "redirect:/msg/cartInputOk";
		}
		
	}
	
	@RequestMapping(value="/dbCartList", method=RequestMethod.GET)
	public String dbCartListGet(HttpSession session, DbCartListVO vo, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<DbCartListVO> vos = dbShopService.getDbCartList(mid);
		
		model.addAttribute("cartListVos", vos);
		return "dbShop/dbCartList";
	}
	
	@RequestMapping(value="/dbCartList", method=RequestMethod.POST)
	public String dbCartListPost(HttpServletRequest request, Model model, HttpSession session) {
		String mid = session.getAttribute("sMid").toString();
		int baesong = Integer.parseInt(request.getParameter("baesong"));
		
		DbOrderVO maxIdx = dbShopService.getOrderMaxIdx();
		int idx = 1;
		if(maxIdx != null) idx = maxIdx.getMaxIdx() + 1;
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(today) + idx;
				
		String[] idxChecked = request.getParameterValues("idxChecked");
		
		DbCartListVO cartVo = new DbCartListVO();
		List<DbOrderVO> orderVos = new ArrayList<DbOrderVO>();
		
		for(String strIdx : idxChecked) {	
			cartVo = dbShopService.getCartIdx(Integer.parseInt(strIdx));	
			DbOrderVO orderVo = new DbOrderVO();
			orderVo.setProductIdx(cartVo.getProductIdx());
			orderVo.setProductName(cartVo.getProductName());
			orderVo.setMainPrice(cartVo.getMainPrice());
			orderVo.setThumbImg(cartVo.getThumbImg());
			orderVo.setOptionName(cartVo.getOptionName());
			orderVo.setOptionPrice(cartVo.getOptionPrice());
			orderVo.setOptionNum(cartVo.getOptionNum());
			orderVo.setTotalPrice(cartVo.getTotalPrice());
			orderVo.setCartIdx(cartVo.getIdx());
			orderVo.setBaesong(baesong);
			
			orderVo.setOrderIdx(orderIdx);	
			orderVo.setMid(mid);					
			
			orderVos.add(orderVo);
		}
		session.setAttribute("sOrderVos", orderVos); 
		model.addAttribute("cartVo", cartVo);
		MemberVO memberVo = memberService.getMemIdCheck(mid);
		model.addAttribute("memberVo", memberVo);
		
		return "dbShop/dbOrder"; 
	}
	
	@ResponseBody
	@RequestMapping(value="/dbCartDelete", method=RequestMethod.POST)
	public String dbCartDeleteGet(int idx) {
		dbShopService.dbCartDelete(idx);
		return "";
	}
	
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String paymentPost(DbOrderVO orderVo, PayMentVO payMentVo, DbBaesongVO baesongVo, HttpSession session, Model model) {
		
		model.addAttribute("payMentVo", payMentVo);
		
		
		session.setAttribute("sPayMentVo", payMentVo);
		session.setAttribute("sBaesongVo", baesongVo);
		
		return "dbShop/paymentOk";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/paymentResult", method=RequestMethod.GET)
	public String paymentResultGet(HttpSession session, PayMentVO receivePayMentVo, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<DbOrderVO> orderVos = (List<DbOrderVO>) session.getAttribute("sOrderVos");
		PayMentVO payMentVo = (PayMentVO) session.getAttribute("sPayMentVo");
		DbBaesongVO baesongVo = (DbBaesongVO) session.getAttribute("sBaesongVo");
		session.removeAttribute("sOrderVos");
		session.removeAttribute("sPayMentVo");
		session.removeAttribute("sBaesongVo");
		
		for(DbOrderVO vo : orderVos) {
			vo.setIdx(Integer.parseInt(vo.getOrderIdx().substring(8))); 
			vo.setOrderIdx(vo.getOrderIdx());        			
			vo.setMid(vo.getMid());
			
			dbShopService.setDbOrder(vo);                 	
			dbShopService.dbCartDeleteAll(vo.getCartIdx()); 
		}
		
		baesongVo.setOIdx(orderVos.get(0).getIdx());
		baesongVo.setOrderIdx(orderVos.get(0).getOrderIdx());
		baesongVo.setAddress(payMentVo.getBuyer_addr());
		baesongVo.setTel(payMentVo.getBuyer_tel());
		dbShopService.setDbBaesong(baesongVo); 
		dbShopService.setMemberPointPlus((int)(baesongVo.getOrderTotalPrice() * 0.01), orderVos.get(0).getMid());	
		
		payMentVo.setImp_uid(receivePayMentVo.getImp_uid());
		payMentVo.setMerchant_uid(receivePayMentVo.getMerchant_uid());
		payMentVo.setPaid_amount(receivePayMentVo.getPaid_amount());
		payMentVo.setApply_num(receivePayMentVo.getApply_num());
		
		model.addAttribute("orderVos", orderVos);
		model.addAttribute("payMentVo", payMentVo);
		model.addAttribute("orderTotalPrice", baesongVo.getOrderTotalPrice());
		model.addAttribute("mid", mid);
		return "redirect:/msg/paymentResultOk";
	}
	
	@RequestMapping(value="/dbOrderBaesong", method=RequestMethod.GET)
	public String dbOrderBaesongGet(String orderIdx, Model model) {
		List<DbBaesongVO> vos = dbShopService.getOrderBaesong(orderIdx); 
		model.addAttribute("vo", vos.get(0)); 
		
		return "dbShop/dbOrderBaesong";
	}
	
  @RequestMapping(value="/adminOrderStatus")
  public String dbOrderProcessGet(Model model,
   @RequestParam(name="startJumun", defaultValue="", required=false) String startJumun,
   @RequestParam(name="endJumun", defaultValue="", required=false) String endJumun,
   @RequestParam(name="orderStatus", defaultValue="전체", required=false) String orderStatus,
   @RequestParam(name="pag", defaultValue="1", required=false) int pag,
   @RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
     
     List<DbBaesongVO> vos = null;
     PageVO pageVo = null;
     String strNow = "";
     if(startJumun.equals("")) {
        Date now = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      strNow = sdf.format(now);
      
      startJumun = strNow;
      endJumun = strNow;
     }
   
   String strOrderStatus = startJumun + "@" + endJumun + "@" + orderStatus;
   pageVo = pageProcess.totRecCnt(pag, pageSize, "adminDbOrderProcess", "", strOrderStatus);
     
     vos = dbShopService.getAdminOrderStatus(startJumun, endJumun, orderStatus);
  
    model.addAttribute("startJumun", startJumun);
    model.addAttribute("endJumun", endJumun);
    model.addAttribute("orderStatus", orderStatus);
    model.addAttribute("vos", vos);
    model.addAttribute("pageVo", pageVo);
  
    return "admin/dbShop/dbOrderProcess";
  }
  

  @RequestMapping(value = "/season", method = RequestMethod.GET)
	public String seasonGet(HttpServletRequest request) {
		return "dbShop/season";
	}
  
  @RequestMapping(value = "/season1-1", method = RequestMethod.GET)
  public String season11Get(HttpServletRequest request, Model model) {
  	
  	String brand = "O";
  	List<DbProductVO> Vos = dbShopService.getSeason1(brand);
  	
  	model.addAttribute("MainName", "GUESS");
  	model.addAttribute("Vos", Vos);
  	
  	return "dbShop/season/season1-1";
  }
  
  @RequestMapping(value = "/season1-2", method = RequestMethod.GET)
  public String season12Get(HttpServletRequest request, Model model) {
  	
  	String brand = "L";
  	List<DbProductVO> Vos = dbShopService.getSeason2(brand);
  	
  	model.addAttribute("MainName", "ARENA");
  	model.addAttribute("Vos", Vos);
  	
  	return "dbShop/season/season1-2";
  }
  @RequestMapping(value = "/season1-3", method = RequestMethod.GET)
  public String season13Get(HttpServletRequest request, Model model) {
  	
  	String brand = "F";
  	List<DbProductVO> Vos = dbShopService.getSeason2(brand);
  	
  	model.addAttribute("MainName", "DECKE");
  	model.addAttribute("Vos", Vos);
  	
  	return "dbShop/season/season1-3";
  }
  @RequestMapping(value = "/season1-4", method = RequestMethod.GET)
  public String season14Get(HttpServletRequest request) {
  	return "dbShop/season/season1-4";
  }
  @RequestMapping(value = "/season1-5", method = RequestMethod.GET)
  public String season15Get(HttpServletRequest request, Model model) {
  	
  	String brand = "M";
  	List<DbProductVO> Vos = dbShopService.getSeason2(brand);
  	
  	model.addAttribute("MainName", "DESCENTE");
  	model.addAttribute("Vos", Vos);
  	
  	return "dbShop/season/season1-5";
  }
  @RequestMapping(value = "/season2-1", method = RequestMethod.GET)
  public String season21Get(HttpServletRequest request) {
  	return "dbShop/season/season2-1";
  }
  @RequestMapping(value = "/season2-2", method = RequestMethod.GET)
  public String season22Get(HttpServletRequest request) {
  	return "dbShop/season/season2-2";
  }
	@RequestMapping(value="/dbMyOrder", method=RequestMethod.GET)
	public String dbMyOrderGet(HttpServletRequest request, HttpSession session, Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="3", required=false) int pageSize) {
		String mid = (String) session.getAttribute("sMid");
		String sMid = (String) session.getAttribute("sMid");
		int level = (int) session.getAttribute("sLevel");
		if(level == 0) mid = "전체";
		
		PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "dbMyOrder", mid, "");
		List<DbProductVO> vos = dbShopService.getMyOrderList(pageVo.getStartIndexNo(), pageSize, sMid);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVo",pageVo);
		
		return "dbShop/dbMyOrder";
	}
	
	@RequestMapping(value="/myOrderStatus", method=RequestMethod.GET)
	public String myOrderStatusGet(
			HttpServletRequest request, 
			HttpSession session, 
			String startJumun, 
			String endJumun, 
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="3", required=false) int pageSize,
 	    @RequestParam(name="conditionOrderStatus", defaultValue="전체", required=false) String conditionOrderStatus,
			Model model) {
		String mid = (String) session.getAttribute("sMid");
		String sMid = (String) session.getAttribute("sMid");
		int level = (int) session.getAttribute("sLevel");
		
		if(level == 0) mid = "전체";
		String searchString = startJumun + "@" + endJumun;
		PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "myOrderStatus", sMid, searchString);  // 4번째인자에 '아이디/조건'(을)를 넘겨서 part를 아이디로 검색처리하게 한다.
		System.out.println("pageVo1" + pageVo);
		List<DbBaesongVO> vos = dbShopService.getMyOrderStatus(pageVo.getStartIndexNo(), pageSize, sMid, startJumun, endJumun);
		model.addAttribute("vos", vos);				
		model.addAttribute("startJumun", startJumun);
		model.addAttribute("endJumun", endJumun);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("stateFlag", "D");
		
		return "dbShop/dbMyOrder";
	}
  @RequestMapping(value="/orderCondition", method=RequestMethod.GET)
  public String orderConditionGet(HttpSession session, Model model,
      @RequestParam(name="conditionDate", defaultValue="1", required=false) int conditionDate,
      @RequestParam(name="pag", defaultValue="1", required=false) int pag,
      @RequestParam(name="pageSize", defaultValue="3", required=false) int pageSize) {
    String mid = (String) session.getAttribute("sMid");
    String strConditionDate = conditionDate + "";
    PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "dbShopMyOrderCondition", mid, strConditionDate);

    List<DbBaesongVO> vos = dbShopService.getOrderCondition(mid, conditionDate, pageVo.getStartIndexNo(), pageSize);
    
		model.addAttribute("vos", vos);
		model.addAttribute("pageVo", pageVo);
    model.addAttribute("conditionDate", conditionDate);

    Calendar startDateJumun = Calendar.getInstance();
    Calendar endDateJumun = Calendar.getInstance();
    startDateJumun.setTime(new Date());  
    endDateJumun.setTime(new Date());    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String startJumun = "";
    String endJumun = "";
    switch (conditionDate) {
      case 7:
        startJumun = sdf.format(startDateJumun.getTime());
        endJumun = sdf.format(endDateJumun.getTime());
      case 15:
        startDateJumun.add(Calendar.DATE, -15);
        break;
      case 30:
        startDateJumun.add(Calendar.MONTH, -1);
        break;
      case 90:
        startDateJumun.add(Calendar.MONTH, -3);
        break;
      case 180:
      	startDateJumun.add(Calendar.MONTH, -6);
      	break;
      case 99999:
        startDateJumun.set(2022, 00, 01);
        break;
      default:
        startJumun = null;
        endJumun = null;
    }
    if(conditionDate != 1 && endJumun != null) {
      startJumun = sdf.format(startDateJumun.getTime());
      endJumun = sdf.format(endDateJumun.getTime());
    }

    model.addAttribute("startJumun", startJumun);
    model.addAttribute("endJumun", endJumun);
    model.addAttribute("stateFlag", "S");

    return "dbShop/dbMyOrder";
  }
	@RequestMapping(value = "/dbMyOrder2", method = RequestMethod.GET)
	public String dbMyOrder2Get(HttpServletRequest request) {
		return "dbShop/dbMyOrder2";
	}
	@RequestMapping(value = "/dbMyOrder3", method = RequestMethod.GET)
	public String dbMyOrder3Get(HttpServletRequest request) {
		return "dbShop/dbMyOrder3";
	}
	@RequestMapping(value = "/dbMyOrder4", method = RequestMethod.GET)
	public String dbMyOrder4Get(HttpServletRequest request) {
		return "dbShop/dbMyOrder4";
	}
}
