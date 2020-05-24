package com.sps.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sps.dao.spsDAO;
import com.sps.vo.ProductVO;
import com.sps.vo.ReviewList;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요


@Controller
public class ShopController {

   @Autowired
   SqlSession shopSqlSession;
   
// 명훈이 추가 05.25/////////////////////////  
   @RequestMapping(value="/")
	public String index(HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@ index() 메소드 실행 @@@@@@@@@@");
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		
//		bestItem은 stock_status가 payOK된 데이터들 중 hit를 내림차순으로 정렬한 후 페이지에 띄워준다.
		ArrayList<ProductVO> bestList = mapper.bestListDescByIdx();
		ArrayList<ProductVO> topList = mapper.topListDescByIdx();
		ArrayList<ProductVO> bottomList = mapper.bottomListDescByIdx();
		ArrayList<ProductVO> onePieceList = mapper.onePieceListDescByIdx();
		ArrayList<ProductVO> outerList = mapper.outerListDescByIdx();
		ArrayList<ProductVO> acsList = mapper.acsListDescByIdx();
		
		/*
			topList는 8, 7, 6, 5, 4, 3, 2, 1로 가는데 product 테이블의 인덱스 10, 9인
			bottomList는 10, 9로 된다.
		*/ 
		
		int bestCount = mapper.selectBestCount(); 				// 메인 페이지에 보여줄 베스트 상품 이미지 개수(8개)
		int topCount = mapper.selectTopCount(); 				// 메인 페이지에 보여줄 상의 카테고리 상품 이미지 개수(8개)
		int bottomCount = mapper.selectBottomCount(); 			// 메인 페이지에 보여줄 상의 카테고리 상품 이미지 개수(8개)
		int onePieceCount = mapper.selectOnePieceCount(); 		// 메인 페이지에 보여줄 원피스 카테고리 상품 이미지 개수(8개)
		int outerCount = mapper.selectOuterCount(); 			// 메인 페이지에 보여줄 아우터 카테고리 상품 이미지 개수(8개)
		int acsCount = mapper.selectAcsCount(); 				// 메인 페이지에 보여줄 악세사리 카테고리 상품 이미지 개수(8개)
		
		model.addAttribute("bestList", bestList);	
		model.addAttribute("topList", topList);
		model.addAttribute("bottomList", bottomList);
		model.addAttribute("onePieceList", onePieceList);
		model.addAttribute("outerList", outerList);
		model.addAttribute("acsList", acsList);
		
		model.addAttribute("bestCount", bestCount);
		model.addAttribute("topCount", topCount);
		model.addAttribute("bottomCount", bottomCount);
		model.addAttribute("onePieceCount", onePieceCount);
		model.addAttribute("outerCount", outerCount);
		model.addAttribute("acsCount", acsCount);
		
		return "shop/index";
	}
// 명훈이 추가 05.25/////////////////////////   
   
   
// 명훈이 추가 05.25/////////////////////////   
   @RequestMapping(value="showCategory")
	public String showCategory(HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@ showCategory() 메소드 실행 @@@@@@@@@@");
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		
//		categoryNum이라는 카테고리 숫자를 넘겨주기
		String categoryNum = request.getParameter("cNum");
		System.out.println(categoryNum);
		model.addAttribute("categoryNum", categoryNum);
		
//		카테고리 별 제품 데이터들을 pList에 저장한다.
		ArrayList<ProductVO> pList = mapper.getPList(categoryNum);
		System.out.println(pList);
		
//		product_imgPath에서 따온 category number
		int imgCategory = mapper.selectCategory(categoryNum);
		System.out.println(imgCategory);
		
//		for (int i = 0; i < pList.size(); i++) { System.out.println(pList.get(i)); }
//		for (int i = 0; i < pList.size(); i++) { System.out.println(pList.get(i).getProduct_category()); }
//		System.out.println(imgCategory);
		
		model.addAttribute("pList", pList);
		model.addAttribute("imgCategory", imgCategory);
		
		return "shop/showCategory";
	}
// 명훈이 추가 05.25/////////////////////////  
   
   
   
   
//   찬호 옵션 찾기
@RequestMapping("/getOptionValues")
	public void getOptionValues(HttpServletRequest req, HttpServletResponse res, String param, String param2) { 
      	try {
      		String size = param;
      		String product_idx = param2;
      		System.out.println("Size 확인 : " + size);
      		System.out.println("IDX 확인 : " + product_idx);
      		
      		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
      		System.out.println("SQL Session Open");
      		
      		ArrayList<String> optionList = mapper.findOption(product_idx, size);
      		System.out.println("SUCCESS GET LIST : " + optionList);
    
      		String getStock;
      		
      			
			
      		JSONArray jsonArray = new JSONArray();
      		for (int i = 0; i < optionList.size(); i++) {
      			getStock = mapper.findOptionStock(product_idx, size, optionList.get(i));
      			System.out.println("Running For roof ("+i+") : " + optionList.get(i));
      			if(getStock.equals("0")) {
      				jsonArray.add(optionList.get(i) + "[품절]");
      			}else if(Integer.parseInt(getStock) < 5) {
      				jsonArray.add(optionList.get(i) + " (재고 : " + getStock + ")");
      			}
      			else {
      				jsonArray.add(optionList.get(i));
      			}
      		}
	    
      		  System.out.println("List pass and fl/cl");
		      PrintWriter pw = res.getWriter();
		      pw.print(jsonArray.toString());
		      pw.flush();
		      pw.close();
		    
		      } catch (Exception e) {
		          System.out.println("com.sps.controller.ShopController java row : 82 ! getOptionValues Exception !");
		      }
      		  System.out.println("getOptionValues Method Running successfully!");
	}
	 

  
//   유정 상품 상세페이지
@RequestMapping(value = "/productInfo")
public String productInfo(HttpSession session,HttpServletRequest request, Model model) {
   System.out.println("컨트롤러의 productInfo() 메소드 실행");
   spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
   String product_idx = request.getParameter("product_idx");
//   System.out.println(product_idx);
   
//   상품 정보 가져오기
   ProductVO productVO = new ProductVO();
   productVO = mapper.getProductInfo(product_idx);
   
//   명훈이 삽입 부분 //////////////////////////////////////////////////////

   //	카테고리 번호를 임시로 담아둘 변수
	int hit = mapper.increment(Integer.parseInt(product_idx)); 
	model.addAttribute("productVO", productVO);
	model.addAttribute("product_hit", hit);
	model.addAttribute("product_imgPath", productVO.getProduct_imgPath());
	model.addAttribute("product_imgPathStock", productVO.getProduct_imgPathStock());
	model.addAttribute("product_category", productVO.getProduct_category());
	model.addAttribute("product_idx", productVO.getProduct_idx());
//  명훈이 삽입 부분 ////////////////////////////////////////////////////////
   
   
//   사이즈 리스트에 가져오기(ORDER BY stock_idx DESC)
   ArrayList<String> size = mapper.getSize(product_idx);
   
   
//   색 리스트에 가져오기(ORDER BY stock_idx DESCc)
   ArrayList<String> color = mapper.getColor(product_idx);
   
   
  
//   리뷰
   
   ReviewList reviewList = new ReviewList();
	int pageSize = 5;
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) { }
	int totalCount = mapper.selectCount(product_idx);

	reviewList.initReviewList2(pageSize, totalCount, currentPage);
	System.out.println(reviewList.getStartNo());
	reviewList.setReviewList(mapper.selectList(Integer.parseInt(product_idx), reviewList.getStartNo()));
//	System.out.println(reviewList.getReviewList().get(0).getReview_imgPath());

	model.addAttribute("reviewList", reviewList);
	model.addAttribute("currentPage", currentPage);
	session.setAttribute("productVO", productVO);
	session.setAttribute("size", size);         
	session.setAttribute("color", color);      
   
   
   return "shop/productInfo";
}
// 명훈이 추가 05.25/////////////////////////
@RequestMapping("/increment")
public String increment(HttpServletRequest request, Model model) {
	System.out.println("@@@@@@@@@@ increment() 메소드 실행 @@@@@@@@@@");
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	int idx = Integer.parseInt(request.getParameter("product_idx"));
	mapper.increment(idx);
	model.addAttribute("product_idx", idx);
	return "redirect:shop/index";
}
//명훈이 추가 05.25/////////////////////////

//   유정 장바구니에 담기
@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
public String insertCart(HttpServletRequest request, Model model) {
   System.out.println("컨트롤러의 insertCart() 메소드 실행");
   
   spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
   String orderList_client_idx = request.getParameter("orderList_client_idx");
   String orderList_product_idx = request.getParameter("orderList_product_idx");
   Boolean confirmFlag = Boolean.parseBoolean(request.getParameter("confirmFlag"));
   String selectCode = request.getParameter("selectCode");
   Date date = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   String orderList_orderDate = sdf.format(date);
   
   
   System.out.println(selectCode);
   
   String[] options = selectCode.split("/");
   String[] option = null;
   
   for (int i = 0; i < options.length; i++) {
      option = options[i].split("_");
      String orderList_size = option[0];
      String orderList_color = option[1];
      String orderList_stock = option[2];
         
      mapper.insertCart(orderList_client_idx, orderList_product_idx, orderList_size, orderList_color, orderList_stock, orderList_orderDate);
            
      }
   
   if (confirmFlag) {
   
      return "redirect:cartView";
   }
   
   return "redirect:productInfo?product_idx="+orderList_product_idx;
}


}