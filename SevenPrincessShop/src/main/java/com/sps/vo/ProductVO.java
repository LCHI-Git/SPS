package com.sps.vo;

import java.sql.Date;

public class ProductVO {

	private int product_idx;				// 상품 인덱스
	private String product_name;			// 상품 이름
	private int product_price;				// 상품 가격
	private int product_category;			// 상품 카테고리(01~18)이미지 참고
	private String product_registerDate;	// 상품 등록 날짜
	private int product_hit;				// 상품 조회수
	private int product_stock;				// 상품의 모든 재고(STOCK 테이블의 상품 인덱스에 해당하는 stock 총합)
	private String product_imgPath;			// 상품 사진 경로 (ex "/images/productImages/01/01_01/01_01" => .jpg나 _상세사진 숫자.jpg 따로 추가)
	private int product_imgPathStock;		// 상세 이미지 개수(반복문에 필요)
	
	
	private int stock_idx;				// 재고 인덱스
	private int stock_product_idx;		// 상품 인덱스
	private String stock_size;			// 상품의 사이즈
	private String stock_color;			// 상품의 색상
	private int stock_stock;			// 해당 사이즈, 색상 상품의 재고
	
}
