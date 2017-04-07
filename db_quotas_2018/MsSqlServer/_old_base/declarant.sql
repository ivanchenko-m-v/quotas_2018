USE [limits_2009c]
GO

/****** Object:  Table [dbo].[declarant]    Script Date: 07.04.2017 12:44:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[declarant](
	[id_declarant_history] [int] NOT NULL,
	[id_declarant] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[date_registration] [datetime] NULL,
	[declarant] [varchar](250) NULL,
	[work_number] [varchar](20) NULL,
	[declarant_type] [varchar](20) NULL,
	[address] [varchar](255) NULL,
	[postal_address] [varchar](200) NULL,
	[director] [varchar](80) NULL,
	[phone] [varchar](40) NULL,
	[fax] [varchar](20) NULL,
	[telex] [varchar](20) NULL,
	[e_mail] [varchar](50) NULL,
	[declarant_full] [varchar](150) NULL,
	[inn] [varchar](20) NULL,
	[kpp] [varchar](9) NULL,
	[reg_number] [varchar](50) NULL,
	[OKPO] [varchar](50) NULL,
	[OKATO] [varchar](5) NULL,
	[OKVED] [varchar](10) NULL,
	[KOPF] [varchar](2) NULL,
	[KFS] [varchar](2) NULL,
	[id_own] [int] NULL,
	[own] [varchar](250) NULL,
	[note] [varchar](255) NULL,
	[timestamp_] [datetime] NULL,
	[responsible] [varchar](50) NULL,
	[juridical] [tinyint] NULL,
	[id_declarant_history_was] [int] NULL,
 CONSTRAINT [PK_declarant] PRIMARY KEY CLUSTERED 
(
	[id_declarant_history] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


