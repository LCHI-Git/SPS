package com.sps.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sps.vo.ClientVO;


public interface MybatisSampleDAO {

	void insertMember(ClientVO clientVO);

	int countMember();

	ClientVO selectMember();

	ClientVO selectMember(int count);





//	아이디 / 비밀번호 찾기
	String findId(String name, String phoneNumber);
	
	void changePwd(String newPw, String client_id);

	int findPwCount(String id, String email);




	
	
	

	

}
