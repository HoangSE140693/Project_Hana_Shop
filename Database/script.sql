USE [master]
GO
/****** Object:  Database [Hana_Shop]    Script Date: 02/11/2021 1:29:12 SA ******/
CREATE DATABASE [Hana_Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hana_Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hana_Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hana_Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hana_Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hana_Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hana_Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hana_Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hana_Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hana_Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hana_Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hana_Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hana_Shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hana_Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hana_Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hana_Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hana_Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hana_Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hana_Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hana_Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hana_Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hana_Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hana_Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hana_Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hana_Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hana_Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hana_Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hana_Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hana_Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hana_Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hana_Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Hana_Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hana_Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hana_Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hana_Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hana_Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hana_Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hana_Shop] SET QUERY_STORE = OFF
GO
USE [Hana_Shop]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 02/11/2021 1:29:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategorys] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 02/11/2021 1:29:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[OrderDetailID] [varchar](10) NOT NULL,
	[OrderID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 02/11/2021 1:29:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [varchar](10) NOT NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[DateOrder] [varchar](10) NOT NULL,
	[TotalMoney] [float] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 02/11/2021 1:29:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ProductID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreateDate] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblFoods] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUpdateHistory]    Script Date: 02/11/2021 1:29:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUpdateHistory](
	[ID] [int] NOT NULL,
	[DateOfUpdate] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[UserID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblUpdateHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 02/11/2021 1:29:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[Role] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (N'1', N'Jewelry')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (N'2', N'Home Decor')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (N'3', N'Clothing, Shoes & Accessories')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (N'4', N'Toy')
INSERT [dbo].[tblCategories] ([CategoryID], [CategoryName]) VALUES (N'5', N'Other')
GO
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'1', N'1', N'P03', 2, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'10', N'5', N'P11', 1, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'11', N'5', N'P08', 2, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'12', N'5', N'P10', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'13', N'6', N'P08', 6, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'14', N'7', N'P16', 5, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'15', N'8', N'P16', 2, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'16', N'9', N'P08', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'17', N'10', N'P11', 1, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'18', N'10', N'P08', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'19', N'11', N'P06', 1, 5)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'2', N'1', N'P13', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'20', N'12', N'P09', 1, 20)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'21', N'13', N'P10', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'22', N'14', N'P08', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'23', N'15', N'P01', 1, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'24', N'16', N'P01', 1, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'25', N'17', N'P13', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'26', N'18', N'P13', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'27', N'19', N'P13', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'28', N'20', N'P09', 1, 20)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'29', N'21', N'P09', 1, 20)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'3', N'2', N'P13', 7, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'30', N'22', N'P09', 1, 20)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'31', N'23', N'P04', 1, 3)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'32', N'24', N'P03', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'33', N'24', N'P04', 1, 3)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'4', N'3', N'P13', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'5', N'3', N'P10', 3, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'6', N'4', N'P01', 1, 10)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'7', N'4', N'P13', 1, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'8', N'4', N'P08', 2, 4)
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (N'9', N'4', N'P10', 1, 4)
GO
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'1', N'user1', N'2021-01-21', 12)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'10', N'user1', N'2021-11-01', 14)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'11', N'user1', N'2021-11-01', 5)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'12', N'user1', N'2021-11-01', 20)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'13', N'user1', N'2021-11-02', 4)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'14', N'user1', N'2021-11-02', 4)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'15', N'user1', N'2021-11-02', 10)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'16', N'user1', N'2021-11-02', 10)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'17', N'user1', N'2021-11-02', 4)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'18', N'user1', N'2021-11-02', 4)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'19', N'user1', N'2021-11-02', 4)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'2', N'user1', N'2021-01-23', 28)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'20', N'user1', N'2021-11-02', 20)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'21', N'user1', N'2021-11-02', 20)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'22', N'user1', N'2021-11-02', 20)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'23', N'user1', N'2021-11-02', 3)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'24', N'user1', N'2021-11-02', 7)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'3', N'user1', N'2021-01-23', 16)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'4', N'user2', N'2021-01-23', 26)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'5', N'user2', N'2021-01-27', 22)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'6', N'user1', N'2021-01-27', 24)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'7', N'user2', N'2021-04-10', 50)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'8', N'user2', N'2021-04-10', 20)
INSERT [dbo].[tblOrders] ([OrderID], [CustomerID], [DateOrder], [TotalMoney]) VALUES (N'9', N'user1', N'2021-11-01', 4)
GO
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P01', N'Sauna, Russian bathhouse, bucket for shower ', N'https://m.media-amazon.com/images/I/61IafZ2D29L._SL1000_.jpg', 10, N'2', 7, 1, N'2021-01-17', N'NEW LINDEN Wood Waterfall Bucket Extremely Freshing FOR: Sauna, Bath, SPA, Pool, Jacuzzi, Shower. Made from 100% ecological materials. Was made without using varnish and glue. Material: High quality old linden. Available size of the Waterfall Bucket is: 10 Liters - 2.64 Gallons - 500 x 345 x 600 - Weight: 7,6 kg / 16,7 lb Recommended mounting height: 2.1 m / 6.9 ft.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P02', N'Live Edge Cherry Wood Naturally Form', N'https://m.media-amazon.com/images/I/71a1zkOhaoL._SL1500_.jpg', 10, N'2', 20, 1, N'2021-01-20', N'Materials: Cherry Wood Slab, Solid Iron Legs, Solid Iron Connecting Parts Application: It is Live Edge in raw form. Only preventive maintenance oil has been applied. (Natural linseed oil) (As seen in the pictures. Please look at the pictures carefully.)')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P03', N'Live Edge Olive Tree Root Amazing Naturally', N'https://m.media-amazon.com/images/I/81AdCD2rJKL._SL1500_.jpg', 4, N'2', 19, 1, N'2021-01-18', N'Live Edge Olive Tree Root Amazing Naturally Form Wood Slab, Big Coffee Table 81 X 64 cm Materials: One whole, Natural Olive Tree Root wood slab - One whole, 3 pc Solid Iron Chain Legs, (durable) Application: Only applied, colorless protective varnish. All products are natural patterns and natural colors. ')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P04', N'Telepathy Friendship Lamps', N'https://m.media-amazon.com/images/I/81LnYEcz9RL._SL1500_.jpg', 3, N'2', 98, 1, N'2021-01-18', N'When loved ones are away, but love finds its way - Telepathy long distance touch lamps
Touch on your lamp and your loved one''s lamp would light up in same color
More than 200 different color shades. Set color for your mood in this friendship lamp
A push button switch given for using it as a conventional night lamp whenever needed
Home icon appears on top, only when the lamp lights up. Hence reminding your loved ones of family back home.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P05', N'Working Man''s Leather Belt', N'https://m.media-amazon.com/images/I/61m324hmZuL._SL1000_.jpg', 4, N'3', 25, 1, N'2021-01-18', N'For proper sizing we suggest one size larger than you normal pant size, so if you typically wear 32” waist pants, please select one of our size 34 belts. The Working Man’s Belt by American Bench Craft is 1.5” wide and more than 1/8” thick. The buckle we use with our Working Man’s Belt is secured with snap fasteners, so the buckle can easily be switched out with your own custom buckle if you prefer. Our black leather Working Man’s Belt is available with stainless steel hardware, and our brown leather belt is available with solid brass. Our belts are heavy-duty, rugged and extremely durable. They can be stylishly worn with any pair of jeans, khaki pants or shorts.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P06', N'Fingerless Writing Gloves', N'https://m.media-amazon.com/images/I/51YuI8u9q7L.jpg', 5, N'3', 24, 1, N'2021-01-18', N'Brood on lost Lenore with The Raven Writing Gloves featuring text straight from Edgar Allan Poe''s classic poem!

Our Writing Gloves are made from American-made, super soft 100% cotton knit fabric. The open palm circumference is about 8" and the arm band is about 7" around. The inseam on these black and gray fingerless gloves have a decorative serged detail created from a contrasting, silky stretch thread and the outside seam has a gathered design for a more dramatic statement.
')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P07', N'Hobbes Tiger', N'https://m.media-amazon.com/images/I/91kJT-c0d1L._SL1500_.jpg', 12.5, N'4', 25, 1, N'2021-01-19', N'-> This listing is for one 14'''' crocheted Hobbes with red scarf. This scarf is removable. 
-> He is handmade by me. He is crocheted by high quality super soft milk cotton yarn, then filled with high quality poly. 
-> Hobbes is the cute tiger in Calvin and Hobbes series, by Mr. Bill Waterson.
-> He is handmade and crocheted by me so the quality is perfect. I will check every item before I ship out.
-> He is an unique and special gift to anyone who loves Calvin and Hobbes.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P08', N'Organic Wooden Toy Car', N'https://m.media-amazon.com/images/I/41zrh-JXjyL.jpg', 4, N'4', 14, 1, N'2021-01-14', N'I am glad to present you one of more than 150 handmade wooden toys in my shop. I present a novelty of my shop - a truck crane with two passengers. This toy is ideal for your small builder. The set includes 4 blocks of different types of wood: oak, beech, maple and linden. They are equipped with magnets, which allows you to move blocks. The size of the machine is 20x7x10 cm, the size of blocks 5x5x1 cm Peg size 5x1 cm. This item is handmade and may be slightly different wood grain and tone than in the pictures: you get a unique piece!')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P09', N'Legendary Hand Cannon', N'https://m.media-amazon.com/images/I/A1dJa0hjo1L._SL1500_.jpg', 20, N'4', 1, 1, N'2021-01-15', N'Fatebringer is a legendary hand cannon. This item is 3D printed at 20% infill. Printed in color PLA plastic. The hand cannon is about 13 inches(approx. 330mm). Shipping: $10 with Post Office. Check out my shop for more props.**This is not an officially licensed product and is only considered Fan Art, the item is 3D modeled, 3D printed and assembled by me.**')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P10', N'Cute Kawaii Succulent Plant Love', N'https://m.media-amazon.com/images/I/71EgpsT9QlL._SL1500_.jpg', 4, N'5', 19, 1, N'2021-01-14', N'"I''m a Succa for You!" This card is perfect for succulent fans and plant lovers! This happy and cute kawaii succulent will let you significant other know how much you''re into them. Perfect for Valentine''s Day, or for anniversaries, birthdays, or just to say I love you.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P11', N'Cute Bird Birthday Greeting Card', N'https://m.media-amazon.com/images/I/71mQeRZUrRL._SL1500_.jpg', 10, N'5', 23, 1, N'2021-01-14', N'Happy Bird-Day! A super cute Happy Birthday bird pun card with a little bird in a party hat with a party blower. This is a high quality card print of my original vector art drawing.

Card size is 4.25 x 5.5 inches
Blank inside for your personal message
Printed on premium recycled stock and comes with a matching white envelope.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P12', N'Custom Engraved Wooden Watch for Men', N'https://m.media-amazon.com/images/I/91Mi+baJOeL._SL1500_.jpg', 4, N'1', 25, 1, N'2021-01-18', N'- Fine Wooden Craftsmanship, very light, comfortable to wear and durable. We are providing High Quality Product along with the Reasonable Price.
- Accurate Japanese Quartz Movement. Japan Miyota 2035 quartz movement to guarantee accurate time, the original battery that can last more than 2 years.
- FREE Engraving. We''ll laser engrave your custom messages on the back of the wooden case making it one-of-a-kind watch.
- Make someone you love happy. The wood watch is great gift idea for your husband, boyfriend, brother, father, son, best friend, even your grandpa. Also it''s an ideal gift for many occasions such as Birthday, Anniversary, Christmas Day, and also for Wedding Ocassions to Groomsmen and Best Man')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P13', N'Wire braided Teal blue sea glass necklace', N'https://m.media-amazon.com/images/I/510V4GcbvkL._SL1200_.jpg', 4, N'1', 12, 1, N'2021-01-16', N'Aloha!This jewelry reflects my love for our beautiful islands of Hawaii and brings forth our “Hawaii Aloha Spirit”.

Jewelry will be made to order and shipped directly from Hawaii. Items that are available for Prime will be shipped from the mainland Amazon warehouse for faster shipping.

This is a sea glass pendant with a silver chain. I normally make and ship the chain at around 20 inches long with a lobster claw catch. If you prefer a different length (30 inches and shorter), please contact me first, I’d be happy to make a custom listing for you

“Purple glass may change color under different lighting conditions. It will appear purple under sunlight, light purple under daylight bulb indoor, and may appear clear, pink, even blue under some indoor light and fluorescent light.”')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P14', N'Hip Hop Enamel Pin', N'https://m.media-amazon.com/images/I/71wMPdhptcS._SL1500_.jpg', 4, N'1', 25, 1, N'2021-01-19', N'Add our Hip Hop Enamel Pin to your collection! Great quality and detail! - High Quality Soft Enamel - Measures 2" Inches High - 2 Backing Post')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P15', N'Avogato Enamel Pin', N'https://m.media-amazon.com/images/I/81JqcCHvPvL._SL1500_.jpg', 12, N'1', 100, 1, N'2021-01-20', N'Add our Dino Mashup Enamel Pin to your collection! Great quality and detail! - High Quality Soft Enamel - Measures 2" Inches High - 2 Backing Post')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P16', N'Patchwork Heart Wood Card', N'https://m.media-amazon.com/images/I/81nzOKAy6WL._SL1500_.jpg', 10, N'5', 0, 1, N'2021-01-23', N'We love how the geometric shapes in our patchwork heart card come together to complete one large heart. This card is perfect for a variety of occasions to let someone special know they have a place in your heart. There’s nothing better than a reminder that no one has a love like yours. Send your most significant a special message that shows how important they are. Beautiful thoughts laser cut into the warmth of natural wood make your gesture of love something to keep and remember.')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P17', N'Labradorite Silver Ring', N'https://m.media-amazon.com/images/I/61ExaQaiMBL._SL1500_.jpg', 10, N'1', 0, 0, N'2021-01-23', N'Labradorite is a gemstone that was named after Labrador in Canada, where it was found on the Isle of Paul, near Nain in 1770. It has since been found in other places, including Finland, Madagascar, and Australia. After its discovery, labradorite became popular with the missionaries. Labradorite is a plagioclase feldspar which shows adularescence (a white or bluish light seen when turned)')
INSERT [dbo].[tblProducts] ([ProductID], [Name], [Image], [Price], [CategoryID], [Quantity], [Status], [CreateDate], [Description]) VALUES (N'P18', N'Larimar Stone Ring', N'https://m.media-amazon.com/images/I/51tM7TE9xrL._SL1237_.jpg', 0, N'1', 2, 0, N'2021-01-23', N'"SILVERPALACECO" Jewelry brings you jewelry made of only the very best materials that won’t tarnish. This gorgeous and timeless ring is made from 925 sterling silver and Larimar Stone in a bezel setting. ')
GO
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (1, N'2021-01-23', N'P11', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (2, N'2021-01-23', N'P03', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (3, N'2021-01-23', N'P07', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (4, N'2021-01-23', N'P02', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (5, N'2021-01-23', N'P06', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (6, N'2021-01-23', N'P08', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (7, N'2021-01-23', N'P14', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (8, N'2021-01-23', N'P07', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (9, N'2021-01-23', N'P02', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (10, N'2021-01-23', N'P06', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (11, N'2021-01-23', N'P08', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (12, N'2021-01-23', N'P11', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (13, N'2021-01-23', N'P12', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (14, N'2021-01-23', N'P11', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (15, N'2021-01-23', N'P08', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (16, N'2021-01-23', N'P08', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (17, N'2021-01-23', N'P10', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (18, N'2021-01-23', N'P07', N'admin')
INSERT [dbo].[tblUpdateHistory] ([ID], [DateOfUpdate], [ProductID], [UserID]) VALUES (19, N'2021-04-09', N'P18', N'admin')
GO
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Email], [Address], [SDT], [Role]) VALUES (N'admin', N'Diệp Đặng Huy Hoàng', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'hoangddhse140693@fpt.edu.vn', N'Gia Biện, Phú Giáo, Bình Dương', N'0967275854', N'admin')
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Email], [Address], [SDT], [Role]) VALUES (N'user1', N'Cao Van Truong', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'tomvip9a2@gmail.com', N'Cu Chi, tp.HCM', N'0123456789', N'user')
INSERT [dbo].[tblUsers] ([UserID], [Name], [Password], [Email], [Address], [SDT], [Role]) VALUES (N'user2', N'Tran Gia Nguyen', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'hoangtomtl@gmail.com', N'Q9, TP.HCM', N'0987654321', N'user')
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ProductID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategories]
GO
ALTER TABLE [dbo].[tblUpdateHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblUpdateHistory_tblProducts] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ProductID])
GO
ALTER TABLE [dbo].[tblUpdateHistory] CHECK CONSTRAINT [FK_tblUpdateHistory_tblProducts]
GO
ALTER TABLE [dbo].[tblUpdateHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblUpdateHistory_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblUpdateHistory] CHECK CONSTRAINT [FK_tblUpdateHistory_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [Hana_Shop] SET  READ_WRITE 
GO
