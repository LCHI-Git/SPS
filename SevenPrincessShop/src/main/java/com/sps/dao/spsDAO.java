package com.sps.dao;

import java.util.ArrayList;

import com.sps.vo.ClientVO;
import com.sps.vo.ProductVO;

public interface spsDAO {
	
//	고객
	ClientVO selectById(String client_id);
	
//	홈페이지 메인 
	ArrayList<ProductVO> getPList(String cNum);			// 카테고리를 클릭하면 나오는 페이지(showCategory.jsp)에 데이터를 넘겨줄 메소드
	ArrayList<String> getSize(int product_idx);
	ArrayList<String> getColor(int product_idx);
	ProductVO getProductInfo(int product_idx);
	int increment(int product_idx);

	ArrayList<ProductVO> topListDescByIdx();
	ArrayList<ProductVO> bottomListDescByIdx();
	ArrayList<ProductVO> onePieceListDescByIdx();
	ArrayList<ProductVO> outerListDescByIdx();
	ArrayList<ProductVO> acsListDescByIdx();
	
	int selectTopCount();
	int selectBottomCount();
	int selectOnePieceCount();
	int selectOuterCount();
	int selectAcsCount();
	


}
