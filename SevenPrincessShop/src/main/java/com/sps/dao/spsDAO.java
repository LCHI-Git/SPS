package com.sps.dao;

import java.util.ArrayList;
import java.util.List;

import com.sps.vo.ClientVO;
import com.sps.vo.ProductVO;

public interface spsDAO {

	ClientVO selectById(String client_id);

	ArrayList<String> getSize(String product_idx);

	ArrayList<String> getColor(String product_idx);

	ProductVO getProductInfo(String product_idx);

}
