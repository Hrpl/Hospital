USE [master]
GO
/****** Object:  Database [Hospital2]    Script Date: 17.03.2024 15:00:03 ******/
CREATE DATABASE [Hospital2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital2', FILENAME = N'C:\Users\Денис\Hospital2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital2_log', FILENAME = N'C:\Users\Денис\Hospital2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hospital2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital2] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hospital2] SET QUERY_STORE = OFF
GO
USE [Hospital2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departaments]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departaments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Departaments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalizations]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalizations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Code] [uniqueidentifier] NOT NULL,
	[BeginDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Target] [nvarchar](max) NOT NULL,
	[DepartamentId] [int] NOT NULL,
	[Condition] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Hospitalizations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measures]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MeasureTypeId] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
	[Recipes] [nvarchar](max) NOT NULL,
	[Recommendation] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Measures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasureType]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_MeasureType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCards]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime2](7) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[PatientId] [int] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_MedicalCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [varbinary](max) NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NULL,
	[PassportSerial] [nvarchar](max) NOT NULL,
	[PassportNumber] [nvarchar](max) NOT NULL,
	[Birthday] [datetime2](7) NOT NULL,
	[Gender] [int] NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[PlaceOfWork] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[LastVisit] [datetime2](7) NOT NULL,
	[NextVisit] [datetime2](7) NULL,
	[Diagnosis] [nvarchar](max) NOT NULL,
	[History] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policies]    Script Date: 17.03.2024 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[Company] [nvarchar](max) NOT NULL,
	[BeginDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[PatientId] [int] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240317114104_Init', N'8.0.3')
GO
/****** Object:  Index [IX_Hospitalizations_DepartamentId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_Hospitalizations_DepartamentId] ON [dbo].[Hospitalizations]
(
	[DepartamentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Hospitalizations_PatientId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_Hospitalizations_PatientId] ON [dbo].[Hospitalizations]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Measures_DoctorId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_Measures_DoctorId] ON [dbo].[Measures]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Measures_MeasureTypeId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_Measures_MeasureTypeId] ON [dbo].[Measures]
(
	[MeasureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Measures_PatientId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_Measures_PatientId] ON [dbo].[Measures]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicalCards_PatientId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_MedicalCards_PatientId] ON [dbo].[MedicalCards]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Policies_PatientId]    Script Date: 17.03.2024 15:00:04 ******/
CREATE NONCLUSTERED INDEX [IX_Policies_PatientId] ON [dbo].[Policies]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hospitalizations]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalizations_Departaments_DepartamentId] FOREIGN KEY([DepartamentId])
REFERENCES [dbo].[Departaments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hospitalizations] CHECK CONSTRAINT [FK_Hospitalizations_Departaments_DepartamentId]
GO
ALTER TABLE [dbo].[Hospitalizations]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalizations_Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hospitalizations] CHECK CONSTRAINT [FK_Hospitalizations_Patients_PatientId]
GO
ALTER TABLE [dbo].[Measures]  WITH CHECK ADD  CONSTRAINT [FK_Measures_Doctors_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Measures] CHECK CONSTRAINT [FK_Measures_Doctors_DoctorId]
GO
ALTER TABLE [dbo].[Measures]  WITH CHECK ADD  CONSTRAINT [FK_Measures_MeasureType_MeasureTypeId] FOREIGN KEY([MeasureTypeId])
REFERENCES [dbo].[MeasureType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Measures] CHECK CONSTRAINT [FK_Measures_MeasureType_MeasureTypeId]
GO
ALTER TABLE [dbo].[Measures]  WITH CHECK ADD  CONSTRAINT [FK_Measures_Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Measures] CHECK CONSTRAINT [FK_Measures_Patients_PatientId]
GO
ALTER TABLE [dbo].[MedicalCards]  WITH CHECK ADD  CONSTRAINT [FK_MedicalCards_Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicalCards] CHECK CONSTRAINT [FK_MedicalCards_Patients_PatientId]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_Patients_PatientId]
GO
USE [master]
GO
ALTER DATABASE [Hospital2] SET  READ_WRITE 
GO
