USE [master]
GO
CREATE DATABASE [notification] ON  PRIMARY 
( NAME = N'notification', FILENAME = N'@dbdatadir\notification.mdf' , SIZE = 2726400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'notification_log', FILENAME = N'@dbdatadir\notification.ldf' , SIZE = 2013440KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [notification] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [notification].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [notification] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [notification] SET ANSI_NULLS OFF
GO
ALTER DATABASE [notification] SET ANSI_PADDING OFF
GO
ALTER DATABASE [notification] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [notification] SET ARITHABORT OFF
GO
ALTER DATABASE [notification] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [notification] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [notification] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [notification] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [notification] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [notification] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [notification] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [notification] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [notification] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [notification] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [notification] SET  DISABLE_BROKER
GO
ALTER DATABASE [notification] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [notification] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [notification] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [notification] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [notification] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [notification] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [notification] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [notification] SET  READ_WRITE
GO
ALTER DATABASE [notification] SET RECOVERY FULL
GO
ALTER DATABASE [notification] SET  MULTI_USER
GO
ALTER DATABASE [notification] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [notification] SET DB_CHAINING OFF
GO
USE [notification]
GO

-- ----------------------------
-- Table structure for sms_inbox
-- ----------------------------
DROP TABLE [sms_inbox]
GO
CREATE TABLE [sms_inbox] (
[objid] nvarchar(50) NOT NULL ,
[state] nvarchar(25) NULL ,
[dtfiled] datetime2(7) NULL ,
[channel] nvarchar(25) NULL ,
[keyword] nvarchar(50) NULL ,
[phoneno] nvarchar(15) NULL ,
[message] nvarchar(160) NULL 
)


GO

-- ----------------------------
-- Records of sms_inbox
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for sms_inbox_pending
-- ----------------------------
DROP TABLE [sms_inbox_pending]
GO
CREATE TABLE [sms_inbox_pending] (
[objid] nvarchar(50) NOT NULL ,
[dtexpiry] datetime2(7) NULL ,
[dtretry] datetime2(7) NULL ,
[retrycount] smallint NULL 
)


GO

-- ----------------------------
-- Records of sms_inbox_pending
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for sms_outbox
-- ----------------------------
DROP TABLE [sms_outbox]
GO
CREATE TABLE [sms_outbox] (
[objid] nvarchar(50) NOT NULL ,
[state] nvarchar(25) NULL ,
[dtfiled] datetime2(7) NULL ,
[refid] nvarchar(50) NULL ,
[phoneno] nvarchar(15) NULL ,
[message] nvarchar(MAX) NULL ,
[creditcount] smallint NULL ,
[remarks] nvarchar(160) NULL ,
[dtsend] datetime2(7) NULL ,
[traceid] nvarchar(50) NULL 
)


GO

-- ----------------------------
-- Records of sms_outbox
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for sys_notification_group
-- ----------------------------
DROP TABLE [sys_notification_group]
GO
CREATE TABLE [sys_notification_group] (
[notificationid] nvarchar(50) NOT NULL ,
[objid] varchar(50) NULL ,
[dtfiled] datetime2(7) NULL ,
[senderid] varchar(50) NULL ,
[groupid] varchar(32) NULL ,
[message] varchar(255) NULL ,
[filetype] varchar(50) NULL ,
[data] nvarchar(MAX) NULL ,
[sender] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of sys_notification_group
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for sys_notification_user
-- ----------------------------
DROP TABLE [sys_notification_user]
GO
CREATE TABLE [sys_notification_user] (
[notificationid] nvarchar(50) NOT NULL ,
[objid] varchar(50) NULL ,
[dtfiled] datetime2(7) NULL ,
[senderid] varchar(50) NULL ,
[recipientid] varchar(50) NULL ,
[message] varchar(255) NULL ,
[filetype] varchar(50) NULL ,
[data] nvarchar(MAX) NULL ,
[sender] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of sys_notification_user
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Indexes structure for table sms_inbox
-- ----------------------------
CREATE INDEX [ix_dtfiled] ON [sms_inbox]
([dtfiled] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_phoneno] ON [sms_inbox]
([phoneno] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Primary Key structure for table sms_inbox
-- ----------------------------
ALTER TABLE [sms_inbox] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sms_inbox_pending
-- ----------------------------
CREATE INDEX [ix_dtexpiry] ON [sms_inbox_pending]
([dtexpiry] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_dtretry] ON [sms_inbox_pending]
([dtretry] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Primary Key structure for table sms_inbox_pending
-- ----------------------------
ALTER TABLE [sms_inbox_pending] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sms_outbox
-- ----------------------------
CREATE INDEX [ix_dtfiled] ON [sms_outbox]
([dtfiled] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_phoneno] ON [sms_outbox]
([phoneno] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_dtsend] ON [sms_outbox]
([dtsend] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_refid] ON [sms_outbox]
([refid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_traceid] ON [sms_outbox]
([traceid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Primary Key structure for table sms_outbox
-- ----------------------------
ALTER TABLE [sms_outbox] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_notification_group
-- ----------------------------
CREATE INDEX [ix_dtfiled] ON [sys_notification_group]
([dtfiled] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_groupid] ON [sys_notification_group]
([groupid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_senderid] ON [sys_notification_group]
([senderid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_objid] ON [sys_notification_group]
([objid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Primary Key structure for table sys_notification_group
-- ----------------------------
ALTER TABLE [sys_notification_group] ADD PRIMARY KEY ([notificationid])
GO

-- ----------------------------
-- Indexes structure for table sys_notification_user
-- ----------------------------
CREATE INDEX [ix_dtfiled] ON [sys_notification_user]
([dtfiled] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_recipientid] ON [sys_notification_user]
([recipientid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_senderid] ON [sys_notification_user]
([senderid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ix_objid] ON [sys_notification_user]
([objid] ASC) 
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Primary Key structure for table sys_notification_user
-- ----------------------------
ALTER TABLE [sys_notification_user] ADD PRIMARY KEY ([notificationid])
GO
