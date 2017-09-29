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

Date: 2017-09-29 11:44:03
*/


-- ----------------------------
-- Table structure for B_OA_IAttachment
-- ----------------------------
DROP TABLE [dbo].[B_OA_IAttachment]
GO
CREATE TABLE [dbo].[B_OA_IAttachment] (
[WDBH] varchar(50) NULL ,
[APPBH] varchar(255) NULL ,
[WDMC] varchar(255) NULL ,
[WDLX] varchar(255) NULL ,
[WDSX] varchar(255) NULL ,
[WDDX] varchar(255) NULL ,
[WDMS] varchar(1000) NULL ,
[WDZZ] varchar(255) NULL ,
[WDLJ] varchar(1000) NULL DEFAULT '' ,
[WDBT] varchar(1000) NULL ,
[WDHZ] varchar(255) NULL ,
[CJSJ] datetime NULL ,
[CJR] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'WDLX')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文档类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDLX'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文档类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDLX'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'WDSX')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文档属性'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDSX'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文档属性'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDSX'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'WDDX')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文档'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDDX'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文档'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDDX'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'WDLJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文档路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDLJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文档路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDLJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'WDBT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文档标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDBT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文档标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDBT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'WDHZ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文档后缀'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDHZ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文档后缀'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'WDHZ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'CJSJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'CJSJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'CJSJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_IAttachment', 
'COLUMN', N'CJR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'CJR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_IAttachment'
, @level2type = 'COLUMN', @level2name = N'CJR'
GO
