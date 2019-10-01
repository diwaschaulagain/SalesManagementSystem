USE [master]
GO
/****** Object:  Database [BusinessManagementDB]    Script Date: 7/8/2019 10:16:59 AM ******/
CREATE DATABASE [BusinessManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BusinessManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BusinessManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BusinessManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BusinessManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BusinessManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusinessManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusinessManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BusinessManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusinessManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusinessManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusinessManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusinessManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BusinessManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [BusinessManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusinessManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusinessManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusinessManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BusinessManagementDB]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustomerPayment]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerPayment](
	[CustomerPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[PaymentDate] [date] NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[PaymentAmount] [decimal](18, 0) NULL,
	[RemainingAmount] [decimal](18, 0) NULL,
	[PaymentMode] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCustomerPayment] PRIMARY KEY CLUSTERED 
(
	[CustomerPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Salary] [decimal](18, 0) NULL,
	[Position] [nvarchar](50) NULL,
	[PaymentType] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeePayment]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeePayment](
	[EmployeePaymentId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[PaymentDate] [date] NULL,
	[Amount] [decimal](18, 0) NULL,
	[PaymentBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEmployeePayment] PRIMARY KEY CLUSTERED 
(
	[EmployeePaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[UnitId] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[SellingPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPurchase]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchase](
	[PurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseInvoiceId] [int] NULL,
	[ProductId] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[PurchaseDate] [date] NULL,
	[Tax] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblPurchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPurchaseInvoice]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseInvoice](
	[PurchaseInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[InvoiceDate] [date] NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[VendorId] [int] NULL,
 CONSTRAINT [PK_tblPurchaseInvoice] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSales]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSales](
	[SalesId] [int] IDENTITY(1,1) NOT NULL,
	[SalesInvoiceId] [int] NULL,
	[ProductId] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[SalesDate] [date] NULL,
	[Tax] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblSales] PRIMARY KEY CLUSTERED 
(
	[SalesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSalesInvoice]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSalesInvoice](
	[SalesInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[InvoiceDate] [date] NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_tblSalesInvoice] PRIMARY KEY CLUSTERED 
(
	[SalesInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStock]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tblStock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUnit]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUnit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUnit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Usertype] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVedor]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVedor](
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVendor]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVendor](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblVedor] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVendorPayment]    Script Date: 7/8/2019 10:16:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVendorPayment](
	[VendorPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NULL,
	[PaymentDate] [date] NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[PaymentAmount] [decimal](18, 0) NULL,
	[RemainingAmount] [decimal](18, 0) NULL,
	[PaymentMode] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblVendorPayment] PRIMARY KEY CLUSTERED 
(
	[VendorPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (1, N'Cold Drink')
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (4, N'Beer')
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (5, N'Whisky')
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (6, N'Vodka')
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (7, N'Rum')
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (8, N'Wine')
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName]) VALUES (9, N'Brandy')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([CustomerId], [Name], [Address], [Phone], [CompanyName], [Email]) VALUES (1, N'Aashish Sharma', N'Dhapakhel', N'345325', N'Big Mart', N'aashish@gmail.com')
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
SET IDENTITY_INSERT [dbo].[tblCustomerPayment] ON 

INSERT [dbo].[tblCustomerPayment] ([CustomerPaymentId], [CustomerId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (1, 1, CAST(0xDC3F0B00 AS Date), CAST(10454 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), CAST(8454 AS Decimal(18, 0)), N'Cash')
INSERT [dbo].[tblCustomerPayment] ([CustomerPaymentId], [CustomerId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (2, 1, CAST(0xDC3F0B00 AS Date), CAST(8454 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), CAST(6454 AS Decimal(18, 0)), N'Cash')
SET IDENTITY_INSERT [dbo].[tblCustomerPayment] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmployeeId], [Name], [Gender], [Email], [Salary], [Position], [PaymentType], [IsActive]) VALUES (1, N'Ram Bhadur', N'Male', N'', CAST(15000 AS Decimal(18, 0)), N'Driver', N'Monthly', 1)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
SET IDENTITY_INSERT [dbo].[tblEmployeePayment] ON 

INSERT [dbo].[tblEmployeePayment] ([EmployeePaymentId], [EmployeeId], [PaymentDate], [Amount], [PaymentBy]) VALUES (1, 1, CAST(0xDC3F0B00 AS Date), CAST(15000 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[tblEmployeePayment] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [UnitId], [UnitPrice], [SellingPrice]) VALUES (1, 1, N'Fanta 500 ml', 2, CAST(1500 AS Decimal(18, 0)), CAST(1600 AS Decimal(18, 0)))
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [UnitId], [UnitPrice], [SellingPrice]) VALUES (2, 1, N'Coke 250 ml', 2, CAST(400 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblPurchase] ON 

INSERT [dbo].[tblPurchase] ([PurchaseId], [PurchaseInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [PurchaseDate], [Tax]) VALUES (1, 2, 1, CAST(1500 AS Decimal(18, 0)), 7, CAST(12196 AS Decimal(18, 0)), CAST(0xD93F0B00 AS Date), CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[tblPurchase] ([PurchaseId], [PurchaseInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [PurchaseDate], [Tax]) VALUES (2, 2, 2, CAST(400 AS Decimal(18, 0)), 9, CAST(4218 AS Decimal(18, 0)), CAST(0xD93F0B00 AS Date), CAST(16 AS Decimal(18, 0)))
INSERT [dbo].[tblPurchase] ([PurchaseId], [PurchaseInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [PurchaseDate], [Tax]) VALUES (3, 3, 1, CAST(1500 AS Decimal(18, 0)), 6, CAST(10454 AS Decimal(18, 0)), CAST(0xDA3F0B00 AS Date), CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[tblPurchase] ([PurchaseId], [PurchaseInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [PurchaseDate], [Tax]) VALUES (4, 3, 2, CAST(400 AS Decimal(18, 0)), 8, CAST(3717 AS Decimal(18, 0)), CAST(0xDA3F0B00 AS Date), CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[tblPurchase] ([PurchaseId], [PurchaseInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [PurchaseDate], [Tax]) VALUES (5, 4, 1, CAST(1500 AS Decimal(18, 0)), 8, CAST(13938 AS Decimal(18, 0)), CAST(0xDA3F0B00 AS Date), CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[tblPurchase] ([PurchaseId], [PurchaseInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [PurchaseDate], [Tax]) VALUES (6, 5, 2, CAST(400 AS Decimal(18, 0)), 7, CAST(3252 AS Decimal(18, 0)), CAST(0xDA3F0B00 AS Date), CAST(15 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblPurchase] OFF
SET IDENTITY_INSERT [dbo].[tblPurchaseInvoice] ON 

INSERT [dbo].[tblPurchaseInvoice] ([PurchaseInvoiceId], [InvoiceNo], [InvoiceDate], [GrandTotal], [VendorId]) VALUES (1, N'PUR-1', CAST(0x243F0B00 AS Date), CAST(50000 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblPurchaseInvoice] ([PurchaseInvoiceId], [InvoiceNo], [InvoiceDate], [GrandTotal], [VendorId]) VALUES (2, N'PUR-2', CAST(0xD93F0B00 AS Date), CAST(16414 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblPurchaseInvoice] ([PurchaseInvoiceId], [InvoiceNo], [InvoiceDate], [GrandTotal], [VendorId]) VALUES (3, N'PUR-3', CAST(0xDA3F0B00 AS Date), CAST(14170 AS Decimal(18, 0)), 2)
INSERT [dbo].[tblPurchaseInvoice] ([PurchaseInvoiceId], [InvoiceNo], [InvoiceDate], [GrandTotal], [VendorId]) VALUES (4, N'PUR-4', CAST(0xDA3F0B00 AS Date), CAST(13938 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblPurchaseInvoice] ([PurchaseInvoiceId], [InvoiceNo], [InvoiceDate], [GrandTotal], [VendorId]) VALUES (5, N'PUR-5', CAST(0xDA3F0B00 AS Date), CAST(3252 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[tblPurchaseInvoice] OFF
SET IDENTITY_INSERT [dbo].[tblSales] ON 

INSERT [dbo].[tblSales] ([SalesId], [SalesInvoiceId], [ProductId], [UnitPrice], [Quantity], [Total], [SalesDate], [Tax]) VALUES (1, 1, 1, CAST(1500 AS Decimal(18, 0)), 6, CAST(10454 AS Decimal(18, 0)), CAST(0xDC3F0B00 AS Date), CAST(15 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblSales] OFF
SET IDENTITY_INSERT [dbo].[tblSalesInvoice] ON 

INSERT [dbo].[tblSalesInvoice] ([SalesInvoiceId], [InvoiceNo], [InvoiceDate], [GrandTotal], [CustomerId]) VALUES (1, N'SL-1', CAST(0xDC3F0B00 AS Date), CAST(10454 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[tblSalesInvoice] OFF
SET IDENTITY_INSERT [dbo].[tblStock] ON 

INSERT [dbo].[tblStock] ([StockId], [ProductId], [Quantity]) VALUES (1, 1, 15)
INSERT [dbo].[tblStock] ([StockId], [ProductId], [Quantity]) VALUES (2, 2, 4)
SET IDENTITY_INSERT [dbo].[tblStock] OFF
SET IDENTITY_INSERT [dbo].[tblUnit] ON 

INSERT [dbo].[tblUnit] ([UnitId], [UnitName]) VALUES (1, N'Box')
INSERT [dbo].[tblUnit] ([UnitId], [UnitName]) VALUES (2, N'Case')
INSERT [dbo].[tblUnit] ([UnitId], [UnitName]) VALUES (3, N'Crate')
SET IDENTITY_INSERT [dbo].[tblUnit] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [Username], [Password], [Usertype], [Fullname]) VALUES (1, N'sakshat', N'sakshat', N'Admin', N'Sakshat Budhathoki')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
SET IDENTITY_INSERT [dbo].[tblVendor] ON 

INSERT [dbo].[tblVendor] ([VendorId], [Name], [Address], [PhoneNo], [CompanyName], [Email]) VALUES (1, N'Sunil Chaudhary', N'Kathmandu', N'342532', N'Bottlers Nepal', N'suneel@gmail.com')
INSERT [dbo].[tblVendor] ([VendorId], [Name], [Address], [PhoneNo], [CompanyName], [Email]) VALUES (2, N'Bikash Adhikari', N'Bhaktapur, Nepal', N'3253245', N'XYZ', N'bikash@gmail.com')
SET IDENTITY_INSERT [dbo].[tblVendor] OFF
SET IDENTITY_INSERT [dbo].[tblVendorPayment] ON 

INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (1, 1, CAST(0xD93F0B00 AS Date), CAST(16414 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(6414 AS Decimal(18, 0)), N'Cash')
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (2, 1, CAST(0xDA3F0B00 AS Date), CAST(6414 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), CAST(1414 AS Decimal(18, 0)), N'Cash')
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (3, 1, CAST(0xDA3F0B00 AS Date), CAST(1414 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(914 AS Decimal(18, 0)), N'Cash')
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (4, 2, CAST(0xDA3F0B00 AS Date), CAST(14170 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), CAST(9170 AS Decimal(18, 0)), N'Cash')
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (5, 2, CAST(0xDA3F0B00 AS Date), CAST(9170 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), CAST(6170 AS Decimal(18, 0)), N'Cash')
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (6, 1, CAST(0xDA3F0B00 AS Date), CAST(14852 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), CAST(11852 AS Decimal(18, 0)), NULL)
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (7, 1, CAST(0xDA3F0B00 AS Date), CAST(15104 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), CAST(13104 AS Decimal(18, 0)), NULL)
INSERT [dbo].[tblVendorPayment] ([VendorPaymentId], [VendorId], [PaymentDate], [TotalAmount], [PaymentAmount], [RemainingAmount], [PaymentMode]) VALUES (8, 1, CAST(0xDA3F0B00 AS Date), CAST(13104 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(3104 AS Decimal(18, 0)), N'Cash')
SET IDENTITY_INSERT [dbo].[tblVendorPayment] OFF
ALTER TABLE [dbo].[tblCustomerPayment]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerPayment_tblCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCustomerPayment] CHECK CONSTRAINT [FK_tblCustomerPayment_tblCustomer]
GO
ALTER TABLE [dbo].[tblEmployeePayment]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeePayment_tblEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployee] ([EmployeeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployeePayment] CHECK CONSTRAINT [FK_tblEmployeePayment_tblEmployee]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblCategory] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblUnit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[tblUnit] ([UnitId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblUnit]
GO
ALTER TABLE [dbo].[tblPurchase]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchase_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPurchase] CHECK CONSTRAINT [FK_tblPurchase_tblProduct]
GO
ALTER TABLE [dbo].[tblPurchase]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchase_tblPurchaseInvoice] FOREIGN KEY([PurchaseInvoiceId])
REFERENCES [dbo].[tblPurchaseInvoice] ([PurchaseInvoiceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPurchase] CHECK CONSTRAINT [FK_tblPurchase_tblPurchaseInvoice]
GO
ALTER TABLE [dbo].[tblPurchaseInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseInvoice_tblVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[tblVendor] ([VendorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPurchaseInvoice] CHECK CONSTRAINT [FK_tblPurchaseInvoice_tblVendor]
GO
ALTER TABLE [dbo].[tblSales]  WITH CHECK ADD  CONSTRAINT [FK_tblSales_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSales] CHECK CONSTRAINT [FK_tblSales_tblProduct]
GO
ALTER TABLE [dbo].[tblSales]  WITH CHECK ADD  CONSTRAINT [FK_tblSales_tblSalesInvoice] FOREIGN KEY([SalesInvoiceId])
REFERENCES [dbo].[tblSalesInvoice] ([SalesInvoiceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSales] CHECK CONSTRAINT [FK_tblSales_tblSalesInvoice]
GO
ALTER TABLE [dbo].[tblSalesInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblSalesInvoice_tblCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSalesInvoice] CHECK CONSTRAINT [FK_tblSalesInvoice_tblCustomer]
GO
ALTER TABLE [dbo].[tblStock]  WITH CHECK ADD  CONSTRAINT [FK_tblStock_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStock] CHECK CONSTRAINT [FK_tblStock_tblProduct]
GO
ALTER TABLE [dbo].[tblVendorPayment]  WITH CHECK ADD  CONSTRAINT [FK_tblVendorPayment_tblVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[tblVendor] ([VendorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblVendorPayment] CHECK CONSTRAINT [FK_tblVendorPayment_tblVendor]
GO
USE [master]
GO
ALTER DATABASE [BusinessManagementDB] SET  READ_WRITE 
GO
