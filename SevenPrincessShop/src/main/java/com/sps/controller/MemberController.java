package com.sps.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sps.dao.MybatisSampleDAO;
import com.sps.vo.ClientVO;
import com.sps.mail.*;

// 회원과 관련된 기능을 담을 컨트롤러에요

@Controller
public class MemberController {
	
	@Autowired
	public SqlSession sqlSession;	// sqlSession 변수 >> Autowired로 자동 주입 servlet-context.xml 에 빈 선언해놓음

	
	
	
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 아이디 찾기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//	실행해보기위한 테스트 맵핑 (지울것)
	@RequestMapping(value = "/member")
	public String memberMain(Locale locale, Model model) {	
		return "member/memberMain";
	}
	
//	findId폼으로 보내주는 맵핑 => 아이디 찾기 폼
	@RequestMapping(value = "/findIdPw")
	public String findId(HttpServletRequest request, Model model) throws Exception {
		return "member/findIdPw";
	}
	
//	findIdResult폼으로 보내주는 맵핑 => 찾은 아이디 확인 폼
	@RequestMapping(value = "/findIdResult")
	public String findIdResult(HttpServletRequest request, HttpServletResponse response, Model model, ClientVO vo) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		//응답으로 내보낼 출력 스트림 얻어오기
		PrintWriter out = response.getWriter();
		MybatisSampleDAO mapper = sqlSession.getMapper(MybatisSampleDAO.class);
		String name = vo.getClient_name();
		System.out.println(vo.getClient_name());
		String phoneNumber = vo.getClient_phoneNumber();
		System.out.println(vo.getClient_email());
		
		String id = mapper.findId(name, phoneNumber);
		System.out.println(id);
		
		//아이디 검색 sql 실행 후 검색된 아이디가 없다면 alert창으로 문구 띄워주기
		if(id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			model.addAttribute("id",id);
		}
		
		return "member/findIdResult";
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 아이디찾기 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	
	
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비밀번호 찾기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//	이메일 보내기 메소드	
//	findPw 폼에서 입력한 아이디와 이메일을 가지고 와서 비밀번호가 맞다면 임시비밀번호를 생성해서 가져온 이메일 주소로 임시비밀번호를 보내주고
//	아이디와 이메일이 하나라도 일치하는게 없다면 alert창을 띄우는 메소드
	@RequestMapping(value = "/findPwResult")
	public String findPwResult(HttpServletRequest request, HttpServletResponse response, Model model, ClientVO vo) throws Exception {
		MybatisSampleDAO mapper = sqlSession.getMapper(MybatisSampleDAO.class);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		  String id = vo.getClient_id();
		  String email = vo.getClient_email();
		  int count = mapper.findPwCount(id,email);
		  
		  if(count != 1) {
			out.println("<script>");
			out.println("alert('가입된 정보가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return "member/findIdPw";
			
		  }else {
	
			//FindUtil클래스의 createKey() 메소드를 실행하여 임시비밀번호로 쓸 난수를 만들어 newPw 변수에 저장한다.
			String newPw = FindUtil.createKey();
			System.out.println("임시 비밀번호 : " + newPw);
			
			//기존 비밀번호에서 위에서 만든 임시 비밀번호로 바꾸어 DB에 저장하는 메소드를 실행한다. 
			mapper.changePwd(newPw, id);
			System.out.println("찾는 아이디" + id);
			System.out.println("찾는 이메일" + email);
			
			
			//이메일에 쓸 내용
			String subject = "[SevenPrincessShop] 임시 비밀번호 발급 안내"; //이메일 제목
			String msg = ""; //본문내용
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'><strong>" + vo.getClient_id();
			msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
			msg += "<p>임시 비밀번호 : <strong>" + newPw + "</strong></p></div>";
	
			//MailUtil클래스의 sendMail(보낼 이메일, 제목, 본문) 메소드를 실행한다.
			MailUtil.sendMail(email, subject, msg);
			
		
			model.addAttribute("email",email);
		
			return "member/findPwResult"; //로그인 화면 구현되면 로그인창으로 포워드 하기!!
		  }
	}	
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비밀번호 찾기 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	
}
