CREATE DATABASE db_weblinhkien;
GO
USE db_weblinhkien;
GO

/*==========================================================================================*/

--CREATE TABLE

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
	name NVARCHAR(255) NOT NULL,
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
	link_image  TEXT,
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
	phone_number VARCHAR(15),
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
  phone VARCHAR(15),
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

/*===============================================================================================*/

--CONSTRAINT FOREIGN KEY

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

/*================================================================================================*/

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
(1, N'USB 3G - 4G', NULL, NULL),
(2, N'HDD', NULL, NULL),
(2, N'SSD', NULL, NULL),
(2, N'3.5 PC', NULL, NULL),
(2, N'Phụ kiện Ổ cứng', NULL, NULL),
(2, N'Ổ cứng laptop', NULL, NULL),
(3, N'ADSL & ADSL Wireless', NULL, NULL),
(3, N'Network - Network Wireless', NULL, NULL),
(3, N'Hub - Switch', NULL, NULL),
(3, N'Cable mạng', NULL, NULL),
(3, N'Card mạng', NULL, NULL),
(3, N'Khác', NULL, NULL),
(5, N'LCD 17-21 INCH', NULL, NULL),
(5, N'LCD 12-24 INCH', NULL, NULL),
(5, N'LCD 25-32 INCH', NULL, NULL),
(5, N'LCD 33-MAX INCH', NULL, NULL),
(7, N'Quạt tản nhiệt', NULL, NULL)
--Insert table Products
INSERT INTO Products (id_category, name, price, status, promotion, tag, details, description, content, created_at, updated_at) VALUES
(2, N'KB Bosston K803 giả cơ chuyên Game USB Chính Hãng', 250000, 1, NULL, 'boston', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(2, N'KEYBOARD R8 - 1822 LED', 250000, 1, NULL, 'r8', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(7, N'MOUSE R8 - 1658 LED', 50000, 1, NULL, 'r8', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(3, N'USB Kingston 32GB DT100G3 3.0', 199000, 1, NULL, 'kingston', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(5, N'Màn hình LCD Samsung 21.5" LS22F350FHEXXV', 2600000, 1, NULL, 'sam-sung', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(2, N'KB MOTOSPEED CƠ K81 LED PRO', 1400000, 1, NULL, 'motospeed', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(5, N'Màn hình LCD Acer 21.5'' R221Q', 2890000, 1, 15, 'acer', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(5, N'Màn hình LCD Samsung 32'' LC32H711QQEXXV ( Cong )', 13900000, 1, 20, 'sam-sung', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(5, N'Màn hình LCD Philips 23.8''240V5QDSB/74', 2800000, 1, NULL, 'philips', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(5, N'Màn hình LCD Asus 31.5''VA325H', 6000000, 0, NULL, 'asus', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(5, N'Màn hình LCD Asus 21.5'' VZ229HE', 3200000, 1, NULL, 'asus', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Ổ cứng di động/ USB Apacer 8GB AH326', 130000, 1, NULL, 'usb', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Ổ cứng di động/ USB HP 32GB X725', 450000, 1, NULL, 'usb', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Ổ cứng di động/ USB Sandisk 128GB (SDDD3-G46)', 1076000, 1, NULL, 'usb', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Ổ cứng di động/ USB Kingston 32GB DTCNY17', 350000, 0, NULL, 'usb', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Thiết bị mạng ToTo Link 4G MF150', 1450000, 1, NULL, 'usb-4g', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Thiết bị mạng D-link 4G DWR-932C', 1690000, 1, 15, 'usb-4g', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(1, N'Thiết Bị kết nối 3G D-link DWM 156', 495000, 1, NULL, 'usb-3g', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(4, N'Bộ nhớ DDR4 Kingmax 8GB (3000) (Heatsink)', 2420000, 0, NULL, 'ram', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(4, N'Bộ nhớ DDR4 Corsair 16GB (2666)C16 CMK16GX4M2A Ven LPX (2x8GB)', 5100000, 1, 5, 'ram', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(4, N'Bộ nhớ DDR4 Transcend 16GB (2400) (TS2GLH64V4B)', 4300000, 1, NULL, 'ram', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(7, N'Chuột máy tính Logitech Gaming G903', 3700000, 1, NULL, 'chuột', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(7, N'Chuột máy tính Zadez ZM-122', 80000, 1, NULL, 'chuột', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(7, N'Chuột máy tính Ozone 3K', 550000, 1, NULL, 'chuột', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL),
(7, N'Chuột máy tính FL Esports G11', 485000, 0, NULL, 'chuột', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL)
--Insert table Images
INSERT INTO Images (id_product, link_image, created_at, updated_at) VALUES
(6, 'Content\images\kb-motospeed-co-k81-led-pro1461370666.jpg', NULL, NULL),
(2, 'Content\images\keyboard-r8-1822-led1461323688.jpg', NULL, NULL),
(3, 'Content\images\mouse-r8-1658-led1461323899.jpg', NULL, NULL),
(4, 'Content\images\2650_1506504793-4.jpg', NULL, NULL),
(4, 'Content\images\2650_1506504793-1.jpg', NULL, NULL),
(5, 'Content\images\9054_1498896883-1.jpg', NULL, NULL),
(5, 'Content\images\9054_1498896884-4.jpg', NULL, NULL),
(1, 'Content\images\kb-bosston-k803-gia-co-chuyen-game-usb-chinh-hang1478848619.jpg', NULL, NULL),
(7, 'Content\images\13944_1507695775-1.jpg', NULL, NULL),
(7, 'Content\images\14038_1507875994-1.jpg', NULL, NULL),
(7, 'Content\images\14316_1509417121-1.jpg', NULL, NULL),
(1, 'Content\images\14440_1511582690-1.jpg', NULL, NULL),
(1, 'Content\images\13859_1507275922-1.jpg', NULL, NULL),
(1, 'Content\images\10855_1506748225-1.jpg', NULL, NULL),
(1, 'Content\images\12623_1510131195-1.jpg', NULL, NULL),
(1, 'Content\images\9724_1507003685-1.jpg', NULL, NULL),
(1, 'Content\images\1589_1498033976-1.jpg', NULL, NULL),
(1, 'Content\images\10605_1506996898-1.jpg', NULL, NULL),
(1, 'Content\images\2650_1506504793-1.jpg', NULL, NULL),
(5, 'Content\images\9054_1498896883-1.jpg', NULL, NULL),
(5, 'Content\images\14762_1512111397-8.jpg', NULL, NULL),
(5, 'Content\images\14240_1509414233-2.jpg', NULL, NULL),
(5, 'Content\images\14236_1509155974-1.jpg', NULL, NULL),
(5, 'Content\images\14604_1512008288-3.jpg', NULL, NULL)

--Insert table Banners

--Insert table Admin_Users
INSERT INTO Admin_Users (username, password, fullname, email, address, phone_number, role, created_at, updated_at) VALUES
('admin', 'admin', N'Quản trị viên', 'admin@hmail.com', N'Address', '080002222', 'Level max', NULL, NULL),
('cskh01', '123456', N'Chăm sóc khách hàng', 'cskh01@hmail.com', N'Address', '080002222', 'Level 1', NULL, NULL),
('cskh02', '123456', N'Chăm sóc khách hàng', 'cskh02@hmail.com', N'Address', '01639123123', 'Level 1', NULL, NULL)

--Insert table Users
INSERT INTO Users (username, password, fullname, email, address, phone, created_at, updated_at) VALUES
('kh01', '123456', N'Khách hàng 1', 'kh01@hmail.com', N'Address', 123456789, NULL, NULL),
('kh02', '123456', N'Khách hàng 2', 'kh02@hmail.com', N'Address', 123456789, NULL, NULL)

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

--=======================================================================================================

--CODE PROCEDURE

--Insert accounts admin
GO
create proc addNewUserAdmin
	@username varchar(20),
	@password varchar(50),
	@fullname nvarchar(50),
	@email varchar(255),
	@address ntext,
	@phone_number varchar(15),
	@role varchar(255),
	@created_at datetime,
	@updated_at datetime
as
begin
	insert into Admin_Users(username, password, fullname, email, address, phone_number, role, created_at, updated_at)
	values(@username, @password, @fullname, @email, @address, @phone_number, @role, @created_at, @updated_at);
end

--Insert accounts custommer
GO
create procedure addNewUser
	@username varchar(20),
	@password varchar(50),
	@fullname nvarchar(50),
	@email varchar(255),
	@address ntext,
	@phone varchar(15),
	@created_at datetime,
	@updated_at datetime
as
begin
	insert into Users(username, password, fullname, email, address, phone, created_at, updated_at)
	values(@username, @password, @fullname, @email, @address, @phone, @created_at, @updated_at);
end

--Get all accounts admin
GO
CREATE procedure getAllAdminUsers
as
begin
	select 
		id_admin_user as 'ID', 
		username as 'Tài khoản',
		fullname as 'Họ và tên',
		email as 'Email',
		phone_number as 'Số điện thoại',
		role as 'Chức vụ'
	from Admin_Users ;
end

--Get all accounts custommer
GO
CREATE procedure getAllUsers
as
begin
	select 
		id_user as 'ID', 
		username as 'Tài khoản',
		fullname as 'Họ và tên',
		email as 'Email',
		phone as 'Số điện thoại'
	from Users ;
end

--Login By account admin
GO
create procedure loginByUserAdmin
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Admin_Users where username=@username and password=@password	
end

--Login by account custommer
GO
create procedure loginByUser
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Users where username=@username and password=@password	
end

--Get all products
GO
create procedure getAllProducts
as
begin
	select Products.id_product, Category.name as category, Products.name, price, status, promotion, tag, details, description, content 
	from Products, Category
	where Products.id_category=Category.id_category
	order by id_product DESC
end

GO
--Get all categories
create procedure getAllCategories
as
begin
	select id_category,Category.name as category, GroupCategories.name as group_category, GroupCategories.id_group_category as id_group
	from Category, GroupCategories 
	where Category.id_group_category = GroupCategories.id_group_category
end

--Add new product
GO
create procedure addNewProduct
	@id_category int,
	@name nvarchar(100),
	@price float,
	@status int,
	@promotion nvarchar(255),
	@tag nvarchar(255),
	@details ntext,
	@description ntext,
	@content ntext,
	@created_at datetime,
	@updated_at datetime
as
begin
	insert into Products(id_category, name, price, status, promotion, tag, details, description, content, created_at, updated_at)
	values(@id_category, @name, @price, @status, @promotion, @tag, @details, @description, @content, @created_at, @updated_at);
end

go

-- Upload Image by id
create procedure uploadImage
	@id_product int,
	@link_image text,
	@created_at datetime,
	@updated_at datetime
as
begin
	if (@id_product = -1)
		insert into Images (id_product, link_image, created_at, updated_at) values((select MAX(id_product) from Products), @link_image, @created_at, @updated_at);
	else
		insert into Images (id_product, link_image, created_at, updated_at) values(@id_product, @link_image, @created_at, @updated_at);
end

-- Delete product
go
create procedure deleteProduct
	@id int
as
begin
	delete from Images where Images.id_product=@id;
	delete from Products where Products.id_product=@id;
end

go
-- Add new category
create procedure addNewCategory
	@parent int,
	@name nvarchar(50),
	@created_at datetime,
	@updated_at datetime
as
begin
	if (@parent = 0)
		insert into GroupCategories(name, created_at, updated_at) values(@name, @created_at, @updated_at);
	else
		insert into Category(id_category, name, created_at, updated_at) values(@parent, @name, @created_at, @updated_at);
end

-- Get all categories group
go
create procedure getAllGroupCategories
as
begin
	select * from GroupCategories
end

-- Delete category
go
create procedure deleteCategory
	@id int,
	@isRoot int
as
begin
	if (@isRoot = 0)
		delete from GroupCategories where GroupCategories.id_group_category=@id
	else
		delete from Category where Category.id_category=@id
end
go
-- Get Images by id product
create procedure getImagesByIdProduct
	@id_product int
as
begin
	select * from Images where Images.id_product=@id_product; 
end

--Get products in search by name
GO
CREATE procedure getAllProductsInSearch
	@q NVARCHAR(255)
as
begin
	select Products.id_product, Category.name as category, Products.name, price, status, promotion, tag, details, description, content, Images.link_image 
	from Products, Category, Images 
	where Products.id_category=Category.id_category and Products.name like '%'+@q+'%' and Images.id_product=Products.id_product
	order by id_product DESC
end
--Get products filter by price
GO
create procedure getProductsByPrice
	@min_price int,
	@max_price int
as
begin
	select Products.*, Images.link_image
	from Products, Images 
	where Products.price >=@min_price and price <@max_price and Images.id_product=Products.id_product
end

Go
-- Get products filter by group_category
create procedure getProductsByGroupCategory
	@group_category_id int
as
begin
	select Products.*, GroupCategories.name as group_category_name, GroupCategories.id_group_category as group_category_id
	from Products, Category, GroupCategories
	where
		Products.id_category=Category.id_category and
		Category.id_group_category=GroupCategories.id_group_category and
		GroupCategories.id_group_category=@group_category_id
end
Go
-- Get products filter by category
create procedure getProductsByCategory
	@category_id int
as
begin
	select Products.*, GroupCategories.name as group_category_name, GroupCategories.id_group_category as group_category_id
	from Products, Category, GroupCategories
	where
		Products.id_category=Category.id_category and
		Category.id_group_category=GroupCategories.id_group_category and
		Category.id_category=@category_id
end
Go
-- Get products filter by category and Group
create procedure getProductsByCategoryAndGroup
	@category_id int,
	@group_category_id int
as
begin
	select Products.*, GroupCategories.name as group_category_name, GroupCategories.id_group_category as group_category_id
	from Products, Category, GroupCategories
	where
		Products.id_category=Category.id_category and
		Category.id_group_category=GroupCategories.id_group_category and
		Category.id_category=@category_id and
		GroupCategories.id_group_category=@group_category_id
end

go
-- Get product by id
create procedure getProductById
	@id_product int
as
begin
	select * from Products where id_product = @id_product
end

go
-- delete Image by id
create procedure deleteImageById
	@id_image int
as
begin
	delete from Images where id_image=@id_image
end
-- select * from Images

go
-- update product
create procedure updateProduct
	@id_product int,
	@id_category int,
	@name nvarchar(255),
	@price float,
	@status int,
	@promotion varchar(255),
	@tags varchar(255),
	@details text,
	@description text,
	@content text,
	@updated_at datetime
as
begin
	update Products 
	set id_category=@id_category, name=@name, price=@price, status=@status, promotion=@promotion, tag=@tags, details=@details, description=@description, content=@content, updated_at=@updated_at
	where id_product=@id_product;
end

go
-- get all products have promotion
create procedure getAllPromotionProducts
as
begin
	select * from Products where promotion != NULL or promotion != '';
end

--select * from Images

go
-- get related products
create procedure getRelatedProducts
	@id_product int
as
begin
	select * from Products where (select id_category from Products where id_product=@id_product)=id_category
end
go
-- get category by id_category

create procedure getCategoryById
	@id_category int
as
begin
	select * from Category where id_category=@id_category
end

go
-- update category
create procedure updateCategory
	@id_category int,
	@id_group int,
	@name nvarchar(50),
	@updated_at datetime
as
begin
	update Category set id_group_category=@id_group, name=@name, updated_at=@updated_at where id_category=@id_category
end