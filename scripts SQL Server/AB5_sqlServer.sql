USE [master]
GO

/****** Object:  Database [AB5_SQLserver]   ******/
IF  EXISTS (SELECT * FROM sys.databases WHERE name = N'AB5_SQLserver')
BEGIN
DROP DATABASE [AB5_SQLserver]
END
USE [master]
GO

/****** Database aanmaken ******/
CREATE DATABASE [AB5_SQLserver] ON PRIMARY 
( NAME = N'AB5_SQLserver', FILENAME = N'C:\DB\AB5_SQLserver.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AB5_SQLserver_log', FILENAME = N'C:\DB\AB5_SQLserver_log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO


USE [AB5_SQLserver]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 06.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Creatie van de Sqlmembership  tabellen  ******/
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[vertalerId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/****** Creatie tabel- Company ( In deze tabel zitten alle bedrijven die al dan niet klant zijn van SamenSterker.
De kolom Employees is het aantal werknemers van het bedrijf.)******/

CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[Zipcode] [int] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Employees] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Creatie tabel- Contract ( Een contract loopt voor een bepaalde tijd en periode. 
Gebruikers die via hun bedrijf een contract hebben afgesloten mogen vrij gebruik maken van de landschapsbureau’s van SamenSterker.)******/
CREATE TABLE [dbo].[Contract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ContractFormulaId] [int] NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractFormula]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/****** Creatie tabel- ContractFormula (Definieert de looptijd van het contract en het gebruik van de infrastructuur per periode.) ******/
CREATE TABLE [dbo].[ContractFormula](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[MaxUsageHoursPerPeriod] [int] NULL,
	[PeriodInMonths] [int] NOT NULL,
	[NoticePeriodInMonths] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ContractFormula] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/****** Creatie tabel- Location( De vergaderzalen die gereserveerd kunnen worden.)  ******/
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Creatie tabel- Reservation( De landschapsbureau’s mogen vrij gebruikt worden maar de vergaderzalen moeten gereserveerd kunnen worden door gebruikers)******/
CREATE TABLE [dbo].[Reservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 07.05.2014 15:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/****** Creatie tabel- User ******/
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL
) ON [PRIMARY]


GO
SET ANSI_PADDING OFF
GO
/****** Hier worden de aangemaakte tabellen gevuld met waardes ******/
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name], [Street], [Zipcode], [City], [Country], [Email], [Phone], [Employees]) VALUES (1, N'Involved', N'Veldkant 33A', 2550, N'Kontich', N'Belgium', N'info@involved-it.be', N'34508030', 25)
INSERT [dbo].[Company] ([Id], [Name], [Street], [Zipcode], [City], [Country], [Email], [Phone], [Employees]) VALUES (2, N'Cronos', N'Veldkant 33A', 2550, N'Kontich
', N'Belgium', N'info@cronos.be', N'34508031', 2500)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [ContractFormulaId]) VALUES (1, 1, CAST(0x0000A28700000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime), 1, 1)
INSERT [dbo].[Contract] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [ContractFormulaId]) VALUES (2, 2, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A35A00000000 AS DateTime), 1, 5)
INSERT [dbo].[Contract] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [ContractFormulaId]) VALUES (3, 3, CAST(0x0000A28700000000 AS DateTime), CAST(0x0000A2C400000000 AS DateTime), 2, 4)
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[ContractFormula] ON 

INSERT [dbo].[ContractFormula] ([Id], [Description], [MaxUsageHoursPerPeriod], [PeriodInMonths], [NoticePeriodInMonths], [Price]) VALUES (1, N'Limit: 20h p/m - Period: 1m - Notice: x', 20, 1, NULL, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[ContractFormula] ([Id], [Description], [MaxUsageHoursPerPeriod], [PeriodInMonths], [NoticePeriodInMonths], [Price]) VALUES (2, N'Limit: 80h p/m - Period: 1m - Notice: x', 80, 1, NULL, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[ContractFormula] ([Id], [Description], [MaxUsageHoursPerPeriod], [PeriodInMonths], [NoticePeriodInMonths], [Price]) VALUES (3, N'Limit: x - Period: 1m - Notice: x', NULL, 1, NULL, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[ContractFormula] ([Id], [Description], [MaxUsageHoursPerPeriod], [PeriodInMonths], [NoticePeriodInMonths], [Price]) VALUES (4, N'Limit: x - Period: 2m - Notice: 1m', NULL, 2, 1, CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[ContractFormula] ([Id], [Description], [MaxUsageHoursPerPeriod], [PeriodInMonths], [NoticePeriodInMonths], [Price]) VALUES (5, N'Limit: x - Period: 6m - Notice: 2m', NULL, 6, 2, CAST(1200.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ContractFormula] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Name]) VALUES (1, N'Room 1')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (2, N'Room 2')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (1, 1, CAST(0x0000A29800A4CB80 AS DateTime), CAST(0x0000A29800B54640 AS DateTime), 1, 1, CAST(0x0000A25E01174402 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (2, 2, CAST(0x0000A28800DE7920 AS DateTime), CAST(0x0000A28800EEF3E0 AS DateTime), 1, 2, CAST(0x0000A25E01179E87 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (3, 3, CAST(0x0000A29800E6B680 AS DateTime), CAST(0x0000A298011826C0 AS DateTime), 1, 2, CAST(0x0000A25E0117D0F1 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (4, 4, CAST(0x0000A29900C5C100 AS DateTime), CAST(0x0000A29900F73140 AS DateTime), 1, 1, CAST(0x0000A25E01180089 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (5, 5, CAST(0x0000A29A009450C0 AS DateTime), CAST(0x0000A29A01206420 AS DateTime), 1, 2, CAST(0x0000A25E01182A32 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (6, 6, CAST(0x0000A27F00BD83A0 AS DateTime), CAST(0x0000A27F00CDFE60 AS DateTime), 1, 1, CAST(0x0000A25E01185107 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (7, 7, CAST(0x0000A29F00C5C100 AS DateTime), CAST(0x0000A29F00D63BC0 AS DateTime), 1, 2, CAST(0x0000A25E01187374 AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (8, 8, CAST(0x0000A2A1008C1360 AS DateTime), CAST(0x0000A2A100AD08E0 AS DateTime), 1, 1, CAST(0x0000A25E0118A1DA AS DateTime))
INSERT [dbo].[Reservation] ([Id], [Number], [StartDate], [EndDate], [CompanyId], [LocationId], [CreateDate]) VALUES (9, 9, CAST(0x0000A2A000EC34C0 AS DateTime), CAST(0x0000A2A000F47220 AS DateTime), 1, 1, CAST(0x0000A25E0118DB9A AS DateTime))
SET IDENTITY_INSERT [dbo].[Reservation] OFF
/****** Object:  Index [PK__aspnet_A__C93A4C98969B9ED8]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE4539A61CF]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__309103310D9E44A5]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4DAE0B0CB0]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC586859AF1E]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC063FD4C0C4]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1BAB9E5BD8]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D5310955F]    Script Date: 07.05.2014 15:09:17 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Company]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Contract] FOREIGN KEY([ContractFormulaId])
REFERENCES [dbo].[ContractFormula] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Contract]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Company]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Reservation] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Reservation]
GO
