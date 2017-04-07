USE [limits_2009c]
GO

/****** Object:  Table [dbo].[user_action]    Script Date: 07.04.2017 13:15:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_action](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[timestamp_] [datetime] NULL,
	[PCName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[action_] [int] NULL,
 CONSTRAINT [PK_user_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


