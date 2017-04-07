USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_base_distribution]    Script Date: 07.04.2017 12:56:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_base_distribution](
	[id_distribution_tac] [int] NOT NULL,
	[object] [varchar](50) NULL,
	[limits_percent] [decimal](38, 17) NULL,
	[id_regime] [int] NULL,
	[id_subject] [int] NULL,
	[id_basin] [int] NULL,
	[regime_subject] [int] NULL,
 CONSTRAINT [PK_limits_base_distribution] PRIMARY KEY CLUSTERED 
(
	[id_distribution_tac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


