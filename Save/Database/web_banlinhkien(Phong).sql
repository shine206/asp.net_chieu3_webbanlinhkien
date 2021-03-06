USE [master]
GO
/****** Object:  Database [db_weblinhkien]    Script Date: 12/14/2017 11:05:53 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'db_weblinhkien')
BEGIN
CREATE DATABASE [db_weblinhkien] ON  PRIMARY 
( NAME = N'db_weblinhkien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\db_weblinhkien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_weblinhkien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\db_weblinhkien_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
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
ALTER DATABASE [db_weblinhkien] SET AUTO_CLOSE OFF
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
ALTER DATABASE [db_weblinhkien] SET RECOVERY FULL
GO
ALTER DATABASE [db_weblinhkien] SET  MULTI_USER
GO
ALTER DATABASE [db_weblinhkien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_weblinhkien] SET DB_CHAINING OFF
GO
USE [db_weblinhkien]
GO
/****** Object:  ForeignKey [fk_group_category_id]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_group_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [fk_group_category_id]
GO
/****** Object:  ForeignKey [fk_product_category_id]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_product_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [fk_product_category_id]
GO
/****** Object:  ForeignKey [fk_image_id]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_image_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Images]'))
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [fk_image_id]
GO
/****** Object:  StoredProcedure [dbo].[deleteImageById]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteImageById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteImageById]
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteProduct]
GO
/****** Object:  StoredProcedure [dbo].[getAllProductsInSearch]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllProductsInSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllProductsInSearch]
GO
/****** Object:  StoredProcedure [dbo].[getProductsByPrice]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByPrice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProductsByPrice]
GO
/****** Object:  StoredProcedure [dbo].[getImagesByIdProduct]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getImagesByIdProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getImagesByIdProduct]
GO
/****** Object:  StoredProcedure [dbo].[uploadImage]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uploadImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uploadImage]
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[updateProduct]
GO
/****** Object:  StoredProcedure [dbo].[getRelatedProducts]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getRelatedProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getRelatedProducts]
GO
/****** Object:  StoredProcedure [dbo].[getAllPromotionProducts]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllPromotionProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllPromotionProducts]
GO
/****** Object:  StoredProcedure [dbo].[getAllProducts]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllProducts]
GO
/****** Object:  StoredProcedure [dbo].[getOrderDetailByIdOrder]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getOrderDetailByIdOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getOrderDetailByIdOrder]
GO
/****** Object:  StoredProcedure [dbo].[getProductById]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProductById]
GO
/****** Object:  StoredProcedure [dbo].[getProductsByCategory]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProductsByCategory]
GO
/****** Object:  StoredProcedure [dbo].[getProductsByCategoryAndGroup]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByCategoryAndGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProductsByCategoryAndGroup]
GO
/****** Object:  StoredProcedure [dbo].[getProductsByGroupCategory]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByGroupCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProductsByGroupCategory]
GO
/****** Object:  StoredProcedure [dbo].[addNewProduct]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addNewProduct]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_image_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Images]'))
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [fk_image_id]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Images__created___4E88ABD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [DF__Images__created___4E88ABD4]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Images__updated___4F7CD00D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [DF__Images__updated___4F7CD00D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Images]') AND type in (N'U'))
DROP TABLE [dbo].[Images]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_product_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [fk_product_category_id]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Products__create__4CA06362]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [DF__Products__create__4CA06362]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Products__update__4D94879B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [DF__Products__update__4D94879B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  StoredProcedure [dbo].[updateCategory]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[updateCategory]
GO
/****** Object:  StoredProcedure [dbo].[deleteCategory]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteCategory]
GO
/****** Object:  StoredProcedure [dbo].[getAllCategories]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllCategories]
GO
/****** Object:  StoredProcedure [dbo].[addNewCategory]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addNewCategory]
GO
/****** Object:  StoredProcedure [dbo].[getCategoryById]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getCategoryById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getCategoryById]
GO
/****** Object:  StoredProcedure [dbo].[getInfoUserById]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getInfoUserById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getInfoUserById]
GO
/****** Object:  StoredProcedure [dbo].[addNewOrder]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addNewOrder]
GO
/****** Object:  StoredProcedure [dbo].[deleteOrder]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteOrder]
GO
/****** Object:  StoredProcedure [dbo].[getAllGroupCategories]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllGroupCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllGroupCategories]
GO
/****** Object:  StoredProcedure [dbo].[getAllOrders]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllOrders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllOrders]
GO
/****** Object:  StoredProcedure [dbo].[getAllAdminUsers]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllAdminUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllAdminUsers]
GO
/****** Object:  StoredProcedure [dbo].[getAllUsers]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[addNewUser]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addNewUser]
GO
/****** Object:  StoredProcedure [dbo].[addNewUserAdmin]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewUserAdmin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addNewUserAdmin]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/14/2017 11:05:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_group_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [fk_group_category_id]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Category__create__4AB81AF0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF__Category__create__4AB81AF0]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Category__update__4BAC3F29]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF__Category__update__4BAC3F29]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  StoredProcedure [dbo].[confirmOrder]    Script Date: 12/14/2017 11:05:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[confirmOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[confirmOrder]
GO
/****** Object:  StoredProcedure [dbo].[loginByUser]    Script Date: 12/14/2017 11:05:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loginByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[loginByUser]
GO
/****** Object:  StoredProcedure [dbo].[loginByUserAdmin]    Script Date: 12/14/2017 11:05:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loginByUserAdmin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[loginByUserAdmin]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/14/2017 11:05:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__OrderDeta__creat__628FA481]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [DF__OrderDeta__creat__628FA481]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__OrderDeta__updat__6383C8BA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [DF__OrderDeta__updat__6383C8BA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/14/2017 11:05:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Orders__created___68487DD7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF__Orders__created___68487DD7]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Orders__updated___693CA210]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF__Orders__updated___693CA210]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[Admin_Users]    Script Date: 12/14/2017 11:05:55 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Admin_Use__creat__48CFD27E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Admin_Users] DROP CONSTRAINT [DF__Admin_Use__creat__48CFD27E]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Admin_Use__updat__49C3F6B7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Admin_Users] DROP CONSTRAINT [DF__Admin_Use__updat__49C3F6B7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin_Users]') AND type in (N'U'))
DROP TABLE [dbo].[Admin_Users]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 12/14/2017 11:05:54 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Banners__created__46E78A0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banners] DROP CONSTRAINT [DF__Banners__created__46E78A0C]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Banners__updated__47DBAE45]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banners] DROP CONSTRAINT [DF__Banners__updated__47DBAE45]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banners]') AND type in (N'U'))
DROP TABLE [dbo].[Banners]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/14/2017 11:05:54 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Users__created_a__4316F928]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__created_a__4316F928]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Users__updated_a__440B1D61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__updated_a__440B1D61]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[GroupCategories]    Script Date: 12/14/2017 11:05:54 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__GroupCate__creat__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GroupCategories] DROP CONSTRAINT [DF__GroupCate__creat__44FF419A]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__GroupCate__updat__45F365D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GroupCategories] DROP CONSTRAINT [DF__GroupCate__updat__45F365D3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupCategories]') AND type in (N'U'))
DROP TABLE [dbo].[GroupCategories]
GO
/****** Object:  Table [dbo].[GroupCategories]    Script Date: 12/14/2017 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupCategories](
	[id_group_category] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_group_category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[GroupCategories] ON
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (1, N'USB - THẺ NHỚ', NULL, NULL)
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (2, N'Ổ CỨNG', NULL, NULL)
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (3, N'THIẾT BỊ MẠNG', NULL, NULL)
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (4, N'RAM', NULL, NULL)
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (5, N'MÀN HÌNH', NULL, NULL)
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (6, N'MAINBOARD', NULL, NULL)
INSERT [dbo].[GroupCategories] ([id_group_category], [name], [created_at], [updated_at]) VALUES (7, N'LINH KIỆN', NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupCategories] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 12/14/2017 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [ntext] NULL,
	[phone] [varchar](15) NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
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
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([id_user], [username], [password], [fullname], [email], [address], [phone], [created_at], [updated_at]) VALUES (1, N'kh01', N'123456', N'Khách hàng 1', N'kh01@hmail.com', N'Address', N'123456789', NULL, NULL)
INSERT [dbo].[Users] ([id_user], [username], [password], [fullname], [email], [address], [phone], [created_at], [updated_at]) VALUES (2, N'kh02', N'123456', N'Khách hàng 2', N'kh02@hmail.com', N'Address', N'123456789', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Banners]    Script Date: 12/14/2017 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banners]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Banners](
	[id_banner] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[url] [ntext] NOT NULL,
	[url_banner] [ntext] NOT NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_banner] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Admin_Users]    Script Date: 12/14/2017 11:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Admin_Users](
	[id_admin_user] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [ntext] NULL,
	[phone_number] [varchar](15) NULL,
	[role] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
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
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin_Users] ON
INSERT [dbo].[Admin_Users] ([id_admin_user], [username], [password], [fullname], [email], [address], [phone_number], [role], [created_at], [updated_at]) VALUES (1, N'admin', N'admin', N'Quản trị viên', N'admin@hmail.com', N'Address', N'080002222', N'Level max', NULL, NULL)
INSERT [dbo].[Admin_Users] ([id_admin_user], [username], [password], [fullname], [email], [address], [phone_number], [role], [created_at], [updated_at]) VALUES (2, N'cskh01', N'123456', N'Chăm sóc khách hàng', N'cskh01@hmail.com', N'Address', N'080002222', N'Level 1', NULL, NULL)
INSERT [dbo].[Admin_Users] ([id_admin_user], [username], [password], [fullname], [email], [address], [phone_number], [role], [created_at], [updated_at]) VALUES (3, N'cskh02', N'123456', N'Chăm sóc khách hàng', N'cskh02@hmail.com', N'Address', N'01639123123', N'Level 1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Admin_Users] OFF
/****** Object:  Table [dbo].[Orders]    Script Date: 12/14/2017 11:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[id_order] [int] NOT NULL,
	[id_order_detail] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[status] [int] NULL,
	[payment_method] [int] NULL,
	[coupon] [varchar](6) NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_order] ASC,
	[id_order_detail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Orders] ([id_order], [id_order_detail], [id_user], [status], [payment_method], [coupon], [created_at], [updated_at]) VALUES (2234, 4, 1, NULL, NULL, NULL, CAST(0x0000A84900AD1A76 AS DateTime), CAST(0x0000A84900AD1A76 AS DateTime))
INSERT [dbo].[Orders] ([id_order], [id_order_detail], [id_user], [status], [payment_method], [coupon], [created_at], [updated_at]) VALUES (2234, 5, 1, NULL, NULL, NULL, CAST(0x0000A84900AD1A77 AS DateTime), CAST(0x0000A84900AD1A77 AS DateTime))
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/14/2017 11:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetail](
	[id_order_detail] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NULL,
	[current_price] [float] NULL,
	[fullname_customer] [nvarchar](50) NULL,
	[email_customer] [varchar](255) NULL,
	[phone_customer] [varchar](15) NULL,
	[address_customer] [ntext] NULL,
	[description] [text] NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_order_detail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON
INSERT [dbo].[OrderDetail] ([id_order_detail], [id_product], [quantity], [current_price], [fullname_customer], [email_customer], [phone_customer], [address_customer], [description], [created_at], [updated_at]) VALUES (1, 2, 1, 2321, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetail] ([id_order_detail], [id_product], [quantity], [current_price], [fullname_customer], [email_customer], [phone_customer], [address_customer], [description], [created_at], [updated_at]) VALUES (2, 7, 1, 2890000, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A848017457D8 AS DateTime), CAST(0x0000A848017457D8 AS DateTime))
INSERT [dbo].[OrderDetail] ([id_order_detail], [id_product], [quantity], [current_price], [fullname_customer], [email_customer], [phone_customer], [address_customer], [description], [created_at], [updated_at]) VALUES (3, 8, 2, 13900000, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A848017457D9 AS DateTime), CAST(0x0000A848017457D9 AS DateTime))
INSERT [dbo].[OrderDetail] ([id_order_detail], [id_product], [quantity], [current_price], [fullname_customer], [email_customer], [phone_customer], [address_customer], [description], [created_at], [updated_at]) VALUES (4, 7, 1, 2890000, N'Khách hàng 1', N'kh01@hmail.com', N'123456789', N'Address', N'ghi chu', CAST(0x0000A84900AD1A76 AS DateTime), CAST(0x0000A84900AD1A76 AS DateTime))
INSERT [dbo].[OrderDetail] ([id_order_detail], [id_product], [quantity], [current_price], [fullname_customer], [email_customer], [phone_customer], [address_customer], [description], [created_at], [updated_at]) VALUES (5, 17, 4, 1690000, N'Khách hàng 1', N'kh01@hmail.com', N'123456789', N'Address', N'ghi chu', CAST(0x0000A84900AD1A77 AS DateTime), CAST(0x0000A84900AD1A77 AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
/****** Object:  StoredProcedure [dbo].[loginByUserAdmin]    Script Date: 12/14/2017 11:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loginByUserAdmin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[loginByUserAdmin]
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Admin_Users where username=@username and password=@password	
end

--Login by account custommer
' 
END
GO
/****** Object:  StoredProcedure [dbo].[loginByUser]    Script Date: 12/14/2017 11:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loginByUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[loginByUser]
	@username varchar(20),
	@password varchar(50)
as
begin
	select * from Users where username=@username and password=@password	
end

--Get all products
' 
END
GO
/****** Object:  StoredProcedure [dbo].[confirmOrder]    Script Date: 12/14/2017 11:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[confirmOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[confirmOrder]
	@id_order int,
	@updated_at datetime
as
begin
	update Orders set status=2, updated_at=@updated_at where id_order=@id_order
end' 
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[id_category] [int] IDENTITY(1,1) NOT NULL,
	[id_group_category] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (1, 7, N'Chuột', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (2, 7, N'Bàn phím', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (3, 1, N'USB', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (4, 5, N'Màn Hình', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (5, 1, N'Thẻ nhớ', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (6, 1, N'USB 3G - 4G', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (7, 2, N'HDD', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (8, 2, N'SSD', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (9, 6, N'3.5 PC', NULL, CAST(0x0000A84701770CE4 AS DateTime))
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (10, 2, N'Phụ Kiện Ổ Cứng', NULL, CAST(0x0000A84701771CD5 AS DateTime))
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (11, 2, N'Ổ cứng laptop', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (12, 3, N'ADSL & ADSL Wireless', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (13, 3, N'Network - Network Wireless', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (14, 3, N'Hub - Switch', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (15, 3, N'Cable mạng', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (16, 3, N'Card mạng', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (17, 3, N'Khác', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (18, 5, N'LCD 17-21 INCH', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (19, 5, N'LCD 12-24 INCH', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (20, 5, N'LCD 25-32 INCH', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (21, 5, N'LCD 33-MAX INCH', NULL, NULL)
INSERT [dbo].[Category] ([id_category], [id_group_category], [name], [created_at], [updated_at]) VALUES (22, 7, N'Quạt tản nhiệt', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  StoredProcedure [dbo].[addNewUserAdmin]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewUserAdmin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[addNewUserAdmin]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[addNewUser]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[addNewUser]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllUsers]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getAllUsers]
as
begin
	select 
		id_user as ''ID'', 
		username as ''Tài khoản'',
		fullname as ''Họ và tên'',
		email as ''Email'',
		phone as ''Số điện thoại''
	from Users ;
end

--Login By account admin
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllAdminUsers]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllAdminUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getAllAdminUsers]
as
begin
	select 
		id_admin_user as ''ID'', 
		username as ''Tài khoản'',
		fullname as ''Họ và tên'',
		email as ''Email'',
		phone_number as ''Số điện thoại'',
		role as ''Chức vụ''
	from Admin_Users ;
end

--Get all accounts custommer
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllOrders]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllOrders]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getAllOrders]
as
begin
	select id_order, count(1) as count_order, status from Orders group by id_order, status
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllGroupCategories]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllGroupCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getAllGroupCategories]
as
begin
	select * from GroupCategories
end

-- Delete category
' 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteOrder]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[deleteOrder]
	@id_order int
as
begin
	delete from Orders where id_order=@id_order
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[addNewOrder]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[addNewOrder]
	@id_order int,
	@id_product int,
	@id_user int,
	@quantity int,
	@price float,
	@fullname nvarchar(50),
	@email varchar(255),
	@address ntext,
	@phone varchar(15),
	@description text,
	@updated_at datetime,
	@created_at datetime
as
begin
	insert into OrderDetail(id_product,quantity,current_price, fullname_customer, email_customer, phone_customer, address_customer, description, created_at, updated_at) 
			values(@id_product, @quantity, @price, @fullname, @email, @phone, @address, @description, @created_at, @updated_at);
	insert into Orders(id_order, id_order_detail, id_user, created_at, updated_at) values(@id_order, (select MAX(OrderDetail.id_order_detail) from OrderDetail),@id_user, @created_at, @updated_at);
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[getInfoUserById]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getInfoUserById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getInfoUserById]
	@id int
as
begin
	select * from Users where id_user=@id
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[getCategoryById]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getCategoryById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getCategoryById]
	@id_category int
as
begin
	select * from Category where id_category=@id_category
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[addNewCategory]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Add new category
create procedure [dbo].[addNewCategory]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllCategories]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Get all categories
create procedure [dbo].[getAllCategories]
as
begin
	select id_category,Category.name as category, GroupCategories.name as group_category, GroupCategories.id_group_category as id_group
	from Category, GroupCategories 
	where Category.id_group_category = GroupCategories.id_group_category
end

--Add new product
' 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCategory]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[deleteCategory]
	@id int,
	@isRoot int
as
begin
	if (@isRoot = 0)
		delete from GroupCategories where GroupCategories.id_group_category=@id
	else
		delete from Category where Category.id_category=@id
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[updateCategory]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- update category
create procedure [dbo].[updateCategory]
	@id_category int,
	@id_group int,
	@name nvarchar(50),
	@updated_at datetime
as
begin
	update Category set id_group_category=@id_group, name=@name, updated_at=@updated_at where id_category=@id_category
end' 
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[id_category] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NULL,
	[status] [int] NULL,
	[promotion] [varchar](255) NULL,
	[tag] [varchar](255) NULL,
	[details] [ntext] NULL,
	[description] [ntext] NULL,
	[content] [ntext] NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (1, 2, N'KB Bosston K803 giả cơ chuyên Game USB Chính Hãng', 250000, 1, N'', N'boston', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700EEABEC AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (2, 2, N'KEYBOARD R8 - 1822 LED', 250000, 1, NULL, N'r8', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL)
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (3, 1, N'MOUSE R8 - 1658 LED', 50000, 1, N'', N'r8', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84701777997 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (4, 3, N'USB Kingston 32GB DT100G3 3.0', 199000, 1, NULL, N'kingston', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL)
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (5, 4, N'Màn hình LCD Samsung 21.5" LS22F350FHEXXV', 2600000, 1, N'', N'sam-sung', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E6994D AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (6, 2, N'KB MOTOSPEED CƠ K81 LED PRO', 1400000, 1, NULL, N'motospeed', N'chi tiết sản phẩm', N'mô tả chi tiết sản phẩm', N'nội dung bài viết', NULL, NULL)
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (7, 4, N'Màn hình LCD Acer 21.5'' R221Q', 2890000, 1, N'15', N'acer', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700EED796 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (8, 4, N'Màn hình LCD Samsung 32'' LC32H711QQEXXV ( Cong )', 13900000, 1, N'20', N'sam-sung', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700EEE987 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (9, 4, N'Màn hình LCD Philips 23.8''240V5QDSB/74', 2800000, 1, N'', N'philips', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700EF2FC4 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (10, 4, N'Màn hình LCD Asus 31.5''VA325H', 6000000, 0, N'', N'asus', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700EF3D0C AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (11, 4, N'Màn hình LCD Asus 21.5'' VZ229HE', 3200000, 1, N'', N'asus', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E233DB AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (12, 3, N'Ổ cứng di động/ USB Apacer 8GB AH326', 130000, 1, N'', N'usb', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E24121 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (13, 3, N'Ổ cứng di động/ USB HP 32GB X725', 450000, 1, N'', N'usb', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E24F00 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (14, 3, N'Ổ cứng di động/ USB Sandisk 128GB (SDDD3-G46)', 1076000, 1, N'', N'usb', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E821C8 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (15, 3, N'Ổ cứng di động/ USB Kingston 32GB DTCNY17', 350000, 0, N'', N'usb', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E7E467 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (16, 6, N'Thiết bị mạng ToTo Link 4G MF150', 1450000, 1, N'', N'usb-4g', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E740CF AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (17, 6, N'Thiết bị mạng D-link 4G DWR-932C', 1690000, 1, N'15', N'usb-4g', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E6E3B2 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (18, 6, N'Thiết Bị kết nối 3G D-link DWM 156', 495000, 1, N'', N'usb-3g', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E711BF AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (19, 10, N'Bộ nhớ DDR4 Kingmax 8GB (3000) (Heatsink)', 2420000, 0, N'', N'ram', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E051D5 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (20, 4, N'Bộ nhớ DDR4 Corsair 16GB (2666)C16 CMK16GX4M2A Ven LPX (2x8GB)', 5100000, 1, N'5', N'ram', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E15E51 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (21, 10, N'Bộ nhớ DDR4 Transcend 16GB (2400) (TS2GLH64V4B)', 4300000, 1, N'', N'ram', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700E2D17C AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (22, 1, N'Chuột máy tính Logitech Gaming G903', 3700000, 1, N'', N'chu?t', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700F038DC AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (23, 1, N'Chuột máy tính Zadez ZM-122', 80000, 1, N'', N'chu?t', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700F07C01 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (24, 1, N'Chuột máy tính Ozone 3K', 550000, 1, N'', N'chu?t', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700F0B2E8 AS DateTime))
INSERT [dbo].[Products] ([id_product], [id_category], [name], [price], [status], [promotion], [tag], [details], [description], [content], [created_at], [updated_at]) VALUES (25, 1, N'Chuột máy tính FL Esports G11', 485000, 0, N'', N'chu?t', N'chi ti?t s?n ph?m', N'mô t? chi ti?t s?n ph?m', N'n?i dung bài vi?t', NULL, CAST(0x0000A84700F0ED6D AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[Images]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Images]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Images](
	[id_image] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[link_image] [text] NULL,
	[created_at] [datetime] NULL DEFAULT (NULL),
	[updated_at] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id_image] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Images] ON
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (1, 6, N'Content\images\kb-motospeed-co-k81-led-pro1461370666.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (2, 2, N'Content\images\keyboard-r8-1822-led1461323688.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (3, 3, N'Content\images\mouse-r8-1658-led1461323899.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (4, 4, N'Content\images\2650_1506504793-4.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (5, 4, N'Content\images\2650_1506504793-1.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (6, 5, N'Content\images\9054_1498896883-1.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (8, 1, N'Content\images\kb-bosston-k803-gia-co-chuyen-game-usb-chinh-hang1478848619.jpg', NULL, NULL)
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (26, 19, N'Content\images\13688_1506393798-1_201712121336433783.jpg', CAST(0x0000A84700E051D6 AS DateTime), CAST(0x0000A84700E051D6 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (27, 19, N'Content\images\13688_1506393798-2_201712050017507388_201712121336433813.jpg', CAST(0x0000A84700E051D7 AS DateTime), CAST(0x0000A84700E051D7 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (28, 19, N'Content\images\13688_201712050017507342_201712121336433843.jpg', CAST(0x0000A84700E051D8 AS DateTime), CAST(0x0000A84700E051D8 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (29, 17, N'Content\images\1589_1498033976-1_201712121339038833.jpg', CAST(0x0000A84700E0F67F AS DateTime), CAST(0x0000A84700E0F67F AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (30, 16, N'Content\images\12623_1510131195-1_201712121340044468.jpg', CAST(0x0000A84700E13D78 AS DateTime), CAST(0x0000A84700E13D78 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (31, 20, N'Content\images\13865_1507265341-4_201712121340324854.jpg', CAST(0x0000A84700E15E53 AS DateTime), CAST(0x0000A84700E15E53 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (32, 7, N'Content\images\14762_1512111397-8_201712121341458746.jpg', CAST(0x0000A84700E1B454 AS DateTime), CAST(0x0000A84700E1B454 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (33, 9, N'Content\images\14236_1509155974-1_201712121341584923.jpg', CAST(0x0000A84700E1C31D AS DateTime), CAST(0x0000A84700E1C31D AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (34, 10, N'Content\images\14240_1509414233-2_201712121342122031.jpg', CAST(0x0000A84700E1D32E AS DateTime), CAST(0x0000A84700E1D32E AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (35, 11, N'Content\images\14762_1512111397-8_201712121341458746_201712121342467391.jpg', CAST(0x0000A84700E1FBA7 AS DateTime), CAST(0x0000A84700E1FBA7 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (36, 12, N'Content\images\2650_1506504793-1_201712121343040760.jpg', CAST(0x0000A84700E20FF8 AS DateTime), CAST(0x0000A84700E20FF8 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (37, 13, N'Content\images\2650_1506504793-4_201712121343578691.jpg', CAST(0x0000A84700E24F02 AS DateTime), CAST(0x0000A84700E24F02 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (38, 14, N'Content\images\9724_1507003685-1_201712121344123390.jpg', CAST(0x0000A84700E25FF7 AS DateTime), CAST(0x0000A84700E25FF7 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (39, 15, N'Content\images\14440_1511582690-1_201712121344555244.jpg', CAST(0x0000A84700E29293 AS DateTime), CAST(0x0000A84700E29293 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (40, 18, N'Content\images\13859_1507275922-1_201712121345236730.jpg', CAST(0x0000A84700E2B38F AS DateTime), CAST(0x0000A84700E2B38F AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (41, 21, N'Content\images\13865_1507265341-4_201712121345492155.jpg', CAST(0x0000A84700E2D17E AS DateTime), CAST(0x0000A84700E2D17E AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (42, 21, N'Content\images\13865_1507265341-4_201712121340324854_201712121345492185.jpg', CAST(0x0000A84700E2D17E AS DateTime), CAST(0x0000A84700E2D17E AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (43, 22, N'Content\images\13944_1507695775-1_201712121346040093.jpg', CAST(0x0000A84700E2E2D3 AS DateTime), CAST(0x0000A84700E2E2D3 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (44, 23, N'Content\images\14038_1507875994-1_201712121346215493.jpg', CAST(0x0000A84700E2F762 AS DateTime), CAST(0x0000A84700E2F762 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (45, 24, N'Content\images\14316_1509417121-1_201712121346380003.jpg', CAST(0x0000A84700E30AA9 AS DateTime), CAST(0x0000A84700E30AA9 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (46, 25, N'Content\images\14316_1509417121-1_201712121346532832.jpg', CAST(0x0000A84700E31C92 AS DateTime), CAST(0x0000A84700E31C92 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (47, 8, N'Content\images\2017111167111_201712050014201366_201712121347449341.jpg', CAST(0x0000A84700E35919 AS DateTime), CAST(0x0000A84700E35919 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (48, 8, N'Content\images\5104_201712050014201226_201712121347449381.jpg', CAST(0x0000A84700E3591A AS DateTime), CAST(0x0000A84700E3591A AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (49, 8, N'Content\images\14604_1512008288-3_201712121347449411.jpg', CAST(0x0000A84700E3591B AS DateTime), CAST(0x0000A84700E3591B AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (50, 9, N'Content\images\14236_1509155974-2_201712121355310938.jpg', CAST(0x0000A84700E57B61 AS DateTime), CAST(0x0000A84700E57B61 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (51, 9, N'Content\images\14236_1509155974-3_201712121355310988.jpg', CAST(0x0000A84700E57B63 AS DateTime), CAST(0x0000A84700E57B63 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (52, 10, N'Content\images\14238_1509416523-4_201712121356253099.jpg', CAST(0x0000A84700E5BAEA AS DateTime), CAST(0x0000A84700E5BAEA AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (53, 10, N'Content\images\14238_1509416522-1_201712121356253139.jpg', CAST(0x0000A84700E5BAEB AS DateTime), CAST(0x0000A84700E5BAEB AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (54, 10, N'Content\images\14238_1509416523-2_201712121356253169.jpg', CAST(0x0000A84700E5BAF3 AS DateTime), CAST(0x0000A84700E5BAF3 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (55, 7, N'Content\images\14238_1509416523-4_201712121357572171.jpg', CAST(0x0000A84700E6269E AS DateTime), CAST(0x0000A84700E6269E AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (56, 7, N'Content\images\14762_1512111396-2_201712121357572221.jpg', CAST(0x0000A84700E626A0 AS DateTime), CAST(0x0000A84700E626A0 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (57, 7, N'Content\images\14762_1512111397-5_201712121357572261.jpg', CAST(0x0000A84700E626A0 AS DateTime), CAST(0x0000A84700E626A0 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (58, 7, N'Content\images\14762_1512111397-7_201712121357572291.jpg', CAST(0x0000A84700E626A9 AS DateTime), CAST(0x0000A84700E626A9 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (59, 7, N'Content\images\14762_1512111397-8_201712121357572561.jpg', CAST(0x0000A84700E626A9 AS DateTime), CAST(0x0000A84700E626A9 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (60, 5, N'Content\images\14602_1511930019-2_201712121358436048.jpg', CAST(0x0000A84700E65CFA AS DateTime), CAST(0x0000A84700E65CFA AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (61, 5, N'Content\images\14602_1511930019-3_201712121358436088.jpg', CAST(0x0000A84700E65CFB AS DateTime), CAST(0x0000A84700E65CFB AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (62, 5, N'Content\images\14602_1511930020-10_201712121358436118.jpg', CAST(0x0000A84700E65CFF AS DateTime), CAST(0x0000A84700E65CFF AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (63, 17, N'Content\images\1589_1498033976-2_201712121400385914.jpg', CAST(0x0000A84700E6E3BA AS DateTime), CAST(0x0000A84700E6E3BA AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (64, 17, N'Content\images\1589_1498033976-3_201712121400385954.jpg', CAST(0x0000A84700E6E3BB AS DateTime), CAST(0x0000A84700E6E3BB AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (65, 18, N'Content\images\13859_1507275923-3_201712121401178656.jpg', CAST(0x0000A84700E711C1 AS DateTime), CAST(0x0000A84700E711C1 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (66, 18, N'Content\images\13859_1507275923-4_201712121401178836.jpg', CAST(0x0000A84700E711CA AS DateTime), CAST(0x0000A84700E711CA AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (67, 18, N'Content\images\13859_1507275923-5_201712121401178996.jpg', CAST(0x0000A84700E711CA AS DateTime), CAST(0x0000A84700E711CA AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (68, 16, N'Content\images\12623_1510131196-3 (1)_201712121401539977.jpg', CAST(0x0000A84700E73C19 AS DateTime), CAST(0x0000A84700E73C19 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (69, 16, N'Content\images\12623_1510131196-3_201712121401540027.jpg', CAST(0x0000A84700E73C1A AS DateTime), CAST(0x0000A84700E73C1A AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (70, 16, N'Content\images\12623_1510131196-4_201712121401540317.jpg', CAST(0x0000A84700E73C26 AS DateTime), CAST(0x0000A84700E73C26 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (71, 15, N'Content\images\14440_1511582690-2_201712121404176259.jpg', CAST(0x0000A84700E7E468 AS DateTime), CAST(0x0000A84700E7E468 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (72, 15, N'Content\images\14440_1511582690-3_201712121404176289.jpg', CAST(0x0000A84700E7E46A AS DateTime), CAST(0x0000A84700E7E46A AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (73, 15, N'Content\images\14440_1511582690-5_201712121404176329.jpg', CAST(0x0000A84700E7E46B AS DateTime), CAST(0x0000A84700E7E46B AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (74, 14, N'Content\images\9724_1507003685-2_201712121405100019.jpg', CAST(0x0000A84700E821CB AS DateTime), CAST(0x0000A84700E821CB AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (75, 14, N'Content\images\9724_1507003685-4_201712121405100109.jpg', CAST(0x0000A84700E821CC AS DateTime), CAST(0x0000A84700E821CC AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (76, 22, N'Content\images\11991_1504924096-3_201712121434373200.jpg', CAST(0x0000A84700F038DD AS DateTime), CAST(0x0000A84700F038DD AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (77, 22, N'Content\images\14516_1511406471-3_201712121434373250.jpg', CAST(0x0000A84700F038DE AS DateTime), CAST(0x0000A84700F038DE AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (78, 22, N'Content\images\14516_1511406471-4_201712121434373290.jpg', CAST(0x0000A84700F038E7 AS DateTime), CAST(0x0000A84700F038E7 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (79, 23, N'Content\images\11991_1504924096-3_201712121435346183.jpg', CAST(0x0000A84700F07C03 AS DateTime), CAST(0x0000A84700F07C03 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (80, 23, N'Content\images\12444_1504584820-2_201712121435346243.jpg', CAST(0x0000A84700F07C05 AS DateTime), CAST(0x0000A84700F07C05 AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (81, 24, N'Content\images\57_201712121436214689.jpg', CAST(0x0000A84700F0B2EA AS DateTime), CAST(0x0000A84700F0B2EA AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (82, 24, N'Content\images\14038_1507875995-5_201712121436214729.jpg', CAST(0x0000A84700F0B2EE AS DateTime), CAST(0x0000A84700F0B2EE AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (83, 25, N'Content\images\G11_201712121437114028.jpg', CAST(0x0000A84700F0ED6D AS DateTime), CAST(0x0000A84700F0ED6D AS DateTime))
INSERT [dbo].[Images] ([id_image], [id_product], [link_image], [created_at], [updated_at]) VALUES (84, 25, N'Content\images\13944_1507695775-2_201712121437114058.jpg', CAST(0x0000A84700F0ED6E AS DateTime), CAST(0x0000A84700F0ED6E AS DateTime))
SET IDENTITY_INSERT [dbo].[Images] OFF
/****** Object:  StoredProcedure [dbo].[addNewProduct]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addNewProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[addNewProduct]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getProductsByGroupCategory]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByGroupCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Get products filter by group_category
create procedure [dbo].[getProductsByGroupCategory]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getProductsByCategoryAndGroup]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByCategoryAndGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Get products filter by category and Group
create procedure [dbo].[getProductsByCategoryAndGroup]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getProductsByCategory]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Get products filter by category
create procedure [dbo].[getProductsByCategory]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getProductById]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Get product by id
create procedure [dbo].[getProductById]
	@id_product int
as
begin
	select * from Products where id_product = @id_product
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderDetailByIdOrder]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getOrderDetailByIdOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getOrderDetailByIdOrder]
	@id_order int,
	@top int
as
begin
	if (@top=1)
		select top 1 * from OrderDetail, Orders where OrderDetail.id_order_detail = Orders.id_order_detail and Orders.id_order=@id_order;
	else
		select Orders.*, OrderDetail.*, Products.name 
		from OrderDetail, Orders, Products 
		where OrderDetail.id_order_detail = Orders.id_order_detail and Products.id_product=OrderDetail.id_product and Orders.id_order=@id_order;
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllProducts]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getAllProducts]
as
begin
	select Products.id_product, Category.name as category, Products.name, price, status, promotion, tag, details, description, content 
	from Products, Category
	where Products.id_category=Category.id_category
	order by id_product DESC
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllPromotionProducts]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllPromotionProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- get all products have promotion
create procedure [dbo].[getAllPromotionProducts]
as
begin
	select * from Products where promotion != NULL or promotion != '''';
end

--select * from Images
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getRelatedProducts]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getRelatedProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- get related products
create procedure [dbo].[getRelatedProducts]
	@id_product int
as
begin
	select * from Products where (select id_category from Products where id_product=@id_product)=id_category
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- update product
create procedure [dbo].[updateProduct]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uploadImage]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uploadImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Upload Image by id
create procedure [dbo].[uploadImage]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getImagesByIdProduct]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getImagesByIdProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Get Images by id product
create procedure [dbo].[getImagesByIdProduct]
	@id_product int
as
begin
	select * from Images where Images.id_product=@id_product; 
end

--Get products in search by name
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getProductsByPrice]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProductsByPrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getProductsByPrice]
	@min_price int,
	@max_price int
as
begin
	select Products.*, Images.link_image
	from Products, Images 
	where Products.price >=@min_price and price <@max_price and Images.id_product=Products.id_product
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllProductsInSearch]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllProductsInSearch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getAllProductsInSearch]
	@q NVARCHAR(255)
as
begin
	select Products.id_product, Category.name as category, Products.name, price, status, promotion, tag, details, description, content, Images.link_image 
	from Products, Category, Images 
	where Products.id_category=Category.id_category and Products.name like ''%''+@q+''%'' and Images.id_product=Products.id_product
	order by id_product DESC
end
--Get products filter by price
' 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[deleteProduct]
	@id int
as
begin
	delete from Images where Images.id_product=@id;
	delete from Products where Products.id_product=@id;
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteImageById]    Script Date: 12/14/2017 11:05:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteImageById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- delete Image by id
create procedure [dbo].[deleteImageById]
	@id_image int
as
begin
	delete from Images where id_image=@id_image
end
-- select * from Images
' 
END
GO
/****** Object:  ForeignKey [fk_group_category_id]    Script Date: 12/14/2017 11:05:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_group_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fk_group_category_id] FOREIGN KEY([id_group_category])
REFERENCES [dbo].[GroupCategories] ([id_group_category])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_group_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fk_group_category_id]
GO
/****** Object:  ForeignKey [fk_product_category_id]    Script Date: 12/14/2017 11:05:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_product_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_category_id] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id_category])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_product_category_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_category_id]
GO
/****** Object:  ForeignKey [fk_image_id]    Script Date: 12/14/2017 11:05:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_image_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Images]'))
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [fk_image_id] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id_product])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_image_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Images]'))
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [fk_image_id]
GO
