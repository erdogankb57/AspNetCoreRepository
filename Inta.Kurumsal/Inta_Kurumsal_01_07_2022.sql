USE [master]
GO
/****** Object:  Database [IntaKurumsal]    Script Date: 1.07.2022 09:21:46 ******/
CREATE DATABASE [IntaKurumsal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IntaKurumsal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IntaKurumsal.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IntaKurumsal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IntaKurumsal_log.ldf' , SIZE = 1122304KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IntaKurumsal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IntaKurumsal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IntaKurumsal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IntaKurumsal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IntaKurumsal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IntaKurumsal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IntaKurumsal] SET ARITHABORT OFF 
GO
ALTER DATABASE [IntaKurumsal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IntaKurumsal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IntaKurumsal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IntaKurumsal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IntaKurumsal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IntaKurumsal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IntaKurumsal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IntaKurumsal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IntaKurumsal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IntaKurumsal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IntaKurumsal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IntaKurumsal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IntaKurumsal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IntaKurumsal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IntaKurumsal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IntaKurumsal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IntaKurumsal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IntaKurumsal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IntaKurumsal] SET  MULTI_USER 
GO
ALTER DATABASE [IntaKurumsal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IntaKurumsal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IntaKurumsal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IntaKurumsal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IntaKurumsal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IntaKurumsal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IntaKurumsal] SET QUERY_STORE = OFF
GO
USE [IntaKurumsal]
GO
/****** Object:  User [sa1]    Script Date: 1.07.2022 09:21:46 ******/
CREATE USER [sa1] FOR LOGIN [sa1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[BannerTypeId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](50) NULL,
	[Target] [nvarchar](20) NULL,
	[ShortExplanation] [nvarchar](max) NULL,
	[OrderNumber] [int] NOT NULL,
	[TargetId] [int] NULL,
	[Image] [varchar](max) NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Price] [decimal](9, 3) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerType]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SmallImageWidth] [int] NULL,
	[BigImageWidth] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_BannerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[PageTypeId] [int] NULL,
	[CategoryId] [int] NULL,
	[FormGroupId] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[CategoryUrl] [nvarchar](255) NULL,
	[Title] [nvarchar](max) NULL,
	[MetaDecription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[ShortExplanation] [nvarchar](max) NULL,
	[CanBeDeleted] [bit] NULL,
	[CanSubCategoryBeAdded] [bit] NULL,
	[Image] [nvarchar](max) NULL,
	[ImageTag] [nvarchar](max) NULL,
	[ImageTitle] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CategoryLink] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorySpecialty]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorySpecialty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[CategoryId] [int] NULL,
	[SpecialtyTypeId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortExplanation] [nvarchar](50) NULL,
	[Explanation] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileTagName] [nvarchar](max) NULL,
	[FileTitleName] [nvarchar](max) NULL,
	[TargetType] [nvarchar](50) NULL,
	[HomePageStatus] [bit] NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CategorySpecialty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Gsm] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[Explanation] [nvarchar](max) NULL,
	[GoogleMapFrame] [nvarchar](max) NULL,
	[GoogleMapLink] [nvarchar](max) NULL,
	[GoogleMapX] [nvarchar](50) NULL,
	[GoogleMapY] [nvarchar](50) NULL,
	[Image] [nvarchar](100) NULL,
	[QrCode] [nvarchar](50) NULL,
	[FormSendEmail] [nvarchar](50) NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EditorTemplate]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditorTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HtmlContent] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EditorTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmVariables]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmVariables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_FirmVariables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormElement]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormElement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[SystemUserId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[FormGroupId] [int] NULL,
	[FormTypeId] [int] NULL,
	[ElementTypeId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsRequired] [bit] NULL,
	[ValidationMessage] [nvarchar](max) NULL,
	[AllowNulls] [bit] NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_FormElement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormElementOptions]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormElementOptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[FormElementId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[IsSelected] [bit] NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_FormOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormGroup]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Explanation] [nvarchar](500) NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_FormGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormType]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_FormType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneralSettings]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NULL,
	[SystemUserId] [int] NULL,
	[EmailIpAdress] [nvarchar](100) NULL,
	[EmailAdress] [nvarchar](100) NULL,
	[EmailPort] [int] NULL,
	[EmailPassword] [nvarchar](50) NULL,
	[DomainName] [nvarchar](50) NULL,
	[CdnUrl] [nvarchar](50) NULL,
	[ImageUploadPath] [nvarchar](100) NULL,
	[FileUploadPath] [nvarchar](100) NULL,
	[DeveloperName] [nvarchar](100) NULL,
	[DeveloperEmail] [nvarchar](100) NULL,
	[CategoryImageSmallWidth] [int] NULL,
	[CategoryImageSmallHeight] [int] NULL,
	[CategoryImageBigWidth] [int] NULL,
	[CategoryImageBigHeight] [int] NULL,
	[ContentImageSmallWidth] [int] NULL,
	[ContentImageSmallHeight] [int] NULL,
	[ContentImageBigWidth] [int] NULL,
	[ContentImageBigHeight] [int] NULL,
 CONSTRAINT [PK_GeneralSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogMessage]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](50) NULL,
	[Source] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[InnerException] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[ObjectSource] [nvarchar](max) NULL,
	[RecordDate] [datetime] NULL,
 CONSTRAINT [PK_LogMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageHistory]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NULL,
	[MessageTypeId] [int] NULL,
	[ClientName] [nvarchar](50) NULL,
	[ClientSurname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Subject] [nvarchar](500) NULL,
	[Explanation] [nvarchar](max) NULL,
	[IsArchive] [bit] NULL,
	[IsRead] [bit] NULL,
	[ArchiveDate] [datetime] NULL,
	[IpNumber] [nvarchar](50) NULL,
	[RecordDate] [datetime] NULL,
 CONSTRAINT [PK_MessageHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageType]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageCode] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MessageType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageType]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[Code] [nvarchar](10) NULL,
	[Name] [nvarchar](500) NULL,
	[ControllerName] [nvarchar](500) NULL,
	[ActionName] [nvarchar](500) NULL,
	[ViewName] [nvarchar](500) NULL,
	[IsExplanationEnabled] [bit] NULL,
	[IsShortExplanationEnabled] [bit] NULL,
	[CanContentBeAdded] [bit] NULL,
	[IsMenuFirstRecord] [bit] NULL,
	[IsMenuFirstCategory] [bit] NULL,
	[IsPagingEnabled] [bit] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_PageType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[CategoryId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[RecordUrl] [nvarchar](255) NULL,
	[Title] [nvarchar](50) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[ShortContent] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[TargetType] [int] NULL,
	[ShortExplanation] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
	[Image] [varchar](255) NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordFile]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[RecordId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[ShortExplanation] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
	[FileName] [varchar](255) NULL,
	[FileTagName] [nvarchar](max) NULL,
	[FileTitleName] [nvarchar](max) NULL,
	[TargetId] [int] NULL,
	[HomePageStatus] [bit] NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ContentFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordImage]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[RecordId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[ShortExplanation] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[ImageTagName] [nvarchar](max) NULL,
	[ImageTitleName] [nvarchar](max) NULL,
	[TargetId] [int] NULL,
	[HomePageStatus] [bit] NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ContentImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordSpecialty]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSpecialty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [int] NULL,
	[CategoryId] [int] NULL,
	[SpecialtyTypeId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortExplanation] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileTagName] [nvarchar](max) NULL,
	[FileTitleName] [nvarchar](max) NULL,
	[TargetType] [nvarchar](50) NULL,
	[HomePageStatus] [bit] NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ContentSpecialty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEOIndex]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEOIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageId] [nvarchar](10) NULL,
	[Url] [nvarchar](max) NULL,
	[RedirectUrl] [nvarchar](max) NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SEOIndex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialtyType]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialtyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SpecialtyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaticText]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticText](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Explanation] [nvarchar](max) NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_StaticText] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemAction]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemAction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemMenuId] [int] NULL,
	[ControllerName] [nvarchar](255) NULL,
	[ActionName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_SystemAction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemActionRole]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemActionRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemActionId] [int] NULL,
	[SystemRoleId] [int] NULL,
 CONSTRAINT [PK_SystemActionRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemMenu]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemMenu](
	[Id] [int] NOT NULL,
	[SystemMenuId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Explanation] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[MenuIcon] [nvarchar](50) NULL,
	[Link] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SystemMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemMenuRole]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemMenuRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemRoleId] [int] NULL,
	[SystemMenuId] [int] NULL,
	[RecordDate] [datetime] NULL,
 CONSTRAINT [PK_SystemMenuRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemRole]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Explanation] [nvarchar](max) NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SystemRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[SystemRoleId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_SystemUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUserRole]    Script Date: 1.07.2022 09:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemRoleId] [int] NULL,
	[SystemUserId] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SystemUserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62360, 1, 4, 2015, N'62360', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62361, 1, 4, 2015, N'62361', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62362, NULL, 4, 2018, N'62362', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62363, 1, 4, 2015, N'62363', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62364, 1, 4, 2015, N'62364', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62365, 1, 4, 2015, N'62365', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62366, 1, 4, 2015, N'62366', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62367, 1, 4, 2015, N'62367', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62368, 1, 4, 2015, N'62368', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62369, 1, 4, 2015, N'62369', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62370, 1, 4, 2015, N'62370', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62371, 1, 4, 2015, N'62371', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62372, 1, 4, 2015, N'62372', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62373, 1, 4, 2015, N'62373', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62374, 1, 4, 2015, N'62374', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62375, 1, 4, 2015, N'62375', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62376, 1, 4, 2015, N'62376', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62377, 1, 4, 2015, N'62377', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62378, 1, 4, 2015, N'62378', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62379, 1, 4, 2015, N'62379', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62380, 1, 4, 2015, N'62380', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62381, 1, 4, 2015, N'62381', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62382, 1, 4, 2015, N'62382', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62383, 1, 4, 2015, N'62383', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62384, 1, 4, 2015, N'62384', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62385, 1, 4, 2015, N'62385', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62386, 1, 4, 2015, N'62386', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62387, 1, 4, 2015, N'62387', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62388, 1, 4, 2015, N'62388', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62389, 1, 4, 2015, N'62389', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62390, 1, 4, 2015, N'62390', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62391, NULL, 4, 2018, N'62391', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62392, 1, 4, 2015, N'62392', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62393, 1, 4, 2015, N'62393', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62394, 1, 4, 2015, N'62394', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62395, 1, 4, 2015, N'62395', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62396, 1, 4, 2015, N'62396', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62397, 1, 4, 2015, N'62397', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62398, 1, 4, 2015, N'62398', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62399, 1, 4, 2015, N'62399', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62400, 1, 4, 2015, N'62401111', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62401, 1, 4, 2015, N'62401', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62402, NULL, 4, 2018, N'test', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62403, 1, 4, 2015, N'62403', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62404, 1, 4, 2015, N'62404', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62405, 1, 4, 2015, N'62405', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62406, 1, 4, 2015, N'62406', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62407, 1, 4, 2015, N'62407', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62408, 1, 4, 2015, N'62408', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62409, 1, 4, 2015, N'62409', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62410, 1, 4, 2015, N'62410', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62411, 1, 4, 2015, N'62411', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62412, 1, 4, 2015, N'62412', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62413, 1, 4, 2015, N'62413', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62414, 1, 4, 2015, N'62414', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62415, 1, 4, 2015, N'62415', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62416, 1, 4, 2015, N'62416', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62417, 1, 4, 2015, N'62417', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62418, 1, 4, 2015, N'62418', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62419, 1, 4, 2015, N'62419', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62420, 1, 4, 2015, N'62420', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62421, 1, 4, 2015, N'62421', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [RecordDate], [IsActive], [Price]) VALUES (62422, NULL, 4, 2018, N'a', N'1', N'1', N'1', 1, 1, N'1', CAST(N'2022-06-07T10:26:52.207' AS DateTime), 1, CAST(500.000 AS Decimal(9, 3)))
GO
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[BannerType] ON 
GO
INSERT [dbo].[BannerType] ([Id], [SystemUserId], [LanguageId], [Name], [Description], [SmallImageWidth], [BigImageWidth], [RecordDate], [IsActive]) VALUES (2015, 1, 1, N'Anasayfa Banner', NULL, 100, 100, NULL, NULL)
GO
INSERT [dbo].[BannerType] ([Id], [SystemUserId], [LanguageId], [Name], [Description], [SmallImageWidth], [BigImageWidth], [RecordDate], [IsActive]) VALUES (2016, 1, 1, N'Ana sayfa sol banner', NULL, 100, 100, NULL, NULL)
GO
INSERT [dbo].[BannerType] ([Id], [SystemUserId], [LanguageId], [Name], [Description], [SmallImageWidth], [BigImageWidth], [RecordDate], [IsActive]) VALUES (2017, 1, 1, N'Sol Menü Reklam', NULL, 100, 100, NULL, NULL)
GO
INSERT [dbo].[BannerType] ([Id], [SystemUserId], [LanguageId], [Name], [Description], [SmallImageWidth], [BigImageWidth], [RecordDate], [IsActive]) VALUES (2018, NULL, 4, N'Test', NULL, 200, 500, NULL, NULL)
GO
INSERT [dbo].[BannerType] ([Id], [SystemUserId], [LanguageId], [Name], [Description], [SmallImageWidth], [BigImageWidth], [RecordDate], [IsActive]) VALUES (2019, 1, 4, N'dsd', N'1', 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[BannerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6029, 1, 1, 2, 0, NULL, NULL, N'Anasayfa', N'anasayfa', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6030, NULL, 5, 2, 0, NULL, NULL, N'Home', N'home', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6031, 1, 5, 2, 0, NULL, NULL, N'Products', N'products', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6032, 1, 5, 2, 0, NULL, NULL, N'About', N'about', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6033, 1, 5, 2, 0, NULL, NULL, N'Contact', N'contact', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6034, NULL, NULL, 2, 0, NULL, NULL, N'Ana sayfa', N'ana-sayfa', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6035, 1, 5, 2, 6031, NULL, NULL, N'Laptop', N'laptop', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6036, NULL, NULL, 2, 0, NULL, NULL, N'10', N'10', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6037, NULL, NULL, 2, 0, NULL, NULL, N'10', N'10', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6039, NULL, 4, 2, 0, NULL, NULL, N'Biz Kimiz', N'biz-kimiz', NULL, NULL, NULL, NULL, 1, 1, N'csharp-1-1-9d0187a8-62ce-4d26-a111-65e370f6b561.jpg', NULL, NULL, N'<img alt="" src="/Uploads/EditorImages/1-klijp3uwtgae-q9xuc-pva-dfd110a6-1e93-4f22-bb44-8cce55175ed3.png?d=22.06.2022 13:35:54" style="height:274px; width:274px" /><img alt="" src="/Uploads/cf6f194e-064d-4482-990f-57be1b0eb018.png" style="height:608px; width:1024px" />', 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6040, 1, 4, 2, 0, NULL, NULL, N'Orion'' u keşfet', N'orion-u-kesfet', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6041, 1, 4, 2, 0, NULL, NULL, N'Neler yapıyoruz', N'neler-yapiyoruz', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6042, 1, 4, 2, 0, NULL, NULL, N'Donanım', N'donanim', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6043, 1, 4, 2, 0, NULL, NULL, N'Güncel', N'guncel', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6044, 1, 4, 2, 0, NULL, NULL, N'Kimlerle çalışıyoruz', N'kimlerle-calisiyoruz', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6045, 1, 4, 2, 0, NULL, NULL, N'Bize ulaşın', N'bize-ulasin', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6046, 1, 4, 2, 6039, NULL, NULL, N'Misyon', N'misyon', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6047, 1, 4, 2, 6039, NULL, NULL, N'Deneme', N'deneme', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6048, NULL, 4, 2, 0, NULL, NULL, N'Test', N'test', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6049, 1, 4, 2, 0, NULL, NULL, N'test türkçe', N'test-turkce', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [RecordDate], [IsActive], [CategoryLink]) VALUES (6050, 1, 5, 2, 0, NULL, NULL, N'ingilizce test', N'ingilizce-test', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactInformation] ON 
GO
INSERT [dbo].[ContactInformation] ([Id], [SystemUserId], [LanguageId], [Name], [Email], [Phone], [Gsm], [Fax], [Adress], [Explanation], [GoogleMapFrame], [GoogleMapLink], [GoogleMapX], [GoogleMapY], [Image], [QrCode], [FormSendEmail], [OrderNumber], [RecordDate], [IsActive]) VALUES (4010, 1, 1, N'İletişim Bilgilerimiz', N'email', N'telefon', NULL, NULL, N'adres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2022-04-18T17:02:08.670' AS DateTime), 0)
GO
INSERT [dbo].[ContactInformation] ([Id], [SystemUserId], [LanguageId], [Name], [Email], [Phone], [Gsm], [Fax], [Adress], [Explanation], [GoogleMapFrame], [GoogleMapLink], [GoogleMapX], [GoogleMapY], [Image], [QrCode], [FormSendEmail], [OrderNumber], [RecordDate], [IsActive]) VALUES (4011, NULL, 4, N'1', N'1', N'1', N'1', N'1', N'1', N'11', N'1', NULL, NULL, NULL, N'c-to-c-rest-vs-grpc-5477103c-d85d-413a-9a6b-aa2a7970cd37.jpg', NULL, NULL, 0, CAST(N'2022-04-25T15:03:53.000' AS DateTime), 0)
GO
INSERT [dbo].[ContactInformation] ([Id], [SystemUserId], [LanguageId], [Name], [Email], [Phone], [Gsm], [Fax], [Adress], [Explanation], [GoogleMapFrame], [GoogleMapLink], [GoogleMapX], [GoogleMapY], [Image], [QrCode], [FormSendEmail], [OrderNumber], [RecordDate], [IsActive]) VALUES (4012, NULL, 4, N'2', N'2', N'2', N'2', N'2', N'2', N'2', N'2', NULL, NULL, NULL, N'1-klijp3uwtgae-q9xuc-pva-b9c19df0-9f6c-491f-a1f4-77435428e3de.png', NULL, NULL, 0, CAST(N'2022-04-26T09:28:08.000' AS DateTime), 0)
GO
INSERT [dbo].[ContactInformation] ([Id], [SystemUserId], [LanguageId], [Name], [Email], [Phone], [Gsm], [Fax], [Adress], [Explanation], [GoogleMapFrame], [GoogleMapLink], [GoogleMapX], [GoogleMapY], [Image], [QrCode], [FormSendEmail], [OrderNumber], [RecordDate], [IsActive]) VALUES (4013, NULL, 5, N'test', N'1', N'1', NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2022-05-09T17:54:08.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[ContactInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[EditorTemplate] ON 
GO
INSERT [dbo].[EditorTemplate] ([Id], [SystemUserId], [LanguageId], [Name], [HtmlContent], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 1, 4, N'Test', NULL, NULL, 0, CAST(N'2021-10-12T18:32:31.457' AS DateTime), 0)
GO
INSERT [dbo].[EditorTemplate] ([Id], [SystemUserId], [LanguageId], [Name], [HtmlContent], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (2, NULL, 4, N'Test', N'adsdsddsdsds', NULL, 0, CAST(N'2021-10-12T18:32:48.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[EditorTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[FirmVariables] ON 
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (3, 4, N'CategoryBigImageWidth', NULL, N'500', 0, CAST(N'2021-10-17T21:46:09.043' AS DateTime), 0)
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (4, 4, N'CategorySmallImageWidth', NULL, N'500', 0, CAST(N'2021-10-17T21:46:25.670' AS DateTime), 0)
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (5, 4, N'CategorySmallImageHeight', NULL, N'500', 0, CAST(N'2021-10-17T21:46:58.127' AS DateTime), 0)
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (12, 5, N'6', NULL, N'6', 0, CAST(N'2022-05-09T14:49:38.910' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[FirmVariables] OFF
GO
SET IDENTITY_INSERT [dbo].[FormElement] ON 
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 0, 1, 1, 1, NULL, 1, N'1', NULL, NULL, 1, 0, CAST(N'2021-10-13T19:40:38.120' AS DateTime), 1)
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (2, 0, 1, 1, 3, NULL, 1, N'asasasa', NULL, NULL, 0, 0, CAST(N'2021-10-14T22:00:28.427' AS DateTime), 0)
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (3, 0, 1, 1, 3, NULL, 1, N'asasasa', NULL, NULL, 0, 0, CAST(N'2021-10-14T22:00:28.427' AS DateTime), 0)
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (4, 0, 1, 1, 3, NULL, 1, N'asasasa', NULL, NULL, 0, 0, CAST(N'2021-10-14T22:00:28.427' AS DateTime), 0)
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (5, 0, 1, 1, 1, NULL, 1, N'asas', NULL, NULL, 0, 0, CAST(N'2021-10-14T22:00:51.883' AS DateTime), 0)
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (1002, 0, 1, 1, 1, NULL, 5, N'test drop', NULL, NULL, 0, 1, CAST(N'2021-10-19T16:00:27.360' AS DateTime), 0)
GO
INSERT [dbo].[FormElement] ([Id], [CategoryId], [SystemUserId], [LanguageId], [FormGroupId], [FormTypeId], [ElementTypeId], [Name], [IsRequired], [ValidationMessage], [AllowNulls], [OrderNumber], [RecordDate], [IsActive]) VALUES (1007, NULL, 1, 1, 1, NULL, 1, N'5', NULL, NULL, 0, 5, CAST(N'2022-04-18T14:19:14.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[FormElement] OFF
GO
SET IDENTITY_INSERT [dbo].[FormElementOptions] ON 
GO
INSERT [dbo].[FormElementOptions] ([Id], [SystemUserId], [LanguageId], [FormElementId], [Name], [Value], [IsSelected], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 1, 1, 0, N'test', N'test', 1, 0, CAST(N'2021-10-19T15:57:45.987' AS DateTime), 0)
GO
INSERT [dbo].[FormElementOptions] ([Id], [SystemUserId], [LanguageId], [FormElementId], [Name], [Value], [IsSelected], [OrderNumber], [RecordDate], [IsActive]) VALUES (2, 1, 1, 1002, N'test', N'test', 0, 0, CAST(N'2021-10-19T16:00:40.450' AS DateTime), 0)
GO
INSERT [dbo].[FormElementOptions] ([Id], [SystemUserId], [LanguageId], [FormElementId], [Name], [Value], [IsSelected], [OrderNumber], [RecordDate], [IsActive]) VALUES (3, 1, 1, 1002, N'g', N'k', 0, 0, CAST(N'2021-10-24T22:16:00.990' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[FormElementOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[FormGroup] ON 
GO
INSERT [dbo].[FormGroup] ([Id], [SystemUserId], [LanguageId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 1, 1, N'test', N'test', 0, CAST(N'2021-10-14' AS Date), 0)
GO
INSERT [dbo].[FormGroup] ([Id], [SystemUserId], [LanguageId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (2, 1, 1, N'test', N'test', 1, CAST(N'2021-10-14' AS Date), 0)
GO
INSERT [dbo].[FormGroup] ([Id], [SystemUserId], [LanguageId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (3, NULL, NULL, N'testasas', N'testasas', 1, CAST(N'2021-10-14' AS Date), 0)
GO
INSERT [dbo].[FormGroup] ([Id], [SystemUserId], [LanguageId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (4, 1, 1, N'2', N'6', 6, CAST(N'2022-04-18' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[FormGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[GeneralSettings] ON 
GO
INSERT [dbo].[GeneralSettings] ([Id], [LanguageId], [SystemUserId], [EmailIpAdress], [EmailAdress], [EmailPort], [EmailPassword], [DomainName], [CdnUrl], [ImageUploadPath], [FileUploadPath], [DeveloperName], [DeveloperEmail], [CategoryImageSmallWidth], [CategoryImageSmallHeight], [CategoryImageBigWidth], [CategoryImageBigHeight], [ContentImageSmallWidth], [ContentImageSmallHeight], [ContentImageBigWidth], [ContentImageBigHeight]) VALUES (7, NULL, NULL, N'1', N'1', 1, N'1', N'https://localhost:44338/', N'https://localhost:44338/Upload/Image', N'~/Upload/Image', N'~/Upload/File', N'Erdoğan KABA', N'erdogankb57@gmail.com', 200, 200, 1000, 1000, 200, 200, 1000, 1000)
GO
INSERT [dbo].[GeneralSettings] ([Id], [LanguageId], [SystemUserId], [EmailIpAdress], [EmailAdress], [EmailPort], [EmailPassword], [DomainName], [CdnUrl], [ImageUploadPath], [FileUploadPath], [DeveloperName], [DeveloperEmail], [CategoryImageSmallWidth], [CategoryImageSmallHeight], [CategoryImageBigWidth], [CategoryImageBigHeight], [ContentImageSmallWidth], [ContentImageSmallHeight], [ContentImageBigWidth], [ContentImageBigHeight]) VALUES (8, 5, 1, N'1', N'1', 1, N'1', N'1', N'1', N'1', N'1', N'1', N'11', 1, 1, 11, 1, 1, 1, 11, 1)
GO
SET IDENTITY_INSERT [dbo].[GeneralSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 
GO
INSERT [dbo].[Language] ([Id], [Code], [Name], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (4, N'tr', N'Türkçe', NULL, 1, CAST(N'2022-04-21T09:20:46.517' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [Code], [Name], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (5, N'en', N'İngilizce', NULL, 1, CAST(N'2022-04-21T09:20:54.467' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET IDENTITY_INSERT [dbo].[LogMessage] ON 
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (33, N'SystemMenuRoleManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemRoleId":3,"SystemMenuId":1,"RecordDate":"0001-01-01T00:00:00"}', CAST(N'2022-04-18T12:59:12.760' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (34, N'FormElementOptionsManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FormElementOptions''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"FormElementId":1002,"Name":"2","Value":"2","IsSelected":false,"OrderNumber":null,"RecordDate":"2022-04-18T12:59:57.3892287+03:00","IsActive":false}', CAST(N'2022-04-18T12:59:57.470' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (35, N'FormElementManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"1","ElementTypeId":1,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2022-04-18T13:00:09.8129749+03:00","IsActive":false}', CAST(N'2022-04-18T13:00:09.870' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (36, N'FormElementManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"1","ElementTypeId":1,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2022-04-18T13:00:56.4569511+03:00","IsActive":false}', CAST(N'2022-04-18T13:02:31.480' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (37, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1002,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"test drop","ElementTypeId":5,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2021-10-19T16:00:27","IsActive":false}', CAST(N'2022-04-18T14:11:35.093' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (38, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1002,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"test drop","ElementTypeId":5,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2021-10-19T16:00:27","IsActive":false}', CAST(N'2022-04-18T14:12:01.503' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (39, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1002,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"test drop","ElementTypeId":5,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2021-10-19T16:00:27","IsActive":false}', CAST(N'2022-04-18T14:12:38.867' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (40, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1002,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"test drop","ElementTypeId":5,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2021-10-19T16:00:27","IsActive":false}', CAST(N'2022-04-18T14:14:18.980' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (41, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1002,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"test drop","ElementTypeId":5,"AllowNulls":false,"OrderNumber":1,"RecordDate":"2021-10-19T16:00:27","IsActive":false}', CAST(N'2022-04-18T14:14:41.237' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (42, N'FormElementManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''SystemUserId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":1,"CategoryId":null,"FormGroupId":2,"Name":"2","ElementTypeId":1,"AllowNulls":false,"OrderNumber":2,"RecordDate":"2022-04-18T14:16:14.7392742+03:00","IsActive":false}', CAST(N'2022-04-18T14:16:15.140' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (43, N'FormElementManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''SystemUserId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":1,"CategoryId":null,"FormGroupId":1,"Name":"as","ElementTypeId":1,"AllowNulls":false,"OrderNumber":0,"RecordDate":"2022-04-18T14:16:33.6108525+03:00","IsActive":false}', CAST(N'2022-04-18T14:16:35.907' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (44, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1007,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"5","ElementTypeId":1,"AllowNulls":false,"OrderNumber":5,"RecordDate":"2022-04-18T14:19:14","IsActive":false}', CAST(N'2022-04-18T14:19:27.360' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (45, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1007,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"5","ElementTypeId":1,"AllowNulls":false,"OrderNumber":5,"RecordDate":"2022-04-18T14:19:14","IsActive":false}', CAST(N'2022-04-18T14:20:50.070' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (46, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1007,"SystemUserId":null,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"5","ElementTypeId":1,"AllowNulls":false,"OrderNumber":5,"RecordDate":"2022-04-18T14:19:14","IsActive":false}', CAST(N'2022-04-18T14:21:30.997' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (47, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1007,"SystemUserId":1,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"5","ElementTypeId":1,"AllowNulls":false,"OrderNumber":5,"RecordDate":"2022-04-18T14:19:14","IsActive":false}', CAST(N'2022-04-18T14:22:10.500' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (48, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1007,"SystemUserId":1,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"5","ElementTypeId":1,"AllowNulls":false,"OrderNumber":5,"RecordDate":"2022-04-18T14:19:14","IsActive":false}', CAST(N'2022-04-18T14:22:40.810' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (49, N'FormElementManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''LanguageId'', table ''IntaKurumsal.dbo.FormElement''; column does not allow nulls. UPDATE fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":1007,"SystemUserId":1,"LanguageId":null,"CategoryId":null,"FormGroupId":1,"Name":"5","ElementTypeId":1,"AllowNulls":false,"OrderNumber":5,"RecordDate":"2022-04-18T14:19:14","IsActive":false}', CAST(N'2022-04-18T14:22:55.540' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (50, N'BannerManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''ImageId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"LanguageId":4,"BannerTypeId":2018,"Name":"c#","Link":null,"TargetId":null,"ShortExplanation":null,"OrderNumber":0,"ImageId":null,"Image":"1-klijp3uwtgae-q9xuc-pva-bfea2a67-7116-40c2-b80c-8ef774a731e1.png","IsActive":false}', CAST(N'2022-04-26T09:13:43.960' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (51, N'BannerManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''ImageId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"LanguageId":4,"BannerTypeId":2018,"Name":"c#","Link":null,"TargetId":null,"ShortExplanation":null,"OrderNumber":0,"ImageId":null,"Image":"1-klijp3uwtgae-q9xuc-pva-4d1eb1b8-a26a-4ff4-b1d5-df1e86174d0c.png","IsActive":false}', CAST(N'2022-04-26T09:15:24.400' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (52, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"ac470837-c1a5-4230-8486-42f48b5ebe03.png","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.4310269+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.597' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (53, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"1b9e5c2c-e335-4760-a27a-e6b337675f78.png","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.618498+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.623' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (54, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"6d35a7a3-a950-480f-ac9c-6ae91fe9abae.jpg","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.629048+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.630' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (55, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"a5c822df-2fe9-419d-94ba-fdb9d86f8695.jpg","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.6356265+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.640' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (56, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"d845aa1b-64a4-4d17-aa09-98b3268c3540.jpg","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.6440216+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.647' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (57, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"c4327322-124f-41a7-be2a-33e689a92b5d.jpg","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.6503392+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.650' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (58, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":null,"LanguageId":null,"RecordId":8015,"Name":"","ShortExplanation":null,"Explanation":null,"FileName":"e8fc8950-08ba-40b9-98e7-492eedf08b11.png","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":0,"RecordDate":"2022-04-26T09:30:02.6561222+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:02.660' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (59, N'RecordFileManager base repository getById', N'Core Microsoft SqlClient Data Provider', N'Invalid column name ''FileId''.', N'', N'   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Linq.Enumerable.TryGetSingle[TSource](IEnumerable`1 source, Boolean& found)
   at lambda_method2031(Closure , QueryContext )
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.GetById(Int32 id) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 0', N'', CAST(N'2022-04-26T09:30:20.940' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (60, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"LanguageId":4,"RecordId":8015,"Name":"s","ShortExplanation":null,"Explanation":null,"FileName":"474ed064-66f1-4b40-904a-6d43e913e877.png","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":null,"RecordDate":"2022-04-26T09:30:20.9492347+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:20.950' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (61, N'RecordFileManager base repository getById', N'Core Microsoft SqlClient Data Provider', N'Invalid column name ''FileId''.', N'', N'   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Linq.Enumerable.TryGetSingle[TSource](IEnumerable`1 source, Boolean& found)
   at lambda_method2031(Closure , QueryContext )
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.GetById(Int32 id) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 0', N'', CAST(N'2022-04-26T09:30:46.510' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (62, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"LanguageId":4,"RecordId":8015,"Name":"a","ShortExplanation":null,"Explanation":null,"FileName":"7ada4143-03f9-41fc-b8d5-815c9ebdb77a.png","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":null,"RecordDate":"2022-04-26T09:30:46.5165401+03:00","IsActive":false}', CAST(N'2022-04-26T09:30:46.520' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (63, N'RecordFileManager base repository getById', N'Core Microsoft SqlClient Data Provider', N'Invalid column name ''FileId''.', N'', N'   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Linq.Enumerable.TryGetSingle[TSource](IEnumerable`1 source, Boolean& found)
   at lambda_method2031(Closure , QueryContext )
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.GetById(Int32 id) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 0', N'', CAST(N'2022-04-26T09:31:08.507' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (64, N'RecordFileManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Invalid column name ''FileId''.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"LanguageId":4,"RecordId":8015,"Name":"a","ShortExplanation":null,"Explanation":null,"FileName":"670a69ee-8efd-4f9b-8954-42caa54da410.png","FileTagName":null,"FileTitleName":null,"TargetId":null,"HomePageStatus":false,"FileId":null,"OrderNumber":null,"RecordDate":"2022-04-26T09:31:16.6185708+03:00","IsActive":false}', CAST(N'2022-04-26T09:31:31.050' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (65, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T14:17:06.567' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (66, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:24:36.823' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (67, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:24:54.007' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (68, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:25:01.457' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (69, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:25:14.710' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (70, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:25:33.483' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (71, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:25:43.057' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (72, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:26:53.220' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (73, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:27:22.313' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (74, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:29:08.713' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (75, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:29:30.687' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (76, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:29:33.963' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (77, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:29:38.713' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (78, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 31', N'""', CAST(N'2022-04-28T15:29:58.457' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (79, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:46:01.957' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (80, N'Mail gönderilirken hata oluştu', N'System.Net.Mail', N'The parameter ''address'' cannot be an empty string. (Parameter ''address'')', N'', N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at Inta.Framework.Extension.Common.MailManager.Send(List`1 Mails, String Message, String Subject) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Common\MailManager.cs:line 30', N'""', CAST(N'2022-04-28T15:46:05.240' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (81, N'FirmVariablesManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FirmVariables''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"LanguageId":4,"Name":"2","Value":null,"Description":"2","OrderNumber":null,"RecordDate":"2022-05-09T14:23:35.2007206+03:00","IsActive":false}', CAST(N'2022-05-09T14:23:35.510' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (82, N'FirmVariablesManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FirmVariables''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"LanguageId":5,"Name":"en","Value":null,"Description":"variable","OrderNumber":null,"RecordDate":"2022-05-09T14:44:03.4445504+03:00","IsActive":false}', CAST(N'2022-05-09T14:44:03.670' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (83, N'FirmVariablesManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FirmVariables''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"LanguageId":5,"Name":"2","Value":null,"Description":"2","OrderNumber":null,"RecordDate":"2022-05-09T14:44:29.8571322+03:00","IsActive":false}', CAST(N'2022-05-09T14:44:29.860' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (84, N'FirmVariablesManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FirmVariables''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"LanguageId":5,"Name":"2","Value":null,"Description":"2","OrderNumber":null,"RecordDate":"2022-05-09T14:44:54.027165+03:00","IsActive":false}', CAST(N'2022-05-09T14:46:01.820' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (85, N'FirmVariablesManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FirmVariables''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"LanguageId":5,"Name":"2","Value":null,"Description":"2","OrderNumber":null,"RecordDate":"2022-05-09T14:47:58.0664116+03:00","IsActive":false}', CAST(N'2022-05-09T14:47:58.353' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (86, N'FirmVariablesManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''OrderNumber'', table ''IntaKurumsal.dbo.FirmVariables''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"LanguageId":5,"Name":"3","Value":null,"Description":"3","OrderNumber":null,"RecordDate":"2022-05-09T14:49:00.9645349+03:00","IsActive":false}', CAST(N'2022-05-09T14:49:00.970' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (87, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.LoginController.Index() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\LoginController.cs:line 22
   at lambda_method123(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-05-31T16:29:59.033' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (88, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.LoginController.Index() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\LoginController.cs:line 22
   at lambda_method123(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-05-31T16:32:19.130' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (89, N'Application Error', N'Microsoft.AspNetCore.Routing', N'The request matched multiple endpoints. Matches: 

Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.GetImageList (Inta.Kurumsal.Admin)
Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.GetImageList (Inta.Kurumsal.Admin)', N'', N'   at Microsoft.AspNetCore.Routing.Matching.DefaultEndpointSelector.ReportAmbiguity(CandidateState[] candidateState)
   at Microsoft.AspNetCore.Routing.Matching.DefaultEndpointSelector.ProcessFinalCandidates(HttpContext httpContext, CandidateState[] candidateState)
   at Microsoft.AspNetCore.Routing.Matching.DefaultEndpointSelector.Select(HttpContext httpContext, CandidateState[] candidateState)
   at Microsoft.AspNetCore.Routing.Matching.DfaMatcher.MatchAsync(HttpContext httpContext)
   at Microsoft.AspNetCore.Routing.EndpointRoutingMiddleware.Invoke(HttpContext httpContext)
   at Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.HttpsPolicy.HttpsRedirectionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.HttpsPolicy.HstsMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.Invoke(HttpContext context)', N'', CAST(N'2022-06-02T15:56:56.157' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (90, N'Application Error', N'Microsoft.AspNetCore.Routing', N'The request matched multiple endpoints. Matches: 

Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.GetImageList (Inta.Kurumsal.Admin)
Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.GetImageList (Inta.Kurumsal.Admin)', N'', N'   at Microsoft.AspNetCore.Routing.Matching.DefaultEndpointSelector.ReportAmbiguity(CandidateState[] candidateState)
   at Microsoft.AspNetCore.Routing.Matching.DefaultEndpointSelector.ProcessFinalCandidates(HttpContext httpContext, CandidateState[] candidateState)
   at Microsoft.AspNetCore.Routing.Matching.DefaultEndpointSelector.Select(HttpContext httpContext, CandidateState[] candidateState)
   at Microsoft.AspNetCore.Routing.Matching.DfaMatcher.MatchAsync(HttpContext httpContext)
   at Microsoft.AspNetCore.Routing.EndpointRoutingMiddleware.Invoke(HttpContext httpContext)
   at Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.HttpsPolicy.HttpsRedirectionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.HttpsPolicy.HstsMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.Invoke(HttpContext context)', N'', CAST(N'2022-06-02T15:57:04.407' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (91, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T15:57:53.293' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (92, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T15:58:01.903' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (93, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T15:58:28.120' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (94, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T15:58:50.960' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (95, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T15:59:28.540' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (96, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:03:04.547' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (97, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:03:30.507' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (98, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:05:05.407' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (99, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:05:12.600' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (100, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:05:46.387' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (101, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:07:21.500' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (102, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:07:45.457' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (103, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:11:09.070' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (104, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method260(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:11:24.263' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (105, N'Application Error', N'System.Drawing.Common', N'A generic error occurred in GDI+.', N'', N'   at System.Drawing.SafeNativeMethods.Gdip.CheckStatus(Int32 status)
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at System.Drawing.Image.Save(String filename, ImageFormat format)
   at System.Drawing.Image.Save(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 38
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:16:15.200' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (106, N'Application Error', N'System.Drawing.Common', N'A generic error occurred in GDI+.', N'', N'   at System.Drawing.SafeNativeMethods.Gdip.CheckStatus(Int32 status)
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at System.Drawing.Image.Save(String filename, ImageFormat format)
   at System.Drawing.Image.Save(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 38
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:16:21.023' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (107, N'Application Error', N'System.Drawing.Common', N'A generic error occurred in GDI+.', N'', N'   at System.Drawing.SafeNativeMethods.Gdip.CheckStatus(Int32 status)
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at System.Drawing.Image.Save(String filename, ImageFormat format)
   at System.Drawing.Image.Save(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 38
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:18:37.793' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (108, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\csharp-nedir-ne-ise-yarar-850x478-05de5a6a-b6e1-4f82-bec1-6a154d1daa29.jpg?d=2.06.2022 16:57:18', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method702(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-02T16:57:38.380' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (109, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\csharp-nedir-ne-ise-yarar-850x478-011721ee-80c5-4fa8-85cc-b6a7ecb39027.jpg?d=3.06.2022 12:05:39', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method689(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T12:05:46.723' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (110, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\csharp-nedir-ne-ise-yarar-850x478-011721ee-80c5-4fa8-85cc-b6a7ecb39027.jpg?d=3.06.2022 12:05:39', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method689(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T12:05:48.553' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (111, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\csharp-nedir-ne-ise-yarar-850x478-011721ee-80c5-4fa8-85cc-b6a7ecb39027.jpg?d=3.06.2022 12:05:39', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method689(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T12:05:55.950' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (112, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\csharp-nedir-ne-ise-yarar-850x478-011721ee-80c5-4fa8-85cc-b6a7ecb39027.jpg?d=3.06.2022 12:06:00', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method689(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T12:06:03.830' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (113, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\csharp-nedir-ne-ise-yarar-850x478-011721ee-80c5-4fa8-85cc-b6a7ecb39027.jpg?d=3.06.2022 13:03:56', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method796(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T13:04:04.453' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (114, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\1-klijp3uwtgae-q9xuc-pva-80163962-7b26-4de9-900e-26343c8d8f26.png?d=3.06.2022 13:05:44', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T13:05:45.413' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (115, N'Application Error', N'System.Drawing.Common', N'C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\wwwroot\Uploads\EditorImages\1-klijp3uwtgae-q9xuc-pva-80163962-7b26-4de9-900e-26343c8d8f26.png?d=3.06.2022 13:07:16', N'', N'   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at Inta.Kurumsal.Admin.Controllers.EditorImageUploadController.CropImage(String imageName, Int32 width, Int32 height, Int32 x, Int32 y) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\EditorImageUploadController.cs:line 30
   at lambda_method252(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-03T13:07:45.580' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (116, N'SystemRoleManager base repository find', N'Core Microsoft SqlClient Data Provider', N'Invalid column name ''Name''.', N'', N'   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Find(Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 112', N'', CAST(N'2022-06-06T14:56:33.887' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (117, N'BannerManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":5017,"SystemUserId":null,"LanguageId":4,"BannerTypeId":2018,"Name":"2","Link":null,"TargetId":null,"ShortExplanation":null,"OrderNumber":3,"Image":"1-uhsx5djhrwiguxowsw-lew-16e09ae6-8841-4757-b536-07938cbd0c10.png","IsActive":true,"RecordDate":"0001-01-01T00:00:00","Price":0.0}', CAST(N'2022-06-06T16:21:36.513' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (118, N'SystemUserManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''Name'', table ''IntaKurumsal.dbo.SystemUser''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"SystemRoleId":0,"Name":null,"SurName":null,"UserName":null,"Password":null,"Email":null,"Phone":null,"Address":null,"RecordDate":"2022-06-06T16:47:16.7975127+03:00","IsActive":false,"IsAdmin":false}', CAST(N'2022-06-06T16:47:17.290' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (119, N'SystemUserManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''Name'', table ''IntaKurumsal.dbo.SystemUser''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"SystemRoleId":0,"Name":null,"SurName":null,"UserName":null,"Password":null,"Email":null,"Phone":null,"Address":null,"RecordDate":"2022-06-06T16:49:55.0809004+03:00","IsActive":false,"IsAdmin":false}', CAST(N'2022-06-06T16:49:55.793' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (120, N'SystemUserManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''Name'', table ''IntaKurumsal.dbo.SystemUser''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"SystemRoleId":0,"Name":null,"SurName":null,"UserName":null,"Password":null,"Email":null,"Phone":null,"Address":null,"RecordDate":"2022-06-06T16:50:03.9457362+03:00","IsActive":false,"IsAdmin":false}', CAST(N'2022-06-06T16:50:39.813' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (121, N'SystemUserManager base repository save', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'Cannot insert the value NULL into column ''Name'', table ''IntaKurumsal.dbo.SystemUser''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Save(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 124', N'{"Id":0,"SystemUserId":1,"SystemRoleId":0,"Name":null,"SurName":null,"UserName":null,"Password":null,"Email":null,"Phone":null,"Address":null,"RecordDate":"2022-06-06T16:54:07.5097641+03:00","IsActive":false,"IsAdmin":false}', CAST(N'2022-06-06T16:54:07.573' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (122, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.BannerController.GetList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\BannerController.cs:line 54
   at lambda_method372(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-06T17:48:44.910' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (123, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.BannerController.GetList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\BannerController.cs:line 54
   at lambda_method372(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-06T17:48:48.623' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (124, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.BannerController.GetList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\BannerController.cs:line 54
   at lambda_method372(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-06T17:48:51.753' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (125, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.BannerController.GetList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\BannerController.cs:line 54
   at lambda_method372(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-06T17:49:11.520' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (126, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-07T11:01:50.177' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (127, N'BannerManager base repository delete', N'Microsoft.EntityFrameworkCore', N'Value cannot be null. (Parameter ''entity'')', N'', N'   at Microsoft.EntityFrameworkCore.Utilities.Check.NotNull[T](T value, String parameterName)
   at Microsoft.EntityFrameworkCore.DbContext.Entry[TEntity](TEntity entity)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Delete(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 15', N'', CAST(N'2022-06-07T11:02:09.517' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (128, N'BannerManager base repository delete', N'Microsoft.EntityFrameworkCore', N'Value cannot be null. (Parameter ''entity'')', N'', N'   at Microsoft.EntityFrameworkCore.Utilities.Check.NotNull[T](T value, String parameterName)
   at Microsoft.EntityFrameworkCore.DbContext.Entry[TEntity](TEntity entity)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Delete(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 15', N'', CAST(N'2022-06-07T11:02:17.863' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (129, N'BannerManager base repository delete', N'Microsoft.EntityFrameworkCore', N'Value cannot be null. (Parameter ''entity'')', N'', N'   at Microsoft.EntityFrameworkCore.Utilities.Check.NotNull[T](T value, String parameterName)
   at Microsoft.EntityFrameworkCore.DbContext.Entry[TEntity](TEntity entity)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Delete(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 15', N'', CAST(N'2022-06-07T11:02:32.870' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (130, N'BannerManager base repository delete', N'Microsoft.EntityFrameworkCore', N'Value cannot be null. (Parameter ''entity'')', N'', N'   at Microsoft.EntityFrameworkCore.Utilities.Check.NotNull[T](T value, String parameterName)
   at Microsoft.EntityFrameworkCore.DbContext.Entry[TEntity](TEntity entity)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Delete(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 15', N'', CAST(N'2022-06-07T11:02:50.050' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (131, N'BannerManager base repository delete', N'Microsoft.EntityFrameworkCore', N'Value cannot be null. (Parameter ''entity'')', N'', N'   at Microsoft.EntityFrameworkCore.Utilities.Check.NotNull[T](T value, String parameterName)
   at Microsoft.EntityFrameworkCore.DbContext.Entry[TEntity](TEntity entity)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Delete(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 15', N'', CAST(N'2022-06-07T11:03:35.627' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (132, N'BannerManager base repository delete', N'Microsoft.EntityFrameworkCore', N'Value cannot be null. (Parameter ''entity'')', N'', N'   at Microsoft.EntityFrameworkCore.Utilities.Check.NotNull[T](T value, String parameterName)
   at Microsoft.EntityFrameworkCore.DbContext.Entry[TEntity](TEntity entity)
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Delete(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 15', N'', CAST(N'2022-06-07T11:04:33.403' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (133, N'BannerManager base repository update', N'Microsoft.EntityFrameworkCore.Relational', N'An error occurred while saving the entity changes. See the inner exception for details.', N'The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__104_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at Inta.EntityFramework.Core.Base.RepositoryBase`2.Update(TEntity Entity) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\Base\RepositoryBase.cs:line 152', N'{"Id":62400,"SystemUserId":null,"LanguageId":4,"BannerTypeId":2018,"Name":"62401","Link":"1","TargetId":1,"ShortExplanation":"1","OrderNumber":1,"Image":"1","IsActive":true,"RecordDate":"0001-01-01T00:00:00","Price":0.0}', CAST(N'2022-06-07T13:42:47.617' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (134, N'Application Error', N'System.Linq.Expressions', N'The binary operator AndAlso is not defined for the types ''System.Boolean'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.AndAlso(Expression left, Expression right, MethodInfo method)
   at System.Linq.Expressions.Expression.AndAlso(Expression left, Expression right)
   at System.Linq.Enumerable.Aggregate[TSource](IEnumerable`1 source, Func`3 func)
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 44
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-09T14:40:52.617' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (135, N'Application Error', N'System.Linq.Expressions', N'The binary operator OrElse is not defined for the types ''System.Boolean'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.OrElse(Expression left, Expression right, MethodInfo method)
   at System.Linq.Expressions.Expression.OrElse(Expression left, Expression right)
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 38
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-09T17:05:43.690' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (136, N'Application Error', N'System.Linq.Expressions', N'The binary operator OrElse is not defined for the types ''System.Boolean'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.OrElse(Expression left, Expression right, MethodInfo method)
   at System.Linq.Expressions.Expression.OrElse(Expression left, Expression right)
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 38
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Routing.EndpointRoutingMiddleware.<Invoke>g__AwaitMatcher|8_0(EndpointRoutingMiddleware middleware, HttpContext httpContext, Task`1 matcherTask)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-09T17:05:43.690' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (137, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''right'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.And(Expression left, Expression right, MethodInfo method)
   at System.Linq.Expressions.Expression.And(Expression left, Expression right)
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 36
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T11:20:59.743' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (138, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Boolean'' and ''System.String''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 34
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 20
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 50
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T11:35:48.707' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (139, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Boolean'' and ''System.String''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 34
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 20
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 50
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T11:36:17.910' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (140, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Boolean'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 34
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 20
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 50
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T11:37:30.307' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (141, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:43:55.367' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (142, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:45:56.237' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (143, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:45:58.923' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (144, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:47:00.840' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (145, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:47:05.370' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (146, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:47:11.847' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (147, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Boolean]'' and ''System.Boolean''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 55
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:49:02.400' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (148, N'Application Error', N'System.Linq.Expressions', N'Instance property ''LanguageId'' is not defined for type ''Inta.Kurumsal.Entity.Concrete.Language'' (Parameter ''propertyName'')', N'', N'   at System.Linq.Expressions.Expression.Property(Expression expression, String propertyName)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 42
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.<ExecuteAsync>b__8_1() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Shared\_Layout.cshtml:line 143
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.ExecuteAsync()
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderLayoutAsync(ViewContext context, ViewBufferTextWriter bodyWriter)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:56:55.557' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (149, N'Application Error', N'System.Linq.Expressions', N'Instance property ''LanguageId'' is not defined for type ''Inta.Kurumsal.Entity.Concrete.Language'' (Parameter ''propertyName'')', N'', N'   at System.Linq.Expressions.Expression.Property(Expression expression, String propertyName)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 42
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.<ExecuteAsync>b__8_1()
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.ExecuteAsync()
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderLayoutAsync(ViewContext context, ViewBufferTextWriter bodyWriter)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:57:26.150' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (150, N'Application Error', N'System.Linq.Expressions', N'Instance property ''LanguageId'' is not defined for type ''Inta.Kurumsal.Entity.Concrete.Language'' (Parameter ''propertyName'')', N'', N'   at System.Linq.Expressions.Expression.Property(Expression expression, String propertyName)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 42
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.<ExecuteAsync>b__8_1#1()
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.ExecuteAsync()
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderLayoutAsync(ViewContext context, ViewBufferTextWriter bodyWriter)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:57:35.623' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (151, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:59:24.590' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (152, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T14:59:36.520' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (153, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:01:45.173' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (154, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:01:58.583' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (155, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:02:32.620' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (156, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:03:15.010' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (157, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:03:43.117' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (158, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:04:12.990' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (159, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:05:36.960' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (160, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:12:59.660' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (161, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:13:07.947' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (162, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:17:52.757' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (163, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:18:14.757' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (164, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 34
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:23:43.220' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (165, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 34
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:25:03.940' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (166, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 44
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 34
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:29:47.153' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (167, N'Application Error', N'System.Private.CoreLib', N'Invalid cast from ''System.Int32'' to ''System.Nullable`1[[System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]''.', N'', N'   at System.Convert.DefaultToType(IConvertible value, Type targetType, IFormatProvider provider)
   at System.Int32.System.IConvertible.ToType(Type type, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 43
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:35:47.253' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (168, N'Application Error', N'System.Private.CoreLib', N'Invalid cast from ''System.Int32'' to ''System.Nullable`1[[System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]''.', N'', N'   at System.Convert.DefaultToType(IConvertible value, Type targetType, IFormatProvider provider)
   at System.Int32.System.IConvertible.ToType(Type type, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 43
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:36:07.717' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (169, N'Application Error', N'System.Private.CoreLib', N'Invalid cast from ''System.Int32'' to ''System.Nullable`1[[System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]''.', N'', N'   at System.Convert.DefaultToType(IConvertible value, Type targetType, IFormatProvider provider)
   at System.Int32.System.IConvertible.ToType(Type type, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 43
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel, ParameterExpression parameter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 22
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 30
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-10T15:37:25.707' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (170, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32[]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 49
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:42:05.670' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (171, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32[]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 49
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:42:12.130' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (172, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32[]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 49
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:42:33.730' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (173, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32[]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 49
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:42:41.830' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (174, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Boolean'' and ''Inta.EntityFramework.Core.DynamicExpression.ExpressionItem''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 49
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:45:11.763' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (175, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 64
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:45:53.690' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (176, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 64
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 25
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:46:49.053' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (177, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:51:14.667' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (178, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:51:26.753' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (179, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:52:01.767' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (180, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:52:21.010' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (181, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''method'')', N'', N'   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:55:15.473' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (182, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:57:35.190' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (183, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:58:28.413' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (184, N'Application Error', N'System.Private.CoreLib', N'Ambiguous match found.', N'', N'   at System.RuntimeType.GetMethodImplCommon(String name, Int32 genericParameterCount, BindingFlags bindingAttr, Binder binder, CallingConventions callConv, Type[] types, ParameterModifier[] modifiers)
   at System.Type.GetMethod(String name, BindingFlags bindingAttr)
   at System.Type.GetMethod(String name)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 45
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T13:58:37.833' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (185, N'Application Error', N'System.Linq.Expressions', N'Method ''Boolean Contains(System.String)'' declared on type ''System.String'' cannot be called with instance of type ''System.Int32''', N'', N'   at System.Linq.Expressions.Expression.ValidateCallInstanceType(Type instanceType, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateStaticOrInstanceMethod(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateMethodAndGetParameters(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:07:08.727' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (186, N'Application Error', N'System.Linq.Expressions', N'Method ''Boolean Contains(System.String)'' declared on type ''System.String'' cannot be called with instance of type ''System.Int32''', N'', N'   at System.Linq.Expressions.Expression.ValidateCallInstanceType(Type instanceType, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateStaticOrInstanceMethod(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateMethodAndGetParameters(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:08:01.103' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (187, N'Application Error', N'System.Linq.Expressions', N'Method ''Boolean Contains(System.String)'' declared on type ''System.String'' cannot be called with instance of type ''System.Int32''', N'', N'   at System.Linq.Expressions.Expression.ValidateCallInstanceType(Type instanceType, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateStaticOrInstanceMethod(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateMethodAndGetParameters(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:08:36.633' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (188, N'Application Error', N'System.Linq.Expressions', N'Method ''Boolean Contains(System.String)'' declared on type ''System.String'' cannot be called with instance of type ''System.Int32''', N'', N'   at System.Linq.Expressions.Expression.ValidateCallInstanceType(Type instanceType, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateStaticOrInstanceMethod(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateMethodAndGetParameters(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:09:23.500' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (189, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32'' and ''System.String''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:11:12.263' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (190, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''method'')', N'', N'   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:14:05.720' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (191, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32'' and ''System.Int32[]''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 69
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:21:38.557' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (192, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Int32'' and ''System.Int32[]''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 69
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:21:56.377' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (193, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''method'')', N'', N'   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:40:45.517' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (194, N'Application Error', N'System.Linq.Expressions', N'Static method requires null instance, non-static method requires non-null instance.', N'', N'   at System.Linq.Expressions.Expression.ValidateStaticOrInstanceMethod(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateMethodAndGetParameters(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 70
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:43:52.810' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (195, N'Application Error', N'System.Linq.Expressions', N'Expression of type ''System.String[]'' cannot be used for parameter of type ''System.String'' of method ''Boolean Contains(System.String)'' (Parameter ''arg0'')', N'', N'   at System.Dynamic.Utils.ExpressionUtils.ValidateOneArgument(MethodBase method, ExpressionType nodeKind, Expression arguments, ParameterInfo pi, String methodParamName, String argumentParamName, Int32 index)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 67
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T14:44:47.260' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (196, N'Application Error', N'System.Linq.Expressions', N'Method ''Boolean Contains(System.String)'' declared on type ''System.Collections.Generic.List`1[System.String]'' cannot be called with instance of type ''System.RuntimeType''', N'', N'   at System.Linq.Expressions.Expression.ValidateCallInstanceType(Type instanceType, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateStaticOrInstanceMethod(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.ValidateMethodAndGetParameters(Expression instance, MethodInfo method)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 75
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T16:06:37.663' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (197, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''method'')', N'', N'   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 75
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T16:13:03.310' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (198, N'Application Error', N'System.Linq.Expressions', N'Expression of type ''System.Int32'' cannot be used for parameter of type ''System.Object'' of method ''Boolean Contains(System.Object)'' (Parameter ''arg0'')', N'', N'   at System.Dynamic.Utils.ExpressionUtils.ValidateOneArgument(MethodBase method, ExpressionType nodeKind, Expression arguments, ParameterInfo pi, String methodParamName, String argumentParamName, Int32 index)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 76
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:38:58.010' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (199, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 58
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:42:54.793' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (200, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 58
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:43:11.100' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (201, N'Application Error', N'System.Linq.Expressions', N'The binary operator Equal is not defined for the types ''System.Nullable`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetEqualityComparisonOperator(ExpressionType binaryType, String opName, Expression left, Expression right, Boolean liftToNull)
   at System.Linq.Expressions.Expression.Equal(Expression left, Expression right, Boolean liftToNull, MethodInfo method)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 58
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Banner_Add.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Banner\Add.cshtml:line 33
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.PartialViewResultExecutor.ExecuteAsync(ActionContext context, PartialViewResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:43:43.270' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (202, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Collections.Generic.List`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 55
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:45:30.313' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (203, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Collections.Generic.List`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 55
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:46:10.303' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (204, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Collections.Generic.List`1[System.Int32]'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 55
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:46:17.170' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (205, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Collections.Generic.List`1[System.Int32]'' and ''Inta.EntityFramework.Core.DynamicExpression.ExpressionItem''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 57
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:48:34.610' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (206, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Boolean'' and ''System.Linq.Expressions.PropertyExpression''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 59
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:49:36.923' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (207, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.Collections.Generic.List`1[System.Int32]'' and ''Inta.EntityFramework.Core.DynamicExpression.ExpressionItem''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 57
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionModels) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-15T17:50:29.450' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (208, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 178
   at lambda_method400(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T11:18:26.327' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (209, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 178
   at lambda_method400(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T11:19:19.120' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (210, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 189
   at lambda_method570(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T11:41:30.650' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (211, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''left'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.AndAlso(Expression left, Expression right, MethodInfo method)
   at System.Linq.Expressions.Expression.AndAlso(Expression left, Expression right)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 95
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 185
   at lambda_method399(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:03:51.853' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (212, N'Application Error', N'Anonymously Hosted DynamicMethods Assembly', N'Error mapping types.

Mapping types:
Expression`1 -> Expression`1
System.Linq.Expressions.Expression`1[[System.Func`2[[Inta.Kurumsal.Entity.Concrete.BannerType, Inta.Kurumsal.Entity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null],[System.Boolean, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]] -> System.Linq.Expressions.Expression`1[[System.Func`2[[Inta.Kurumsal.Dto.Concrete.BannerTypeDto, Inta.Kurumsal.Dto, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null],[System.Boolean, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]

Type Map configuration:
Expression`1 -> Expression`1
System.Linq.Expressions.Expression`1[[System.Func`2[[Inta.Kurumsal.Entity.Concrete.BannerType, Inta.Kurumsal.Entity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null],[System.Boolean, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]] -> System.Linq.Expressions.Expression`1[[System.Func`2[[Inta.Kurumsal.Dto.Concrete.BannerTypeDto, Inta.Kurumsal.Dto, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null],[System.Boolean, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]

Destination Member:
Parameters
', N'Object reference not set to an instance of an object.', N'   at lambda_method404(Closure , Object , Expression`1 , ResolutionContext )
   at Inta.Kurumsal.Bussiness.Service.BannerTypeService.Find(Expression`1 filter) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Service\BannerTypeService.cs:line 32
   at Inta.Kurumsal.Admin.Controllers.BannerTypeController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\BannerTypeController.cs:line 40
   at lambda_method395(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:17:18.620' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (213, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''System.String'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 59
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 188
   at lambda_method421(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:18:23.793' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (214, N'Application Error', N'System.Private.CoreLib', N'Invalid cast from ''System.Int32'' to ''System.Nullable`1[[System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]''.', N'', N'   at System.Convert.DefaultToType(IConvertible value, Type targetType, IFormatProvider provider)
   at System.Int32.System.IConvertible.ToType(Type type, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 61
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 188
   at lambda_method399(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:25:03.623' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (215, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 183
   at lambda_method399(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:36:38.400' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (216, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 183
   at lambda_method401(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:39:56.203' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (217, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 183
   at lambda_method401(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:41:04.730' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (218, N'Application Error', N'Inta.Kurumsal.Admin', N'Object reference not set to an instance of an object.', N'', N'   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 183
   at lambda_method399(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T15:48:40.457' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (219, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''Newtonsoft.Json.Linq.JArray'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 60
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request)
   at lambda_method401(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T16:34:18.063' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (220, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''method'')', N'', N'   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 83
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request)
   at lambda_method622(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T16:35:18.837' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (221, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''method'')', N'', N'   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression arg0)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, IEnumerable`1 arguments)
   at System.Linq.Expressions.Expression.Call(Expression instance, MethodInfo method, Expression[] arguments)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 83
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 26
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 185
   at lambda_method401(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T16:43:40.573' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (222, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''left'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.AndAlso(Expression left, Expression right, MethodInfo method)
   at System.Linq.Expressions.Expression.AndAlso(Expression left, Expression right)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 105
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 27
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 185
   at lambda_method401(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T17:21:12.460' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (223, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''Newtonsoft.Json.Linq.JArray'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel)
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 185
   at lambda_method399(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T17:46:47.110' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (224, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''Newtonsoft.Json.Linq.JArray'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel)
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 185
   at lambda_method574(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T17:47:35.717' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (225, N'Application Error', N'System.Linq.Expressions', N'No coercion operator is defined between types ''Newtonsoft.Json.Linq.JArray'' and ''System.Int32''.', N'', N'   at System.Linq.Expressions.Expression.GetUserDefinedCoercionOrThrow(ExpressionType coercionType, Expression expression, Type convertToType)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type, MethodInfo method)
   at System.Linq.Expressions.Expression.Convert(Expression expression, Type type)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionModel)
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 185
   at lambda_method574(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-24T17:48:00.790' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (226, N'Application Error', N'Newtonsoft.Json', N'Could not convert string to integer: AND. Path ''[0].MergeOperator'', line 1, position 55.', N'', N'   at Newtonsoft.Json.JsonReader.ReadInt32String(String s)
   at Newtonsoft.Json.JsonTextReader.FinishReadQuotedNumber(ReadType readType)
   at Newtonsoft.Json.JsonTextReader.ReadNumberValue(ReadType readType)
   at Newtonsoft.Json.JsonTextReader.ReadAsInt32()
   at Newtonsoft.Json.JsonReader.ReadForType(JsonContract contract, Boolean hasConverter)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateList(IList list, JsonReader reader, JsonArrayContract contract, JsonProperty containerProperty, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateList(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, Object existingValue, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonSerializer.Deserialize(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)
   at Inta.Framework.Extension.Serializer.JavaScript`1.Deserialize(String val) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Serializer\JavaScript.cs:line 19
   at Inta.Kurumsal.Admin.Models.DataTableAjaxPostModel.get_SearchParameterItem() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Models\DataTableAjaxPostModel.cs:line 24
   at Microsoft.Extensions.Internal.PropertyHelper.CallNullSafePropertyGetter[TDeclaringType,TValue](Func`2 getter, Object target)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertyAsync(ModelBindingContext bindingContext, ModelMetadata property, IModelBinder propertyBinder, String fieldName, String modelName)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertiesAsync(ModelBindingContext bindingContext, Int32 propertyData, IReadOnlyList`1 boundProperties)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindModelCoreAsync(ModelBindingContext bindingContext, Int32 propertyData)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-27T09:56:35.417' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (227, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''body'')', N'', N'   at System.Linq.Expressions.Expression.ValidateLambdaArgs(Type delegateType, Expression& body, ReadOnlyCollection`1 parameters, String paramName)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, String name, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, Boolean tailCall, IEnumerable`1 parameters)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 24
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.<ExecuteAsync>b__8_1() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Shared\_Layout.cshtml:line 143
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.ExecuteAsync()
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderLayoutAsync(ViewContext context, ViewBufferTextWriter bodyWriter)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-28T14:48:28.170' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (228, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''body'')', N'', N'   at System.Linq.Expressions.Expression.ValidateLambdaArgs(Type delegateType, Expression& body, ReadOnlyCollection`1 parameters, String paramName)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, String name, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, Boolean tailCall, IEnumerable`1 parameters)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 24
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 186
   at lambda_method397(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-28T15:27:20.453' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (229, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''body'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.ValidateLambdaArgs(Type delegateType, Expression& body, ReadOnlyCollection`1 parameters, String paramName)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, String name, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, ParameterExpression[] parameters)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 24
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-28T15:55:33.313' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (230, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''body'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.ValidateLambdaArgs(Type delegateType, Expression& body, ReadOnlyCollection`1 parameters, String paramName)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, String name, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, ParameterExpression[] parameters)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 24
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__5>d.MoveNext() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 91
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCoreGeneratedDocument.Views_Login_Index.<>c__DisplayClass18_0.<<ExecuteAsync>b__1>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Login_Index.ExecuteAsync() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Login\Index.cshtml:line 3
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-28T16:09:50.833' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (231, N'Application Error', N'Inta.EntityFramework.Core', N'Object reference not set to an instance of an object.', N'', N'   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 148
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 21
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.<ExecuteAsync>b__8_1() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Shared\_Layout.cshtml:line 143
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.ExecuteAsync()
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderLayoutAsync(ViewContext context, ViewBufferTextWriter bodyWriter)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T09:58:15.560' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (232, N'Application Error', N'Inta.EntityFramework.Core', N'Object reference not set to an instance of an object.', N'', N'   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpressionItem(List`1 expressionItems, ParameterExpression parameterExpression) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 156
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 21
   at Inta.Kurumsal.Bussiness.Common.Html.DropDownListForService[TDto,TEntity](IHtmlHelper content, String serviceName, String DisplayName, String ValueName, String objectName, String selectedValue, Boolean isRequired, String DefaultText, String DefaultValue, List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Bussiness\Common\Html.cs:line 29
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.<ExecuteAsync>b__8_1() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Views\Shared\_Layout.cshtml:line 143
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.SetOutputContentAsync()
   at AspNetCoreGeneratedDocument.Views_Shared__Layout.ExecuteAsync()
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderLayoutAsync(ViewContext context, ViewBufferTextWriter bodyWriter)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T12:58:05.873' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (233, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''body'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.ValidateLambdaArgs(Type delegateType, Expression& body, ReadOnlyCollection`1 parameters, String paramName)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, String name, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, ParameterExpression[] parameters)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 23
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 186
   at lambda_method380(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T13:06:31.670' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (234, N'Application Error', N'System.Linq.Expressions', N'Value cannot be null. (Parameter ''body'')', N'', N'   at System.Dynamic.Utils.ContractUtils.RequiresNotNull(Object value, String paramName, Int32 index)
   at System.Dynamic.Utils.ExpressionUtils.RequiresCanRead(Expression expression, String paramName, Int32 idx)
   at System.Linq.Expressions.Expression.ValidateLambdaArgs(Type delegateType, Expression& body, ReadOnlyCollection`1 parameters, String paramName)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, String name, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, Boolean tailCall, IEnumerable`1 parameters)
   at System.Linq.Expressions.Expression.Lambda[TDelegate](Expression body, ParameterExpression[] parameters)
   at Inta.EntityFramework.Core.DynamicExpression.ExpressionBuilder`1.CreateExpression(List`1 expressionItems) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.EntityFramework.Core\DynamicExpression\ExpressionBuilder.cs:line 23
   at Inta.Kurumsal.Admin.Controllers.CategoryController.GetDataList(DataTableAjaxPostModel request) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Controllers\CategoryController.cs:line 186
   at lambda_method380(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T13:06:31.670' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (235, N'Application Error', N'Newtonsoft.Json', N'Value cannot be null. (Parameter ''value'')', N'', N'   at Newtonsoft.Json.Utilities.ValidationUtils.ArgumentNotNull(Object value, String parameterName)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)
   at Inta.Framework.Extension.Serializer.JavaScript`1.Deserialize(String val) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Serializer\JavaScript.cs:line 19
   at Inta.Kurumsal.Admin.Models.DataTableAjaxPostModel.get_SearchParameterItem() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Models\DataTableAjaxPostModel.cs:line 24
   at Microsoft.Extensions.Internal.PropertyHelper.CallNullSafePropertyGetter[TDeclaringType,TValue](Func`2 getter, Object target)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertyAsync(ModelBindingContext bindingContext, ModelMetadata property, IModelBinder propertyBinder, String fieldName, String modelName)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertiesAsync(ModelBindingContext bindingContext, Int32 propertyData, IReadOnlyList`1 boundProperties)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindModelCoreAsync(ModelBindingContext bindingContext, Int32 propertyData)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T16:56:39.767' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (236, N'Application Error', N'Newtonsoft.Json', N'Value cannot be null. (Parameter ''value'')', N'', N'   at Newtonsoft.Json.Utilities.ValidationUtils.ArgumentNotNull(Object value, String parameterName)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)
   at Inta.Framework.Extension.Serializer.JavaScript`1.Deserialize(String val) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Serializer\JavaScript.cs:line 19
   at Inta.Kurumsal.Admin.Models.DataTableAjaxPostModel.get_SearchParameterItem() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Models\DataTableAjaxPostModel.cs:line 24
   at Microsoft.Extensions.Internal.PropertyHelper.CallNullSafePropertyGetter[TDeclaringType,TValue](Func`2 getter, Object target)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertyAsync(ModelBindingContext bindingContext, ModelMetadata property, IModelBinder propertyBinder, String fieldName, String modelName)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertiesAsync(ModelBindingContext bindingContext, Int32 propertyData, IReadOnlyList`1 boundProperties)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindModelCoreAsync(ModelBindingContext bindingContext, Int32 propertyData)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T16:56:47.797' AS DateTime))
GO
INSERT [dbo].[LogMessage] ([Id], [Message], [Source], [ErrorMessage], [InnerException], [StackTrace], [ObjectSource], [RecordDate]) VALUES (237, N'Application Error', N'Newtonsoft.Json', N'Value cannot be null. (Parameter ''value'')', N'', N'   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Inta.Framework.Extension.Serializer.JavaScript`1.Deserialize(String val) in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Framework\Inta.Framework.Extension\Serializer\JavaScript.cs:line 19
   at Inta.Kurumsal.Admin.Models.DataTableAjaxPostModel.get_SearchParameterItem() in C:\Users\e.kaba\Documents\GitHub\AspNetCoreRepository\Inta.Kurumsal\Inta.Kurumsal.Admin\Models\DataTableAjaxPostModel.cs:line 24
   at Microsoft.Extensions.Internal.PropertyHelper.CallNullSafePropertyGetter[TDeclaringType,TValue](Func`2 getter, Object target)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertyAsync(ModelBindingContext bindingContext, ModelMetadata property, IModelBinder propertyBinder, String fieldName, String modelName)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindPropertiesAsync(ModelBindingContext bindingContext, Int32 propertyData, IReadOnlyList`1 boundProperties)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ComplexObjectModelBinder.BindModelCoreAsync(ModelBindingContext bindingContext, Int32 propertyData)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)', N'', CAST(N'2022-06-29T16:56:53.873' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LogMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[MessageHistory] ON 
GO
INSERT [dbo].[MessageHistory] ([Id], [LanguageId], [MessageTypeId], [ClientName], [ClientSurname], [Email], [Phone], [Subject], [Explanation], [IsArchive], [IsRead], [ArchiveDate], [IpNumber], [RecordDate]) VALUES (2, 1, 1, N'1', N'11', N'1', N'1', N'1', N'1', 1, 1, NULL, NULL, CAST(N'2021-10-18T19:17:57.513' AS DateTime))
GO
INSERT [dbo].[MessageHistory] ([Id], [LanguageId], [MessageTypeId], [ClientName], [ClientSurname], [Email], [Phone], [Subject], [Explanation], [IsArchive], [IsRead], [ArchiveDate], [IpNumber], [RecordDate]) VALUES (3, 1, 1, N'1', N'1', N'1', N'1', N'1', N'1', 1, 1, NULL, NULL, CAST(N'2021-10-18T19:27:31.243' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MessageHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[PageType] ON 
GO
INSERT [dbo].[PageType] ([Id], [SystemUserId], [Code], [Name], [ControllerName], [ActionName], [ViewName], [IsExplanationEnabled], [IsShortExplanationEnabled], [CanContentBeAdded], [IsMenuFirstRecord], [IsMenuFirstCategory], [IsPagingEnabled], [RecordDate], [IsActive]) VALUES (2, NULL, N'1', N'İçerik listesi sayfası', N'1', N'1', N'1', 1, 0, 1, 0, 0, 0, NULL, 0)
GO
INSERT [dbo].[PageType] ([Id], [SystemUserId], [Code], [Name], [ControllerName], [ActionName], [ViewName], [IsExplanationEnabled], [IsShortExplanationEnabled], [CanContentBeAdded], [IsMenuFirstRecord], [IsMenuFirstCategory], [IsPagingEnabled], [RecordDate], [IsActive]) VALUES (3, NULL, N'CATLIST', N'Kategori Listeleme sayfası', N'Category', N'Index', N'Index', 0, 0, 0, 0, 0, 0, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[PageType] OFF
GO
SET IDENTITY_INSERT [dbo].[Record] ON 
GO
INSERT [dbo].[Record] ([Id], [SystemUserId], [LanguageId], [CategoryId], [Name], [RecordUrl], [Title], [MetaDescription], [MetaKeywords], [Url], [ShortContent], [Link], [TargetType], [ShortExplanation], [Explanation], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (8015, NULL, 4, 6039, N'sss', N'sss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<img alt="" src="/Uploads/65fea9ac-e1aa-4cdf-9356-11626b02909b.jpg" style="height:478px; width:850px" />', NULL, N'csharp-1-1-c0624383-d4f8-4172-9f68-eccdb7f512f5.jpg', 0, CAST(N'2022-04-25T15:10:48.000' AS DateTime), 0)
GO
INSERT [dbo].[Record] ([Id], [SystemUserId], [LanguageId], [CategoryId], [Name], [RecordUrl], [Title], [MetaDescription], [MetaKeywords], [Url], [ShortContent], [Link], [TargetType], [ShortExplanation], [Explanation], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (8016, NULL, 5, 6030, N'test', N'test', NULL, NULL, NULL, NULL, N'a', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2022-04-27T09:08:21.000' AS DateTime), 0)
GO
INSERT [dbo].[Record] ([Id], [SystemUserId], [LanguageId], [CategoryId], [Name], [RecordUrl], [Title], [MetaDescription], [MetaKeywords], [Url], [ShortContent], [Link], [TargetType], [ShortExplanation], [Explanation], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (8017, NULL, 4, 6046, N'Test', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'monthcalender-06d7a06a-dfd0-4359-acbc-9602ecf32b49.png', 0, CAST(N'2022-05-09T14:12:29.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Record] OFF
GO
SET IDENTITY_INSERT [dbo].[RecordFile] ON 
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1009, 0, 0, 1005, N'', NULL, NULL, N'5e43d3ebae298b0ffcf825b0.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:09.153' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1010, 0, 0, 1005, N'', NULL, NULL, N'1849872_620x410 - Kopya - Kopya.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:09.183' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1011, 0, 0, 1005, N'', NULL, NULL, N'1849872_620x410 - Kopya (2) - Kopya.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:09.203' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1012, 0, 0, 1005, N'sdsds', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:09.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1013, 0, 0, 0, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:09.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1014, 0, 0, 0, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:09.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1016, 1, 1, 0, N'as', NULL, NULL, N'System.Web.HttpPostedFileWrapper', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:19:59.843' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (1017, 0, 0, 0, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-17T14:25:03.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (2007, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (2) - Kopya.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-18T21:27:40.137' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (2008, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (2).jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-18T21:27:40.177' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (2009, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (3) - Kopya.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-18T21:27:40.183' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (2010, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (3).jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-18T21:27:40.193' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (3007, 1, 1, 4005, N'1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2021-10-20T17:10:02.383' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4014, 1, 1, 0, N'ghgh', NULL, NULL, N'C:\Users\Erdoğan\Source\Repos\erdogankb57\WorkspaceRepository\Inta.Kurumsal\Inta.Kurumsal.Web\Upload\File\8e9c3cdf-b446-463e-91d1-1eb222708036.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T17:56:01.463' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4016, 1, 1, 0, N'fdfgfg', NULL, NULL, N'7bc0bc75-f61c-471c-8cde-8fbf2570247c.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T17:57:42.680' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4018, 0, 0, 4007, N'', NULL, NULL, N'86826a1c-223f-4f47-b885-d1e4d30452ea.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T18:02:20.970' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4019, 0, 0, 4007, N'', NULL, NULL, N'377fc127-07a0-4a6f-8e89-691f0712d398.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T18:02:21.067' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4020, 0, 0, 4007, N'', NULL, NULL, N'ac212bae-9ad7-4386-a2c4-e0756a0d5b98.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T18:02:21.073' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4021, 0, 0, 4007, N'', NULL, NULL, N'1512e59e-5d20-463a-bffa-2793831e5c92.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T18:02:21.077' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4022, 0, 0, 4007, N'', NULL, NULL, N'a065229c-3901-4b8a-8d17-435ed1d18287.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T18:02:21.080' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (4023, 0, 0, 4007, N'test', NULL, NULL, N'6cfa186b-9f93-4bcf-b69a-32dc1575ece2.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T18:02:21.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (5007, 0, 0, 4007, N'', NULL, NULL, N'b209558a-120f-4daf-be54-983836dfe8ac.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T20:56:12.233' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (5008, 0, 0, 4006, N'cfdfdf', NULL, NULL, N'2abd7272-e483-4289-aeeb-fcdfdda97206.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:11:23.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7011, 0, 0, 5008, N'', NULL, NULL, N'e185a79e-2563-4698-b55b-f84116f65f70.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:47.657' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7012, 0, 0, 5008, N'', NULL, NULL, N'c228e6ca-cbce-4fa6-865b-d97649a5cf4c.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:47.700' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7013, 0, 0, 5008, N'', NULL, NULL, N'8f16622d-a06b-4171-9c29-25dd47cba73f.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:47.707' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7014, 0, 0, 5008, N'', NULL, NULL, N'6ca40673-fc9f-488f-a73f-5a0fc8937b6a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:47.713' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7015, 0, 0, 5008, N'', NULL, NULL, N'1857bf1f-c39c-48db-bb61-d99257ed264f.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:47.717' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7016, 0, 0, 5008, N'', NULL, NULL, N'0691c1a4-2e76-45eb-a60b-84914fb23b1a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:56.090' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7017, 0, 0, 5008, N'', NULL, NULL, N'ed32a6ea-e7e2-4f6b-9420-c0b92ffa3dc3.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:56.123' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7018, 0, 0, 5008, N'', NULL, NULL, N'4f99c380-7f12-4602-8d48-e7f4673b6cae.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:56.127' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7019, 0, 0, 5008, N'', NULL, NULL, N'f5859ebf-3177-47a0-9f89-9de49ce91697.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:56.133' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7020, 0, 0, 5008, N'', NULL, NULL, N'117d9105-df81-4528-9a6b-48707e5606c6.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:19:56.147' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7021, 0, 0, 5008, N'', NULL, NULL, N'9b21314f-4970-4bd0-a1f2-45ffe1b70ba9.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:20:08.233' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7022, 0, 0, 5008, N'', NULL, NULL, N'2ba7d960-c6af-4ead-9f03-69e07f294f4c.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:20:08.257' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7023, 0, 0, 5008, N'', NULL, NULL, N'57081b8e-8b74-4ce6-9358-7c6295905a44.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:20:08.280' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7024, 0, 0, 5008, N'', NULL, NULL, N'5790d7c5-ded5-4c5e-a2f3-1e1899f9da95.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:20:08.297' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7025, 0, 0, 5008, N'', NULL, NULL, N'c81206e1-9f7a-4b6b-a7cf-f40fe97bec29.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:20:08.303' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8007, 0, 0, 8007, N'asas', NULL, NULL, N'fc20e04e-17b4-4d3d-bd15-a7c13d28aae2.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-11-01T22:06:53.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8008, NULL, NULL, 8010, N'', NULL, NULL, N'27617434-4d60-4eac-8062-1241cf99a414.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-04T13:48:32.267' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8009, NULL, NULL, 8012, N'y', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-04-08T14:46:41.493' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8010, NULL, NULL, 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-08T16:14:43.033' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8011, NULL, NULL, 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-08T16:14:43.053' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8012, NULL, NULL, 8012, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-08T16:15:22.020' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8013, NULL, NULL, 8012, N'a', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-08T16:15:22.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8015, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-11T15:43:19.870' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8016, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-18T12:56:16.527' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8017, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-18T12:56:16.630' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8026, NULL, NULL, 8015, N'', NULL, NULL, N'195a6265-018c-4aa5-a03c-9c3733208398.xlsx', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-25T15:37:00.033' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8027, NULL, NULL, 8015, N'', NULL, NULL, N'749307b9-38aa-4da1-a79e-9aac7824faef.xlsx', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-25T15:37:00.227' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8028, NULL, NULL, 8015, N'', NULL, NULL, N'bdadf8f6-d9ec-48cb-814d-81057009675d.xlsx', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-25T15:37:00.233' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8029, NULL, NULL, 8015, N'', NULL, NULL, N'cf6f194e-064d-4482-990f-57be1b0eb018.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:58.870' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8030, NULL, NULL, 8015, N'', NULL, NULL, N'52c26a1a-6a0e-4342-93e6-22b7c74f5cca.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:59.027' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8031, NULL, NULL, 8015, N'', NULL, NULL, N'65fea9ac-e1aa-4cdf-9356-11626b02909b.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:59.030' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8032, NULL, NULL, 8015, N'', NULL, NULL, N'0bf4d381-c614-4c49-9d69-a76b44a0cf07.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:59.033' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8033, NULL, NULL, 8015, N'', NULL, NULL, N'01bde31c-b608-49ee-b594-9b1effd9982a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:59.037' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8034, NULL, NULL, 8015, N'', NULL, NULL, N'b4fca64c-29ea-4499-94d9-37817d7731f4.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:59.040' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8035, NULL, NULL, 8015, N'', NULL, NULL, N'aed13521-ade1-46fd-a68a-fc2d25bb7d9e.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:32:59.043' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8036, 1, 4, 8015, N'1', NULL, NULL, N'cd3a2b42-1873-4307-9bfd-2769ff771b24.jpg', NULL, NULL, NULL, 0, NULL, CAST(N'2022-04-26T09:33:09.393' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8037, NULL, NULL, 8016, N'', NULL, NULL, N'b2e8dfea-0f41-4121-a255-2117781e5233.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.190' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8038, NULL, NULL, 8016, N'', NULL, NULL, N'1d6dae08-583a-47a5-bba1-e04d9da4e8b0.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.243' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8039, NULL, NULL, 8016, N'', NULL, NULL, N'2b68379c-f42b-479b-b0a1-1976a07edaee.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.247' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8040, NULL, NULL, 8016, N'', NULL, NULL, N'e117398e-ca44-4a17-a415-4b4650e2fd67.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.253' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8041, NULL, NULL, 8016, N'', NULL, NULL, N'ab46e9e5-490f-43fb-aabe-986ba7ef2b75.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.257' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8042, NULL, NULL, 8016, N'', NULL, NULL, N'748ce417-6862-41d7-9962-82a38160f3bd.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.260' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8043, NULL, NULL, 8016, N'', NULL, NULL, N'664718e5-3561-49d5-99cd-9678683d2662.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:25.263' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8044, NULL, NULL, 8016, N'', NULL, NULL, N'78446f4c-acd1-4487-b22f-545a17c5d7ae.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.810' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8045, NULL, NULL, 8016, N'', NULL, NULL, N'42c12085-965e-4091-bf82-4c222d48422a.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.837' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8046, NULL, NULL, 8016, N'', NULL, NULL, N'167f83a3-74c9-4f61-9b92-c404dc5d5b8d.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.840' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8047, NULL, NULL, 8016, N'', NULL, NULL, N'b63f20f0-1ff9-4287-b858-e18791cea8cc.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.840' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8048, NULL, NULL, 8016, N'', NULL, NULL, N'18e4eed8-ed1f-47a9-a737-e0a7590b2177.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.843' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8049, NULL, NULL, 8016, N'', NULL, NULL, N'0cc8c1c9-b71a-4237-bb27-1a5164ce021b.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.847' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8050, NULL, NULL, 8016, N'', NULL, NULL, N'41d1b94a-3206-4a76-b662-33850bf84bf3.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:46.850' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8051, NULL, NULL, 8016, N'', NULL, NULL, N'15e97e74-c1be-4abf-b085-057b5375a0d3.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.783' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8052, NULL, NULL, 8016, N'', NULL, NULL, N'31c00cba-08ec-4260-9b35-d80b52fa9733.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.787' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8053, NULL, NULL, 8016, N'', NULL, NULL, N'e4f2e8d8-f95a-483b-8810-14ad89e42500.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.790' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8054, NULL, NULL, 8016, N'', NULL, NULL, N'3d85b1f4-abbf-4b53-9fef-3de97c4b4b99.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.793' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8055, NULL, NULL, 8016, N'', NULL, NULL, N'c09e0551-8f26-4656-b3d2-e54da5e916a4.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.797' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8056, NULL, NULL, 8016, N'', NULL, NULL, N'd8b3cbbf-d1e7-4ddf-95c6-e9c606ced60e.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.800' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8057, NULL, NULL, 8016, N'', NULL, NULL, N'07664e59-0657-409a-943d-2e6877afbd9e.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:12:01.803' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8058, NULL, NULL, 8017, N'', NULL, NULL, N'08ca87c4-4430-47bc-b2d1-bbffedec2e5f.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.027' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8059, NULL, NULL, 8017, N'', NULL, NULL, N'75f3d31b-864a-49fd-bcde-54692468aad0.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.093' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8060, NULL, NULL, 8017, N'', NULL, NULL, N'9da98400-0f13-46fc-8f75-a40cd563b054.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.097' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8061, NULL, NULL, 8017, N'', NULL, NULL, N'f5908117-8f83-438a-ac60-0b64790c03d7.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.103' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8062, NULL, NULL, 8017, N'', NULL, NULL, N'b42e1938-0f0d-4a2c-b2bb-683874096c47.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.107' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8063, NULL, NULL, 8017, N'asasa', NULL, NULL, N'a598bec7-4d87-409b-ae12-da132ae9349d.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8064, NULL, NULL, 8017, N'sdsdsd', NULL, NULL, N'fae52d3a-777e-441a-8d39-a2b1e683b5cf.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:56.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[RecordFile] OFF
GO
SET IDENTITY_INSERT [dbo].[RecordImage] ON 
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7077, 1, 1, 4005, N'h', NULL, NULL, N'6412b997-a173-490a-bb8e-d8b28fda6f2e.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:26:16.027' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7078, 0, 0, 0, N'', NULL, NULL, N'959f7258-0974-4b18-8a51-fa47561d1ff1.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:32:07.783' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7079, 0, 0, 0, N'', NULL, NULL, N'3f1fa79d-cf8a-4a64-90cc-55683fe4ad1b.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:32:18.330' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7080, 0, 0, 4005, N'', NULL, NULL, N'f95c1150-3877-4a50-87e5-437354df5d94.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:33:23.373' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7081, 0, 0, 4005, N'', NULL, NULL, N'f1e3282c-ce2a-4a79-ac57-a2ab97bc1c27.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:34:03.920' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7082, 0, 0, 4005, N'', NULL, NULL, N'bc96ac4c-6c2a-4c66-a866-a58ef6ac1626.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:34:03.957' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7083, 0, 0, 4005, N'', NULL, NULL, N'bd0b6053-e8de-45be-b9e2-bf163c362979.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:34:03.977' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7084, 0, 0, 4005, N'ASASAS', NULL, NULL, N'd6de07c5-f872-457a-859a-1f2b3cf2ad94.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-20T21:34:03.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7092, 0, 0, 0, N'', NULL, NULL, N'53b9db47-3443-4e4e-aa2c-9d41d4a24e12.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.230' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7093, 0, 0, 0, N'', NULL, NULL, N'fd5128e0-2d7b-456f-8d2f-135c53ee356e.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.457' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7094, 0, 0, 0, N'', NULL, NULL, N'1ab52ac7-b566-469b-a32c-83c46481cc01.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.580' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7095, 0, 0, 0, N'', NULL, NULL, N'46e60d89-d09b-4239-9e23-f9bde529682b.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.637' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7096, 0, 0, 0, N'', NULL, NULL, N'c371e1a2-c779-4be3-9c96-6c2c1f134045.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.683' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7097, 0, 0, 0, N'', NULL, NULL, N'ca388d2b-a960-492c-88a8-62dfe703499a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.737' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7098, 0, 0, 0, N'', NULL, NULL, N'c2eac36e-ce4f-480b-9da2-cf780fc48cd5.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:34:47.787' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7099, 0, 0, 4007, N'', NULL, NULL, N'4f649bd5-e36f-42fd-ae38-9cffcf35b5c6.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:35:11.220' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7101, 0, 0, 4007, N'', NULL, NULL, N'10fac86c-791a-41aa-8745-f5d71c9fb551.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:35:11.427' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7102, 0, 0, 4007, N'', NULL, NULL, N'b4c89273-3aed-460e-8ca5-8cfeba6e3d7b.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:35:11.580' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7103, 0, 0, 4007, N'', NULL, NULL, N'3db83dea-73e6-4f03-adfb-f8636c3d31c7.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:35:11.633' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7104, 0, 0, 4007, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:35:11.677' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (7105, 0, 0, 4007, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T15:35:11.723' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8077, 0, 0, 4006, N'', NULL, NULL, N'c39ddd98-e080-4703-8f4c-43722822c095.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:07:48.960' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8078, 0, 0, 4006, N'', NULL, NULL, N'd366a4c0-ed1d-4f39-8d36-c9861e1446ab.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:07:49.177' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8079, 0, 0, 4006, N'', NULL, NULL, N'73e79c0e-2568-4f59-9b4c-f2b31cb8ff72.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:07:49.347' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8080, 0, 0, 4006, N'', NULL, NULL, N'02bd7bbb-942f-47c9-bae7-845ecb9d66b0.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:07:49.410' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8081, 0, 0, 4006, N'', NULL, NULL, N'128b1163-d579-4ca1-a054-109c2e2d514a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:07:49.477' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8082, 0, 0, 4006, N'', NULL, NULL, N'0db0cdef-13e8-43c2-912b-af0389714e5f.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:07:49.537' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8083, 0, 0, 4006, N'asas', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:10:11.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (8084, 0, 0, 4006, N'hjhj', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-10-21T21:10:52.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (9080, 0, 0, 5008, N'', NULL, NULL, N'ac8d985f-4153-46ba-b81d-dc8d30f8a93c.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-26T20:45:57.350' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (9081, 0, 0, 5008, N'', NULL, NULL, N'1bdb6e04-d8a0-4031-a9c8-10160220caf9.jpg', NULL, NULL, NULL, 0, 1, CAST(N'2021-10-26T20:45:57.453' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (9082, 1, 1, 5008, N'ssddsd', NULL, NULL, N'6444db47-4f1a-4550-b1f4-a825052eae02.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-26T21:23:31.927' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (10077, 0, 0, 5008, N'', NULL, NULL, N'fb516abf-99c1-423e-aace-9c9317f35614.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:18:12.513' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (10078, 0, 0, 5008, N'', NULL, NULL, N'b4a75a6c-8ba7-4d5d-b4a2-e3223c550981.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:18:13.540' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (10079, 0, 0, 5008, N'', NULL, NULL, N'5207a736-b05f-4503-aa5a-7d0e263322e2.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:18:13.603' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (10080, 0, 0, 5008, N'', NULL, NULL, N'f47d3f37-65cd-47e0-949d-ce4395e4227a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-27T23:18:13.663' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (11077, 0, 0, 5008, N'', NULL, NULL, N'42baa57b-f193-4c07-a714-46b455f1f037.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-30T22:30:55.693' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (11078, 0, 0, 5008, N'', NULL, NULL, N'67e227c2-c153-4c0b-9510-2c366784a5ab.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-30T22:30:55.780' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (11079, 0, 0, 5008, N'', NULL, NULL, N'68f4c5a9-6bbd-44af-9c19-a935a7ac09d6.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-10-30T22:30:55.837' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12077, 0, 0, 8007, N'gh', NULL, NULL, N'0bc9bf3c-8448-412e-8091-024780907ce2.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-11-01T22:05:02.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12078, 0, 0, 8010, N'', NULL, NULL, N'8e959007-e250-46c5-8ae7-0d4a2a84425d.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-11-02T21:52:07.343' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12079, 0, 0, 8010, N'', NULL, NULL, N'4bcaaad6-453d-41a0-b90a-81f44f6bde35.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-11-02T21:52:07.423' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12080, 0, 0, 8010, N'', NULL, NULL, N'9b9e1811-c239-4643-b7e1-d86d26eff221.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-11-02T21:52:07.483' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12081, 0, 0, 8010, N'', NULL, NULL, N'b00c9924-f8ba-412d-96f9-5dfa4402c60f.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2021-11-02T21:52:07.537' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12082, NULL, NULL, 8010, N'', NULL, NULL, N'hata-8e51964e-9e47-4ed9-903f-ea374c14f582.jpeg', NULL, NULL, NULL, 0, 0, CAST(N'2022-02-24T17:38:43.820' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12083, NULL, NULL, 8011, N'a', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-04-04T15:03:44.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12084, NULL, NULL, 8012, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-04-07T16:13:34.967' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12085, NULL, NULL, 8012, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-07T16:13:44.880' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12086, NULL, NULL, 8012, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-07T16:13:44.900' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12087, NULL, NULL, 8012, N'3', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-07T16:15:21.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12100, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-11T15:43:00.820' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12101, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-11T15:43:00.837' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12102, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-11T15:43:00.860' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12103, NULL, NULL, 8014, N'deneme ürün', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-18T12:55:52.913' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12104, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-18T12:56:04.037' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12105, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-04-18T12:56:04.070' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12109, NULL, NULL, 8015, N'', NULL, NULL, N'1-klijp3uwtgae-q9xuc-pva-43fbb079-2f1e-4b81-a3df-76d6aed27c16.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.500' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12110, NULL, NULL, 8015, N'', NULL, NULL, N'1-uhsx5djhrwiguxowsw-lew-7f40b284-9fec-42f1-b31a-724e11d0ca72.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.573' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12111, NULL, NULL, 8015, N'', NULL, NULL, N'csharp-nedir-ne-ise-yarar-850x478-31cb557b-1390-4281-84ed-32abc709bcdb.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.620' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12112, NULL, NULL, 8015, N'', NULL, NULL, N'csharp-1-1-b233f49b-b35a-4a39-aedc-ce6f320d787d.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.660' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12113, NULL, NULL, 8015, N'', NULL, NULL, N'c-to-c-rest-vs-grpc-84387f0f-c762-4c2e-9cd4-021b9fe6306a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.720' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12114, NULL, NULL, 8015, N'', NULL, NULL, N'images-37a30a33-f55c-4049-a7e2-5383020bd49a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.753' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12115, NULL, NULL, 8015, N'', NULL, NULL, N'monthcalender-aacd48cb-f4be-4b4d-8880-85eabefe530c.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-26T09:29:29.780' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12123, 1, 5, 8016, N'test', NULL, NULL, N'csharp-nedir-ne-ise-yarar-850x478-cd099475-a177-4dcb-9bae-455ba5adb7b7.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:00.010' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12124, NULL, NULL, 8016, N'', NULL, NULL, N'1-klijp3uwtgae-q9xuc-pva-81e2ec9a-ca14-42ee-b908-2ca75c7189e4.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.367' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12125, NULL, NULL, 8016, N'', NULL, NULL, N'1-uhsx5djhrwiguxowsw-lew-6dba72cb-209e-47f4-a365-273cda3e5bb8.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.437' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12126, NULL, NULL, 8016, N'', NULL, NULL, N'csharp-nedir-ne-ise-yarar-850x478-230e1756-4a0b-4a99-b5e6-5688417e5c9a.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.483' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12127, NULL, NULL, 8016, N'', NULL, NULL, N'csharp-1-1-6e4be7e0-5511-41fa-a675-9f616fcaf8f6.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.527' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12128, NULL, NULL, 8016, N'', NULL, NULL, N'c-to-c-rest-vs-grpc-449d3a7f-66f7-478d-a68f-b4874b4f24fb.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.593' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12129, NULL, NULL, 8016, N'', NULL, NULL, N'images-ba35c4f1-5c96-466d-ac7c-d426368a2d62.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.627' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12130, NULL, NULL, 8016, N'', NULL, NULL, N'monthcalender-a4279303-0aae-401a-830e-1f7aff5c344b.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T09:09:10.657' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12131, NULL, NULL, 8016, N'', NULL, NULL, N'1-klijp3uwtgae-q9xuc-pva-7e487893-1c9a-4e07-a74d-1b9d970851ee.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.450' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12132, NULL, NULL, 8016, N'', NULL, NULL, N'1-uhsx5djhrwiguxowsw-lew-6601f8d4-e5a9-4175-8603-7d90584cf839.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.737' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12133, NULL, NULL, 8016, N'', NULL, NULL, N'csharp-nedir-ne-ise-yarar-850x478-f302e071-06d1-4cb4-ba9b-15a0a4290942.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.790' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12134, NULL, NULL, 8016, N'', NULL, NULL, N'csharp-1-1-ceacf736-cf35-4fa9-b904-f3a340b3452b.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.837' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12135, NULL, NULL, 8016, N'', NULL, NULL, N'c-to-c-rest-vs-grpc-adc05c8e-02d6-4d0b-8db1-195418b80993.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.903' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12136, NULL, NULL, 8016, N'', NULL, NULL, N'images-0ee1482a-f631-49d5-8ad1-03488f4717ca.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.937' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12137, NULL, NULL, 8016, N'', NULL, NULL, N'monthcalender-0607fcda-07e4-47aa-9bf2-6f38a6c98f3b.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-04-27T17:11:33.967' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12138, NULL, NULL, 8017, N'', NULL, NULL, N'csharp-1-1-979cb44d-e381-4cd3-81b2-10e764be1005.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-11T15:00:12.220' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12139, NULL, NULL, 8017, N'', NULL, NULL, N'1-klijp3uwtgae-q9xuc-pva-7560bb71-8094-43c4-9e1a-dce8e58a6d1a.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:25.443' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12140, NULL, NULL, 8017, N'', NULL, NULL, N'1-uhsx5djhrwiguxowsw-lew-cd8c7920-b313-4986-b38c-541e38dc5345.png', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:25.820' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12141, NULL, NULL, 8017, N'', NULL, NULL, N'csharp-nedir-ne-ise-yarar-850x478-dac1dc66-1d6c-4dff-8c24-c701efdbd72c.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:25.920' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12142, NULL, NULL, 8017, N'', NULL, NULL, N'csharp-1-1-27b1cb90-f012-4007-9233-03851fb590f7.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:25.983' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12143, NULL, NULL, 8017, N'', NULL, NULL, N'c-to-c-rest-vs-grpc-fa7af5e6-73e7-4036-b9c6-3876346a4acd.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:26.230' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12144, NULL, NULL, 8017, N'', NULL, NULL, N'images-19a462da-5d4b-452f-87bb-ea3bdc394659.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:26.313' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [OrderNumber], [RecordDate], [IsActive]) VALUES (12145, NULL, NULL, 8017, N'1221', NULL, NULL, N'c-to-c-rest-vs-grpc-79638d66-fffe-4b85-ba0b-be49e2cc8e92.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-05-18T13:29:26.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[RecordImage] OFF
GO
SET IDENTITY_INSERT [dbo].[StaticText] ON 
GO
INSERT [dbo].[StaticText] ([Id], [SystemUserId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 1, N'1', N'1', 0, CAST(N'2021-10-12T18:31:48.407' AS DateTime), 0)
GO
INSERT [dbo].[StaticText] ([Id], [SystemUserId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (2, 1, N'2', N'2', NULL, CAST(N'2022-05-09T14:24:10.673' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[StaticText] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemAction] ON 
GO
INSERT [dbo].[SystemAction] ([Id], [SystemMenuId], [ControllerName], [ActionName], [Description]) VALUES (1, 1, N'Banner', N'Index', N'Banner Listeleme Ekranı')
GO
INSERT [dbo].[SystemAction] ([Id], [SystemMenuId], [ControllerName], [ActionName], [Description]) VALUES (2, 9, N'SystemUser', N'Index', N'Kullanıcı tanımlaırı listeleme')
GO
INSERT [dbo].[SystemAction] ([Id], [SystemMenuId], [ControllerName], [ActionName], [Description]) VALUES (3, 6, N'Category', N'Index', N'Kategori Listeleme')
GO
INSERT [dbo].[SystemAction] ([Id], [SystemMenuId], [ControllerName], [ActionName], [Description]) VALUES (4, 1, N'Home', N'Index', N'Ana sayfa')
GO
SET IDENTITY_INSERT [dbo].[SystemAction] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemActionRole] ON 
GO
INSERT [dbo].[SystemActionRole] ([Id], [SystemActionId], [SystemRoleId]) VALUES (3, 1, 2)
GO
INSERT [dbo].[SystemActionRole] ([Id], [SystemActionId], [SystemRoleId]) VALUES (1002, 2, 2)
GO
INSERT [dbo].[SystemActionRole] ([Id], [SystemActionId], [SystemRoleId]) VALUES (1003, 3, 2)
GO
INSERT [dbo].[SystemActionRole] ([Id], [SystemActionId], [SystemRoleId]) VALUES (1004, 4, 2)
GO
SET IDENTITY_INSERT [dbo].[SystemActionRole] OFF
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (1, 0, N'Ana sayfa', NULL, N'Home', N'Index', CAST(N'2021-10-12T17:02:05.533' AS DateTime), N'fas fa-bars', N'/Home/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (2, 3, N'Banner Tipleri', NULL, N'BannerType', N'Index', CAST(N'2021-10-12T17:03:05.573' AS DateTime), N'fa fa-adn', N'/BannerType/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (3, 0, N'Banner Yönetimi', NULL, N'', N'', CAST(N'2021-10-12T17:03:19.663' AS DateTime), N'fab fa-adversal', N'#', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (4, 5, N'İletişim Bilgileri', NULL, N'ContactInformation', N'Index', CAST(N'2021-10-12T17:22:39.807' AS DateTime), N'fa fa-map-marker', N'/ContactInformation/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (5, 0, N'Menü ve İçerik Yönetimi', NULL, NULL, NULL, CAST(N'2021-10-12T17:30:15.267' AS DateTime), N'fa fa-window-maximize', N'#', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (6, 5, N'Kategori Yönetimi', NULL, N'Category', N'Index', CAST(N'2021-10-12T17:30:42.737' AS DateTime), N'fa fa-list', N'/Category/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (7, 5, N'İçerik Yönetimi', NULL, N'Record', N'Index', CAST(N'2021-10-12T17:31:45.037' AS DateTime), N'fa fa-file-text-o', N'/Record/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (8, 0, N'Kullanıcı Yönetimi', NULL, NULL, NULL, CAST(N'2021-10-12T18:27:14.597' AS DateTime), N'fa fa-user-o', N'#', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (9, 8, N'Kullanıcı Tanımları', NULL, N'SystemUser', N'Index', CAST(N'2021-10-12T18:27:44.707' AS DateTime), N'fa fa-user-circle-o', N'/SystemUser/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (10, 8, N'Kullanıcı Rolleri', NULL, N'SystemRole', N'Index', CAST(N'2021-10-12T18:28:32.493' AS DateTime), N'fa fa-user-circle', N'/SystemRole/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (11, 0, N'Form Yönetimi', NULL, NULL, NULL, CAST(N'2021-10-12T18:29:10.437' AS DateTime), N'fa fa-check-square', N'#', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (12, 11, N'Form Elemanları', NULL, N'FormElement', N'Index', CAST(N'2021-10-12T18:29:28.780' AS DateTime), N'far fa-bookmark', N'/FormElement/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (13, 17, N'Sistem Sayfaları', NULL, N'SystemAction', N'Index', CAST(N'2021-10-12T18:30:26.260' AS DateTime), N'fa fa-file-text', N'/SystemAction/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (14, 17, N'Sayfa Türü Ayarları', NULL, N'PageType', N'Index', CAST(N'2021-10-12T18:30:57.580' AS DateTime), N'fa fa-file-o', N'/PageType/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (15, 17, N'Statik İçerikler', NULL, N'StaticText', N'Index', CAST(N'2021-10-12T18:31:20.073' AS DateTime), N'fa fa-file', N'/StaticText/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (16, 17, N'Html Editör Tanımları', NULL, N'EditorTemplate', N'Index', CAST(N'2021-10-12T18:32:18.930' AS DateTime), N'fa fa-html5', N'/EditorTemplate/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (17, 0, N'Sistem Ayarları', NULL, NULL, NULL, CAST(N'2021-10-14T14:59:13.170' AS DateTime), N'fa fa-dedent', N'#', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (18, 11, N'Form Grupları', NULL, N'FormGroup', N'Index', CAST(N'2021-10-14T21:25:03.823' AS DateTime), N'fas fa-align-left', N'/FormGroup/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (19, 17, N'Genel Ayarlar', NULL, N'GeneralSettings', N'Index', CAST(N'2021-10-17T14:47:51.007' AS DateTime), N'fas fa-clipboard-list', N'/GeneralSettings/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (20, 17, N'Firma Değişkenleri', NULL, N'FirmVariables', N'Index', CAST(N'2021-10-17T19:13:09.463' AS DateTime), N'fa fa-feed', N'/FirmVariables/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (21, 5, N'Seo Index', NULL, N'SeoIndex', N'Index', CAST(N'2021-10-18T22:20:11.367' AS DateTime), N'fab fa-google-plus', N'/SeoIndex/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (22, 12, N'Form Seçenekleri', NULL, N'FormElementOptions', N'Index', CAST(N'2021-10-19T16:01:53.077' AS DateTime), N'fas fa-align-justify', N'/FormElementOptions/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (23, 3, N'Banner Listesi', NULL, N'Banner', N'Index', CAST(N'2021-10-19T16:04:53.883' AS DateTime), N'fa fa-list-alt', N'/Banner/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (24, 7, N'Dosya Ekle', NULL, N'RecordFile', N'Index', CAST(N'2021-10-21T21:20:10.160' AS DateTime), NULL, N'/ContentFile/Index', 0)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (25, 7, N'Resim Ekle', NULL, N'RecordImage', N'Index', CAST(N'2021-10-21T21:21:40.470' AS DateTime), NULL, N'/ContentImage/Index', 0)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (26, 5, N'Mesajlarım', NULL, N'MessageHistory', N'Index', CAST(N'2021-10-21T21:22:38.947' AS DateTime), N'far fa-comment-alt', N'/MessageHistory/Index', 1)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (27, 6, N'Kategori Ekleme', NULL, N'Category', N'Add', CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'', N'/Category/Add', 0)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (28, 7, N'İçerik Ekleme', NULL, N'Record', N'Add', CAST(N'2022-04-04T00:00:00.000' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[SystemMenu] ([Id], [SystemMenuId], [Name], [Explanation], [ControllerName], [ActionName], [RecordDate], [MenuIcon], [Link], [IsActive]) VALUES (29, 16, N'Editor Tanımı Ekle', NULL, N'EditorTemplate', N'Add', CAST(N'2022-05-09T00:00:00.000' AS DateTime), NULL, N'/EditorTemplate/Add', 0)
GO
SET IDENTITY_INSERT [dbo].[SystemMenuRole] ON 
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (6, 2, 7, CAST(N'2021-10-22T18:44:26.917' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (7, 2, 8, CAST(N'2021-10-22T18:44:35.500' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (8, 2, 5, CAST(N'2021-10-22T18:44:39.677' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (9, 2, 3, CAST(N'2021-10-22T18:44:43.903' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (11, 2, 4, CAST(N'2021-10-22T18:47:26.600' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (12, 2, 6, CAST(N'2021-10-22T18:47:26.660' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (13, 2, 9, CAST(N'2021-10-22T18:47:26.667' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (14, 2, 26, CAST(N'2021-10-22T18:47:26.670' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (15, 2, 1, CAST(N'2021-10-22T20:39:27.383' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (16, 2, 2, CAST(N'2021-10-22T20:39:27.457' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (17, 2, 23, CAST(N'2021-10-22T20:39:27.470' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (19, 3, 5, CAST(N'2022-04-18T12:59:28.737' AS DateTime))
GO
INSERT [dbo].[SystemMenuRole] ([Id], [SystemRoleId], [SystemMenuId], [RecordDate]) VALUES (20, 3, 13, CAST(N'2022-04-18T12:59:28.743' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SystemMenuRole] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemRole] ON 
GO
INSERT [dbo].[SystemRole] ([Id], [Name], [Explanation], [RecordDate], [IsActive]) VALUES (2, N'Test', N's', CAST(N'2021-10-13T19:33:38.000' AS DateTime), 0)
GO
INSERT [dbo].[SystemRole] ([Id], [Name], [Explanation], [RecordDate], [IsActive]) VALUES (3, N'Deneme255', N'd', CAST(N'2022-04-18T12:59:12.000' AS DateTime), 0)
GO
INSERT [dbo].[SystemRole] ([Id], [Name], [Explanation], [RecordDate], [IsActive]) VALUES (4, N'Robin', N'6', CAST(N'2022-06-06T15:22:15.567' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[SystemRole] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemUser] ON 
GO
INSERT [dbo].[SystemUser] ([Id], [SystemUserId], [SystemRoleId], [Name], [SurName], [UserName], [Password], [Email], [Phone], [Address], [RecordDate], [IsActive], [IsAdmin]) VALUES (1, 0, 2, N'Erdoğan', N'KABA', N'erdogankb57@gmail.com', N'123456', N'erdogankb57@gmail.com', N'05318479796', N'Bağcan sok', CAST(N'2021-10-12T14:55:20.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[SystemUser] ([Id], [SystemUserId], [SystemRoleId], [Name], [SurName], [UserName], [Password], [Email], [Phone], [Address], [RecordDate], [IsActive], [IsAdmin]) VALUES (2, 1, 2, N'Test', N'Test', N'Test', N'Test', N'Test', N'Test', N'Test', CAST(N'2021-10-14T18:01:01.403' AS DateTime), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[SystemUser] OFF
GO
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF_Banner_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CanBeDeleted]  DEFAULT ((1)) FOR [CanBeDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CanSubCategoryBeAdded]  DEFAULT ((1)) FOR [CanSubCategoryBeAdded]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[CategorySpecialty] ADD  CONSTRAINT [DF_CategorySpecialty_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[EditorTemplate] ADD  CONSTRAINT [DF_EditorTemplate_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[FirmVariables] ADD  CONSTRAINT [DF_FirmVariables_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[FormElement] ADD  CONSTRAINT [DF_FormElement_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[FormElement] ADD  CONSTRAINT [DF_FormElement_FormGroupId]  DEFAULT ((0)) FOR [FormGroupId]
GO
ALTER TABLE [dbo].[FormElement] ADD  CONSTRAINT [DF_FormElement_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[FormElement] ADD  CONSTRAINT [DF_FormElement_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[FormElement] ADD  CONSTRAINT [DF_FormElement_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FormElementOptions] ADD  CONSTRAINT [DF_FormOptions_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[FormGroup] ADD  CONSTRAINT [DF_FormGroup_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[FormType] ADD  CONSTRAINT [DF_FormType_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[LogMessage] ADD  CONSTRAINT [DF_LogMessage_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[MessageHistory] ADD  CONSTRAINT [DF_MessageHistory_IsArchive]  DEFAULT ((1)) FOR [IsArchive]
GO
ALTER TABLE [dbo].[MessageHistory] ADD  CONSTRAINT [DF_MessageHistory_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[MessageHistory] ADD  CONSTRAINT [DF_MessageHistory_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[MessageType] ADD  CONSTRAINT [DF_MessageType_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Content_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Content_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[RecordFile] ADD  CONSTRAINT [DF_ContentFile_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[RecordFile] ADD  CONSTRAINT [DF_ContentFile_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[RecordFile] ADD  CONSTRAINT [DF_ContentFile_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RecordImage] ADD  CONSTRAINT [DF_ContentImage_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[RecordImage] ADD  CONSTRAINT [DF_ContentImage_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[RecordImage] ADD  CONSTRAINT [DF_ContentImage_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RecordSpecialty] ADD  CONSTRAINT [DF_ContentSpecialty_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SEOIndex] ADD  CONSTRAINT [DF_SEOIndex_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[StaticText] ADD  CONSTRAINT [DF_StaticText_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SystemMenu] ADD  CONSTRAINT [DF_SystemMenu_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SystemMenu] ADD  CONSTRAINT [DF_SystemMenu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SystemRole] ADD  CONSTRAINT [DF_SystemRole_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SystemRole] ADD  CONSTRAINT [DF_SystemRole_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SystemUserRole] ADD  CONSTRAINT [DF_SystemUserRole_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
USE [master]
GO
ALTER DATABASE [IntaKurumsal] SET  READ_WRITE 
GO
