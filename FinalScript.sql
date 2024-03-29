USE [master]
GO
/****** Object:  Database [MedicineMonitoringSystem]    Script Date: 03/30/2019 4:39:22 PM ******/
CREATE DATABASE [MedicineMonitoringSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedicineMonitoringSystem', FILENAME = N'D:\Naresh1\MedicineMonitoringSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MedicineMonitoringSystem_log', FILENAME = N'D:\Naresh1\MedicineMonitoringSystem_log.ldf' , SIZE = 768KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [MedicineMonitoringSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedicineMonitoringSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedicineMonitoringSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET  MULTI_USER 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedicineMonitoringSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedicineMonitoringSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedicineMonitoringSystem', N'ON'
GO
USE [MedicineMonitoringSystem]
GO
/****** Object:  Table [dbo].[BranchAdminRegistration]    Script Date: 03/30/2019 4:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchAdminRegistration](
	[Branch_Admin_Id] [numeric](4, 0) IDENTITY(1000,1) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[Present_Address] [nvarchar](max) NOT NULL,
	[Permanent_Address] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Email_Address] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](6) NOT NULL,
	[Marital_Status] [nvarchar](10) NOT NULL,
	[Contact_Number] [nvarchar](10) NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[Id_Proof_Type] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](6) NULL,
 CONSTRAINT [PK_BranchAdminRegistration] PRIMARY KEY CLUSTERED 
(
	[Branch_Admin_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineDetailsRegistration]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineDetailsRegistration](
	[Medicine_Type_Id] [nvarchar](5) NOT NULL,
	[Registration_Date] [date] NOT NULL,
	[Medicine_Name] [nvarchar](50) NOT NULL,
	[Number_Of_Medicine] [numeric](18, 0) NOT NULL,
	[Manufactured_Date] [date] NOT NULL,
	[Expiry_Date] [date] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MedicineDetailsRegistration] PRIMARY KEY CLUSTERED 
(
	[Medicine_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineRequest]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineRequest](
	[Request_Id] [nvarchar](6) NOT NULL CONSTRAINT [DF_MedicineRequest_Request_Id]  DEFAULT (N'REQ000'),
	[Medicine_Id] [nvarchar](5) NOT NULL,
	[Dosage] [numeric](18, 0) NOT NULL,
	[Number_Of_Medicine] [numeric](18, 0) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Branch_Admin_Id] [numeric](4, 0) NOT NULL,
	[Status] [nvarchar](50) NOT NULL CONSTRAINT [DF_MedicineRequest_Status]  DEFAULT (N'Pending'),
 CONSTRAINT [PK_MedicineRequest] PRIMARY KEY CLUSTERED 
(
	[Request_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockDetailsRegistration]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockDetailsRegistration](
	[Stock_Id] [nvarchar](6) NOT NULL CONSTRAINT [DF_StockDetailsRegistration_Stock_Id]  DEFAULT (N'ST0000'),
	[Registration_Date] [date] NOT NULL,
	[Medicine_Id] [nvarchar](5) NOT NULL,
	[Branch_Admin_Id] [numeric](4, 0) NOT NULL,
	[Number_Of_Strips] [numeric](18, 0) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StockDetailsRegistration] PRIMARY KEY CLUSTERED 
(
	[Stock_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BranchAdminRegistration] ON 

INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1001 AS Numeric(4, 0)), N'3', N'3', N'3', N'3', N'3', N'3', N'34', N'4', N'4', N'4', N'4', CAST(N'2019-01-01' AS Date), N'4', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1012 AS Numeric(4, 0)), N'kdfhgkj', N'nfgfdlgn', N'jgmjlfnl', N'ndkgnkd', N'ngkjsrfng', N'Madhya Pradesh', N'India', N'ngfvkjs@gmail.com', N'Male', N'Single', N'2222222222', CAST(N'1995-01-02' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1013 AS Numeric(4, 0)), N'bhgkjdfbgk', N'lkdrgldfng', N'lkjnbldjgbl', N'jessjgrdjg', N'`ldglkfg', N'Jammu and Kashmir', N'India', N'jlfjglf@gmail.com', N'Female', N'Single', N'5555555555', CAST(N'1996-02-03' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1014 AS Numeric(4, 0)), N'gkjrfgll', N'jrgjrdjgmj', N'kh;k;dh', N'kg;rk;r', N'l;fhj', N'Rajasthan', N'India', N'fkgnkd@gmail.com', N'Female', N'Married', N'6666666666', CAST(N'1998-03-05' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1015 AS Numeric(4, 0)), N'hg', N'jlfg', N'djgdfjg', N'glkdmg', N'dlmglsm', N'Tamil Nadu', N'India', N'mbhfdnhl@gamil.com', N'Male', N'Single', N'8888888888', CAST(N'1996-05-06' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1016 AS Numeric(4, 0)), N'jngd', N'ldkghdfg', N'jldjhdf', N'jgrrjm', N'rtdjhrdj', N'Nagaland', N'India', N'mjlkfhd@glrrgn.com', N'Female', N'Divorced', N'6666666666', CAST(N'1998-03-02' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1017 AS Numeric(4, 0)), N'lkrdgld', N'jldrjgord', N'ldrgnlr', N'lkjgeg', N'jglrsg', N'Lakshadweep', N'India', N'ljfdgr@gmail.com', N'Male', N'Divorced', N'5555555555', CAST(N'1999-12-02' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1018 AS Numeric(4, 0)), N'girdhied', N'jgordjogj', N'jdtljh', N'jtdhjd', N'jghj', N'Haryana', N'India', N'fghlrfg@gmail.com', N'Female', N'Single', N'5555555555', CAST(N'1996-02-05' AS Date), N'Passport', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1019 AS Numeric(4, 0)), N'urgh', N'rlglr', N'jldfghlfdj', N'JLFDDJGLDFJ', N'K;GJ;RSRJ', N'Goa', N'India', N'JLRFGJ@GMAIL.COM', N'Male', N'Married', N'5555555555', CAST(N'1996-02-05' AS Date), N'Voter ID', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1020 AS Numeric(4, 0)), N'ayeshaji', N'parveen', N'bhbcccc', N'cca', N'1234', N'Mizoram', N'India', N'a@gmail.com', N'Female', N'Single', N'5555555555', CAST(N'2019-03-22' AS Date), N'GMV1234', NULL)
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1021 AS Numeric(4, 0)), N'juili', N'gaikwad', N'jh', N'hj', N'1', N'Andhra Pradesh', N'India', N'a@gmail.com', N'Male', N'Married', N'5555555555', CAST(N'2016-07-06' AS Date), N'GMV1234', N'0')
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1022 AS Numeric(4, 0)), N'juili', N'gaikwad', N'1', N'1', N'1', N'Maharashtra', N'India', N'a@gmail.com', N'Female', N'Single', N'5555555555', CAST(N'2012-01-13' AS Date), N'GMV1234', N'Minor')
INSERT [dbo].[BranchAdminRegistration] ([Branch_Admin_Id], [First_Name], [Last_Name], [Present_Address], [Permanent_Address], [Password], [State], [Country], [Email_Address], [Gender], [Marital_Status], [Contact_Number], [Date_Of_Birth], [Id_Proof_Type], [Status]) VALUES (CAST(1023 AS Numeric(4, 0)), N'juili', N'gaikwad', N'pune', N'pune', N'Juli@64', N'Maharashtra', N'India', N'juili@gmail.com', N'Female', N'Single', N'6303668582', CAST(N'1995-06-04' AS Date), N'DL1234', N'Normal')
SET IDENTITY_INSERT [dbo].[BranchAdminRegistration] OFF
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0001', CAST(N'2019-01-01' AS Date), N'juili', CAST(50 AS Numeric(18, 0)), CAST(N'2019-01-01' AS Date), CAST(N'2020-01-01' AS Date), CAST(50.00 AS Numeric(18, 2)), N'JUILI LOO SARDARD BADAO!!')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0002', CAST(N'2019-03-26' AS Date), N'Juili', CAST(100 AS Numeric(18, 0)), CAST(N'2019-03-26' AS Date), CAST(N'2019-04-30' AS Date), CAST(50.00 AS Numeric(18, 2)), N'juili lo sardard hatao')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0003', CAST(N'2019-03-26' AS Date), N'ayesha', CAST(100 AS Numeric(18, 0)), CAST(N'2019-03-26' AS Date), CAST(N'2019-04-30' AS Date), CAST(50.00 AS Numeric(18, 2)), N'ayesha lo sardard hatao')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0004', CAST(N'2019-03-26' AS Date), N'ayesha', CAST(100 AS Numeric(18, 0)), CAST(N'2019-03-26' AS Date), CAST(N'2019-04-30' AS Date), CAST(50.00 AS Numeric(18, 2)), N'ayesha lo sardard hatao')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0005', CAST(N'2019-03-26' AS Date), N'prachi', CAST(200 AS Numeric(18, 0)), CAST(N'2019-03-26' AS Date), CAST(N'2020-12-31' AS Date), CAST(50.00 AS Numeric(18, 2)), N'fghkfdgk')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0006', CAST(N'2019-03-26' AS Date), N'naresh', CAST(50 AS Numeric(18, 0)), CAST(N'2019-03-01' AS Date), CAST(N'2019-03-31' AS Date), CAST(1000.00 AS Numeric(18, 2)), N'costly and rare')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0007', CAST(N'2019-03-26' AS Date), N'shub', CAST(20 AS Numeric(18, 0)), CAST(N'2019-01-01' AS Date), CAST(N'2020-01-01' AS Date), CAST(20.00 AS Numeric(18, 2)), N'fgdfg')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0008', CAST(N'2019-03-27' AS Date), N'para', CAST(50 AS Numeric(18, 0)), CAST(N'1995-05-09' AS Date), CAST(N'2020-08-09' AS Date), CAST(123.00 AS Numeric(18, 2)), N'cold remove')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0009', CAST(N'2019-03-27' AS Date), N'naresh', CAST(1 AS Numeric(18, 0)), CAST(N'2018-11-15' AS Date), CAST(N'2019-03-07' AS Date), CAST(2.00 AS Numeric(18, 2)), N'ff')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0010', CAST(N'2019-03-28' AS Date), N'ljdufd', CAST(56 AS Numeric(18, 0)), CAST(N'2020-05-20' AS Date), CAST(N'2019-03-28' AS Date), CAST(456.00 AS Numeric(18, 2)), N'hsnacff')
INSERT [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id], [Registration_Date], [Medicine_Name], [Number_Of_Medicine], [Manufactured_Date], [Expiry_Date], [Price], [Description]) VALUES (N'M0011', CAST(N'2019-03-28' AS Date), N'dolo', CAST(100 AS Numeric(18, 0)), CAST(N'2016-01-05' AS Date), CAST(N'2020-10-11' AS Date), CAST(500.00 AS Numeric(18, 2)), N'abcd')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ001', N'M0001', CAST(10 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), N'koti', CAST(1001 AS Numeric(4, 0)), N'Approved')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ002', N'M0001', CAST(20 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'hayatnagar', CAST(1012 AS Numeric(4, 0)), N'Approved')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ003', N'M0001', CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'koti', CAST(1012 AS Numeric(4, 0)), N'Approved')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ004', N'M0001', CAST(10 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'tarnaka', CAST(1001 AS Numeric(4, 0)), N'Rejected')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ005', N'M0007', CAST(50 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'koti', CAST(1001 AS Numeric(4, 0)), N'Cancelled')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ006', N'M0006', CAST(50 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'naresh', CAST(1001 AS Numeric(4, 0)), N'Pending')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ007', N'M0011', CAST(100 AS Numeric(18, 0)), CAST(200 AS Numeric(18, 0)), N'mettukupam', CAST(1001 AS Numeric(4, 0)), N'Pending')
INSERT [dbo].[MedicineRequest] ([Request_Id], [Medicine_Id], [Dosage], [Number_Of_Medicine], [Branch], [Branch_Admin_Id], [Status]) VALUES (N'REQ008', N'M0001', CAST(50 AS Numeric(18, 0)), CAST(100 AS Numeric(18, 0)), N'koti', CAST(1021 AS Numeric(4, 0)), N'Approved')
INSERT [dbo].[StockDetailsRegistration] ([Stock_Id], [Registration_Date], [Medicine_Id], [Branch_Admin_Id], [Number_Of_Strips], [Description]) VALUES (N'ST0001', CAST(N'2019-02-28' AS Date), N'M0001', CAST(1001 AS Numeric(4, 0)), CAST(50 AS Numeric(18, 0)), N'1')
INSERT [dbo].[StockDetailsRegistration] ([Stock_Id], [Registration_Date], [Medicine_Id], [Branch_Admin_Id], [Number_Of_Strips], [Description]) VALUES (N'ST0002', CAST(N'2019-03-26' AS Date), N'M0001', CAST(1001 AS Numeric(4, 0)), CAST(50 AS Numeric(18, 0)), N'juili')
INSERT [dbo].[StockDetailsRegistration] ([Stock_Id], [Registration_Date], [Medicine_Id], [Branch_Admin_Id], [Number_Of_Strips], [Description]) VALUES (N'ST0003', CAST(N'2019-03-28' AS Date), N'M0001', CAST(1023 AS Numeric(4, 0)), CAST(50 AS Numeric(18, 0)), N'abcd')
ALTER TABLE [dbo].[MedicineRequest]  WITH CHECK ADD  CONSTRAINT [FK_MedicineRequest_BranchAdminRegistration] FOREIGN KEY([Branch_Admin_Id])
REFERENCES [dbo].[BranchAdminRegistration] ([Branch_Admin_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicineRequest] CHECK CONSTRAINT [FK_MedicineRequest_BranchAdminRegistration]
GO
ALTER TABLE [dbo].[MedicineRequest]  WITH CHECK ADD  CONSTRAINT [FK_MedicineRequest_MedicineDetailsRegistration] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicineRequest] CHECK CONSTRAINT [FK_MedicineRequest_MedicineDetailsRegistration]
GO
ALTER TABLE [dbo].[StockDetailsRegistration]  WITH CHECK ADD  CONSTRAINT [FK_StockDetailsRegistration_BranchAdminRegistration] FOREIGN KEY([Branch_Admin_Id])
REFERENCES [dbo].[BranchAdminRegistration] ([Branch_Admin_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockDetailsRegistration] CHECK CONSTRAINT [FK_StockDetailsRegistration_BranchAdminRegistration]
GO
ALTER TABLE [dbo].[StockDetailsRegistration]  WITH CHECK ADD  CONSTRAINT [FK_StockDetailsRegistration_MedicineDetailsRegistration] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[MedicineDetailsRegistration] ([Medicine_Type_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockDetailsRegistration] CHECK CONSTRAINT [FK_StockDetailsRegistration_MedicineDetailsRegistration]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMedicineRequest]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMedicineRequest] 
	-- Add the parameters for the stored procedure here
	@RequestId nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from MedicineRequest where Request_Id=@RequestId
END

GO
/****** Object:  StoredProcedure [dbo].[GetByIdRegistration]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIdRegistration]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50),
	@Password nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT First_Name as Fname, Password as Pass,Branch_Admin_Id as BAI FROM BranchAdminRegistration WHERE First_Name = @FirstName AND Password = @Password;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertBranchAdmin]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertBranchAdmin] 
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PresentAddress nvarchar(max),
	@PermanentAddress nvarchar(max),
	@Password nvarchar(50),
	@State nvarchar(50),
	@Country nvarchar(50),
	@EmailAddress nvarchar(50),
	@Gender nvarchar(6),
	@MaritalStatus nvarchar(10),
	@ContactNumber nvarchar(10),
	@DateOfBirth date,
	@IdProofType nvarchar(50),
	@Status nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO BranchAdminRegistration VALUES(@FirstName,@LastName,@PresentAddress,@PermanentAddress,@Password,@State,@Country,@EmailAddress,@Gender,@MaritalStatus,@ContactNumber,@DateOfBirth,@IdProofType,@Status)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMedicineDetail]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertMedicineDetail] 
	-- Add the parameters for the stored procedure here
	@MedicineTypeId nvarchar(5),
	@RegistrationDate date, 
	@MedicineName nvarchar(50),
	@NumberOfMedicine numeric(18,0),
	@ManufacturedDate date,
	@ExpiryDate date,
	@Price numeric(18,2),
	@Description nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	INSERT INTO MedicineDetailsRegistration VALUES(@MedicineTypeId, @RegistrationDate, @MedicineName,@NumberOfMedicine, @ManufacturedDate, @ExpiryDate, @Price, @Description)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMedicineRequest]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertMedicineRequest]
	-- Add the parameters for the stored procedure here
	@RequestId nvarchar(6) ,
	@MedicineId nvarchar(5),
	@Dosage numeric(18,0),
	@NumberOfMedicine numeric(18,0),
	@Branch nvarchar(50),
	@BranchAdminId numeric(4,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    -- Insert statements for procedure here
	INSERT INTO MedicineRequest(Request_Id,Medicine_Id,Dosage,Number_Of_Medicine,Branch,Branch_Admin_Id) values(@RequestId ,@MedicineId,@Dosage,@NumberOfMedicine ,@Branch,@BranchAdminId)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertStockDetail]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertStockDetail] 
	-- Add the parameters for the stored procedure here
	@StockId nvarchar(6),
	@RegistrationDate date,
	@MedicineId nvarchar(5),
	@BranchAdminId numeric(18,0),
	@NumberOfStrips numeric(18,0),
	@Description nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	INSERT INTO StockDetailsRegistration VALUES(@StockId,@RegistrationDate,@MedicineId,@BranchAdminId,@NumberOfStrips,@Description)
END

GO
/****** Object:  StoredProcedure [dbo].[SelectMedicineRequest]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectMedicineRequest]
	-- Add the parameters for the stored procedure here
	@RequestId nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MedicineRequest WHERE Request_Id = @RequestId
END

GO
/****** Object:  StoredProcedure [dbo].[SelectPendingRequest]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectPendingRequest]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Request_Id,Medicine_Id,Dosage,Number_Of_Medicine,Branch, Branch_Admin_Id FROM MedicineRequest WHERE Status='Pending'
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateBranchAdmin]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBranchAdmin]
	@BranchAdminId numeric(18,0),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PresentAddress nvarchar(max),
	@PermanentAddress nvarchar(max),
	@Password nvarchar(50),
	@State nvarchar(50),
	@Country nvarchar(50),
	@EmailAddress nvarchar(50),
	@Gender nvarchar(6),
	@MaritalStatus nvarchar(10),
	@ContactNumber nvarchar(10),
	@DateOfBirth date,
	@IdProofType nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE BranchAdminRegistration 
	SET
	First_Name = @FirstName,
	Last_Name = @LastName,
	Present_Address = @PresentAddress,
	Permanent_Address = @PermanentAddress,
	Password = @Password,
	State = @State,
	Country = @Country,
	Email_Address =  @EmailAddress,
	Gender = @Gender,
	Marital_Status = @MaritalStatus,
	Contact_Number = @ContactNumber,
	Date_Of_Birth = @DateOfBirth,
	Id_Proof_Type = @IdProofType
	WHERE Branch_Admin_Id = @BranchAdminId
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateMedicineDetail]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateMedicineDetail]
	-- Add the parameters for the stored procedure here
	@MedicineTypeId nvarchar(5),
	@RegistrationDate date, 
	@MedicineName nvarchar(50),
	@NumberOfMedicine numeric(18,0),
	@ManufacturedDate date,
	@ExpiryDate date,
	@Price numeric(18,2),
	@Description nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE MedicineDetailsRegistration
	SET
	Registration_Date = @RegistrationDate,
	Medicine_Name = @MedicineName,
	Number_Of_Medicine = @NumberOfMedicine,
	Manufactured_Date = @ManufacturedDate,
	Expiry_Date = @ExpiryDate,
	Price = @Price,
	Description = @Description
	WHERE Medicine_Type_Id = @MedicineTypeId
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateMedicineRequest]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateMedicineRequest] 
	-- Add the parameters for the stored procedure here
	@RequestId nvarchar(6),
	@Status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE MedicineRequest set
	
	Status=@Status Where Request_Id=@RequestId
	END

GO
/****** Object:  StoredProcedure [dbo].[UpdateStockDetail]    Script Date: 03/30/2019 4:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStockDetail]
	-- Add the parameters for the stored procedure here
	@StockId nvarchar(6),
	@RegistrationDate date,
	@MedicineId nvarchar(5),
	@BranchAdminId numeric(18,0),
	@NumberOfStrips numeric(18,0),
	@Description nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE StockDetailsRegistration
	SET
	Registration_Date = @RegistrationDate,
	Medicine_Id = @MedicineId,
	Branch_Admin_Id = @BranchAdminId,
	Number_Of_Strips = @NumberOfStrips,
	Description = @Description

	WHERE Stock_Id = @StockId
END

GO
USE [master]
GO
ALTER DATABASE [MedicineMonitoringSystem] SET  READ_WRITE 
GO
