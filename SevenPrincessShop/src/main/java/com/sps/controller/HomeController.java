package com.sps.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sps.vo.ClientVO;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home(HttpSession session,HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
//		유정 수정 
		ClientVO vo = new ClientVO();
		
		vo.setClient_id("비회원");
		
		session.setAttribute("nowUser", vo);
		return "shop/index";
	}
}
