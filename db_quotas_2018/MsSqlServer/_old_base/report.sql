USE [limits_2009c]
GO

/****** Object:  Table [dbo].[report]    Script Date: 07.04.2017 13:10:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[report](
	[id_report] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[report] [varchar](250) NULL,
	[creation_date] [datetime] NULL,
 CONSTRAINT [PK_report] PRIMARY KEY CLUSTERED 
(
	[id_report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


