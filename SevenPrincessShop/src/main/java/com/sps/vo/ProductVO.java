package com.sps.vo;

import java.sql.Date;

public class ProductVO {

	private int product_idx;				// ?? idx	(= stock_product_idx)
	private String product_name;			// ?? ?΄λ¦?
	private int product_price;				// ?? κ°?κ²?
	private int product_category;			// ?? μΉ΄νκ³ λ¦¬
	private Date product_registerDate;		// μ£Όλ¬Έ ? μ§?
	private int product_hit;				// ?? μ‘°ν?(μ‘°ν?κ°? ??? κ±? λ©μΈ ??΄μ§?? 6κ°μ© λ³΄μ¬μ§?κ²? ??€.)
	private String product_imgPath;			// ?? ?΄λ―Έμ? κ²½λ‘
	private String product_Sstock;			// S?¬?΄μ¦? ?¬κ³?
	private String product_Mstock;			// M?¬?΄μ¦? ?¬κ³?
	private String product_Lstock;			// L?¬?΄μ¦? ?¬κ³?
	private String product_Fstock;			// F?¬?΄μ¦? ?¬κ³?
	private int product_stock;				// μ΄? ?¬κ³? ??
	
	
}
