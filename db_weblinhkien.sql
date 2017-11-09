CREATE DATABASE db_weblinhkien;
GO
USE db_weblinhkien;
GO

CREATE TABLE Products(
	id INTEGER PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(100),
	price FLOAT,
	link_main_image TEXT,
	status INT,
	details TEXT,
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
)

CREATE TABLE Images(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	link_sub_image TEXT,
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
)

CREATE TABLE GroupCategories(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	id_category NVARCHAR(255),
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
)

CREATE TABLE Category(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
)

CREATE TABLE Details(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	description TEXT,
	content TEXT,
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
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
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
	
)

CREATE TABLE Orders(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	id_user INT,
	id_product INT NOT NULL,
	status INT,
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
)

CREATE TABLE OrderDetail(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	quantity INT,
	total_money FLOAT,
	payment_method INT,
	is_coupon INT,
	created_at timestamp NULL DEFAULT NULL,
	updated_at timestamp NULL DEFAULT NULL
)

------------------------------------------------
