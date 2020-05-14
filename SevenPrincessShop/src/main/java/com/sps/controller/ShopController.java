package com.sps.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sps.dao.spsDAO;
import com.sps.vo.OrderListVO;
import com.sps.vo.ProductVO;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요


@Controller
public class ShopController {

	@Autowired
	SqlSession shopSqlSession;
	
	
	@RequestMapping(value="/showCategory")
	public String showCategory(HttpServletRequest request, Model model) {
		
		String cNum = request.getParameter("cNum");
		model.addAttribute("cNum", cNum);
		
		return "shop/showCategory";
	}
	
//	상품 상세페이지
@RequestMapping(value = "/productInfo", method = RequestMethod.GET)
public String productInfo(HttpServletRequest request, Model model) {
	System.out.println("컨트롤러의 productInfo() 메소드 실행");
	
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	
	
	
	String product_idx = request.getParameter("product_idx");
	System.out.println(product_idx);
	

	ArrayList<String> size = mapper.getSize(product_idx);
	
	
	System.out.println(size);
	
	
	// 색상을 담은 리스트
	ArrayList<String> color = mapper.getColor(product_idx);
	
	
	System.out.println(color);
	
	// 상품명, 가격, 이미지 path, path 크기 가져오기
	ProductVO productVO = new ProductVO();

	
	
	
	productVO = mapper.getProductInfo(product_idx);
	
	model.addAttribute("productVO", productVO);
	model.addAttribute("size", size);
	model.addAttribute("color", color);
	
	return "shop/productInfo";
}

@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
public String insertCart(HttpServletRequest request, Model model) {
	System.out.println("컨트롤러의 insertCart() 메소드 실행");
	
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	String orderList_client_idx = request.getParameter("orderList_client_idx");
	String orderList_product_idx = request.getParameter("orderList_product_idx");
	//System.out.println(orderList_product_idx);
	String selectCode = request.getParameter("selectCode");
	System.out.println(selectCode);
	String[] options = selectCode.split("/");
	String[] option = null;
	for (int i = 0; i < options.length; i++) {
		option = options[i].split("_");
		String orderList_size = option[0];
		String orderList_color = option[1];
		String orderList_stock = option[2];
			
		mapper.insertCart(orderList_client_idx, orderList_product_idx, orderList_size, orderList_color, orderList_stock);
				
		}
	
	
	
	
	
	
	return "shop/productInfo";
}

	
}
