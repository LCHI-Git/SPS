package com.sps.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sps.dao.spsDAO;
import com.sps.vo.ProductVO;

// 메인 홈페이지에 있는 베스트 상품들, 히트 상품들, 카테고리별 상품들 나오게 하기!!!!!!!!!!!!!!!!!!!!!!!

@Controller
public class HomeController {
	
	@Autowired
	public SqlSession shopSqlSession;
	
	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, Model model) {
		try { request.setCharacterEncoding("UTF-8"); } catch (UnsupportedEncodingException e) { e.printStackTrace(); }
		
		return "";
	}
	
}
