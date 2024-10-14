CREATE DATABASE CULTIVATRADE;
GO

USE CULTIVATRADE;
GO

CREATE TABLE ADMIN (
    ADMIN_ID INT IDENTITY(1,1) PRIMARY KEY,
    ADMIN_USERNAME VARCHAR(50) NOT NULL,
    ADMIN_PASS VARCHAR(50) NOT NULL
);

CREATE TABLE BUYER (
    BUYER_ID INT IDENTITY(1,1) PRIMARY KEY,
    BUYER_FIRSTNAME VARCHAR(50) NOT NULL,
    BUYER_LASTNAME VARCHAR(50) NOT NULL,
    BUYER_NAME AS (BUYER_FIRSTNAME + ' ' + BUYER_LASTNAME),
    BUYER_CONTACTNO INT NOT NULL,
    BUYER_EMAIL VARCHAR(50) NOT NULL,
    BUYER_STREET VARCHAR(50) NOT NULL,
    BUYER_CITY VARCHAR(50) NOT NULL,
    BUYER_ZIP INT NOT NULL,
    BUYER_DATE_CREATED DATETIME DEFAULT GETDATE() NOT NULL,
    BUYER_DATE_UPDATE DATETIME DEFAULT GETDATE() NOT NULL
);

CREATE TABLE SELLER (
    SELLER_ID INT IDENTITY(1,1) PRIMARY KEY,
    ADMIN_ID INT NOT NULL,
    SELLER_FIRSTNAME VARCHAR(50) NOT NULL,
    SELLER_LASTNAME VARCHAR(50) NOT NULL,
    SELLER_NAME AS (SELLER_FIRSTNAME + ' ' + SELLER_LASTNAME),
    SELLER_CONTACTNO INT NOT NULL,
    SELLER_EMAIL VARCHAR(50) NOT NULL,
    SELLER_DATE_CREATED DATETIME DEFAULT GETDATE() NOT NULL,
    SELLER_DATE_UPDATE DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
);

ALTER TABLE SELLER
ADD BUSINESS_PERMITNO INT NOT NULL

ALTER TABLE SELLER
ADD BUSINESS_PERMIT_IMG VARCHAR(MAX) NOT NULL

ALTER TABLE SELLER
ADD SANITARY_PERMIT_IMG VARCHAR(MAX) NOT NULL


CREATE TABLE CART (
    CART_ID INT IDENTITY(1,1) PRIMARY KEY,
    PRODUCT_ID INT NOT NULL,
    BUYER_ID INT NOT NULL,
    PRODUCT_QUANTITY INT NOT NULL,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    PRODUCT_PRICE MONEY NOT NULL,
    PRODUCT_TOTALPRICE MONEY NOT NULL,
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
    FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID)
);

CREATE TABLE FEEDBACK (
    FEEDBACK_ID INT IDENTITY(1,1) PRIMARY KEY,
    BUYER_ID INT NOT NULL,
    ORDER_ID INT NOT NULL,
    RATING VARCHAR(50) NOT NULL,
    FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);

CREATE TABLE DELIVERY (
    DELIVER_ID INT IDENTITY(1,1) PRIMARY KEY,
    BUYER_ID INT NOT NULL,
    ORDER_ID INT NOT NULL,
    DELIVER_STATUS VARCHAR(25) NOT NULL,
    DELIVER_OPTION VARCHAR(25) NOT NULL,
    DELIVER_TIME DATETIME NOT NULL,
    BUYER_STREET VARCHAR(50) NOT NULL,
    BUYER_CITY VARCHAR(50) NOT NULL,
    BUYER_ZIP VARCHAR(50) NOT NULL,
    BUYER_CONTACTNO INT NOT NULL,
    BUYER_EMAIL VARCHAR(50) NOT NULL,
    FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID)
);
ALTER TABLE DELIVERY 
ADD CONSTRAINT FK_DELIVERY_ORDER
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID);

CREATE TABLE ORDERS (
    ORDER_ID INT IDENTITY(1,1) PRIMARY KEY,
    BUYER_ID INT NOT NULL,
    SELLER_ID INT NOT NULL,
    PRODUCT_ID INT NOT NULL,
    DELIVERY_ID INT NOT NULL,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    ORDER_DATE DATETIME NOT NULL,
    ORDER_STATUS VARCHAR(50) NOT NULL,
    ORDER_DATE_RECEIVED DATETIME NOT NULL,
    FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID),
    FOREIGN KEY (SELLER_ID) REFERENCES SELLER(SELLER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
    FOREIGN KEY (DELIVERY_ID) REFERENCES DELIVERY(DELIVER_ID)
);

CREATE TABLE PAYMENT (
    PAYMENT_ID INT IDENTITY(1,1) PRIMARY KEY,
    BUYER_ID INT NOT NULL,
    ORDER_ID INT NOT NULL,
    SELLER_ID INT NOT NULL,
    PAYMENT_DATE DATETIME NOT NULL,
    PAYMENT_METHOD VARCHAR(50) NOT NULL,
    PAYMENT_AMOUNT DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (SELLER_ID) REFERENCES SELLER(SELLER_ID)
);

CREATE TABLE PRODUCT (
    PRODUCT_ID INT IDENTITY(1,1) PRIMARY KEY,
    SELLER_ID INT NOT NULL,
    ADMIN_ID INT NOT NULL,
	CATEGORY_ID INT NOT NULL,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    PRODUCT_DESCRIPTION VARCHAR(100) NOT NULL,
    PRODUCT_PRICE MONEY NOT NULL,
    PRODUCT_IMG VARCHAR(MAX) NOT NULL,
    PRODUCT_QUANTITY INT NOT NULL,
    PRODUCT_EXPIRYDATE DATETIME NOT NULL,
    FOREIGN KEY (SELLER_ID) REFERENCES SELLER(SELLER_ID),
    FOREIGN KEY (ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
);

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_PRODUCT_CATEGORY
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID);

CREATE TABLE CATEGORY (
    CATEGORY_ID INT IDENTITY(1,1) PRIMARY KEY,
    CATEGORY_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE NOTIFICATION (
    NOTIF_ID INT IDENTITY(1,1) PRIMARY KEY,
    BUYER_ID INT NOT NULL,
    SELLER_ID INT NOT NULL,
    NOTIF_MESSAGE VARCHAR(100) NOT NULL,
    NOTIF_DATE DATETIME NOT NULL,
    FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID),
    FOREIGN KEY (SELLER_ID) REFERENCES SELLER(SELLER_ID)
);

CREATE TABLE ORDER_DETAILS (
    ORDER_ID INT NOT NULL,	
    PRODUCT_ID INT NOT NULL,  
    QUANTITY INT NOT NULL,
    UNIT_PRICE MONEY NOT NULL,
    TOTAL_PRICE AS (QUANTITY * UNIT_PRICE),
	PRIMARY KEY (PRODUCT_ID, ORDER_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
);

CREATE TABLE BOOSTED_PRODUCT(
	BOOSTED_ID INT IDENTITY(1,1) PRIMARY KEY,
	PRODUCT_ID INT NOT NULL,
	BOOST_COST MONEY NOT NULL,
	BOOST_START_DATE DATETIME DEFAULT GETDATE() NOT NULL,
	BOOST_END_DATE DATETIME DEFAULT GETDATE() NOT NULL,
	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
	);