USE [limits_2009c]
GO

/****** Object:  Table [dbo].[regime]    Script Date: 07.04.2017 13:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[regime](
	[id_regime] [int] NOT NULL,
	[regime] [varchar](55) NULL,
	[mode] [int] NULL,
	[regime_order] [varchar](55) NULL,
 CONSTRAINT [PK_regime] PRIMARY KEY CLUSTERED 
(
	[id_regime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


