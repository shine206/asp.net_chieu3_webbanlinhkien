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

INSERT INTO Products (id_product, id_category, name, price, status, promotion, tag, details, description, content, created_at, updated_at) VALUES
(1, 2, 'KB Bosston K803 giả cơ chuyên Game USB Chính Hãng', 250000, 1, NULL, 'boston', 'chi tiết sản phẩm', 'mô tả chi tiết sản phẩm', 'nội dung bài viết', NULL, NULL),
(2, 2, 'KEYBOARD R8 - 1822 LED', 250000, 1, NULL, 'r8', 'chi tiết sản phẩm', 'mô tả chi tiết sản phẩm', 'nội dung bài viết', NULL, NULL),
(3, 1, 'MOUSE R8 - 1658 LED', 50000, 1, NULL, 'r8', 'chi tiết sản phẩm', 'mô tả chi tiết sản phẩm', 'nội dung bài viết', NULL, NULL),
(4, 3, 'USB Kingston 32GB DT100G3 3.0', 199000, 1, NULL, 'kingston', 'chi tiết sản phẩm', 'mô tả chi tiết sản phẩm', 'nội dung bài viết', NULL, NULL),
(5, 4, 'Màn hình LCD Samsung 21.5'' LS22F350FHEXXV', 2600000, 1, NULL, 'sam-sung', 'chi tiết sản phẩm', 'mô tả chi tiết sản phẩm', 'nội dung bài viết', NULL, NULL),
(6, 2, 'KB MOTOSPEED CƠ K81 LED PRO', 1400000, 1, NULL, 'motospeed', 'chi tiết sản phẩm', 'mô tả chi tiết sản phẩm', 'nội dung bài viết', NULL, NULL)

CREATE TABLE Images(
	id_image INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	link_image TEXT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

INSERT INTO Images (id_image, id_product, link_image, created_at, updated_at) VALUES
(1, 6, 'Content\images\kb-motospeed-co-k81-led-pro1461370666.jpg', NULL, NULL),
(2, 2, 'Content\images\keyboard-r8-1822-led1461323688.jpg', NULL, NULL),
(3, 3, 'Content\images\mouse-r8-1658-led1461323899.jpg', NULL, NULL),
(4, 4, 'Content\images\2650_1506504793-4.jpg', NULL, NULL),
(5, 4, 'Content\images\2650_1506504793-1.jpg', NULL, NULL),
(6, 5, 'Content\images\9054_1498896883-1.jpg', NULL, NULL),
(7, 5, 'Content\images\9054_1498896884-4.jpg', NULL, NULL),
(8, 1, 'Content\images\kb-bosston-k803-gia-co-chuyen-game-usb-chinh-hang1478848619.jpg', NULL, NULL)


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
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)
INSERT INTO GroupCategories (id_group_category, name, created_at, updated_at) VALUES
(1, 'USB - THẺ NHỚ', NULL, NULL),
(2, 'Ổ CỨNG', NULL, NULL),
(3, 'THIẾT BỊ MẠNG', NULL, NULL),
(4, 'RAM', NULL, NULL),
(5, 'MÀN HÌNH', NULL, NULL),
(6, 'MAINBOARD', NULL, NULL),
(7, 'LINH KIỆN', NULL, NULL)

CREATE TABLE Category(
	id_category INT PRIMARY KEY IDENTITY NOT NULL,
	id_group_category INT NOT NULL,
	name NVARCHAR(50),
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

INSERT INTO Category (id_category, name, created_at, updated_at) VALUES
(1, 7, 'Chuột', NULL, NULL),
(2, 7, 'Bàn phím', NULL, NULL),
(3, 1, 'USB', NULL, NULL),
(4, 5, 'Màn Hình', NULL, NULL),
(5, 1, 'Thẻ nhớ', NULL, NULL),
(6, 2, 'HDD', NULL, NULL),
(7, 2, 'SSD', NULL, NULL)

CREATE TABLE Admin_Users(
	id_admin_user INT PRIMARY KEY IDENTITY NOT NULL,
	username VARCHAR(20) UNIQUE NOT NULL,
	password varchar(30) NOT NULL,
	fullname NVARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	address TEXT,
	phone_number INT,
	role varchar(255) NOT NULL,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
	
)

INSERT INTO Admin_Users (id_admin_user, username, password, fullname, email, address, phone_number, role, created_at, updated_at) VALUES
(1, 'admin', 'admin', 'Quản trị viên', 'admin@hmail.com', 'Address', 080002222, 'Level max', NULL, NULL),
(2, 'cskh01', '123456', 'Chăm sóc khách hàng', 'cskh01@hmail.com', 'Address', 080002222, 'Level 1', NULL, NULL)

CREATE TABLE Users (
  id_user INT PRIMARY KEY IDENTITY NOT NULL,
  username NVARCHAR(20) UNIQUE NOT NULL,
  password varchar(30) NOT NULL,
  fullname NVARCHAR(50) NOT NULL,
  email varchar(255) UNIQUE NOT NULL,
  address TEXT,
  phone INT,
  created_at DATETIME NULL DEFAULT NULL,
  updated_at DATETIME NULL DEFAULT NULL
)

INSERT INTO Users (id_user, username, password, fullname, email, address, phone, created_at, updated_at) VALUES
(1, 'kh01', '123456', 'Khách hàng 1', 'kh01@hmail.com', 'Address', 123456789, NULL, NULL),
(2, 'kh02', '123456', 'Khách hàng 2', 'kh02@hmail.com', 'Address', 123456789, NULL, NULL)

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

INSERT INTO Orders (id_order, id_order_detail, id_user, status, payment_method, coupon, created_at, updated_at) VALUES
(1, 1, 1, null, NULL, NULL, NULL),
(1, 2, 1, null, NULL, NULL, NULL),
(2, 3, 2, null, NULL, NULL, NULL)

CREATE TABLE OrderDetail(
	id_order_detail INT PRIMARY KEY IDENTITY NOT NULL,
	id_product INT NOT NULL,
	quantity INT,
	current_price FLOAT,
	created_at DATETIME NULL DEFAULT NULL,
	updated_at DATETIME NULL DEFAULT NULL
)

INSERT INTO OrderDetail (id_order_detail, id_product, quantity, current_price, created_at, updated_at) VALUES
(1, 3, 10, 500000, NULL, NULL),
(2, 6, 1, 1400000, NULL, NULL),
(3, 1, 4, 1000000, NULL, NULL)

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