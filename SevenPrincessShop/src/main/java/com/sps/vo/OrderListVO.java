package com.sps.vo;

import java.sql.Date;

public class OrderListVO {

	private int orderList_idx;
	private int orderList_client_idx;
	private int orderList_product_idx;
	private String orderList_orderStatus;		// 주문?��?��	// boolean => String ?���? �?�?(주문 ?��?��, 배송 �?�?, 배송 �?, 배송 ?���?, 주문 취소 ?��)
	private Date orderList_orderDate;			// 주문 ?���?
	
}
