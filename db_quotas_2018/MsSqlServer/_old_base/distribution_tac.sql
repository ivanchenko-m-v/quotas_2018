USE [limits_2009c]
GO

/****** Object:  Table [dbo].[distribution_tac]    Script Date: 07.04.2017 12:50:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[distribution_tac](
	[id_distribution_tac] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[distribution_tac] [varchar](150) NULL,
	[creation_date] [datetime] NULL,
 CONSTRAINT [PK_distribution_tac] PRIMARY KEY CLUSTERED 
(
	[id_distribution_tac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


