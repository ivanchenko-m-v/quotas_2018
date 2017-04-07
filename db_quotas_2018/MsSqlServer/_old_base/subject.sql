USE [limits_2009c]
GO

/****** Object:  Table [dbo].[subject]    Script Date: 07.04.2017 13:12:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subject](
	[id_subject] [int] NOT NULL,
	[subject] [varchar](50) NULL,
	[subject_order] [varchar](50) NULL,
	[id_subject_osm] [int] NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [smalldatetime] NULL,
	[sorting] [int] NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id_subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[subject] ADD  CONSTRAINT [DF_subject_sorting]  DEFAULT ((9999999)) FOR [sorting]
GO


