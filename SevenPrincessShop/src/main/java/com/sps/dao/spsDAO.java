package com.sps.dao;

import java.util.ArrayList;
import java.util.List;

import com.sps.vo.ClientVO;
import com.sps.vo.OrderListVO;
import com.sps.vo.ProductVO;

public interface spsDAO {

	ClientVO selectById(String client_id);

//	유정 상품사이즈 가져오기
	ArrayList<String> getSize(String product_idx);

//	유정 상품색상가져오기
	ArrayList<String> getColor(String product_idx);

//	유정 상품정보가져오기
	ProductVO getProductInfo(String product_idx);

//	유정 카트에 정보 담기

	void insertCart(String orderList_client_idx, String orderList_product_idx, String orderList_size,
			String orderList_color, String orderList_stock);

}
