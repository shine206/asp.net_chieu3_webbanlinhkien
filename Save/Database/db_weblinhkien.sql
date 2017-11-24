CREATE DATABASE db_weblinhkien;
GO
USE db_weblinhkien;
GO

CREATE TABLE Products(
	id_product INTEGER PRIMARY KEY IDENTITY NOT NULL,
	id_category INT NOT NULL,
	name NVARCHAR(100) NOT NULL,
	price FLOAT,
	status INT,
	promotion VARCHAR(255),
	tag VARCHAR(255),
	details TEXT,
	description TEXT,
	content TEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Images(
	id_image INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	link_image TEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Banners (
  id_banner INT PRIMARY KEY IDENTITY NOT NULL,
  name NVARCHAR(255) NOT NULL,
  url TEXT NOT NULL,
  url_banner TEXT NOT NULL,
  created_at DATETIME NULL DEFAULT NULL,
  updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE GroupCategories(
	id_group_category INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	id_category INT NOT NULL,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Category(
	id_category INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Admin_Users(
	id_admin_user INT PRIMARY KEY IDENTITY NOT NULL,
	username VARCHAR(20) UNIQUE NOT NULL,
	password varchar(50) NOT NULL,
	fullname NVARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	address TEXT,
	phone TEXT,
	role varchar(255) NOT NULL,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
	
)

CREATE TABLE Users (
  id_user INT PRIMARY KEY IDENTITY NOT NULL,
  username NVARCHAR(20) UNIQUE NOT NULL,
  password varchar(50) NOT NULL,
  fullname NVARCHAR(50) NOT NULL,
  email varchar(255) UNIQUE NOT NULL,
  address TEXT,
  phone TEXT,
  created_at DATETIME NULL DEFAULT NULL,
  updated_at DATETIME NULL DEFAULT NULL
)



CREATE TABLE Orders(
	id_order INT NOT NULL,
	id_order_detail INT NOT NULL,
	id_user INT NOT NULL,
	status INT,
	payment_method INT,
	coupon VARCHAR(6),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (id_order, id_order_detail)
)

CREATE TABLE OrderDetail(
	id_order_detail INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	quantity INT,
	current_price FLOAT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)
--drop database db_weblinhkien;
------------------------------------------------
--Ràng buộc khóa ngoại

ALTER TABLE Orders
	add constraint fk_orders_user_id FOREIGN KEY (id_user) REFERENCES Users(id_user)

ALTER TABLE Orders
	add constraint fk_order_detail_id FOREIGN KEY (id_order_detail) REFERENCES OrderDetail(id_order_detail)

ALTER TABLE OrderDetail
	add constraint fk_product_id FOREIGN KEY (id_product) REFERENCES Products(id_product)
	
ALTER TABLE GroupCategories
	add constraint fk_category_id FOREIGN KEY (id_category) REFERENCES Category(id_category)
	
ALTER TABLE Images
	add constraint fk_image_id FOREIGN KEY (id_product) REFERENCES Products(id_product)
	
ALTER TABLE	Products
	add constraint fk_product_category_id FOREIGN KEY (id_category) REFERENCES Category(id_category)

create procedure loginByUserAdmin
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Admin_Users where username=@username and password=@password	
end

create procedure loginByUser
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Users where username=@username and password=@password	
end

create procedure addNewUserAdmin
	@username varchar(20),
	@password varchar(50),
	@fullname nvarchar(50),
	@email varchar(255),
	@address text,
	@phone text,
	@role varchar(255),
	@created_at datetime,
	@updated_at datetime
as
begin
	insert into Admin_Users(username, password, fullname, email, address, phone, role, created_at, updated_at)
	values(@username, @password, @fullname, @email, @address, @phone, @role, @created_at, @updated_at);
end

create procedure addNewUser
	@username varchar(20),
	@password varchar(50),
	@fullname nvarchar(50),
	@email varchar(255),
	@address text,
	@phone text,
	@created_at datetime,
	@updated_at datetime
as
begin
	insert into Admin_Users(username, password, fullname, email, address, phone, created_at, updated_at)
	values(@username, @password, @fullname, @email, @address, @phone, @created_at, @updated_at);
end


--exec loginByUser 'admin', '21232f297a57a5a743894a0e4a801fc3'