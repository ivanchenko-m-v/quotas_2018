USE [limits_2009c]
GO

/****** Object:  Table [dbo].[fish]    Script Date: 07.04.2017 12:51:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[fish](
	[id_fish] [int] NOT NULL,
	[fish] [varchar](45) NULL,
	[note] [varchar](250) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [smalldatetime] NULL,
	[id_fish_osm] [int] NULL,
	[fish_order] [varchar](45) NULL,
	[sorting] [int] NOT NULL,
 CONSTRAINT [PK_fish] PRIMARY KEY CLUSTERED 
(
	[id_fish] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[fish] ADD  CONSTRAINT [DF_fish_sorting]  DEFAULT ((9999999)) FOR [sorting]
GO


