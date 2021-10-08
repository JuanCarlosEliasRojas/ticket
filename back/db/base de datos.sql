USE [master]
GO
/****** Object:  Database [db_presupuesto]    Script Date: 08/10/2021 02:54:49 a. m. ******/
CREATE DATABASE [db_presupuesto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'presupuestosTI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\presupuestosTI.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'presupuestosTI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\presupuestosTI_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_presupuesto] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_presupuesto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_presupuesto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_presupuesto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_presupuesto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_presupuesto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_presupuesto] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_presupuesto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_presupuesto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_presupuesto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_presupuesto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_presupuesto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_presupuesto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_presupuesto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_presupuesto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_presupuesto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_presupuesto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_presupuesto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_presupuesto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_presupuesto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_presupuesto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_presupuesto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_presupuesto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_presupuesto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_presupuesto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_presupuesto] SET  MULTI_USER 
GO
ALTER DATABASE [db_presupuesto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_presupuesto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_presupuesto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_presupuesto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_presupuesto] SET DELAYED_DURABILITY = DISABLED 
GO
USE [db_presupuesto]
GO
/****** Object:  Table [dbo].[costosDirectos]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costosDirectos](
	[idCostosD] [int] IDENTITY(1,1) NOT NULL,
	[id_Presupuesto] [int] NOT NULL,
	[id_Mes] [int] NOT NULL,
	[concepto] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCostosD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flujoEfec]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flujoEfec](
	[idFlujoE] [int] IDENTITY(1,1) NOT NULL,
	[id_Presupuesto] [int] NOT NULL,
	[id_Mes] [int] NOT NULL,
	[ingreso] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFlujoE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gastosAdmin]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gastosAdmin](
	[idgastosAdmin] [int] IDENTITY(1,1) NOT NULL,
	[id_Presupuesto] [int] NOT NULL,
	[id_Mes] [int] NOT NULL,
	[concepto] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idgastosAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingresos]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingresos](
	[idIngreso] [int] IDENTITY(1,1) NOT NULL,
	[id_Presupuesto] [int] NOT NULL,
	[id_Mes] [int] NOT NULL,
	[concepto] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mes]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mes](
	[idMes] [int] IDENTITY(1,1) NOT NULL,
	[nombre_mes] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[presupuesto]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presupuesto](
	[id_presupuesto] [int] IDENTITY(1,1) NOT NULL,
	[fecha_creacion] [date] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[version] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_presupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recursos]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recursos](
	[idRecurso] [int] IDENTITY(1,1) NOT NULL,
	[id_Presupuesto] [int] NOT NULL,
	[id_Mes] [int] NOT NULL,
	[rol] [varchar](30) NOT NULL,
	[recurso] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 08/10/2021 02:54:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mes] ON 
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (1, N'Enero')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (2, N'Febrero')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (3, N'Marzo')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (4, N'Abril')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (5, N'Mayo')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (6, N'Junio')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (7, N'Julio')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (8, N'Agosto')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (9, N'Septiembre')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (10, N'Octubre')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (11, N'Noviembre')
GO
INSERT [dbo].[mes] ([idMes], [nombre_mes]) VALUES (12, N'Diciembre')
GO
SET IDENTITY_INSERT [dbo].[mes] OFF
GO
SET IDENTITY_INSERT [dbo].[presupuesto] ON 
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (28, CAST(N'7777-01-01' AS Date), N'esto es una modificacion del presupuesto', 55)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (29, CAST(N'7777-01-01' AS Date), N'preubas y mas pruebas', 56)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (31, CAST(N'2222-01-01' AS Date), N'2222', 222)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (32, CAST(N'2222-01-01' AS Date), N'2222', 222)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (36, CAST(N'0001-01-01' AS Date), N'98425974981', 14563465)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (37, CAST(N'0001-01-01' AS Date), N'98425974981', 14563465)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (38, CAST(N'1998-01-01' AS Date), N'aaaa', 323)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (39, CAST(N'1998-01-01' AS Date), N'aaaa', 323)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (40, CAST(N'1995-01-01' AS Date), N'proyecto de estilos ', 2.2)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (45, CAST(N'2020-05-25' AS Date), N'prueba real', 8)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (46, CAST(N'2021-05-09' AS Date), N'Super Proyecto bien chido', 1)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (47, CAST(N'2021-05-09' AS Date), N'Super Proyecto bien chido', 1.2)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (48, CAST(N'2021-09-25' AS Date), N'super prueba', 56)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (49, CAST(N'2021-09-25' AS Date), N'prueba de editar', 40)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (50, CAST(N'2021-08-14' AS Date), N'poiuy', 987456)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (51, CAST(N'2021-08-14' AS Date), N'prueba crud', 548)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (56, CAST(N'0001-01-01' AS Date), N'sjkhgdhj', 12)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (57, CAST(N'0001-01-01' AS Date), N'sjkhgdhj', 12)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (58, CAST(N'0001-01-01' AS Date), N'4546546', 4)
GO
INSERT [dbo].[presupuesto] ([id_presupuesto], [fecha_creacion], [descripcion], [version]) VALUES (60, CAST(N'0001-01-01' AS Date), N'ho mundo', 78)
GO
SET IDENTITY_INSERT [dbo].[presupuesto] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([idUser], [user], [password]) VALUES (1, N'juan1234', N'juan123456789')
GO
INSERT [dbo].[users] ([idUser], [user], [password]) VALUES (2, N'Admin12345', N'adminprueba')
GO
INSERT [dbo].[users] ([idUser], [user], [password]) VALUES (3, N'Admin2', N'superadmin')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[costosDirectos]  WITH CHECK ADD FOREIGN KEY([id_Mes])
REFERENCES [dbo].[mes] ([idMes])
GO
ALTER TABLE [dbo].[costosDirectos]  WITH CHECK ADD FOREIGN KEY([id_Presupuesto])
REFERENCES [dbo].[presupuesto] ([id_presupuesto])
GO
ALTER TABLE [dbo].[flujoEfec]  WITH CHECK ADD FOREIGN KEY([id_Mes])
REFERENCES [dbo].[mes] ([idMes])
GO
ALTER TABLE [dbo].[flujoEfec]  WITH CHECK ADD FOREIGN KEY([id_Presupuesto])
REFERENCES [dbo].[presupuesto] ([id_presupuesto])
GO
ALTER TABLE [dbo].[gastosAdmin]  WITH CHECK ADD FOREIGN KEY([id_Mes])
REFERENCES [dbo].[mes] ([idMes])
GO
ALTER TABLE [dbo].[gastosAdmin]  WITH CHECK ADD FOREIGN KEY([id_Presupuesto])
REFERENCES [dbo].[presupuesto] ([id_presupuesto])
GO
ALTER TABLE [dbo].[ingresos]  WITH CHECK ADD FOREIGN KEY([id_Mes])
REFERENCES [dbo].[mes] ([idMes])
GO
ALTER TABLE [dbo].[ingresos]  WITH CHECK ADD FOREIGN KEY([id_Presupuesto])
REFERENCES [dbo].[presupuesto] ([id_presupuesto])
GO
ALTER TABLE [dbo].[recursos]  WITH CHECK ADD FOREIGN KEY([id_Mes])
REFERENCES [dbo].[mes] ([idMes])
GO
ALTER TABLE [dbo].[recursos]  WITH CHECK ADD FOREIGN KEY([id_Presupuesto])
REFERENCES [dbo].[presupuesto] ([id_presupuesto])
GO
USE [master]
GO
ALTER DATABASE [db_presupuesto] SET  READ_WRITE 
GO
