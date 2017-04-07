USE [limits_2009c]
GO

/****** Object:  Table [dbo].[program_files]    Script Date: 07.04.2017 13:08:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[program_files](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[file_name] [varchar](100) NOT NULL,
	[date_modified] [datetime] NOT NULL,
	[not_delete] [tinyint] NULL,
 CONSTRAINT [PK_program_files] PRIMARY KEY CLUSTERED 
(
	[file_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


