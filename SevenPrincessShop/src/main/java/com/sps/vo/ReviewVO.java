package com.sps.vo;

import java.util.Date;

public class ReviewVO {

	private int review_idx; 				// ?��?��?�� fk?��?�� idx�? 3개�? ?��?���?
	private int review_client_idx;			// 고객 idx
	private int review_product_idx;			// ?��?�� idx
	private String review_title;			// 리뷰 ?���?
	private String review_content;			// 리뷰 ?��?��
	private int review_productGrade;		// 리뷰 별점	// String => int�? �?�?
//	private String review_client_id;		// 리뷰?�� ?��?�� ?��?��?�� - ?��?�� ?��?��?��?�� ?��브쿼리로 불러?�� ?�� ?��?��?�� ?��?��?�� ?��?��... 
	private Date review_writeDate;			// 리뷰 ?���?
	private String review_imgPath;			// ?��?�� ?��미�? 경로
	
}
