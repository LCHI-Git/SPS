package com.sps.vo;

import java.util.Date;

public class ReviewVO {

	private int review_idx; 				// ??? fk?¬? idxκ°? 3κ°κ? ?€?΄κ°?
	private int review_client_idx;			// κ³ κ° idx
	private int review_product_idx;			// ?? idx
	private String review_title;			// λ¦¬λ·° ? λͺ?
	private String review_content;			// λ¦¬λ·° ?΄?©
	private int review_productGrade;		// λ¦¬λ·° λ³μ 	// String => intλ‘? λ³?κ²?
//	private String review_client_id;		// λ¦¬λ·°? ?? ??΄? - ?? ??΄?? ?λΈμΏΌλ¦¬λ‘ λΆλ¬?¬ ? ??΄? ??΄? ? ?―... 
	private Date review_writeDate;			// λ¦¬λ·° ? μ§?
	private String review_imgPath;			// ?? ?΄λ―Έμ? κ²½λ‘
	
}
