USE [master]
GO
/****** Object:  Database [OnlineEducation]    Script Date: 7/8/2021 10:22:04 PM ******/
CREATE DATABASE [OnlineEducation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineEducation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineEducation.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineEducation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineEducation_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineEducation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineEducation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineEducation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineEducation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineEducation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineEducation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineEducation] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineEducation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineEducation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineEducation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineEducation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineEducation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineEducation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineEducation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineEducation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineEducation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineEducation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineEducation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineEducation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineEducation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineEducation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineEducation] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineEducation] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineEducation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineEducation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineEducation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineEducation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineEducation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineEducation', N'ON'
GO
USE [OnlineEducation]
GO
/****** Object:  Table [dbo].[Active]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Active](
	[ActiveID] [varchar](255) NOT NULL,
	[Code] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
 CONSTRAINT [PK__Category__19093A2BAF0417B2] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Course_ID] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Chapter__0893A34A1F31FCE0] PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](255) NOT NULL,
	[CourseName] [nvarchar](255) NOT NULL,
	[CategoryCourse] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Teacher_ID] [int] NULL,
	[Active_ID] [varchar](255) NULL,
	[Price] [nvarchar](100) NULL,
	[Image_url] [nvarchar](100) NULL,
 CONSTRAINT [PK__Course__C92D7187ADF2490B] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Description]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Description](
	[DescID] [int] IDENTITY(1,1) NOT NULL,
	[DescriptonTitle] [varchar](255) NULL,
	[Description] [ntext] NULL,
	[Course_ID] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Descript__EB54354949CF0B54] PRIMARY KEY CLUSTERED 
(
	[DescID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyCourse]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Course_ID] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Age] [varchar](255) NULL,
	[Url_Image] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[PhoneNumber] [varchar](255) NULL,
	[Role_ID] [int] NOT NULL,
	[Image_url] [varchar](255) NULL,
 CONSTRAINT [PK__User__1788CCACA190895C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 7/8/2021 10:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Video_url] [varchar](255) NULL,
	[Chapter_ID] [int] NOT NULL,
 CONSTRAINT [PK__Video__BAE5124AACB304F4] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Lập Trình ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Ngoại Ngữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Nhiếp ảnh, Dựng Phim')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Kỹ năng mềm')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Nấu ăn')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Kinh doanh')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (2, N'Chương 1', N'Giới thiệu về ngôn ngữ lập trình C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (6, N'Chương 2', N'Cấu trúc điều khiển & rẽ nhánh', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (8, N'Chương 3', N'Hàm trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (9, N'Chương 4', N'Mảng trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (10, N'Chương 5', N'Chuỗi trong C', N'LTC01')
INSERT [dbo].[Chapter] ([ChapterID], [Name], [Title], [Course_ID]) VALUES (11, N'Chương 6', N'Con trỏ trong C', N'LTC01')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTC01', N'Lập trình C/C++', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'200.000', N'kh1.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTCS', N'Lập trình C#', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'500.000', N'kh2.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTCS01', N'Lập trình web với C#', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'299.000', N'kh3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTJ01', N'Lập trình Java', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'500.000', N'kh4.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTJ02', N'Lập trình web với Java', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'500.000', N'kh5.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTPT01', N'Lập trình Python', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'399.000', N'kh6.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTPT02', N'Lập trình Back-end với Python', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'399.000', N'kh7.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'LTWeb', N'Lập trình Web', 1, CAST(N'2021-07-02' AS Date), NULL, NULL, N'500.000', N'kh8.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS01', N'Học nấu món việt', 5, CAST(N'2021-07-02' AS Date), NULL, NULL, N'1000.000', N'food1.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS02', N'Học nấu món Pháp', 5, CAST(N'2021-07-02' AS Date), NULL, NULL, N'199.000', N'food2.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS03', N'Học nấu món Âu', 5, CAST(N'2021-07-02' AS Date), NULL, NULL, N'299.000', N'food3.jpg')
INSERT [dbo].[Course] ([CourseID], [CourseName], [CategoryCourse], [CreateDate], [Teacher_ID], [Active_ID], [Price], [Image_url]) VALUES (N'MS04', N'Học nẩu món Nhật', 5, CAST(N'2021-07-02' AS Date), NULL, NULL, N'100.000', N'food4.jpg')
SET IDENTITY_INSERT [dbo].[Description] ON 

INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (1, N'Learn', N'Có kiến thức nền tảng vững chắc về ngôn ngữ C/C++ thông qua những kiến thức lý thuyết', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (3, N'Learn', N'Kiến thức lập trình đủ để xây dựng phần mềm từ ý tưởng đến thành phẩm hoàn thiện', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (4, N'Learn', N'Biết sử dụng kỹ thuật đệ quy để giải quyết bài toán phức tạp.', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (5, N'Learn', N'Có đủ kiến thức nền tảng cơ bản về C/C++ để bạn tiếp tục tự học thêm ngôn ngữ', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (6, N'Learn', N'Thiết kế, xây dựng, thử nghiệm và gỡ lỗi', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (7, N'Intro', N'Ngôn ngữ lập trình C++ được xây dựng và phát triển từ ngôn ngữ C. Ngôn ngữ C++ không phải là ngôn ngữ hướng đối tượng hoàn toàn mà là ngôn ngữ “đa hướng”. Vì C++ hỗ trợ cả lập trình hướng hành động và lập trình hướng đối tượng. Nó là một trong những ngôn ngữ phổ biến để viết các ứng dụng máy tính – và ngôn ngữ thông dụng nhất để lập trình games. ', N'LTC01')
INSERT [dbo].[Description] ([DescID], [DescriptonTitle], [Description], [Course_ID]) VALUES (8, N'Intro', N'Khóa học sẽ trang bị cho học viên các kỹ năng lập trình được minh hoạ cụ thể bằng ngôn ngữ lập trình C/C++ từ cơ bản đến nâng cao. Khóa học bao gồm các kỹ thuật lập trình trên các kiểu dữ liệu cơ bản, các phát biểu lựa chọn, câu lệnh điều khiển, vòng lặp, mảng, con trỏ, kiểu cấu trúc. Bên cạnh đó khóa học cũng trang bị cho học viên kiến thức xử lý tập tin, cách viết chương trình theo kiểu lập trình hàm...

Qua khóa học Học lập trình C/C++ TỪ A - Z tại Unica.vn, học viên có thể tự nâng cao kỹ năng lập trình của mình, dễ dàng tiếp cận các ngôn ngữ cấp cao và công nghệ mới. Đây là khóa học tạo tiền đề tốt cho việc tiếp cận phương pháp lập trình hướng đối tượng, một phương pháp lập trình cần phải có của một lập trình viên.', N'LTC01')
SET IDENTITY_INSERT [dbo].[Description] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (2, N'cuongnm', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'0123456789', 1, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (4, N'chienpd', N'chienphan', N'Nguyễn Đức Chiến', N'chienphan@gmail.com', N'0123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (5, N'haiphuong', N'haiphuong', N'Nguyễn Hải Phương', N'haiphuong@gmail.com', N'123456789', 2, NULL)
INSERT [dbo].[User] ([UserID], [Username], [Password], [FullName], [Email], [PhoneNumber], [Role_ID], [Image_url]) VALUES (6, N'manhcuong', N'manhcuong1', N'Nguyễn Mạnh Cường', N'cuongnguyenmanh3008@gmail.com', N'0393556120', 2, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (1, N'Giới thiệu khóa học', NULL, 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (2, N'Biến và hằng trong C', NULL, 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (3, N'Các kiểu dữ liệu trong C', NULL, 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (4, N'Hiện tượng tràn số trong C', NULL, 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (5, N'Nhập xuất trong C', NULL, 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (6, N'Toán tử trong C', NULL, 2)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (7, N'Cấu trúc điều khiển if else', NULL, 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (8, N'Vòng lặp for trong C', NULL, 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (9, N'Vòng lặp while và do … while', NULL, 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (10, N'Sự linh hoạt trong sử dụng vòng lặp', NULL, 6)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (11, N'Một số hàm trong thư viện toán học math.h', NULL, 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (12, N'Hàm người dùng định nghĩa', NULL, 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (13, N'Hàm không trả về giá trị', NULL, 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (14, N'Hàm đệ quy', NULL, 8)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (15, N'Nhập xuất mảng 1 chiều trong C', NULL, 9)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (16, N'Thêm, xóa phần tử trong mảng 1 chiều', NULL, 9)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (17, N'Nhập xuất chuỗi trong C', NULL, 10)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (18, N'Các hàm trong thư viện string.h', NULL, 10)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (19, N'Đảo ngược chuỗi trong C', NULL, 10)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (20, N'Con trỏ trong C', NULL, 11)
INSERT [dbo].[Video] ([VideoID], [Title], [Video_url], [Chapter_ID]) VALUES (21, N'Mối liên hệ giữa con trỏ và mảng trong C', NULL, 11)
SET IDENTITY_INSERT [dbo].[Video] OFF
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FKChapter917126] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FKChapter917126]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category] FOREIGN KEY([CategoryCourse])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Category]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FKCourse287810] FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FKCourse287810]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FKCourse310436] FOREIGN KEY([Active_ID])
REFERENCES [dbo].[Active] ([ActiveID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FKCourse310436]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FKDescriptio705554] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FKDescriptio705554]
GO
ALTER TABLE [dbo].[MyCourse]  WITH CHECK ADD  CONSTRAINT [FKMyCourse150142] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[MyCourse] CHECK CONSTRAINT [FKMyCourse150142]
GO
ALTER TABLE [dbo].[MyCourse]  WITH CHECK ADD  CONSTRAINT [FKMyCourse531829] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[MyCourse] CHECK CONSTRAINT [FKMyCourse531829]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FKUser187275] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FKUser187275]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FKVideo491000] FOREIGN KEY([Chapter_ID])
REFERENCES [dbo].[Chapter] ([ChapterID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FKVideo491000]
GO
USE [master]
GO
ALTER DATABASE [OnlineEducation] SET  READ_WRITE 
GO
