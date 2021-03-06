USE [LLL]
GO
/****** Object:  Table [dbo].[B_OA_IReceiveTask]    Script Date: 2017/9/29 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B_OA_IReceiveTask](
	[XTBH] [varchar](50) NULL,
	[USERID] [varchar](50) NULL,
	[YWBH] [varchar](50) NULL,
	[SWLX] [varchar](50) NULL,
	[SWBT] [varchar](1000) NULL,
	[SWLCBH] [varchar](50) NULL,
	[SWZT] [varchar](2) NULL,
	[FKYJ] [varchar](4000) NULL,
	[BZ] [varchar](4000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'YWBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'SWLX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'SWBT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文流程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'SWLCBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'SWZT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'FKYJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask', @level2type=N'COLUMN',@level2name=N'BZ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已被接收任务列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_IReceiveTask'
GO
