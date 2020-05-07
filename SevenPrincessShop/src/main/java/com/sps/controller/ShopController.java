package com.sps.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 쇼핑몰 페이지 처리관련 기능을 담을 컨트롤러에요
@Controller
public class ShopController {

	
@RequestMapping(value = "/", method = RequestMethod.GET)
public String Main(Locale locale, Model model) {
	
	
	return "mainView/Main";
}	
	
}
