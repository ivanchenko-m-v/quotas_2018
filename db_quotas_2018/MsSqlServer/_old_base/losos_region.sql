USE [limits_2009c]
GO

/****** Object:  Table [dbo].[losos_region]    Script Date: 07.04.2017 12:59:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[losos_region](
	[id_region] [int] NOT NULL,
	[region] [varchar](100) NULL,
	[sorting] [int] NULL,
	[level_] [int] NULL,
 CONSTRAINT [PK_losos_region] PRIMARY KEY CLUSTERED 
(
	[id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


