package com.sps.vo;

import java.sql.Date;

public class ProductVO {

	private int product_idx;				// ?��?�� idx	(= stock_product_idx)
	private String product_name;			// ?��?�� ?���?
	private int product_price;				// ?��?�� �?�?
	private int product_category;			// ?��?�� 카테고리
	private Date product_registerDate;		// 주문 ?���?
	private int product_hit;				// ?��?�� 조회?��(조회?���? ?��?? �? 메인 ?��?���??�� 6개씩 보여�?�? ?��?��.)
	private String product_imgPath;			// ?��?�� ?��미�? 경로
	private String product_Sstock;			// S?��?���? ?���?
	private String product_Mstock;			// M?��?���? ?���?
	private String product_Lstock;			// L?��?���? ?���?
	private String product_Fstock;			// F?��?���? ?���?
	private int product_stock;				// �? ?���? ?��?��
	
	
}
