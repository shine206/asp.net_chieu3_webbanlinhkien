CREATE DATABASE db_weblinhkien;
GO
USE db_weblinhkien;
GO

CREATE TABLE Products(
	id INTEGER PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(100),
	price FLOAT,
	status INT,
	details TEXT,
	description TEXT,
	content TEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Images(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT,
	link_image TEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE GroupCategories(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	id_category INT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Category(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Users(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	username VARCHAR(20) NOT NULL,
	password varchar(255) NOT NULL,
	fullname NVARCHAR(50),
	email VARCHAR(255),
	address TEXT,
	phone_number INT,
	level varchar(255) NOT NULL,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
	
)

CREATE TABLE Orders(
	id INT NOT NULL,
	id_order_detail INT NOT NULL,
	id_user INT,
	status INT,
	payment_method INT,
	coupon VARCHAR(6),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (id, id_order_detail)
)

CREATE TABLE OrderDetail(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	quantity INT,
	current_price FLOAT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

------------------------------------------------
--Ràng buộc khóa ngoại

ALTER TABLE Orders
	add constraint fk_orders_user_id FOREIGN KEY (id_user) REFERENCES Users(id)

ALTER TABLE OrderDetail
	add constraint fk_product_id FOREIGN KEY (id_product) REFERENCES Products(id)
	
ALTER TABLE GroupCategories
	add constraint fk_category_id FOREIGN KEY (id_category) REFERENCES Category(id)