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





	String findId(String client_email);
	
	void changePwd(String newPw, String client_id);

	int findPwCount(String id, String email);


	
	
	

	

}
