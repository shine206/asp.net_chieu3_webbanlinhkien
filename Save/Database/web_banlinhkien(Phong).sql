USE [master]
GO
/****** Object:  Database [db_weblinhkien]    Script Date: 11/26/2017 02:22:40 ******/
CREATE DATABASE [db_weblinhkien] ON  PRIMARY 
( NAME = N'db_weblinhkien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\db_weblinhkien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_weblinhkien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\db_weblinhkien_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_weblinhkien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_weblinhkien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_weblinhkien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_weblinhkien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_weblinhkien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_weblinhkien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_weblinhkien] SET ARITHABORT OFF
GO
ALTER DATABASE [db_weblinhkien] SET AUTO_CLOSE ON
GO
ALTER DATABASE [db_weblinhkien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_weblinhkien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [db_weblinhkien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_weblinhkien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_weblinhkien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_weblinhkien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_weblinhkien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_weblinhkien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_weblinhkien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_weblinhkien] SET  ENABLE_BROKER
GO
ALTER DATABASE [db_weblinhkien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_weblinhkien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_weblinhkien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_weblinhkien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_weblinhkien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_weblinhkien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_weblinhkien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [db_weblinhkien] SET  READ_WRITE
GO
ALTER DATABASE [db_weblinhkien] SET RECOVERY SIMPLE
GO
ALTER DATABASE [db_weblinhkien] SET  MULTI_USER
GO
ALTER DATABASE [db_weblinhkien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_weblinhkien] SET DB_CHAINING OFF
GO
USE [db_weblinhkien]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/26/2017 02:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [text] NULL,
	[phone] [text] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/26/2017 02:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id_category] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 11/26/2017 02:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[id_banner] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[url] [text] NOT NULL,
	[url_banner] [text] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_banner] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin_Users]    Script Date: 11/26/2017 02:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin_Users](
	[id_admin_user] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [text] NULL,
	[phone] [text] NULL,
	[role] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_admin_user] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[addNewUserAdmin]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addNewUserAdmin]
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
GO
/****** Object:  StoredProcedure [dbo].[addNewUser]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addNewUser]
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
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[id_category] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NULL,
	[status] [int] NULL,
	[promotion] [varchar](255) NULL,
	[tag] [varchar](255) NULL,
	[details] [text] NULL,
	[description] [text] NULL,
	[content] [text] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupCategories]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupCategories](
	[id_group_category] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_group_category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getAllUsers]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllUsers]
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
GO
/****** Object:  StoredProcedure [dbo].[getAllAdminUsers]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllAdminUsers]
as
begin
	select 
		id_admin_user as 'ID', 
		username as 'Tài khoản',
		fullname as 'Họ và tên',
		email as 'Email',
		phone as 'Số điện thoại',
		role as 'Chức vụ'
	from Admin_Users ;
end
GO
/****** Object:  StoredProcedure [dbo].[loginByUserAdmin]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[loginByUserAdmin]
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Admin_Users where username=@username and password=@password	
end
GO
/****** Object:  StoredProcedure [dbo].[loginByUser]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[loginByUser]
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Admin_Users where username=@username and password=@password	
end
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id_order_detail] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NULL,
	[current_price] [float] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_order_detail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id_image] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[link_image] [text] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_image] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/26/2017 02:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[id_order] [int] NOT NULL,
	[id_order_detail] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[status] [int] NULL,
	[payment_method] [int] NULL,
	[coupon] [varchar](6) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_order] ASC,
	[id_order_detail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__Users__created_a__2F10007B]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Users__updated_a__300424B4]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__Category__create__182C9B23]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Category] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Category__update__1920BF5C]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Category] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__Banners__created__0CBAE877]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Banners] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Banners__updated__0DAF0CB0]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Banners] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__Admin_Use__creat__239E4DCF]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Admin_Users] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Admin_Use__updat__24927208]    Script Date: 11/26/2017 02:22:41 ******/
ALTER TABLE [dbo].[Admin_Users] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__Products__create__014935CB]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Products] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Products__update__023D5A04]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Products] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__GroupCate__creat__1273C1CD]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[GroupCategories] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__GroupCate__updat__1367E606]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[GroupCategories] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__OrderDeta__creat__3A81B327]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__OrderDeta__updat__3B75D760]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__Images__created___07020F21]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Images] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Images__updated___07F6335A]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Images] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  Default [DF__Orders__created___34C8D9D1]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [created_at]
GO
/****** Object:  Default [DF__Orders__updated___35BCFE0A]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [updated_at]
GO
/****** Object:  ForeignKey [fk_product_category_id]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_category_id] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id_category])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_category_id]
GO
/****** Object:  ForeignKey [fk_category_id]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[GroupCategories]  WITH CHECK ADD  CONSTRAINT [fk_category_id] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id_category])
GO
ALTER TABLE [dbo].[GroupCategories] CHECK CONSTRAINT [fk_category_id]
GO
/****** Object:  ForeignKey [fk_product_id]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_product_id] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id_product])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_product_id]
GO
/****** Object:  ForeignKey [fk_image_id]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [fk_image_id] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id_product])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [fk_image_id]
GO
/****** Object:  ForeignKey [fk_order_detail_id]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_id] FOREIGN KEY([id_order_detail])
REFERENCES [dbo].[OrderDetail] ([id_order_detail])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_order_detail_id]
GO
/****** Object:  ForeignKey [fk_orders_user_id]    Script Date: 11/26/2017 02:22:42 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_user_id] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_orders_user_id]
GO
