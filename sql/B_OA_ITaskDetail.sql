/*
Navicat SQL Server Data Transfer

Source Server         : local
Source Server Version : 120000
Source Host           : .:1433
Source Database       : LLL
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 120000
File Encoding         : 65001

Date: 2017-09-29 11:43:21
*/


-- ----------------------------
-- Table structure for B_OA_ITaskDetail
-- ----------------------------
DROP TABLE [dbo].[B_OA_ITaskDetail]
GO
CREATE TABLE [dbo].[B_OA_ITaskDetail] (
[USERID] varchar(50) NULL ,
[YWBH] varchar(50) NULL ,
[SWLX] varchar(50) NULL ,
[SWLCBH] varchar(50) NULL ,
[SWZT] varchar(2) NULL ,
[FKYJ] varchar(4000) NULL ,
[BZ] varchar(1000) NULL ,
[LCDYBH] varchar(200) NULL ,
[BZDYBH] varchar(200) NULL ,
[BZBH] varchar(50) NULL ,
[SWBT] varchar(1000) NULL ,
[TZNRTEXT] text NULL ,
[TZNR] text NULL ,
[TZJSR] varchar(4000) NULL ,
[SFYX] char(1) NULL ,
[YXJ] char(1) NULL ,
[JSFS] varchar(1) NULL ,
[ZXFK] varchar(200) NULL ,
[CJSJ] datetime NULL ,
[CJR] varchar(50) NULL ,
[WRITER] varchar(200) NULL ,
[TITLETYPE] varchar(50) NULL ,
[TITLECOLOR] varchar(50) NULL ,
[TITLESIZE] int NULL ,
[COPYFROM] varchar(200) NULL ,
[PCDATE] datetime NULL ,
[SAVEPATH] varchar(80) NULL ,
[FILENAME] varchar(30) NULL ,
[FILEEXNAME] varchar(20) NULL ,
[SHR] varchar(10) NULL ,
[SHRQ] datetime NULL ,
[QF] varchar(200) NULL ,
[NGRQ] datetime NULL ,
[GLBH] varchar(50) NULL ,
[TZMB] varchar(10) NULL ,
[ZBDW] varchar(50) NULL ,
[FBR] varchar(50) NULL ,
[NGR] varchar(50) NULL ,
[NGSJ] datetime NULL ,
[CSHGR] varchar(50) NULL ,
[HGSJ] datetime NULL ,
[TGSSG] varchar(100) NULL ,
[TLDQF] varchar(100) NULL ,
[QFSJ] datetime NULL ,
[TGXXID] varchar(255) NULL ,
[DXNR] text NULL ,
[CSSHZT] char(1) NULL ,
[CHYJ] varchar(4000) NULL ,
[TZZT] char(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'YWBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'YWBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'YWBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SWLX')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWLX'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWLX'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SWLCBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'流程编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWLCBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'流程编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWLCBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SWZT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWZT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWZT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'FKYJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'反馈意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FKYJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'反馈意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FKYJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'BZ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'BZ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'BZ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'LCDYBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'流程定义编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'LCDYBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'流程定义编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'LCDYBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'BZDYBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'步骤定义编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'BZDYBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'步骤定义编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'BZDYBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'BZBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'步骤编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'BZBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'步骤编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'BZBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SWBT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWBT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SWBT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TZNRTEXT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZNRTEXT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZNRTEXT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TZJSR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知接收人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZJSR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知接收人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZJSR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SFYX')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否有效'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SFYX'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否有效'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SFYX'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'YXJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'优先级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'YXJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'优先级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'YXJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'JSFS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'接收方式'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'JSFS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'接收方式'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'JSFS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'ZXFK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'在线反馈'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'ZXFK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在线反馈'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'ZXFK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'CJSJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CJSJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CJSJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'CJR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CJR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CJR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TITLETYPE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标题字体'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TITLETYPE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标题字体'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TITLETYPE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TITLECOLOR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标题字体颜色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TITLECOLOR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标题字体颜色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TITLECOLOR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'COPYFROM')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主办单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'COPYFROM'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主办单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'COPYFROM'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'PCDATE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'核稿日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'PCDATE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'核稿日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'PCDATE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SAVEPATH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'html文件保存目录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SAVEPATH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'html文件保存目录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SAVEPATH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'FILENAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知公告文件名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FILENAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知公告文件名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FILENAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'FILEEXNAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件类型（后缀名）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FILEEXNAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件类型（后缀名）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FILEEXNAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SHR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SHR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SHR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'SHRQ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SHRQ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'SHRQ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'QF')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签发人id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'QF'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签发人id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'QF'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'NGRQ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拟稿日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'NGRQ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拟稿日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'NGRQ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'GLBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附件关联编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'GLBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附件关联编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'GLBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TZMB')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知模版'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZMB'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知模版'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZMB'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'ZBDW')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知公告主办单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'ZBDW'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知公告主办单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'ZBDW'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'FBR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发布人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FBR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发布人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'FBR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'NGR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拟稿人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'NGR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拟稿人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'NGR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'NGSJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拟稿时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'NGSJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拟稿时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'NGSJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'CSHGR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知公告处室核稿人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CSHGR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知公告处室核稿人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CSHGR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TGSSG')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'厅公室审稿'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TGSSG'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'厅公室审稿'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TGSSG'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TLDQF')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'厅领导签发'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TLDQF'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'厅领导签发'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TLDQF'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'QFSJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签发时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'QFSJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签发时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'QFSJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'DXNR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'短信内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'DXNR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'短信内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'DXNR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'CSSHZT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处室审核状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CSSHZT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处室审核状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CSSHZT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'CHYJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'签发意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CHYJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签发意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'CHYJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ITaskDetail', 
'COLUMN', N'TZZT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZZT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ITaskDetail'
, @level2type = 'COLUMN', @level2name = N'TZZT'
GO
