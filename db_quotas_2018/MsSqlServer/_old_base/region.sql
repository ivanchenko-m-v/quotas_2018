USE [limits_2009c]
GO

/****** Object:  Table [dbo].[region]    Script Date: 07.04.2017 13:09:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[region](
	[id_region] [int] NOT NULL,
	[region] [varchar](255) NULL,
	[note] [varchar](250) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [smalldatetime] NULL,
	[region_order] [varchar](150) NULL,
	[id_region_osm] [int] NULL,
	[sorting] [int] NOT NULL,
 CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED 
(
	[id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[region] ADD  CONSTRAINT [DF_region_sorting]  DEFAULT ((9999999)) FOR [sorting]
GO


