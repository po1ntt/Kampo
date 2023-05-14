USE [master]
GO
/****** Object:  Database [KampoDB]    Script Date: 15.05.2023 2:32:54 ******/
CREATE DATABASE [KampoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KampoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KampoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KampoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KampoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KampoDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KampoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KampoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KampoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KampoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KampoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KampoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KampoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KampoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KampoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KampoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KampoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KampoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KampoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KampoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KampoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KampoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KampoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KampoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KampoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KampoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KampoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KampoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KampoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KampoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KampoDB] SET  MULTI_USER 
GO
ALTER DATABASE [KampoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KampoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KampoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KampoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KampoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KampoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KampoDB', N'ON'
GO
ALTER DATABASE [KampoDB] SET QUERY_STORE = OFF
GO
USE [KampoDB]
GO
/****** Object:  Table [dbo].[ChangeProductsList]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeProductsList](
	[id_changeProducts] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[logger_products_id] [int] NULL,
 CONSTRAINT [PK_ChangeProductsList] PRIMARY KEY CLUSTERED 
(
	[id_changeProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoggerProducts]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoggerProducts](
	[id_loggerProducts] [int] IDENTITY(1,1) NOT NULL,
	[DateChanging] [nvarchar](max) NULL,
	[TypeActionChanging] [nvarchar](max) NULL,
	[productCategory_id] [int] NOT NULL,
 CONSTRAINT [PK_LoggerProducts] PRIMARY KEY CLUSTERED 
(
	[id_loggerProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogsUsers]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogsUsers](
	[id_logs] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[ActionType] [nvarchar](max) NULL,
	[ObjectChanged] [nvarchar](max) NULL,
	[NameObject] [nvarchar](max) NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_LogsUsers] PRIMARY KEY CLUSTERED 
(
	[id_logs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[status_id] [int] NULL,
	[NumberOrder] [nvarchar](max) NULL,
	[DateCreated] [date] NULL,
	[DateComplete] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersItem]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersItem](
	[id_orderitem] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[ProductCount] [int] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_OrdersItem] PRIMARY KEY CLUSTERED 
(
	[id_orderitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[productscategory_id] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[CountProduct] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsCategory]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsCategory](
	[id_productcategory] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductsCategory] PRIMARY KEY CLUSTERED 
(
	[id_productcategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsProperties]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsProperties](
	[id_productproperties] [int] IDENTITY(1,1) NOT NULL,
	[property_id] [int] NULL,
	[ValueProperty] [nvarchar](max) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_ProductsProperties] PRIMARY KEY CLUSTERED 
(
	[id_productproperties] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[id_propertries] [int] IDENTITY(1,1) NOT NULL,
	[NameProperty] [nvarchar](max) NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[id_propertries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15.05.2023 2:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[SecondName] [nvarchar](max) NULL,
	[Partronumic] [nvarchar](max) NULL,
	[NumberPhone] [nvarchar](max) NULL,
	[Login] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChangeProductsList] ON 

INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (99, 23, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (100, 5, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (101, 6, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (102, 8, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (103, 9, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (104, 14, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (105, 15, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (106, 19, 8)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (117, 20, 10)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (118, 4, 10)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (119, 7, 10)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (120, 13, 10)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (121, 16, 10)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (122, 17, 10)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (123, 18, 9)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (124, 3, 9)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (125, 10, 9)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (126, 12, 9)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (127, 25, 9)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (128, 1, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (129, 2, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (130, 11, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (131, 21, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (132, 22, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (133, 24, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (134, 26, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (135, 27, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (136, 28, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (137, 29, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (138, 30, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (139, 31, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (140, 32, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (141, 33, 11)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (157, 4, 13)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (158, 7, 13)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (159, 13, 13)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (160, 16, 13)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (161, 17, 13)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (168, 1, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (169, 2, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (170, 11, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (171, 21, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (172, 22, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (173, 24, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (174, 26, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (175, 27, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (176, 28, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (177, 29, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (178, 30, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (179, 31, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (180, 32, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (181, 33, 12)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (182, 20, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (183, 5, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (184, 6, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (185, 8, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (186, 9, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (187, 14, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (188, 15, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (189, 19, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (190, 23, 15)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (191, 3, 14)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (192, 10, 14)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (193, 12, 14)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (194, 18, 14)
INSERT [dbo].[ChangeProductsList] ([id_changeProducts], [product_id], [logger_products_id]) VALUES (195, 25, 14)
SET IDENTITY_INSERT [dbo].[ChangeProductsList] OFF
GO
SET IDENTITY_INSERT [dbo].[LoggerProducts] ON 

INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (8, N'14.05.2023', N'Изменено вручную', 4)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (9, N'14.05.2023', N'Изменено вручную', 2)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (10, N'14.05.2023', N'Изменено вручную', 3)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (11, N'14.05.2023', N'Изменено вручную', 1)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (12, N'15.05.2023', N'Изменено вручную', 1)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (13, N'15.05.2023', N'Изменено вручную', 3)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (14, N'15.05.2023', N'Изменено вручную', 2)
INSERT [dbo].[LoggerProducts] ([id_loggerProducts], [DateChanging], [TypeActionChanging], [productCategory_id]) VALUES (15, N'15.05.2023', N'Изменено вручную', 4)
SET IDENTITY_INSERT [dbo].[LoggerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[LogsUsers] ON 

INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1, 1, N'Добавление', N'Продукт', N'fsd', NULL)
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (2, 1, N'Добавление', N'Продукт', N'TestProduct', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (3, 1, N'Добавление', N'Продукт', N'1243', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (4, 1, N'Обновление', N'Продукт', N'1243', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (5, 1, N'Обновление', N'Продукт', N'1243', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (6, 1, N'Обновление', N'Продукт', N'1243', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (7, 1, N'Обновление', N'Продукт', N'1243', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1002, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1003, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1004, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1005, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1006, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1007, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1008, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1009, 1, N'Обновление', N'Продукт', N'Проект 23370', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1010, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1011, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1012, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1013, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1014, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1015, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1016, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1017, 1, N'Обновление', N'Заказ', N'42', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1018, 1, N'Обновление', N'Заказ', N'31231', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1019, 1, N'Обновление', N'Заказ', N'31231', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1020, 1, N'Обновление', N'Заказ', N'31231', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1021, 1, N'Обновление', N'Заказ', N'31231', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1022, 1, N'Обновление', N'Заказ', N'312312', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1023, 1, N'Обновление', N'Заказ', N'312312', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1024, 1, N'Обновление', N'Заказ', N'312312', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1025, 1, N'Обновление', N'Заказ', N'31213', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1026, 1, N'Обновление', N'Заказ', N'31213', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1027, 1, N'Обновление', N'Заказ', N'31213', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1028, 1, N'Обновление', N'Заказ', N'31213', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1029, 1, N'Добавление', N'Категория', N'', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1030, 1, N'Добавление', N'Категория', N'', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1031, 1, N'Добавление', N'Продукт', N'GDFGFD', CAST(N'2023-04-07' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1032, 1, N'Добавление', N'Cвойство', N'', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1033, 1, N'Добавление', N'Cвойство', N'', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1034, 1, N'Добавление', N'Продукт', N'СВУ-5 Снаряжение водолазное универсальное ', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1035, 1, N'Обновление', N'Заказ', N'1k02', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1036, 1, N'Обновление', N'Заказ', N'1k02', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1037, 1, N'Обновление', N'Заказ', N'1k02', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1038, 1, N'Обновление', N'Заказ', N'1k02', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1039, 1, N'Добавление', N'Cвойство', N'', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1040, 1, N'Добавление', N'Продукт', N'АДА-2 Самоспасатель изолирующий индивидуальный ', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1041, 1, N'Добавление', N'Продукт', N'АДА-ПРО Самоспасатель изолирующий резервуарный со сжатым воздухом специального назначения', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1042, 2, N'Обновление', N'Заказ', N'34gt44', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1043, 2, N'Обновление', N'Заказ', N'34gt44', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1044, 2, N'Обновление', N'Заказ', N'34gt44', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1045, 2, N'Обновление', N'Продукт', N'Аппарат воздушно-дыхательный АВМ-12К', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1046, 2, N'Обновление', N'Продукт', N'Аппарат аварийного всплытия СПАС-1', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1047, 1, N'Обновление', N'Заказ', N'GDFGDF1243', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1048, 1, N'Обновление', N'Заказ', N'GDFGDF1243', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1049, 1, N'Обновление', N'Заказ', N'GDFGDF1243', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1050, 1, N'Добавление', N'Продукт', N'Test1', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1051, 1, N'Добавление', N'Продукт', N'gtewtwe', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1052, 1, N'Добавление', N'Продукт', N'hdf', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1053, 1, N'Добавление', N'Продукт', N'wertgdsfg', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1054, 1, N'Добавление', N'Продукт', N'tewt', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1055, 1, N'Добавление', N'Продукт', N'w5ert', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1056, 1, N'Добавление', N'Продукт', N'dfgdfg', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1057, 1, N'Добавление', N'Продукт', N'ger', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1058, 1, N'Добавление', N'Продукт', N'wregtwer', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1059, 1, N'Добавление', N'Продукт', N'235', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1060, 1, N'Добавление', N'Продукт', N'grege', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1061, 1, N'Добавление', N'Продукт', N'w325', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1062, 1, N'Добавление', N'Продукт', N'124214', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1063, 1, N'Добавление', N'Продукт', N'AFSAS', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1064, 1, N'Добавление', N'Продукт', N'QWRQW', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1065, 1, N'Добавление', N'Продукт', N'qwegtqw', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1066, 1, N'Обновление', N'Продукт', N'gtewtwe', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1067, 1, N'Обновление', N'Продукт', N'w5ert', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1068, 1, N'Обновление', N'Продукт', N'w5ert', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1069, 1, N'Обновление', N'Продукт', N'w5ert', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1070, 1, N'Обновление', N'Продукт', N'w5ert', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1071, 1, N'Обновление', N'Продукт', N'hdf', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1072, 1, N'Обновление', N'Продукт', N'Test1', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1073, 1, N'Обновление', N'Продукт', N'hdf', CAST(N'2023-05-15' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1074, 1, N'Обновление', N'Продукт', N'hdf', CAST(N'2023-05-15' AS Date))
INSERT [dbo].[LogsUsers] ([id_logs], [user_id], [ActionType], [ObjectChanged], [NameObject], [DateCreated]) VALUES (1075, 1, N'Обновление', N'Продукт', N'hdf', CAST(N'2023-05-15' AS Date))
SET IDENTITY_INSERT [dbo].[LogsUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id_order], [status_id], [NumberOrder], [DateCreated], [DateComplete]) VALUES (5, 4, N'31213', CAST(N'2023-04-07' AS Date), CAST(N'2023-04-07' AS Date))
INSERT [dbo].[Orders] ([id_order], [status_id], [NumberOrder], [DateCreated], [DateComplete]) VALUES (6, 4, N'GDFGDF1243', CAST(N'2023-04-07' AS Date), CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Orders] ([id_order], [status_id], [NumberOrder], [DateCreated], [DateComplete]) VALUES (7, 4, N'1k02', CAST(N'2023-04-26' AS Date), CAST(N'2023-04-26' AS Date))
INSERT [dbo].[Orders] ([id_order], [status_id], [NumberOrder], [DateCreated], [DateComplete]) VALUES (8, 4, N'34gt44', CAST(N'2023-04-26' AS Date), CAST(N'2023-04-26' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersItem] ON 

INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (12, 1, 23, 5)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (13, 1, 12, 5)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (14, 1, 32, 6)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (15, 4, 32, 6)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (16, 8, 32, 6)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (17, 9, 32, 6)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (18, 8, 32, 6)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (19, 1, 2, 7)
INSERT [dbo].[OrdersItem] ([id_orderitem], [product_id], [ProductCount], [order_id]) VALUES (20, 17, 10, 8)
SET IDENTITY_INSERT [dbo].[OrdersItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (1, N'Огнетушитель порошковый «Океан-1»', 1, N'Пожарная техника', 428, N'https://www.kampo.ru/sites/default/files/foto_production/okean-01_0.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (2, N'Аппарат дыхательный АП «Омега»', 1, N'Пожарная техника', 200, N'https://www.kampo.ru/sites/default/files/omega-eksport1_0.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (3, N'Аппарат воздушно-дыхательный АВМ-12К', 2, N'Морская техника', 4, N'https://www.kampo.ru/sites/default/files/resize/avm-12k-1_0-250x375.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (4, N'Аппарат аварийного всплытия СПАС-1', 3, N'Техника для аварийно-спасательных служб', 69, N'https://www.kampo.ru/sites/default/files/resize/spas-1_1-1_0-250x250.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (5, N'Станция кислородная ингаляционная «КИС-М»', 4, N'Медицинская техника', 21, N'https://www.kampo.ru/sites/default/files/resize/kis-m_0-200x200.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (6, N'Аппарат искусственной вентиляции легких ручной полевой ДП-11', 4, N'Медицинская техника', 3399, N'https://www.kampo.ru/sites/default/files/resize/dp-11pol_2-200x200.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (7, N'Cтанция воздухоснабжения «Каскад»', 3, N'Техника для аварийно-спасательных служб', 123, N'https://www.kampo.ru/sites/default/files/resize/kaskad1_1_1-250x167.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (8, N'Аппарат искусственной вентиляции легких ручной АДР-КАМПО', 4, N'Медицинская техника', 187, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (9, N'Ингалятор кислорода КИ-5', 4, N'Медицинская техника', 4417, N'https://www.kampo.ru/sites/default/files/resize/ki-5_1-200x200.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (10, N'СВУ-5 Снаряжение водолазное универсальное ', 2, N'Для обеспечения водолазных спусков при выполнении подводно-технических, аварийно-спасательных и других видах водолазных работ, в том числе в условиях низких температур воды и воздуха, а также в загрязненных средах, в том числе с повышенным содержанием нефтепродуктов.', 4, N'https://www.kampo.ru/sites/default/files/resize/11_-_svu-5_shlem-2_-_noga-250x250.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (11, N'Тренажер ВГСЧ', 1, N'Тренажер предназначен для тренировки личного состава частей ВГСЧ МЧС России с целью правильного использования средств индивидуальной защиты органов дыхания и приобретения ими навыков правильного дыхания с помощью имитаторов замкнутого и открытого циклов дыхания в условиях действия физических нагрузок различной степени тяжести.', 500, N'https://www.kampo.ru/sites/default/files/resize/foto_production/vgs4s-100x146.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (12, N'Снаряжение водолазное вентилируемое (СВВ)', 2, N'СВВ предназначено для обеспечения водолазных спусков при выполнении подводно-технических, аварийно-спасательных и других видов водолазных работ, в том числе в условиях низких температур воды и воздуха, а также в загрязненных средах, в том числе с повышенным содержанием нефтепродуктов.', 600, N'https://www.kampo.ru/sites/default/files/resize/foto_production/12_-_svv-250x250.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (13, N'Аппарат дыхательный шланговый ДША «Вектор»', 3, N'Предназначен для защиты органов дыхания и зрения человека от вредного воздействия непригодной для дыхания токсичной или задымленной газовой среды при проведении работ в зданиях, сооружениях и на производственных объектах различных отраслей промышленности, а также для проведения аварийно-спасательных работ.', 510, N'https://www.kampo.ru/sites/default/files/resize/shda-vektor-200x300.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (14, N'Комплекс испытательного оборудования КИО-1', 4, N'Комплекс предназначен для проведения освидетельствования и ремонта воздушных и кислородных баллонов высокого давления вместимостью от 1 до 9 л и с диаметром цилиндрической части от 89 до 178 мм, используемых в средствах индивидуальной защиты органов дыхания и позволяет выполнять следующие виды работ:', 520, N'https://www.kampo.ru/sites/default/files/resize/sgibkio-1-300x300.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (15, N'Аппарат искусственной вентиляции легких ГС-16 с пневмоприводом', 4, N'Аппарат предназначен для оказания первой медицинской помощи путем искусственной вентиляции легких (ИВЛ) пострадавшим (взрослым, а также детям с массой тела более 20 кг) специально подготовленным медицинским или, в экстренных случаях, малообученным персоналом в соответствии с правилами, принятыми в эксплуатирующей организации', 610, N'https://www.kampo.ru/sites/default/files/resize/gs-16-keys-200x252.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (16, N'АДА-2 Самоспасатель изолирующий индивидуальный ', 3, N'Самоспасатель изолирующий индивидуальный АДА-2 предназначен для защиты органов дыхания и зрения человека в непригодной для дыхания газовой среде при эвакуации из зданий и сооружений, производственных объектов и рассчитан на неподготовленного пользователя.', 550, N'https://www.kampo.ru/sites/default/files/resize/ada-2-1-250x375.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (17, N'АДА-ПРО Самоспасатель изолирующий резервуарный со сжатым воздухом специального назначения', 3, N'Аппарат предназначен для индивидуальной защиты органов дыхания и зрения от токсичных продуктов горения при эвакуации из помещений во время пожара (аварии) и рассчитан на подготовленного пользователя.', 410, N'https://www.kampo.ru/sites/default/files/resize/ada-pro-1_0-250x250.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (18, N'Test1', 2, N'142', 412, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (19, N'gtewtwe', 4, N'twewew', 421, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (20, N'hdf', 4, N'12412', 412, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (21, N'wertgdsfg', 1, N'gdfgdfgdfgd', 142, N'gdsgs')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (22, N'tewt', 1, N'twegwe', 124, N'gwetw')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (23, N'w5ert', 4, N'wetwetwe', 23523, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (24, N'dfgdfg', 1, N'etgrger', 124, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (25, N'ger', 2, N'hdgfgdf', 124, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (26, N'wregtwer', 1, N'1421', 412, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (27, N'235', 1, N'1234', 32, N'ert')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (28, N'grege', 1, N'terger', 42, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (29, N'w325', 1, N'gds', 24, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (30, N'124214', 1, N'stgewt', 124, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (31, N'AFSAS', 1, N'FSAFAS', 214, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (32, N'QWRQW', 1, N'2314521', 124, N'/Resource/ImagesProducts/imagenotfound.png')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (33, N'qwegtqw', 1, N'wetqtgwe', 421, N'/Resource/ImagesProducts/imagenotfound.png')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsCategory] ON 

INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (1, N'Пожарная техника')
INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (2, N'Морская техника')
INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (3, N'Техника для аварийно-спасательных служб')
INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (4, N'Медицинская техника')
SET IDENTITY_INSERT [dbo].[ProductsCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsProperties] ON 

INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (1, 1, N'4', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (2, 2, N'20', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (3, 3, N'200 ± 10', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (4, 4, N'от минус 40 до плюс 50', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (5, 5, N'10', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (6, 6, N'огнетушащий порошок «ВЕКСОН-АВС 50 Модуль» или аналог', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (7, 7, N'8,0 ± 0,4', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (8, 8, N'15,0', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (9, 9, N'6', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (14, 9, N'10 лет', 4)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (24, 2, N'23', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (25, 6, N'123', 2)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (27, 9, N'4', 9)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (28, 32, N'легочной вентиляции от 35 до 50 л/мин;температуре окружающей среды от минус 40 до +60 °С;давлении воздуха в баллоне от 294 до 10 бар.', 16)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (29, 32, N'давлении воздуха в баллоне от 294 до 10 бар при температуре +20 °С;', 17)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (30, 8, N'32', 18)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (31, 9, N'412', 19)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (32, 9, N'12', 20)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (33, 9, N'12', 20)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (34, 9, N'412', 21)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (35, 9, N'412', 21)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (36, 9, N'412', 21)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (37, 9, N'142', 22)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (38, 29, N'142', 22)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (39, 30, N'124', 23)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (40, 30, N'124', 23)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (41, 30, N'124', 23)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (42, 30, N'124', 23)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (43, 9, N'312', 24)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (44, 9, N'312', 25)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (45, 7, N'32', 26)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (46, 9, N'321', 27)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (47, 7, N'24', 28)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (48, 8, N'42', 29)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (49, 7, N'42', 31)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (50, 9, N'42', 32)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (51, 8, N'421', 33)
SET IDENTITY_INSERT [dbo].[ProductsProperties] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 

INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (1, N'Длина выброса порошка, м, не менее')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (2, N'Время работы огнетушителя, с, не менее')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (3, N'Рабочее давление в пусковом резервуаре  при температуре +20 °С, кгс/см2         ')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (4, N'Огнетушитель работоспособен в диапазоне температур, оС')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (5, N'Вместимость резервуара низкого давления, л')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (6, N'Огнетушащее вещество')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (7, N'Масса огнетушащего вещества, кг')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (8, N'Масса огнетушителя в заряженном виде, кг, не более')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (9, N'Срок службы, лет

')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (29, N'GGGGG')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (30, N'Габаритные размеры ')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (31, N'GGGG')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (32, N'Свойства')
SET IDENTITY_INSERT [dbo].[Properties] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id_status], [StatusName]) VALUES (1, N'Принят')
INSERT [dbo].[Status] ([id_status], [StatusName]) VALUES (2, N'Собран')
INSERT [dbo].[Status] ([id_status], [StatusName]) VALUES (3, N'Отправлен курьером')
INSERT [dbo].[Status] ([id_status], [StatusName]) VALUES (4, N'Выполнен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [FirstName], [SecondName], [Partronumic], [NumberPhone], [Login], [Password]) VALUES (1, N'Ксения', N'Жарова', N'Отчество', N'+77777777', N'j1', N'123')
INSERT [dbo].[Users] ([id_user], [FirstName], [SecondName], [Partronumic], [NumberPhone], [Login], [Password]) VALUES (2, N'Потапов', N'Вадим', N'Петрович', N'+77777771', N'j2', N'1122')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ChangeProductsList]  WITH CHECK ADD  CONSTRAINT [FK_ChangeProductsList_LoggerProducts] FOREIGN KEY([logger_products_id])
REFERENCES [dbo].[LoggerProducts] ([id_loggerProducts])
GO
ALTER TABLE [dbo].[ChangeProductsList] CHECK CONSTRAINT [FK_ChangeProductsList_LoggerProducts]
GO
ALTER TABLE [dbo].[ChangeProductsList]  WITH CHECK ADD  CONSTRAINT [FK_ChangeProductsList_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id_product])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChangeProductsList] CHECK CONSTRAINT [FK_ChangeProductsList_Products]
GO
ALTER TABLE [dbo].[LoggerProducts]  WITH CHECK ADD  CONSTRAINT [FK_LoggerProducts_ProductsCategory1] FOREIGN KEY([productCategory_id])
REFERENCES [dbo].[ProductsCategory] ([id_productcategory])
GO
ALTER TABLE [dbo].[LoggerProducts] CHECK CONSTRAINT [FK_LoggerProducts_ProductsCategory1]
GO
ALTER TABLE [dbo].[LogsUsers]  WITH CHECK ADD  CONSTRAINT [FK_LogsUsers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[LogsUsers] CHECK CONSTRAINT [FK_LogsUsers_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([id_status])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[OrdersItem]  WITH CHECK ADD  CONSTRAINT [FK_OrdersItem_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id_order])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersItem] CHECK CONSTRAINT [FK_OrdersItem_Orders]
GO
ALTER TABLE [dbo].[OrdersItem]  WITH CHECK ADD  CONSTRAINT [FK_OrdersItem_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id_product])
GO
ALTER TABLE [dbo].[OrdersItem] CHECK CONSTRAINT [FK_OrdersItem_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductsCategory] FOREIGN KEY([productscategory_id])
REFERENCES [dbo].[ProductsCategory] ([id_productcategory])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductsCategory]
GO
ALTER TABLE [dbo].[ProductsProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProductsProperties_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id_product])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsProperties] CHECK CONSTRAINT [FK_ProductsProperties_Products]
GO
ALTER TABLE [dbo].[ProductsProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProductsProperties_Properties] FOREIGN KEY([property_id])
REFERENCES [dbo].[Properties] ([id_propertries])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsProperties] CHECK CONSTRAINT [FK_ProductsProperties_Properties]
GO
USE [master]
GO
ALTER DATABASE [KampoDB] SET  READ_WRITE 
GO
