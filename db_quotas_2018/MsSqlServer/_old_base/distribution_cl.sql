USE [limits_2009c]
GO

/****** Object:  Table [dbo].[distribution_cl]    Script Date: 07.04.2017 12:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[distribution_cl](
	[id_distribution_cl] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[distribution_cl] [varchar](150) NULL,
	[creation_date] [datetime] NULL,
 CONSTRAINT [PK_distribution_cl] PRIMARY KEY CLUSTERED 
(
	[id_distribution_cl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


