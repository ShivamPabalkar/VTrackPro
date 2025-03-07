USE [VTSDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26-02-2025 16:46:05 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 26-02-2025 16:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[MobileNumber] [nvarchar](max) NOT NULL,
	[Organization] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVehicles]    Script Date: 26-02-2025 16:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[VehicleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 26-02-2025 16:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleNumber] [nvarchar](50) NOT NULL,
	[VehicleType] [nvarchar](max) NOT NULL,
	[ChassisNumber] [nvarchar](max) NOT NULL,
	[EngineNumber] [nvarchar](max) NOT NULL,
	[ManufacturingYear] [int] NOT NULL,
	[LoadCarryingCapacity] [float] NULL,
	[MakeOfVehicle] [nvarchar](max) NULL,
	[ModelNumber] [nvarchar](max) NOT NULL,
	[BodyType] [nvarchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
	[Make] [nvarchar](255) NULL,
	[Organization] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
