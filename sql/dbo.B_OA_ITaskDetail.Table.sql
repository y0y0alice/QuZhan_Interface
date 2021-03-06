USE [LLL]
GO
/****** Object:  Table [dbo].[B_OA_ITaskDetail]    Script Date: 2017/9/29 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B_OA_ITaskDetail](
	[USERID] [varchar](50) NULL,
	[YWBH] [varchar](50) NULL,
	[SWLX] [varchar](50) NULL,
	[SWLCBH] [varchar](50) NULL,
	[SWZT] [varchar](2) NULL,
	[FKYJ] [varchar](4000) NULL,
	[BZ] [varchar](1000) NULL,
	[LCDYBH] [varchar](200) NULL,
	[BZDYBH] [varchar](200) NULL,
	[BZBH] [varchar](50) NULL,
	[SWBT] [varchar](1000) NULL,
	[TZNRTEXT] [text] NULL,
	[TZNR] [text] NULL,
	[TZJSR] [varchar](4000) NULL,
	[SFYX] [char](1) NULL,
	[YXJ] [char](1) NULL,
	[JSFS] [varchar](1) NULL,
	[ZXFK] [varchar](200) NULL,
	[CJSJ] [datetime] NULL,
	[CJR] [varchar](50) NULL,
	[WRITER] [varchar](200) NULL,
	[TITLETYPE] [varchar](50) NULL,
	[TITLECOLOR] [varchar](50) NULL,
	[TITLESIZE] [int] NULL,
	[COPYFROM] [varchar](200) NULL,
	[PCDATE] [datetime] NULL,
	[SAVEPATH] [varchar](80) NULL,
	[FILENAME] [varchar](30) NULL,
	[FILEEXNAME] [varchar](20) NULL,
	[SHR] [varchar](10) NULL,
	[SHRQ] [datetime] NULL,
	[QF] [varchar](200) NULL,
	[NGRQ] [datetime] NULL,
	[GLBH] [varchar](50) NULL,
	[TZMB] [varchar](10) NULL,
	[ZBDW] [varchar](50) NULL,
	[FBR] [varchar](50) NULL,
	[NGR] [varchar](50) NULL,
	[NGSJ] [datetime] NULL,
	[CSHGR] [varchar](50) NULL,
	[HGSJ] [datetime] NULL,
	[TGSSG] [varchar](100) NULL,
	[TLDQF] [varchar](100) NULL,
	[QFSJ] [datetime] NULL,
	[TGXXID] [varchar](255) NULL,
	[DXNR] [text] NULL,
	[CSSHZT] [char](1) NULL,
	[CHYJ] [varchar](4000) NULL,
	[TZZT] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'YWBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SWLX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SWLCBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SWZT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'FKYJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'BZ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程定义编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'LCDYBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤定义编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'BZDYBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'BZBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收文标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SWBT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TZNRTEXT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知接收人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TZJSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SFYX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优先级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'YXJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'JSFS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线反馈' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'ZXFK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'CJSJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'CJR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题字体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TITLETYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题字体颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TITLECOLOR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主办单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'COPYFROM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'核稿日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'PCDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'html文件保存目录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SAVEPATH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知公告文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'FILENAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型（后缀名）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'FILEEXNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SHR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'SHRQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'QF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拟稿日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'NGRQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件关联编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'GLBH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知模版' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TZMB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知公告主办单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'ZBDW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'FBR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拟稿人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'NGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拟稿时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'NGSJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知公告处室核稿人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'CSHGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厅公室审稿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TGSSG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厅领导签发' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TLDQF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'QFSJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'DXNR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处室审核状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'CSSHZT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签发意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'CHYJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通知状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'B_OA_ITaskDetail', @level2type=N'COLUMN',@level2name=N'TZZT'
GO
