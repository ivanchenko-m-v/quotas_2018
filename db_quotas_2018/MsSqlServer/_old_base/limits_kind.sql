USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_kind]    Script Date: 07.04.2017 12:59:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_kind](
	[id_limits_kind] [int] NOT NULL,
	[limits_kind] [varchar](50) NULL,
 CONSTRAINT [PK_limits_kind] PRIMARY KEY CLUSTERED 
(
	[id_limits_kind] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


