package com.sps.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sps.dao.spsDAO;
import com.sps.vo.OptionData;
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
	
//	유정 상품 상세페이지
@RequestMapping(value = "/productInfo", method = RequestMethod.GET)
public String productInfo(HttpSession session,HttpServletRequest request, Model model) {
	System.out.println("컨트롤러의 productInfo() 메소드 실행");
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	String product_idx = request.getParameter("product_idx");
//	System.out.println(product_idx);
	
//	상품 정보 가져오기
	ProductVO productVO = new ProductVO();
	productVO = mapper.getProductInfo(product_idx);
	
//	사이즈 리스트에 가져오기(ORDER BY stock_idx DESC)
	ArrayList<String> size = mapper.getSize(product_idx);
	
	ArrayList<String> allSize = mapper.getAllSize(product_idx);
	
//	색 리스트에 가져오기(ORDER BY stock_idx DESCc)
	ArrayList<String> color = mapper.getColor(product_idx);
	
	ArrayList<String> allColor = mapper.getAllColor(product_idx);
	
//	재고 리스트에 가져오기(ORDER BY stock_idx DESC)
	ArrayList<String> stock = mapper.getStock(product_idx);
	

	
	
	System.out.println(size);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	// 데이터 구조					i											j2
	System.out.println(size.get(0) + " : " + color.get(0) +" : " +stock.get(0) );
//																			j2
	System.out.println(size.get(0) + " : " + color.get(1) +" : " +stock.get(1) );
//																			j2
	System.out.println(size.get(1) + " : " + color.get(0) +" : " +stock.get(2) );
//																			j2	
	System.out.println(size.get(1) + " : " + color.get(1) +" : " +stock.get(3) );
	
*/
	
	
	
	
	
//	사이즈별 옵션 재고 정리 코드//////////////////////////////////////////
	int c = 0;
	int s = 0;
	ArrayList<OptionData> ao = new ArrayList<OptionData>();
	while(c!=size.size()) {
		for (int i = 0; i < size.size(); i++) {
			for (int j = 0; j < color.size(); j++) {
				OptionData od = new OptionData();
				od.setOdSize(size.get(c));
				od.setOdOption(color.get(j));
				od.setOdStock(stock.get(s));
				ao.add(od);
				s++;
			}
			c++;
		}
	}
	c=0;
	s=0;
	for (int i = 0; i < ao.size(); i++) {
		System.out.println(ao.get(i));
	}
///////////////////////////////////////////////////////////

	
	model.addAttribute("ao", ao);
	
	
	
	

	
	session.setAttribute("productVO", productVO);
	session.setAttribute("size", size);			
	session.setAttribute("color", color);		
	session.setAttribute("allSize", allSize);	
	session.setAttribute("allColor", allColor);
	session.setAttribute("stock", stock);
	
	
	return "shop/productInfo";
}




//	유정 장바구니에 담기
@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
public String insertCart(HttpServletRequest request, Model model) {
	System.out.println("컨트롤러의 insertCart() 메소드 실행");
	
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	String orderList_client_idx = request.getParameter("orderList_client_idx");
	String orderList_product_idx = request.getParameter("orderList_product_idx");
	Boolean confirmFlag = Boolean.parseBoolean(request.getParameter("confirmFlag"));
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
	
	if (confirmFlag) {
	
		return "member/cartView";
	}
	
	return "shop/productInfo";
}





//	동호 바로 결제 페이지로 이동
@RequestMapping(value = "/pay", method = RequestMethod.GET)
public String pay(HttpServletRequest request, Model model) {
	System.out.println("컨트롤러의 insertCart() 메소드 실행");
	
	spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
	String orderList_client_idx = request.getParameter("orderList_client_idx");
	String orderList_product_idx = request.getParameter("orderList_product_idx");
	String selectCode = request.getParameter("selectCode");
	
	String[] options = selectCode.split("/");
	String[] option = null;
	
	for (int i = 0; i < options.length; i++) {
		option = options[i].split("_");
		String orderList_size = option[0];
		String orderList_color = option[1];
		String orderList_stock = option[2];
		
//		여기에서 값 넘기세용 2중 배열 사용 동호오빠한테 설명하기 잊지 말세열!!!!!!!!!
	}
	
	
	return "결제 페이지";
}

}
