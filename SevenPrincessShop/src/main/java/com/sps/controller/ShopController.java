package com.sps.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sps.dao.spsDAO;
import com.sps.vo.ProductVO;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요
@Controller
public class ShopController {
	
	@Autowired
	public SqlSession shopSqlSession;
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@ index() 메소드 실행 @@@@@@@@@@");
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		
		ArrayList<ProductVO> topList = mapper.topListDescByIdx();
		ArrayList<ProductVO> bottomList = mapper.bottomListDescByIdx();
		ArrayList<ProductVO> onePieceList = mapper.onePieceListDescByIdx();
		ArrayList<ProductVO> outerList = mapper.outerListDescByIdx();
		ArrayList<ProductVO> acsList = mapper.acsListDescByIdx();
		
		/*
			topList는 8, 7, 6, 5, 4, 3, 2, 1로 가는데 product 테이블의 인덱스 10, 9인
			bottomList는 10, 9로 된다.
		*/ 
		
		int topCount = mapper.selectTopCount(); // 메인 페이지에 보여줄 상의 카테고리 상품 이미지 개수(8개)
		int bottomCount = mapper.selectBottomCount(); // 메인 페이지에 보여줄 상의 카테고리 상품 이미지 개수(8개)
		int onePieceCount = mapper.selectOnePieceCount(); // 메인 페이지에 보여줄 원피스 카테고리 상품 이미지 개수(8개)
		int outerCount = mapper.selectOuterCount(); // 메인 페이지에 보여줄 아우터 카테고리 상품 이미지 개수(8개)
		int acsCount = mapper.selectAcsCount(); // 메인 페이지에 보여줄 악세사리 카테고리 상품 이미지 개수(8개)
		
		model.addAttribute("topList", topList);
		model.addAttribute("bottomList", bottomList);
		model.addAttribute("onePieceList", onePieceList);
		model.addAttribute("outerList", outerList);
		model.addAttribute("acsList", acsList);
		
		model.addAttribute("topCount", topCount);
		model.addAttribute("bottomCount", bottomCount);
		model.addAttribute("onePieceCount", onePieceCount);
		model.addAttribute("outerCount", outerCount);
		model.addAttribute("acsCount", acsCount);
		
		return "shop/index";
	}
	
	@RequestMapping(value="showCategory")
	public String showCategory(HttpServletRequest request, Model model) {
		
//		cNum이라는 카테고리 숫자를 넘겨주기
		String cNum = request.getParameter("cNum");
		model.addAttribute("cNum", cNum);
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		
		ArrayList<ProductVO> pList = mapper.getPList(cNum);
		
		for (int i = 0; i < pList.size(); i++) {
			
			System.out.println(pList.get(i));
			
		}
		
		model.addAttribute("pList", pList);
		
		return "shop/showCategory";
	}
	
	//	상품 상세페이지
	@RequestMapping(value = "/productInfo")
	public String productInfo(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러의 productInfo() 메소드 실행");
		
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
//		String product_idx = request.getParameter("product_idx");
		int product_idx = Integer.parseInt(request.getParameter("product_idx"));
		
		ProductVO productVO = new ProductVO();
		
//		카테고리 번호를 임시로 담아둘 변수
		productVO = mapper.getProductInfo(product_idx);
		int hit = mapper.increment(product_idx); 

		model.addAttribute("productVO", productVO);
		model.addAttribute("product_hit", hit);
		model.addAttribute("product_imgPath", productVO.getProduct_imgPath());
		model.addAttribute("product_imgPathStock", productVO.getProduct_imgPathStock());
		model.addAttribute("product_category", productVO.getProduct_category());
		model.addAttribute("product_idx", productVO.getProduct_idx());
		model.addAttribute("product_subCategory", productVO.getProduct_subCategory());
		System.out.println(productVO.getProduct_subCategory());
		
		return "shop/productInfo";
	}
	
	@RequestMapping("/increment")
	public String increment(HttpServletRequest request, Model model) {
		System.out.println("@@@@@@@@@@ increment() 메소드 실행 @@@@@@@@@@");
		spsDAO mapper = shopSqlSession.getMapper(spsDAO.class);
		int idx = Integer.parseInt(request.getParameter("product_idx"));
		mapper.increment(idx);
		model.addAttribute("product_idx", idx);
		return "redirect:shop/index";
	}
	
}