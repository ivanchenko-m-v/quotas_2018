USE [limits_2009c]
GO

/****** Object:  Table [dbo].[user_permission]    Script Date: 07.04.2017 13:16:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_permission](
	[PCName] [char](50) NOT NULL,
	[UserName] [char](50) NOT NULL,
	[permission] [int] NULL,
	[launching] [int] NOT NULL,
	[portion_edit] [tinyint] NOT NULL,
	[portion_view] [tinyint] NOT NULL,
	[distribution_del] [tinyint] NOT NULL,
	[spr_edit] [tinyint] NOT NULL,
 CONSTRAINT [PK_user_permission] PRIMARY KEY CLUSTERED 
(
	[PCName] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[user_permission] ADD  CONSTRAINT [DF_user_permission_portion_edit]  DEFAULT ((0)) FOR [portion_edit]
GO

ALTER TABLE [dbo].[user_permission] ADD  CONSTRAINT [DF_user_permission_portion_view]  DEFAULT ((0)) FOR [portion_view]
GO

ALTER TABLE [dbo].[user_permission] ADD  CONSTRAINT [DF_user_permission_distribution_del]  DEFAULT ((0)) FOR [distribution_del]
GO

ALTER TABLE [dbo].[user_permission] ADD  CONSTRAINT [DF_user_permission_spr_edit]  DEFAULT ((0)) FOR [spr_edit]
GO


