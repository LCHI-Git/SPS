﻿/* 테이블 삭제 */

DROP TABLE IF EXISTS Aboard;
DROP TABLE IF EXISTS OrderList;
DROP TABLE IF EXISTS Qboard;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Product; 



/* 테이블 생성 */
CREATE TABLE Aboard
(
	aboard_idx INT NOT NULL AUTO_INCREMENT,
	aboard_qboard_idx INT NOT NULL,
	aboard_title VARCHAR(20),
	aboard_content VARCHAR(500),
	PRIMARY KEY (aboard_idx)
);


CREATE TABLE CLIENT
(
	client_idx INT NOT NULL AUTO_INCREMENT,
	client_name VARCHAR(20),
	client_id VARCHAR(25),
	client_password VARCHAR(100),
	client_email VARCHAR(40),
	client_birthday VARCHAR(10),
	client_phoneNumber VARCHAR(13),
	client_address VARCHAR(100),
	client_registerDate VARCHAR(10),
	PRIMARY KEY (client_idx)
);


CREATE TABLE OrderList
(
	orderList_idx INT NOT NULL AUTO_INCREMENT,
	orderList_client_idx INT,
	orderList_product_idx INT,
	orderList_Status VARCHAR(20),
	orderList_orderDate VARCHAR(10),
	PRIMARY KEY (orderList_idx)
);


CREATE TABLE Product
(
	product_idx INT NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(100),
	product_price INT,
	product_category INT DEFAULT 0,
	product_registerDate VARCHAR(10),
	product_hit INT DEFAULT 0,
	product_imgPath VARCHAR(100),
	product_stock INT  DEFAULT 0,
	product_info VARCHAR(500),
	PRIMARY KEY (product_idx)
);


CREATE TABLE Qboard
(
	qboard_idx INT NOT NULL AUTO_INCREMENT,
	qboard_client_idx INT,
	qboard_product_idx INT,
	qboard_title VARCHAR(20),
	qboard_content VARCHAR(500),
	PRIMARY KEY (qboard_idx)
);


CREATE TABLE Review
(
	review__idx INT NOT NULL AUTO_INCREMENT,
	review_client_idx INT,
	review_product_idx INT,
	review_title VARCHAR(100),
	review_content VARBINARY(500),
	review_productGrade INT,
	review_writeDate VARCHAR(10),
	review_imgPath VARCHAR(100),
	PRIMARY KEY (review__idx)
);


CREATE TABLE Stock
(
	stock_idx INT NOT NULL AUTO_INCREMENT,
	stock_product_idx INT NOT NULL,
	stock_size VARCHAR(4),
	stock_color VARCHAR(10),
	stock_stock INT DEFAULT 0,
	PRIMARY KEY (stock_idx)
);

/*테이블 인코딩*/
ALTER TABLE Aboard CONVERT TO CHARSET utf8;
ALTER TABLE CLIENT CONVERT TO CHARSET utf8;
ALTER TABLE OrderList CONVERT TO CHARSET utf8;
ALTER TABLE Product CONVERT TO CHARSET utf8;
ALTER TABLE Qboard CONVERT TO CHARSET utf8;
ALTER TABLE Review CONVERT TO CHARSET utf8;
ALTER TABLE Stock CONVERT TO CHARSET utf8;

/* FK 설정 */
ALTER TABLE OrderList
	ADD FOREIGN KEY (orderList_client_idx)
	REFERENCES CLIENT (client_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Qboard
	ADD FOREIGN KEY (qboard_client_idx)
	REFERENCES CLIENT (client_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Review
	ADD FOREIGN KEY (review_client_idx)
	REFERENCES CLIENT (client_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE OrderList
	ADD FOREIGN KEY (orderList_product_idx)
	REFERENCES Product (product_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Qboard
	ADD FOREIGN KEY (qboard_product_idx)
	REFERENCES Product (product_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Review
	ADD FOREIGN KEY (review_product_idx)
	REFERENCES Product (product_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Stock
	ADD FOREIGN KEY (stock_product_idx)
	REFERENCES Product (product_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Aboard
	ADD FOREIGN KEY (aboard_qboard_idx)
	REFERENCES Qboard (qboard_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;
////////////////////////////////////////////////////////////////0505 유정 stock 테이블 수정, email 컬럼 추가
