USE [master]
GO
/****** Object:  Database [IntaKurumsal]    Script Date: 20.04.2022 14:57:25 ******/
CREATE DATABASE [IntaKurumsal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IntaKurumsal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IntaKurumsal.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IntaKurumsal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IntaKurumsal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [sa1]    Script Date: 20.04.2022 14:57:25 ******/
CREATE USER [sa1] FOR LOGIN [sa1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 20.04.2022 14:57:25 ******/
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
	[ImageId] [int] NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerType]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 20.04.2022 14:57:25 ******/
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
	[ImageId] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CategoryLink] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorySpecialty]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 20.04.2022 14:57:25 ******/
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
	[ImageId] [int] NULL,
	[OrderNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EditorTemplate]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[FileUpload]    Script Date: 20.04.2022 14:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileUpload](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](500) NULL,
	[FileBase64Data] [varchar](max) NULL,
	[Extension] [varchar](50) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[RecordDate] [datetime] NULL,
	[ContentType] [varchar](500) NULL,
	[IsImage] [bit] NULL,
 CONSTRAINT [PK_FileUpload] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmVariables]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[FormElement]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[FormElementOptions]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[FormGroup]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[FormType]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[GeneralSettings]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[LogMessage]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[MessageHistory]    Script Date: 20.04.2022 14:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageCode] [nvarchar](10) NULL,
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
/****** Object:  Table [dbo].[MessageType]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[PageType]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[Record]    Script Date: 20.04.2022 14:57:25 ******/
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
	[ImageId] [int] NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordFile]    Script Date: 20.04.2022 14:57:25 ******/
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
	[FileId] [int] NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ContentFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordImage]    Script Date: 20.04.2022 14:57:25 ******/
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
	[ImageId] [int] NULL,
	[OrderNumber] [int] NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ContentImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordSpecialty]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SEOIndex]    Script Date: 20.04.2022 14:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEOIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[LanguageCode] [nvarchar](10) NULL,
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
/****** Object:  Table [dbo].[SpecialtyType]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[StaticText]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemAction]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemActionRole]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemMenu]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemMenuRole]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemRole]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemUser]    Script Date: 20.04.2022 14:57:25 ******/
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
/****** Object:  Table [dbo].[SystemUserRole]    Script Date: 20.04.2022 14:57:25 ******/
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
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [ImageId], [RecordDate], [IsActive]) VALUES (5011, 1, 1, 2015, N'Banner 1', NULL, NULL, NULL, 0, NULL, N'', 1062, CAST(N'2022-04-18T17:01:22.933' AS DateTime), 0)
GO
INSERT [dbo].[Banner] ([Id], [SystemUserId], [LanguageId], [BannerTypeId], [Name], [Link], [Target], [ShortExplanation], [OrderNumber], [TargetId], [Image], [ImageId], [RecordDate], [IsActive]) VALUES (5012, NULL, NULL, 2015, N'Banner 2', NULL, NULL, NULL, 0, NULL, N'', NULL, CAST(N'2022-04-18T17:01:38.760' AS DateTime), 0)
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
SET IDENTITY_INSERT [dbo].[BannerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [SystemUserId], [LanguageId], [PageTypeId], [CategoryId], [FormGroupId], [Code], [Name], [CategoryUrl], [Title], [MetaDecription], [MetaKeywords], [ShortExplanation], [CanBeDeleted], [CanSubCategoryBeAdded], [Image], [ImageTag], [ImageTitle], [Explanation], [OrderNumber], [ImageId], [RecordDate], [IsActive], [CategoryLink]) VALUES (6029, 1, 1, 2, 0, NULL, NULL, N'Anasayfa', N'anasayfa', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactInformation] ON 
GO
INSERT [dbo].[ContactInformation] ([Id], [SystemUserId], [LanguageId], [Name], [Email], [Phone], [Gsm], [Fax], [Adress], [Explanation], [GoogleMapFrame], [GoogleMapLink], [GoogleMapX], [GoogleMapY], [Image], [QrCode], [FormSendEmail], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4010, 1, 1, N'İletişim Bilgilerimiz', N'email', N'telefon', NULL, NULL, N'adres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2022-04-18T17:02:08.670' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[ContactInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[EditorTemplate] ON 
GO
INSERT [dbo].[EditorTemplate] ([Id], [SystemUserId], [LanguageId], [Name], [HtmlContent], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 1, 1, N'Test', NULL, NULL, 0, CAST(N'2021-10-12T18:32:31.457' AS DateTime), 0)
GO
INSERT [dbo].[EditorTemplate] ([Id], [SystemUserId], [LanguageId], [Name], [HtmlContent], [Image], [OrderNumber], [RecordDate], [IsActive]) VALUES (2, 1, 1, N'Test', NULL, NULL, 0, CAST(N'2021-10-12T18:32:48.830' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[EditorTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[FirmVariables] ON 
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (3, 0, N'CategoryBigImageWidth', NULL, N'500', 0, CAST(N'2021-10-17T21:46:09.043' AS DateTime), 0)
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (4, 0, N'CategorySmallImageWidth', NULL, N'500', 0, CAST(N'2021-10-17T21:46:25.670' AS DateTime), 0)
GO
INSERT [dbo].[FirmVariables] ([Id], [LanguageId], [Name], [Value], [Description], [OrderNumber], [RecordDate], [IsActive]) VALUES (5, 0, N'CategorySmallImageHeight', NULL, N'500', 0, CAST(N'2021-10-17T21:46:58.127' AS DateTime), 0)
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
INSERT [dbo].[GeneralSettings] ([Id], [LanguageId], [SystemUserId], [EmailIpAdress], [EmailAdress], [EmailPort], [EmailPassword], [DomainName], [CdnUrl], [ImageUploadPath], [FileUploadPath], [DeveloperName], [DeveloperEmail], [CategoryImageSmallWidth], [CategoryImageSmallHeight], [CategoryImageBigWidth], [CategoryImageBigHeight], [ContentImageSmallWidth], [ContentImageSmallHeight], [ContentImageBigWidth], [ContentImageBigHeight]) VALUES (7, 0, 0, N'1', N'1', 1, N'1', N'https://localhost:44338/', N'https://localhost:44338/Upload/Image', N'~/Upload/Image', N'~/Upload/File', N'Erdoğan KABA', N'erdogankb57@gmail.com', 200, 200, 1000, 1000, 200, 200, 1000, 1000)
GO
SET IDENTITY_INSERT [dbo].[GeneralSettings] OFF
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
SET IDENTITY_INSERT [dbo].[LogMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[MessageHistory] ON 
GO
INSERT [dbo].[MessageHistory] ([Id], [LanguageCode], [MessageTypeId], [ClientName], [ClientSurname], [Email], [Phone], [Subject], [Explanation], [IsArchive], [IsRead], [ArchiveDate], [IpNumber], [RecordDate]) VALUES (2, N'1', 1, N'1', N'11', N'1', N'1', N'1', N'1', 1, 1, NULL, NULL, CAST(N'2021-10-18T19:17:57.513' AS DateTime))
GO
INSERT [dbo].[MessageHistory] ([Id], [LanguageCode], [MessageTypeId], [ClientName], [ClientSurname], [Email], [Phone], [Subject], [Explanation], [IsArchive], [IsRead], [ArchiveDate], [IpNumber], [RecordDate]) VALUES (3, N'1', 1, N'1', N'1', N'1', N'1', N'1', N'1', 1, 1, NULL, NULL, CAST(N'2021-10-18T19:27:31.243' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[RecordFile] ON 
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1009, 0, 0, 1005, N'', NULL, NULL, N'5e43d3ebae298b0ffcf825b0.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:09.153' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1010, 0, 0, 1005, N'', NULL, NULL, N'1849872_620x410 - Kopya - Kopya.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:09.183' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1011, 0, 0, 1005, N'', NULL, NULL, N'1849872_620x410 - Kopya (2) - Kopya.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:09.203' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1012, 0, 0, 1005, N'sdsds', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:09.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1013, 0, 0, 0, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:09.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1014, 0, 0, 0, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:09.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1016, 1, 1, 0, N'as', NULL, NULL, N'System.Web.HttpPostedFileWrapper', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:19:59.843' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (1017, 0, 0, 0, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-17T14:25:03.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (2007, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (2) - Kopya.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-18T21:27:40.137' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (2008, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (2).jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-18T21:27:40.177' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (2009, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (3) - Kopya.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-18T21:27:40.183' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (2010, 0, 0, 3010, N'', NULL, NULL, N'1849872_620x410 - Kopya (3).jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-18T21:27:40.193' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (3007, 1, 1, 4005, N'1', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, CAST(N'2021-10-20T17:10:02.383' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4014, 1, 1, 0, N'ghgh', NULL, NULL, N'C:\Users\Erdoğan\Source\Repos\erdogankb57\WorkspaceRepository\Inta.Kurumsal\Inta.Kurumsal.Web\Upload\File\8e9c3cdf-b446-463e-91d1-1eb222708036.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T17:56:01.463' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4016, 1, 1, 0, N'fdfgfg', NULL, NULL, N'7bc0bc75-f61c-471c-8cde-8fbf2570247c.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T17:57:42.680' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4018, 0, 0, 4007, N'', NULL, NULL, N'86826a1c-223f-4f47-b885-d1e4d30452ea.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T18:02:20.970' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4019, 0, 0, 4007, N'', NULL, NULL, N'377fc127-07a0-4a6f-8e89-691f0712d398.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T18:02:21.067' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4020, 0, 0, 4007, N'', NULL, NULL, N'ac212bae-9ad7-4386-a2c4-e0756a0d5b98.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T18:02:21.073' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4021, 0, 0, 4007, N'', NULL, NULL, N'1512e59e-5d20-463a-bffa-2793831e5c92.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T18:02:21.077' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4022, 0, 0, 4007, N'', NULL, NULL, N'a065229c-3901-4b8a-8d17-435ed1d18287.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T18:02:21.080' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (4023, 0, 0, 4007, N'test', NULL, NULL, N'6cfa186b-9f93-4bcf-b69a-32dc1575ece2.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T18:02:21.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (5007, 0, 0, 4007, N'', NULL, NULL, N'b209558a-120f-4daf-be54-983836dfe8ac.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T20:56:12.233' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (5008, 0, 0, 4006, N'cfdfdf', NULL, NULL, N'2abd7272-e483-4289-aeeb-fcdfdda97206.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:11:23.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7011, 0, 0, 5008, N'', NULL, NULL, N'e185a79e-2563-4698-b55b-f84116f65f70.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:47.657' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7012, 0, 0, 5008, N'', NULL, NULL, N'c228e6ca-cbce-4fa6-865b-d97649a5cf4c.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:47.700' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7013, 0, 0, 5008, N'', NULL, NULL, N'8f16622d-a06b-4171-9c29-25dd47cba73f.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:47.707' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7014, 0, 0, 5008, N'', NULL, NULL, N'6ca40673-fc9f-488f-a73f-5a0fc8937b6a.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:47.713' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7015, 0, 0, 5008, N'', NULL, NULL, N'1857bf1f-c39c-48db-bb61-d99257ed264f.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:47.717' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7016, 0, 0, 5008, N'', NULL, NULL, N'0691c1a4-2e76-45eb-a60b-84914fb23b1a.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:56.090' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7017, 0, 0, 5008, N'', NULL, NULL, N'ed32a6ea-e7e2-4f6b-9420-c0b92ffa3dc3.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:56.123' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7018, 0, 0, 5008, N'', NULL, NULL, N'4f99c380-7f12-4602-8d48-e7f4673b6cae.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:56.127' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7019, 0, 0, 5008, N'', NULL, NULL, N'f5859ebf-3177-47a0-9f89-9de49ce91697.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:56.133' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7020, 0, 0, 5008, N'', NULL, NULL, N'117d9105-df81-4528-9a6b-48707e5606c6.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:19:56.147' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7021, 0, 0, 5008, N'', NULL, NULL, N'9b21314f-4970-4bd0-a1f2-45ffe1b70ba9.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:20:08.233' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7022, 0, 0, 5008, N'', NULL, NULL, N'2ba7d960-c6af-4ead-9f03-69e07f294f4c.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:20:08.257' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7023, 0, 0, 5008, N'', NULL, NULL, N'57081b8e-8b74-4ce6-9358-7c6295905a44.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:20:08.280' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7024, 0, 0, 5008, N'', NULL, NULL, N'5790d7c5-ded5-4c5e-a2f3-1e1899f9da95.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:20:08.297' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7025, 0, 0, 5008, N'', NULL, NULL, N'c81206e1-9f7a-4b6b-a7cf-f40fe97bec29.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:20:08.303' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8007, 0, 0, 8007, N'asas', NULL, NULL, N'fc20e04e-17b4-4d3d-bd15-a7c13d28aae2.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-11-01T22:06:53.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8008, NULL, NULL, 8010, N'', NULL, NULL, N'27617434-4d60-4eac-8062-1241cf99a414.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2022-04-04T13:48:32.267' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8009, NULL, NULL, 8012, N'y', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, CAST(N'2022-04-08T14:46:41.493' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8010, NULL, NULL, 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, 0, CAST(N'2022-04-08T16:14:43.033' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8011, NULL, NULL, 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 7, 0, CAST(N'2022-04-08T16:14:43.053' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8012, NULL, NULL, 8012, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 8, 0, CAST(N'2022-04-08T16:15:22.020' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8013, NULL, NULL, 8012, N'a', NULL, NULL, NULL, NULL, NULL, NULL, 0, 22, 0, CAST(N'2022-04-08T16:15:22.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8015, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 50, 0, CAST(N'2022-04-11T15:43:19.870' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8016, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1060, 0, CAST(N'2022-04-18T12:56:16.527' AS DateTime), 0)
GO
INSERT [dbo].[RecordFile] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [FileName], [FileTagName], [FileTitleName], [TargetId], [HomePageStatus], [FileId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8017, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1061, 0, CAST(N'2022-04-18T12:56:16.630' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[RecordFile] OFF
GO
SET IDENTITY_INSERT [dbo].[RecordImage] ON 
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7077, 1, 1, 4005, N'h', NULL, NULL, N'6412b997-a173-490a-bb8e-d8b28fda6f2e.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:26:16.027' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7078, 0, 0, 0, N'', NULL, NULL, N'959f7258-0974-4b18-8a51-fa47561d1ff1.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:32:07.783' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7079, 0, 0, 0, N'', NULL, NULL, N'3f1fa79d-cf8a-4a64-90cc-55683fe4ad1b.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:32:18.330' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7080, 0, 0, 4005, N'', NULL, NULL, N'f95c1150-3877-4a50-87e5-437354df5d94.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:33:23.373' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7081, 0, 0, 4005, N'', NULL, NULL, N'f1e3282c-ce2a-4a79-ac57-a2ab97bc1c27.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:34:03.920' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7082, 0, 0, 4005, N'', NULL, NULL, N'bc96ac4c-6c2a-4c66-a866-a58ef6ac1626.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:34:03.957' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7083, 0, 0, 4005, N'', NULL, NULL, N'bd0b6053-e8de-45be-b9e2-bf163c362979.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:34:03.977' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7084, 0, 0, 4005, N'ASASAS', NULL, NULL, N'd6de07c5-f872-457a-859a-1f2b3cf2ad94.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-20T21:34:03.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7092, 0, 0, 0, N'', NULL, NULL, N'53b9db47-3443-4e4e-aa2c-9d41d4a24e12.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.230' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7093, 0, 0, 0, N'', NULL, NULL, N'fd5128e0-2d7b-456f-8d2f-135c53ee356e.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.457' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7094, 0, 0, 0, N'', NULL, NULL, N'1ab52ac7-b566-469b-a32c-83c46481cc01.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.580' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7095, 0, 0, 0, N'', NULL, NULL, N'46e60d89-d09b-4239-9e23-f9bde529682b.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.637' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7096, 0, 0, 0, N'', NULL, NULL, N'c371e1a2-c779-4be3-9c96-6c2c1f134045.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.683' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7097, 0, 0, 0, N'', NULL, NULL, N'ca388d2b-a960-492c-88a8-62dfe703499a.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.737' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7098, 0, 0, 0, N'', NULL, NULL, N'c2eac36e-ce4f-480b-9da2-cf780fc48cd5.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:34:47.787' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7099, 0, 0, 4007, N'', NULL, NULL, N'4f649bd5-e36f-42fd-ae38-9cffcf35b5c6.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:35:11.220' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7101, 0, 0, 4007, N'', NULL, NULL, N'10fac86c-791a-41aa-8745-f5d71c9fb551.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:35:11.427' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7102, 0, 0, 4007, N'', NULL, NULL, N'b4c89273-3aed-460e-8ca5-8cfeba6e3d7b.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:35:11.580' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7103, 0, 0, 4007, N'', NULL, NULL, N'3db83dea-73e6-4f03-adfb-f8636c3d31c7.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:35:11.633' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7104, 0, 0, 4007, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:35:11.677' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (7105, 0, 0, 4007, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T15:35:11.723' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8077, 0, 0, 4006, N'', NULL, NULL, N'c39ddd98-e080-4703-8f4c-43722822c095.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:07:48.960' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8078, 0, 0, 4006, N'', NULL, NULL, N'd366a4c0-ed1d-4f39-8d36-c9861e1446ab.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:07:49.177' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8079, 0, 0, 4006, N'', NULL, NULL, N'73e79c0e-2568-4f59-9b4c-f2b31cb8ff72.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:07:49.347' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8080, 0, 0, 4006, N'', NULL, NULL, N'02bd7bbb-942f-47c9-bae7-845ecb9d66b0.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:07:49.410' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8081, 0, 0, 4006, N'', NULL, NULL, N'128b1163-d579-4ca1-a054-109c2e2d514a.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:07:49.477' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8082, 0, 0, 4006, N'', NULL, NULL, N'0db0cdef-13e8-43c2-912b-af0389714e5f.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:07:49.537' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8083, 0, 0, 4006, N'asas', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:10:11.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (8084, 0, 0, 4006, N'hjhj', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-21T21:10:52.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (9080, 0, 0, 5008, N'', NULL, NULL, N'ac8d985f-4153-46ba-b81d-dc8d30f8a93c.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-26T20:45:57.350' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (9081, 0, 0, 5008, N'', NULL, NULL, N'1bdb6e04-d8a0-4031-a9c8-10160220caf9.jpg', NULL, NULL, NULL, 0, NULL, 1, CAST(N'2021-10-26T20:45:57.453' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (9082, 1, 1, 5008, N'ssddsd', NULL, NULL, N'6444db47-4f1a-4550-b1f4-a825052eae02.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-26T21:23:31.927' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (10077, 0, 0, 5008, N'', NULL, NULL, N'fb516abf-99c1-423e-aace-9c9317f35614.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:18:12.513' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (10078, 0, 0, 5008, N'', NULL, NULL, N'b4a75a6c-8ba7-4d5d-b4a2-e3223c550981.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:18:13.540' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (10079, 0, 0, 5008, N'', NULL, NULL, N'5207a736-b05f-4503-aa5a-7d0e263322e2.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:18:13.603' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (10080, 0, 0, 5008, N'', NULL, NULL, N'f47d3f37-65cd-47e0-949d-ce4395e4227a.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-27T23:18:13.663' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (11077, 0, 0, 5008, N'', NULL, NULL, N'42baa57b-f193-4c07-a714-46b455f1f037.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-30T22:30:55.693' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (11078, 0, 0, 5008, N'', NULL, NULL, N'67e227c2-c153-4c0b-9510-2c366784a5ab.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-30T22:30:55.780' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (11079, 0, 0, 5008, N'', NULL, NULL, N'68f4c5a9-6bbd-44af-9c19-a935a7ac09d6.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-10-30T22:30:55.837' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12077, 0, 0, 8007, N'gh', NULL, NULL, N'0bc9bf3c-8448-412e-8091-024780907ce2.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-11-01T22:05:02.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12078, 0, 0, 8010, N'', NULL, NULL, N'8e959007-e250-46c5-8ae7-0d4a2a84425d.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-11-02T21:52:07.343' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12079, 0, 0, 8010, N'', NULL, NULL, N'4bcaaad6-453d-41a0-b90a-81f44f6bde35.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-11-02T21:52:07.423' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12080, 0, 0, 8010, N'', NULL, NULL, N'9b9e1811-c239-4643-b7e1-d86d26eff221.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-11-02T21:52:07.483' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12081, 0, 0, 8010, N'', NULL, NULL, N'b00c9924-f8ba-412d-96f9-5dfa4402c60f.jpg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2021-11-02T21:52:07.537' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12082, NULL, NULL, 8010, N'', NULL, NULL, N'hata-8e51964e-9e47-4ed9-903f-ea374c14f582.jpeg', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2022-02-24T17:38:43.820' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12083, NULL, NULL, 8011, N'a', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2022-04-04T15:03:44.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12084, NULL, NULL, 8012, N's', NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, NULL, CAST(N'2022-04-07T16:13:34.967' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12085, NULL, NULL, 8012, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 36, 0, CAST(N'2022-04-07T16:13:44.880' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12086, NULL, NULL, 8012, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 37, 0, CAST(N'2022-04-07T16:13:44.900' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12087, NULL, NULL, 8012, N'3', NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, 0, CAST(N'2022-04-07T16:15:21.000' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12100, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, 0, CAST(N'2022-04-11T15:43:00.820' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12101, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 48, 0, CAST(N'2022-04-11T15:43:00.837' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12102, NULL, NULL, 8013, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 49, 0, CAST(N'2022-04-11T15:43:00.860' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12103, NULL, NULL, 8014, N'deneme ürün', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1057, 0, CAST(N'2022-04-18T12:55:52.913' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12104, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1058, 0, CAST(N'2022-04-18T12:56:04.037' AS DateTime), 0)
GO
INSERT [dbo].[RecordImage] ([Id], [SystemUserId], [LanguageId], [RecordId], [Name], [ShortExplanation], [Explanation], [ImageName], [ImageTagName], [ImageTitleName], [TargetId], [HomePageStatus], [ImageId], [OrderNumber], [RecordDate], [IsActive]) VALUES (12105, NULL, NULL, 8014, N'', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1059, 0, CAST(N'2022-04-18T12:56:04.070' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[RecordImage] OFF
GO
SET IDENTITY_INSERT [dbo].[StaticText] ON 
GO
INSERT [dbo].[StaticText] ([Id], [SystemUserId], [Name], [Explanation], [OrderNumber], [RecordDate], [IsActive]) VALUES (1, 1, N'1', N'1', 0, CAST(N'2021-10-12T18:31:48.407' AS DateTime), 0)
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
INSERT [dbo].[SystemRole] ([Id], [Name], [Explanation], [RecordDate], [IsActive]) VALUES (3, N'Deneme', N'd', CAST(N'2022-04-18T12:59:12.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[SystemRole] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemUser] ON 
GO
INSERT [dbo].[SystemUser] ([Id], [SystemUserId], [SystemRoleId], [Name], [SurName], [UserName], [Password], [Email], [Phone], [Address], [RecordDate], [IsActive], [IsAdmin]) VALUES (1, 0, 2, N'Erdoğan', N'KABA', N'erdogankb57@gmail.com', N'123456', N'erdogankb57@gmail.com', N'05318479796', N'Bağcan sok', CAST(N'2021-10-12T14:55:20.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[SystemUser] ([Id], [SystemUserId], [SystemRoleId], [Name], [SurName], [UserName], [Password], [Email], [Phone], [Address], [RecordDate], [IsActive], [IsAdmin]) VALUES (2, 1, 2, N'Test', N'Test', N'Test', N'Test', N'Test', N'Test', N'Test', CAST(N'2021-10-14T18:01:01.403' AS DateTime), 1, 0)
GO
INSERT [dbo].[SystemUser] ([Id], [SystemUserId], [SystemRoleId], [Name], [SurName], [UserName], [Password], [Email], [Phone], [Address], [RecordDate], [IsActive], [IsAdmin]) VALUES (3, 2, 2, N'1', N'1', N'1', N'1', N'1', N'11', N'1', CAST(N'2021-10-22T20:43:11.727' AS DateTime), 0, 0)
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
