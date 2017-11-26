CREATE DATABASE db_weblinhkien;
GO
USE db_weblinhkien;
GO

CREATE TABLE GroupCategories(
	id_group_category INT PRIMARY KEY IDENTITY NOT NULL,
	name NVARCHAR(50),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Category(
	id_category INT PRIMARY KEY IDENTITY NOT NULL,
	id_group_category INT NOT NULL,
	name NVARCHAR(50),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Products(
	id_product INTEGER PRIMARY KEY IDENTITY NOT NULL,
	id_category INT NOT NULL,
	name NVARCHAR(100) NOT NULL,
	price FLOAT,
	status INT,
	promotion VARCHAR(255),
	tag VARCHAR(255),
	details  NTEXT,
	description  NTEXT,
	content  NTEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Images(
	id_image INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	link_image  NTEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Banners (
  id_banner INT PRIMARY KEY IDENTITY NOT NULL,
  name NVARCHAR(255) NOT NULL,
  url  NTEXT NOT NULL,
  url_banner  NTEXT NOT NULL,
  created_at DATETIME NULL DEFAULT NULL,
  updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE Admin_Users(
	id_admin_user INT PRIMARY KEY IDENTITY NOT NULL,
	username VARCHAR(20) UNIQUE NOT NULL,
	password varchar(30) NOT NULL,
	fullname NVARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	address  NTEXT,
	phone_number INT,
	role varchar(255) NOT NULL,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
	
)

CREATE TABLE Users (
  id_user INT PRIMARY KEY IDENTITY NOT NULL,
  username NVARCHAR(20) UNIQUE NOT NULL,
  password varchar(30) NOT NULL,
  fullname NVARCHAR(50) NOT NULL,
  email varchar(255) UNIQUE NOT NULL,
  address  NTEXT,
  phone INT,
  created_at DATETIME NULL DEFAULT NULL,
  updated_at DATETIME NULL DEFAULT NULL
)

CREATE TABLE OrderDetail(
	id_order_detail INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	quantity INT,
	current_price FLOAT,
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

--drop database db_weblinhkien;
------------------------------------------------
--Ràng buộc khóa ngoại

ALTER TABLE Orders
	add constraint fk_orders_user_id FOREIGN KEY (id_user) REFERENCES Users(id_user)

ALTER TABLE Orders
	add constraint fk_order_detail_id FOREIGN KEY (id_order_detail) REFERENCES OrderDetail(id_order_detail)

ALTER TABLE OrderDetail
	add constraint fk_product_id FOREIGN KEY (id_product) REFERENCES Products(id_product)
	
ALTER TABLE Category
	add constraint fk_group_category_id FOREIGN KEY (id_group_category) REFERENCES GroupCategories(id_group_category)
	
ALTER TABLE Images
	add constraint fk_image_id FOREIGN KEY (id_product) REFERENCES Products(id_product)
	
ALTER TABLE	Products
	add constraint fk_product_category_id FOREIGN KEY (id_category) REFERENCES Category(id_category)

--Insert table Groupcategories
INSERT INTO GroupCategories (name, created_at, updated_at) VALUES
(N'USB - THẺ NHỚ', NULL, NULL),
(N'Ổ CỨNG', NULL, NULL),
(N'THIẾT BỊ MẠNG', NULL, NULL),
(N'RAM', NULL, NULL),
(N'MÀN HÌNH', NULL, NULL),
(N'MAINBOARD', NULL, NULL),
(N'LINH KIỆN', NULL, NULL)

--Insert table Category
INSERT INTO Category (id_group_category, name, created_at, updated_at) VALUES
(7, N'Chuột', NULL, NULL),
(7, N'Bàn phím', NULL, NULL),
(1, N'USB', NULL, NULL),
(5, N'Màn Hình', NULL, NULL),
(1, N'Thẻ nhớ', NULL, NULL),
(2, N'HDD', NULL, NULL),
(2, N'SSD', NULL, NULL)

--Insert table Products
INSERT INTO Products (id_category, name, price, status, promotion, tag, details, description, content, created_at, updated_at) VALUES
(2, N'KB Bosston K803 giả cơ chuyên Game USB Chính Hãng', 250000, 1, NULL, 'boston', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(2, N'KEYBOARD R8 - 1822 LED', 250000, 1, NULL, 'r8', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'MOUSE R8 - 1658 LED', 50000, 1, NULL, 'r8', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(3, N'USB Kingston 32GB DT100G3 3.0', 199000, 1, NULL, 'kingston', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(4, N'Màn hình LCD Samsung 21.5" LS22F350FHEXXV', 2600000, 1, NULL, 'sam-sung', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(2, N'KB MOTOSPEED CƠ K81 LED PRO', 1400000, 1, NULL, 'motospeed', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL)

--Insert table Images
INSERT INTO Images (id_product, link_image, created_at, updated_at) VALUES
(6, N'Content\images\kb-motospeed-co-k81-led-pro1461370666.jpg', NULL, NULL),
(2, N'Content\images\keyboard-r8-1822-led1461323688.jpg', NULL, NULL),
(3, N'Content\images\mouse-r8-1658-led1461323899.jpg', NULL, NULL),
(4, N'Content\images\2650_1506504793-4.jpg', NULL, NULL),
(4, N'Content\images\2650_1506504793-1.jpg', NULL, NULL),
(5, N'Content\images\9054_1498896883-1.jpg', NULL, NULL),
(5, N'Content\images\9054_1498896884-4.jpg', NULL, NULL),
(1, N'Content\images\kb-bosston-k803-gia-co-chuyen-game-usb-chinh-hang1478848619.jpg', NULL, NULL)

--Insert table Banners

--Insert table Admin_Users
INSERT INTO Admin_Users (username, password, fullname, email, address, phone_number, role, created_at, updated_at) VALUES
('admin', 'admin', N'Quản trị viên', N'admin@hmail.com', N'Address', 080002222, N'Level max', NULL, NULL),
('cskh01', '123456', N'Chăm sóc khách hàng', N'cskh01@hmail.com', N'Address', 080002222, N'Level 1', NULL, NULL)

--Insert table Users
INSERT INTO Users (username, password, fullname, email, address, phone, created_at, updated_at) VALUES
('kh01', '123456', N'Khách hàng 1', N'kh01@hmail.com', N'Address', 123456789, NULL, NULL),
('kh02', '123456', N'Khách hàng 2', N'kh02@hmail.com', N'Address', 123456789, NULL, NULL)

--Insert table OrderDetail
INSERT INTO OrderDetail (id_product, quantity, current_price, created_at, updated_at) VALUES
(3, 10, 500000, NULL, NULL),
(6, 1, 1400000, NULL, NULL),
(1, 4, 1000000, NULL, NULL)

--Insert table Orders
INSERT INTO Orders (id_order, id_order_detail, id_user, status, payment_method, coupon, created_at, updated_at) VALUES
(1, 1, 1, null, NULL, NULL, NULL, null),
(1, 2, 1, null, NULL, NULL, NULL, null),
(2, 3, 2, null, NULL, NULL, NULL, null)

select * from Images;
select * from Admin_Users;
select * from Banners;
select * from Category;
select * from GroupCategories;
select * from Products;
select * from Users;
select * from OrderDetail;
select * from Orders;