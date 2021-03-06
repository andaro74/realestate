-- This script creates all the tables in the Real Estate Database
-- This script has to be executed first

/****** Object:  Table [dbo].[Agency]    Script Date: 11/27/2010 17:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agency](
	[AgencyId] [int] IDENTITY(1,1) NOT NULL,
	[AgencyName] [varchar](50) NOT NULL,
	[AddressLine1] [varchar](60) NOT NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[StateProvince] [varchar](50) NULL,
	[PostalCode] [varchar](15) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Phone1] [varchar](25) NOT NULL,
	[Phone2] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[WebPage] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
 CONSTRAINT [PK_Agency] PRIMARY KEY CLUSTERED 
(
	[AgencyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 11/27/2010 17:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agent](
	[FirstName] [varchar](150) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[WorkPhone] [varchar](25) NULL,
	[CellPhone] [varchar](25) NULL,
	[AgencyId] [int] NOT NULL,
	[Title] [varchar](25) NULL,
	[URL] [varchar](50) NULL,
 CONSTRAINT [PK_Agent_1] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Property]    Script Date: 11/27/2010 17:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[MLSId] [varchar](50) NOT NULL,
	[MLSUrl] [varchar](100) NULL,
	[Beds] [int] NULL,
	[Baths] [int] NULL,
	[SqFt] [float] NULL,
	[Description] [varchar](max) NULL,
	[Price] [money] NULL,
	[StreetAddress] [varchar](50) NOT NULL,
	[StateProvince] [varchar](50) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 11/27/2010 17:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Picture](
	[Name] [varchar](25) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[IsMain] [bit] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[PictureId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Picture_1] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Agent_Agency]    Script Date: 11/27/2010 17:20:30 ******/
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([AgencyId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Agency]
GO
/****** Object:  ForeignKey [FK_Picture_Property]    Script Date: 11/27/2010 17:20:30 ******/
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Property]
GO
/****** Object:  ForeignKey [FK_Property_Agent]    Script Date: 11/27/2010 17:20:30 ******/
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Agent]
GO
