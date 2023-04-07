USE [master]
GO
/****** Object:  Database [KampoDB]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[LogsUsers]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[OrdersItem]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[ProductsCategory]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[ProductsProperties]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[Properties]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 07.04.2023 7:55:46 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 07.04.2023 7:55:46 ******/
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
SET IDENTITY_INSERT [dbo].[LogsUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id_order], [status_id], [NumberOrder], [DateCreated], [DateComplete]) VALUES (5, 4, N'31213', CAST(N'2023-04-07' AS Date), CAST(N'2023-04-07' AS Date))
INSERT [dbo].[Orders] ([id_order], [status_id], [NumberOrder], [DateCreated], [DateComplete]) VALUES (6, 1, N'GDFGDF1243', CAST(N'2023-04-07' AS Date), NULL)
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
SET IDENTITY_INSERT [dbo].[OrdersItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (1, N'Проект 23370', 1, N'Многофункциональные модульные катера проекта 23370 предназначены для выполнения поисковых, аварийно-спасательных и подводно-технических работ в портах и в прибрежной морской зоне.', 394, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (2, N'Проект 23370М', 1, N'Многофункциональный модульный катер проекта 23370М предназначен для выполнения поисковых, аварийно-спасательных и подводно-технических работ, в том числе для обеспечения водолазных спусков, в  портах, на открытых рейдах, в гаванях и прибрежных районах.', 4, N'https://ship.kampo.ru/sites/default/files/resize/novost/23370m_2-300x200.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (3, N'Катер-бонопостановщик проекта 03570
', 2, N'Возможность транспортировки катера обычными видами грузового транспорта и его постановки на берег для хранения в зимний период и ремонта, без применения специальных кильблоков;', 4, N'https://ship.kampo.ru/sites/default/files/1_7.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (4, N'gdfgd', 1, N'gdfgdfgf', 37, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (5, N'пвы', 1, N'пвы', 21, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (6, N'Test3', 1, N'dfgd', 3399, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (7, N'TestLogs1', 1, N'gdsg', 123, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (8, N'fsd', 2, N'dfs', 123, N'https://ship.kampo.ru/sites/default/files/katalog/mnogofunkcionalnoe_rabochee_sudno_proekta_02530._buksirovka_rabochey_ploshchadki.jpg')
INSERT [dbo].[Products] ([id_product], [ProductName], [productscategory_id], [ProductDescription], [CountProduct], [ImageUrl]) VALUES (9, N'TestProduct', 1, N'fds', 4385, N'https://ship.kampo.ru/sites/default/files/katalog/23370.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsCategory] ON 

INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (1, N'Многофункциональные суда и катера')
INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (2, N'Буксирно-моторные катера и бонопостановщики')
INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (3, N'Модульные понтонные системы')
INSERT [dbo].[ProductsCategory] ([id_productcategory], [CategoryName]) VALUES (4, N'Контейнеризированные комплексы')
SET IDENTITY_INSERT [dbo].[ProductsCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsProperties] ON 

INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (1, 1, N'20х9 м', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (2, 2, N'8-9 узлов', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (3, 3, N'1,5 м', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (4, 4, N'1,5 м', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (5, 5, N'100 т', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (6, 6, N'3 сут.', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (7, 7, N'3 чел.', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (8, 8, N'до 5 чел.', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (9, 9, N'не менее 250 миль', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (10, 10, N'не менее 340 миль', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (11, 11, N'4 балла', 1)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (14, 1, N'21', 4)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (15, 2, N'233', 4)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (16, 2, N'22', 5)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (17, 7, N'3', 5)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (18, 1, N'gdsgds', 6)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (19, 3, N'gdfsgfdg', 6)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (20, 9, N'werwwre', 6)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (21, 1, N'gdf', 7)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (22, 5, N'3', 7)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (23, 12, N'1', 7)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (24, 2, N'23', 8)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (25, 6, N'123', 8)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (26, 12, N'23', 8)
INSERT [dbo].[ProductsProperties] ([id_productproperties], [property_id], [ValueProperty], [product_id]) VALUES (27, 8, N'4', 9)
SET IDENTITY_INSERT [dbo].[ProductsProperties] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 

INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (1, N'Габаритные размерения')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (2, N'Скорость полного хода')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (3, N'Осадка при полном водоизмещении')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (4, N'Высота надводного борта на миделе')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (5, N'Водоизмещение')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (6, N'Автономность')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (7, N'Экипаж')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (8, N'Спецперсонал')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (9, N'Дальность плавания полным ходом')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (10, N'Дальность плавания экономическим ходом')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (11, N'Мореходность')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (12, N'Класс РРР')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (13, N'Длина габаритная')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (14, N'Ширина габаритная')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (15, N'Высота борта на миделе')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (16, N'Осадка')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (17, N'Полное водоизмещение')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (19, N'Спецперсонал')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (20, N'Мощность двигателей')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (21, N'Скорость полного хода')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (22, N'Тяговое усилие на швартовых')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (23, N'Габаритные размерения')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (24, N' Количество понтонных модулей')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (25, N'Высота надводного борта')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (26, N'Грузоподъемность')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (27, N'Удельная прочность палубы')
INSERT [dbo].[Properties] ([id_propertries], [NameProperty]) VALUES (28, N'Условия эксплуатации')
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

INSERT [dbo].[Users] ([id_user], [FirstName], [SecondName], [Partronumic], [NumberPhone], [Login], [Password]) VALUES (1, N'Ксения', N'Жарова', N'Отчество', N'+77777777', N'Jarova', N'Jarova')
SET IDENTITY_INSERT [dbo].[Users] OFF
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
