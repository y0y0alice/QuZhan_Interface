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

Date: 2017-09-29 11:43:54
*/


-- ----------------------------
-- Table structure for B_OA_IReceiveTask
-- ----------------------------
DROP TABLE [dbo].[B_OA_IReceiveTask]
GO
CREATE TABLE [dbo].[B_OA_IReceiveTask] (
[XTBH] varchar(50) NULL ,
[USERID] varchar(50) NULL ,
[YWBH] varchar(50) NULL ,
[SWLX] varchar(50) NULL ,
[SWBT] varchar(1000) NULL ,
[SWLCBH] varchar(50) NULL ,
[SWZT] varchar(2) NULL ,
[FKYJ] varchar(4000) NULL ,
[BZ] varchar(4000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'已被接收任务列表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'已被接收任务列表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'YWBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'YWBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'YWBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'SWLX')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWLX'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWLX'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'SWBT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWBT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWBT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'SWLCBH')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文流程编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWLCBH'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文流程编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWLCBH'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'SWZT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收文状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWZT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收文状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'SWZT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'FKYJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'反馈意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'FKYJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'反馈意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'FKYJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IReceiveTask', 
'COLUMN', N'BZ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'BZ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IReceiveTask'
, @level2type = 'COLUMN', @level2name = N'BZ'
GO
