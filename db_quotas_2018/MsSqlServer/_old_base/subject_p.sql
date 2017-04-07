USE [limits_2009c]
GO

/****** Object:  Table [dbo].[subject_p]    Script Date: 07.04.2017 13:14:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subject_p](
	[id_subject] [int] NOT NULL,
	[id_subject_parent] [int] NOT NULL,
 CONSTRAINT [PK_subject_p] PRIMARY KEY CLUSTERED 
(
	[id_subject] ASC,
	[id_subject_parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


