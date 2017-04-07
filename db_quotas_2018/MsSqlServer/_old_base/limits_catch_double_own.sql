USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_catch_double_own]    Script Date: 07.04.2017 12:57:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_catch_double_own](
	[id_own] [int] NOT NULL,
	[id_declarant1] [int] NOT NULL,
	[id_declarant2] [int] NOT NULL,
	[transfer_year] [int] NULL,
	[declarant1] [varchar](255) NULL,
	[declarant2] [varchar](255) NULL,
	[note] [varchar](250) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_limits_catch_double_own] PRIMARY KEY CLUSTERED 
(
	[id_own] ASC,
	[id_declarant1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


