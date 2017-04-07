USE [limits_2009c]
GO

/****** Object:  Table [dbo].[z__GRR_limits_base]    Script Date: 07.04.2017 13:18:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[z__GRR_limits_base](
	[id_change] [int] NOT NULL,
	[timestamp_change] [datetime] NULL,
	[id_pos] [int] NULL,
	[sub_number] [int] NOT NULL,
	[document] [varchar](50) NOT NULL,
	[document_date] [datetime] NOT NULL,
	[dyear] [int] NOT NULL,
	[id_basin] [int] NOT NULL,
	[fish] [varchar](45) NULL,
	[id_fish] [int] NOT NULL,
	[region] [varchar](255) NULL,
	[id_region] [int] NOT NULL,
	[unit] [varchar](15) NULL,
	[id_unit] [int] NOT NULL,
	[catch_volume] [decimal](38, 17) NULL,
	[person] [varchar](50) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_z__GRR_limits_base] PRIMARY KEY CLUSTERED 
(
	[sub_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


