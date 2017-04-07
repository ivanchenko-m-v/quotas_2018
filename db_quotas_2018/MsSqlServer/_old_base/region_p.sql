USE [limits_2009c]
GO

/****** Object:  Table [dbo].[region_p]    Script Date: 07.04.2017 13:09:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[region_p](
	[id_region] [int] NOT NULL,
	[id_region_parent] [int] NOT NULL,
 CONSTRAINT [PK_region_p] PRIMARY KEY CLUSTERED 
(
	[id_region] ASC,
	[id_region_parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


