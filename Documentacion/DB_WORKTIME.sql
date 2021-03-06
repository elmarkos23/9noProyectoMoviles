USE [master]
GO
/****** Object:  Database [DB_WORKTIME]    Script Date: 19/05/2021 23:57:24 ******/
CREATE DATABASE [DB_WORKTIME]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_WORKTIME', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_WORKTIME.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_WORKTIME_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_WORKTIME_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_WORKTIME] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_WORKTIME].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_WORKTIME] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_WORKTIME] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_WORKTIME] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_WORKTIME] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_WORKTIME] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_WORKTIME] SET  MULTI_USER 
GO
ALTER DATABASE [DB_WORKTIME] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_WORKTIME] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_WORKTIME] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_WORKTIME] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_WORKTIME] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_WORKTIME] SET QUERY_STORE = OFF
GO
USE [DB_WORKTIME]
GO
/****** Object:  User [marco]    Script Date: 19/05/2021 23:57:24 ******/
CREATE USER [marco] FOR LOGIN [marco] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 19/05/2021 23:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idUsuario] [numeric](18, 0) NOT NULL,
	[fecha] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Asistencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsistenciaDetalle]    Script Date: 19/05/2021 23:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsistenciaDetalle](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idAsistencia] [numeric](18, 0) NULL,
	[tipo] [varchar](1) NOT NULL,
	[hora] [time](7) NOT NULL,
	[ubicacion] [varchar](100) NOT NULL,
	[ubicacionReferencial] [varchar](200) NULL,
	[foto] [varbinary](max) NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_AsistenciaDetalle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 19/05/2021 23:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/05/2021 23:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idDepartamento] [numeric](18, 0) NOT NULL,
	[tipoIdentificacion] [char](3) NOT NULL,
	[identificacion] [varchar](15) NOT NULL,
	[nombres] [varchar](300) NOT NULL,
	[apellidos] [varchar](300) NOT NULL,
	[genero] [char](1) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asistencia] ON 

INSERT [dbo].[Asistencia] ([id], [idUsuario], [fecha], [estado]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[Asistencia] ([id], [idUsuario], [fecha], [estado]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-05-02' AS Date), 1)
INSERT [dbo].[Asistencia] ([id], [idUsuario], [fecha], [estado]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-05-03' AS Date), 1)
INSERT [dbo].[Asistencia] ([id], [idUsuario], [fecha], [estado]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-05-04' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Asistencia] OFF
GO
SET IDENTITY_INSERT [dbo].[AsistenciaDetalle] ON 

INSERT [dbo].[AsistenciaDetalle] ([id], [idAsistencia], [tipo], [hora], [ubicacion], [ubicacionReferencial], [foto], [estado]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'I', CAST(N'10:10:10' AS Time), N'0.0,0,0', N'OOOOOO', NULL, 1)
INSERT [dbo].[AsistenciaDetalle] ([id], [idAsistencia], [tipo], [hora], [ubicacion], [ubicacionReferencial], [foto], [estado]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'O', CAST(N'17:30:10' AS Time), N'0.0,0.0', N'OOO', NULL, 1)
INSERT [dbo].[AsistenciaDetalle] ([id], [idAsistencia], [tipo], [hora], [ubicacion], [ubicacionReferencial], [foto], [estado]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'I', CAST(N'08:30:00' AS Time), N'0.0,0.0', N'AA', NULL, 1)
SET IDENTITY_INSERT [dbo].[AsistenciaDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([id], [nombre]) VALUES (CAST(1 AS Numeric(18, 0)), N'TECNOLOGIA DE LA INFORMACION')
INSERT [dbo].[Departamento] ([id], [nombre]) VALUES (CAST(2 AS Numeric(18, 0)), N'TALENTO HUMANO')
INSERT [dbo].[Departamento] ([id], [nombre]) VALUES (CAST(3 AS Numeric(18, 0)), N'CONTABILIDAD')
INSERT [dbo].[Departamento] ([id], [nombre]) VALUES (CAST(4 AS Numeric(18, 0)), N'COMERCIAL')
INSERT [dbo].[Departamento] ([id], [nombre]) VALUES (CAST(5 AS Numeric(18, 0)), N'VENTAS')
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [idDepartamento], [tipoIdentificacion], [identificacion], [nombres], [apellidos], [genero], [estado]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'CED', N'1721481586', N'MARCO ANTONIO', N'AYALA', N'H', 1)
INSERT [dbo].[Usuario] ([id], [idDepartamento], [tipoIdentificacion], [identificacion], [nombres], [apellidos], [genero], [estado]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'CED', N'1719343020', N'MARIA BELEN', N'NARVAEZ CHICAIZA', N'M', 0)
INSERT [dbo].[Usuario] ([id], [idDepartamento], [tipoIdentificacion], [identificacion], [nombres], [apellidos], [genero], [estado]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'CED', N'1706067426', N'CAROLINA ESTEFANIA', N'SALINAS GALLARDO', N'M', 1)
INSERT [dbo].[Usuario] ([id], [idDepartamento], [tipoIdentificacion], [identificacion], [nombres], [apellidos], [genero], [estado]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'CED', N'1234567890', N'DANIEL JOSE', N'CARRION', N'H', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioAsistencia] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_UsuarioAsistencia]
GO
ALTER TABLE [dbo].[AsistenciaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_AsistenciaDetalle] FOREIGN KEY([idAsistencia])
REFERENCES [dbo].[Asistencia] ([id])
GO
ALTER TABLE [dbo].[AsistenciaDetalle] CHECK CONSTRAINT [FK_AsistenciaDetalle]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioDepartamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_UsuarioDepartamento]
GO
USE [master]
GO
ALTER DATABASE [DB_WORKTIME] SET  READ_WRITE 
GO
