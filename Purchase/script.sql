USE [master]
GO

/****** Object:  Database [PurchaseProcessing_1]    Script Date: 11.04.2022 12:52:43 ******/
CREATE DATABASE [PurchaseProcessing_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PurchaseProcessing', FILENAME = N'D:\SQLDATA\PurchaseProcessing_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG_PurchaseProcessing_Transactions] 
( NAME = N'PurchaseProcessing_Transactions', FILENAME = N'D:\SQLDATA\PurchaseProcessing_Transactions_1.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PurchaseProcessing_log', FILENAME = N'D:\SQLLOG\PurchaseProcessing_log_1.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [PurchaseProcessing_1] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PurchaseProcessing_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [PurchaseProcessing_1] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET ARITHABORT OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [PurchaseProcessing_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [PurchaseProcessing_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET  ENABLE_BROKER 
GO

ALTER DATABASE [PurchaseProcessing_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [PurchaseProcessing_1] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [PurchaseProcessing_1] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET RECOVERY FULL 
GO

ALTER DATABASE [PurchaseProcessing_1] SET  MULTI_USER 
GO

ALTER DATABASE [PurchaseProcessing_1] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [PurchaseProcessing_1] SET DB_CHAINING OFF 
GO

ALTER DATABASE [PurchaseProcessing_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [PurchaseProcessing_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [PurchaseProcessing_1] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [PurchaseProcessing_1] SET QUERY_STORE = OFF
GO

USE [PurchaseProcessing_1]
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [PurchaseProcessing_1] SET  READ_WRITE 
GO

CREATE SCHEMA [DICT];
GO

CREATE TABLE [DICT].[CustomerData](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](200) NOT NULL,
	[iin] [nvarchar](12) NOT NULL,
	[gender] [tinyint] NOT NULL,
	[birthday] [datetime2](7) NOT NULL,
	[physical_address] [nvarchar](200) NOT NULL,
	[phones] [nvarchar](300) NOT NULL,
	[emails] [nvarchar](300) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [DICT].[CustomerAccounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[currency] [nvarchar](3) NOT NULL,
	[iban] [nvarchar](34) NOT NULL,
	[bank_name] [nvarchar](150) NOT NULL,
	[bik] [nvarchar](9) NOT NULL,
	[client_id] [bigint] NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerAccounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DICT].[CustomerAccounts]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccounts_CustomerData] FOREIGN KEY([client_id])
REFERENCES [DICT].[CustomerData] ([id])
GO

ALTER TABLE [DICT].[CustomerAccounts] CHECK CONSTRAINT [FK_CustomerAccounts_CustomerData]
GO

CREATE TABLE [DICT].[PartnerData](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[bin] [nvarchar](12) NOT NULL,
	[type] [tinyint] NOT NULL,
	[phys_address] [nvarchar](200) NOT NULL,
	[jur_address] [nvarchar](200) NOT NULL,
	[emails] [nvarchar](300) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_PartnerData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [DICT].[PartnerAccounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[currency] [nvarchar](3) NOT NULL,
	[iban] [nvarchar](34) NOT NULL,
	[bank_name] [nvarchar](150) NOT NULL,
	[bik] [nvarchar](9) NOT NULL,
	[partner_id] [bigint] NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_PartnerAccounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DICT].[PartnerAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerAccounts_PartnerData] FOREIGN KEY([partner_id])
REFERENCES [DICT].[PartnerData] ([id])
GO

ALTER TABLE [DICT].[PartnerAccounts] CHECK CONSTRAINT [FK_PartnerAccounts_PartnerData]
GO

CREATE SCHEMA [TRAN];
GO

CREATE TABLE [TRAN].[Transactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[customer_acc_id] [bigint] NOT NULL,
	[write_off_currency] [nvarchar](3) NOT NULL,
	[currency_rate] [real] NOT NULL,
	[fee] [real] NOT NULL,
	[status] [int] NOT NULL,
	[parntner_id] [bigint] NOT NULL,
	[partner_acc_id] [bigint] NOT NULL,
	[replenishment_amount] [decimal](18, 2) NOT NULL,
	[replenishment_currency] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [TRAN].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_CustomerAccounts] FOREIGN KEY([customer_acc_id])
REFERENCES [DICT].[CustomerAccounts] ([id])
GO

ALTER TABLE [TRAN].[Transactions] CHECK CONSTRAINT [FK_Transactions_CustomerAccounts]
GO

ALTER TABLE [TRAN].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_CustomerData] FOREIGN KEY([customer_id])
REFERENCES [DICT].[CustomerData] ([id])
GO

ALTER TABLE [TRAN].[Transactions] CHECK CONSTRAINT [FK_Transactions_CustomerData]
GO

ALTER TABLE [TRAN].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_PartnerAccounts] FOREIGN KEY([partner_acc_id])
REFERENCES [DICT].[PartnerAccounts] ([id])
GO

ALTER TABLE [TRAN].[Transactions] CHECK CONSTRAINT [FK_Transactions_PartnerAccounts]
GO

ALTER TABLE [TRAN].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_PartnerData] FOREIGN KEY([parntner_id])
REFERENCES [DICT].[PartnerData] ([id])
GO

ALTER TABLE [TRAN].[Transactions] CHECK CONSTRAINT [FK_Transactions_PartnerData]
GO
