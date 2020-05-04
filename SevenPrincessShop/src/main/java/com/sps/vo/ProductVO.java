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
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_category() {
		return product_category;
	}
	public void setProduct_category(int product_category) {
		this.product_category = product_category;
	}
	public Date getProduct_registerDate() {
		return product_registerDate;
	}
	public void setProduct_registerDate(Date product_registerDate) {
		this.product_registerDate = product_registerDate;
	}
	public int getProduct_hit() {
		return product_hit;
	}
	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}
	public String getProduct_imgPath() {
		return product_imgPath;
	}
	public void setProduct_imgPath(String product_imgPath) {
		this.product_imgPath = product_imgPath;
	}
	public String getProduct_Sstock() {
		return product_Sstock;
	}
	public void setProduct_Sstock(String product_Sstock) {
		this.product_Sstock = product_Sstock;
	}
	public String getProduct_Mstock() {
		return product_Mstock;
	}
	public void setProduct_Mstock(String product_Mstock) {
		this.product_Mstock = product_Mstock;
	}
	public String getProduct_Lstock() {
		return product_Lstock;
	}
	public void setProduct_Lstock(String product_Lstock) {
		this.product_Lstock = product_Lstock;
	}
	public String getProduct_Fstock() {
		return product_Fstock;
	}
	public void setProduct_Fstock(String product_Fstock) {
		this.product_Fstock = product_Fstock;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	
	
}
