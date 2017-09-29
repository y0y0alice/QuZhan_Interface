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

Date: 2017-09-29 11:43:37
*/


-- ----------------------------
-- Table structure for B_OA_ISuggestion
-- ----------------------------
DROP TABLE [dbo].[B_OA_ISuggestion]
GO
CREATE TABLE [dbo].[B_OA_ISuggestion] (
[TID] varchar(50) NULL ,
[TZBH] varchar(255) NULL ,
[DM] varchar(255) NULL ,
[MC] varchar(255) NULL ,
[FKNR] text NULL ,
[RRQ] datetime NULL ,
[VIP] varchar(255) NULL ,
[ZT] varchar(255) NULL ,
[UID] varchar(255) NULL ,
[RUID] varchar(255) NULL ,
[CJR] varchar(255) NULL ,
[CJSJ] datetime NULL ,
[XGR] varchar(255) NULL ,
[XGSJ] datetime NULL ,
[ORGID] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'MC')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'MC'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'MC'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'FKNR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'反馈内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'FKNR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'反馈内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'FKNR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'ZT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'ZT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'ZT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'CJR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'CJR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'CJR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'CJSJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'CJSJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'CJSJ'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'XGR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'XGR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'XGR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'B_OA_ISuggestion', 
'COLUMN', N'XGSJ')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'XGSJ'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'B_OA_ISuggestion'
, @level2type = 'COLUMN', @level2name = N'XGSJ'
GO
