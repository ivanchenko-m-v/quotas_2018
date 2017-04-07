USE [limits_2009c]
GO

/****** Object:  Table [dbo].[portion_copy_calculation]    Script Date: 07.04.2017 13:02:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[portion_copy_calculation](
	[id_regime] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[regime] [varchar](55) NULL,
	[fish] [varchar](45) NULL,
	[region] [varchar](255) NULL,
	[id_fish_copy] [int] NOT NULL,
	[id_region_copy] [int] NOT NULL,
	[fish_copy] [varchar](45) NULL,
	[region_copy] [varchar](255) NULL,
	[id_basin] [int] NOT NULL,
 CONSTRAINT [PK_portion_copy_calculation] PRIMARY KEY CLUSTERED 
(
	[id_regime] ASC,
	[id_fish] ASC,
	[id_region] ASC,
	[id_fish_copy] ASC,
	[id_region_copy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


