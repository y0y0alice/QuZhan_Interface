USE [LLL]
GO
/****** Object:  Table [dbo].[B_OA_IAttachment]    Script Date: 2017/9/29 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B_OA_IAttachment](
	[WDBH] [varchar](50) NULL,
	[APPBH] [varchar](255) NULL,
	[WDMC] [varchar](255) NULL,
	[WDLX] [varchar](255) NULL,
	[WDSX] [varchar](255) NULL,
	[WDDX] [varchar](255) NULL,
	[WDMS] [varchar](1000) NULL,
	[WDZZ] [varchar](255) NULL,
	[WDLJ] [varchar](1000) NULL DEFAULT (''),
	[WDBT] [varchar](1000) NULL,
	[WDHZ] [varchar](255) NULL,
	[CJSJ] [datetime] NULL,
	[CJR] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'WDLX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'WDSX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'WDDX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'WDLJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'WDBT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档后缀' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'WDHZ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'CJSJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IAttachment', @level2type=N'COLUMN',@level2name=N'CJR'
GO
