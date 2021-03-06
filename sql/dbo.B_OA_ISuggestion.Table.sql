USE [LLL]
GO
/****** Object:  Table [dbo].[B_OA_ISuggestion]    Script Date: 2017/9/29 22:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[B_OA_ISuggestion](
	[TID] [varchar](50) NULL,
	[TZBH] [varchar](255) NULL,
	[DM] [varchar](255) NULL,
	[MC] [varchar](255) NULL,
	[FKNR] [text] NULL,
	[RRQ] [datetime] NULL,
	[VIP] [varchar](255) NULL,
	[ZT] [varchar](255) NULL,
	[UID] [varchar](255) NULL,
	[RUID] [varchar](255) NULL,
	[CJR] [varchar](255) NULL,
	[CJSJ] [datetime] NULL,
	[XGR] [varchar](255) NULL,
	[XGSJ] [datetime] NULL,
	[ORGID] [varchar](255) NULL,
	[FKRQ] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'MC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'FKNR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'RRQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'ZT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'RUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'CJR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'CJSJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'XGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'XGSJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ISuggestion', @level2type=N'COLUMN',@level2name=N'FKRQ'
GO
