USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_history]    Script Date: 07.04.2017 12:58:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_history](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[id_limits_kind] [int] NOT NULL,
	[sign] [int] NOT NULL,
	[distribution] [varchar](150) NULL,
	[date] [datetime] NOT NULL,
	[id_basin] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_unit] [int] NOT NULL,
	[id_regime] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_declarant] [int] NOT NULL,
	[catch_volume] [decimal](38, 17) NULL,
	[document] [varchar](50) NULL,
	[document_date] [datetime] NULL,
	[document_change] [varchar](50) NULL,
	[document_change_date] [datetime] NULL,
	[person] [varchar](50) NULL,
	[note] [varchar](255) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_limits_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


