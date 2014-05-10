USE [master]
GO
CREATE DATABASE [@dbname] ON  PRIMARY 
( NAME = N'@dbname', FILENAME = N'@dbdatadir\@dbname.mdf' , SIZE = 2726400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'@dbname_log', FILENAME = N'@dbdatadir\@dbname.ldf' , SIZE = 2013440KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [@dbname] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [@dbname].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [@dbname] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [@dbname] SET ANSI_NULLS OFF
GO
ALTER DATABASE [@dbname] SET ANSI_PADDING OFF
GO
ALTER DATABASE [@dbname] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [@dbname] SET ARITHABORT OFF
GO
ALTER DATABASE [@dbname] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [@dbname] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [@dbname] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [@dbname] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [@dbname] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [@dbname] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [@dbname] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [@dbname] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [@dbname] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [@dbname] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [@dbname] SET  DISABLE_BROKER
GO
ALTER DATABASE [@dbname] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [@dbname] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [@dbname] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [@dbname] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [@dbname] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [@dbname] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [@dbname] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [@dbname] SET  READ_WRITE
GO
ALTER DATABASE [@dbname] SET RECOVERY FULL
GO
ALTER DATABASE [@dbname] SET  MULTI_USER
GO
ALTER DATABASE [@dbname] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [@dbname] SET DB_CHAINING OFF
GO
USE [@dbname]
GO



-- ----------------------------
-- Table structure for account
-- ----------------------------
CREATE TABLE [account] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[state] varchar(10) NULL ,
[chartid] varchar(50) NULL ,
[code] varchar(50) NULL ,
[title] varchar(255) NULL ,
[type] varchar(20) NULL ,
[acctgroup] varchar(50) NULL ,
[target] numeric(12,2) NULL 
)


GO

-- ----------------------------
-- Table structure for account_incometarget
-- ----------------------------
CREATE TABLE [account_incometarget] (
[objid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[target] decimal(18,2) NULL 
)


GO

-- ----------------------------
-- Table structure for afserial
-- ----------------------------
CREATE TABLE [afserial] (
[objid] varchar(50) NOT NULL ,
[serieslength] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for afserial_control
-- ----------------------------
CREATE TABLE [afserial_control] (
[controlid] varchar(50) NOT NULL ,
[txnmode] varchar(10) NULL ,
[assignee_objid] varchar(50) NULL ,
[assignee_name] varchar(50) NULL ,
[currentseries] int NULL ,
[qtyissued] int NULL ,
[active] int NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for afserial_inventory
-- ----------------------------
CREATE TABLE [afserial_inventory] (
[objid] varchar(50) NOT NULL ,
[afid] varchar(50) NULL ,
[respcenter_objid] varchar(50) NULL ,
[respcenter_name] varchar(50) NULL ,
[respcenter_type] varchar(25) NULL ,
[startseries] int NULL ,
[endseries] int NULL ,
[currentseries] int NULL ,
[startstub] int NULL ,
[endstub] int NULL ,
[currentstub] int NULL ,
[prefix] varchar(10) NULL ,
[suffix] varchar(10) NULL ,
[unit] varchar(10) NULL ,
[qtyin] int NULL ,
[qtyout] int NULL ,
[qtycancelled] int NULL ,
[qtybalance] int NULL ,
[currentlineno] int NULL ,
[cost] decimal(10,2) NULL 
)


GO

-- ----------------------------
-- Table structure for afserial_inventory_detail
-- ----------------------------
CREATE TABLE [afserial_inventory_detail] (
[objid] varchar(50) NOT NULL ,
[controlid] varchar(50) NULL ,
[lineno] int NULL ,
[refid] varchar(50) NULL ,
[refno] varchar(50) NULL ,
[reftype] varchar(50) NULL ,
[refdate] datetime NULL ,
[txndate] datetime NULL ,
[txntype] varchar(25) NULL ,
[receivedstartseries] int NULL ,
[receivedendseries] int NULL ,
[beginstartseries] int NULL ,
[beginendseries] int NULL ,
[issuedstartseries] int NULL ,
[issuedendseries] int NULL ,
[endingstartseries] int NULL ,
[endingendseries] int NULL ,
[cancelledstartseries] int NULL ,
[cancelledendseries] int NULL ,
[qtyreceived] int NULL ,
[qtybegin] int NULL ,
[qtyissued] int NULL ,
[qtyending] int NULL ,
[qtycancelled] int NULL ,
[remarks] varchar(255) NULL ,
[cost] decimal(10,2) NULL 
)


GO

-- ----------------------------
-- Table structure for afserial_inventory_detail_cancelseries
-- ----------------------------
CREATE TABLE [afserial_inventory_detail_cancelseries] (
[objid] varchar(50) NOT NULL ,
[series] int NOT NULL ,
[controlid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for afserialcapture
-- ----------------------------
CREATE TABLE [afserialcapture] (
[controlid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for afstockcontrol
-- ----------------------------
CREATE TABLE [afstockcontrol] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL ,
[af] varchar(10) NULL ,
[refid] varchar(50) NULL ,
[reftype] varchar(25) NULL ,
[refdate] datetime NULL ,
[startstub] int NULL ,
[endstub] int NULL ,
[currentstub] int NULL ,
[startseries] int NULL ,
[endseries] int NULL ,
[currentseries] int NULL ,
[prefix] varchar(50) NULL ,
[suffix] varchar(50) NULL ,
[qtyreceived] int NULL ,
[qtyissued] int NULL ,
[qtybalance] int NULL ,
[qtycancelled] int NULL ,
[currentindexno] int NULL ,
[unit] varchar(10) NULL 
)


GO

-- ----------------------------
-- Table structure for ap
-- ----------------------------
CREATE TABLE [ap] (
[objid] varchar(50) NOT NULL ,
[subacctid] varchar(50) NULL DEFAULT NULL ,
[subacctclass] varchar(50) NULL DEFAULT NULL ,
[subaccttitle] varchar(50) NULL DEFAULT NULL ,
[sltype] varchar(10) NULL DEFAULT NULL ,
[totaldr] decimal(10,2) NULL DEFAULT NULL ,
[totalcr] decimal(10,2) NULL DEFAULT NULL ,
[balance] decimal(10,2) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for ap_detail
-- ----------------------------
CREATE TABLE [ap_detail] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[txnrefid] varchar(50) NULL DEFAULT NULL ,
[txnrefno] varchar(50) NULL DEFAULT NULL ,
[txnreftype] varchar(50) NULL DEFAULT NULL ,
[particulars] varchar(255) NULL DEFAULT NULL ,
[dr] decimal(16,2) NULL DEFAULT NULL ,
[cr] decimal(16,2) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for ar
-- ----------------------------
CREATE TABLE [ar] (
[objid] varchar(50) NOT NULL ,
[subacctid] varchar(50) NULL DEFAULT NULL ,
[subacctclass] varchar(50) NULL DEFAULT NULL ,
[subaccttitle] varchar(50) NULL DEFAULT NULL ,
[sltype] varchar(10) NULL DEFAULT NULL ,
[totaldr] decimal(10,2) NULL DEFAULT NULL ,
[totalcr] decimal(10,2) NULL DEFAULT NULL ,
[balance] decimal(10,2) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for ar_detail
-- ----------------------------
CREATE TABLE [ar_detail] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[txnrefid] varchar(50) NULL DEFAULT NULL ,
[txnrefno] varchar(50) NULL DEFAULT NULL ,
[txnreftype] varchar(50) NULL DEFAULT NULL ,
[particulars] varchar(255) NULL DEFAULT NULL ,
[dr] decimal(16,2) NULL DEFAULT NULL ,
[cr] decimal(16,2) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for assessmentnotice
-- ----------------------------
CREATE TABLE [assessmentnotice] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[txnno] varchar(10) NULL DEFAULT NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[taxpayerid] varchar(50) NOT NULL ,
[taxpayername] varchar(800) NOT NULL ,
[taxpayeraddress] varchar(150) NOT NULL ,
[createdbyid] varchar(50) NULL DEFAULT NULL ,
[createdbyname] varchar(100) NOT NULL ,
[createdbytitle] varchar(50) NOT NULL ,
[approvedbyid] varchar(50) NULL DEFAULT NULL ,
[approvedbyname] varchar(100) NULL DEFAULT NULL ,
[approvedbytitle] varchar(50) NULL DEFAULT NULL ,
[dtdelivered] datetime NULL DEFAULT NULL ,
[receivedby] varchar(150) NULL DEFAULT NULL ,
[remarks] varchar(500) NULL DEFAULT NULL ,
[assessmentyear] int NULL 
)


GO

-- ----------------------------
-- Table structure for assessmentnoticeitem
-- ----------------------------
CREATE TABLE [assessmentnoticeitem] (
[objid] varchar(50) NOT NULL ,
[assessmentnoticeid] varchar(50) NOT NULL ,
[faasid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bank
-- ----------------------------
CREATE TABLE [bank] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL ,
[code] varchar(50) NOT NULL ,
[name] varchar(100) NOT NULL ,
[branchname] varchar(50) NOT NULL ,
[address] varchar(255) NULL ,
[manager] varchar(50) NULL ,
[deposittype] varchar(50) NULL ,
[depository] int NULL 
)


GO

-- ----------------------------
-- Table structure for bankaccount
-- ----------------------------
CREATE TABLE [bankaccount] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(50) NOT NULL ,
[title] varchar(100) NOT NULL ,
[description] varchar(255) NULL ,
[accttype] varchar(50) NOT NULL ,
[bank_objid] varchar(50) NOT NULL ,
[bank_code] varchar(50) NOT NULL ,
[bank_name] varchar(100) NOT NULL ,
[fund_objid] varchar(50) NOT NULL ,
[fund_code] varchar(50) NOT NULL ,
[fund_title] varchar(50) NOT NULL ,
[currency] varchar(10) NOT NULL ,
[cashreport] varchar(50) NULL ,
[cashbreakdownreport] varchar(50) NULL ,
[checkreport] varchar(50) NULL ,
[forwardbalance] decimal(16,2) NULL ,
[beginbalance] decimal(16,2) NULL ,
[totaldr] decimal(16,2) NULL ,
[totalcr] decimal(16,2) NULL ,
[endbalance] decimal(16,2) NULL ,
[currentlineno] int NULL ,
[checkbreakdownreport] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bankaccount_account
-- ----------------------------
CREATE TABLE [bankaccount_account] (
[objid] varchar(50) NOT NULL ,
[acctid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bankaccount_entry
-- ----------------------------
CREATE TABLE [bankaccount_entry] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[txndate] datetime NULL ,
[refdate] datetime NULL ,
[refid] varchar(50) NULL ,
[refno] varchar(50) NULL ,
[reftype] varchar(50) NULL ,
[particulars] varchar(255) NULL ,
[dr] decimal(16,2) NULL ,
[cr] decimal(16,2) NULL ,
[runbalance] decimal(16,2) NULL ,
[lineno] int NULL ,
[postingrefid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bankdeposit
-- ----------------------------
CREATE TABLE [bankdeposit] (
[objid] varchar(50) NOT NULL ,
[txnno] varchar(50) NULL ,
[dtposted] datetime NULL ,
[cashier_objid] varchar(50) NULL ,
[cashier_name] varchar(100) NULL ,
[cashier_title] varchar(50) NULL ,
[totalcash] decimal(16,2) NULL ,
[totalnoncash] decimal(16,2) NULL ,
[amount] decimal(16,2) NULL 
)


GO

-- ----------------------------
-- Table structure for bankdeposit_entry
-- ----------------------------
CREATE TABLE [bankdeposit_entry] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL ,
[bankaccount_objid] varchar(50) NOT NULL ,
[bankaccount_code] varchar(50) NOT NULL ,
[bankaccount_title] varchar(255) NOT NULL ,
[totalcash] decimal(16,2) NOT NULL ,
[totalnoncash] decimal(16,2) NOT NULL ,
[amount] decimal(16,2) NOT NULL ,
[cashbreakdown] varchar(600) NOT NULL ,
[summaries] text NULL 
)


GO

-- ----------------------------
-- Table structure for bankdeposit_entry_check
-- ----------------------------
CREATE TABLE [bankdeposit_entry_check] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bankdeposit_liquidation
-- ----------------------------
CREATE TABLE [bankdeposit_liquidation] (
[objid] varchar(50) NOT NULL ,
[bankdepositid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for barangay
-- ----------------------------
CREATE TABLE [barangay] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL DEFAULT NULL ,
[indexno] varchar(15) NULL DEFAULT NULL ,
[pin] varchar(15) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[captain_name] varchar(100) NULL DEFAULT NULL ,
[captain_title] varchar(50) NULL DEFAULT NULL ,
[captain_office] varchar(50) NULL DEFAULT NULL ,
[treasurer_name] varchar(100) NULL DEFAULT NULL ,
[treasurer_title] varchar(50) NULL DEFAULT NULL ,
[treasurer_office] varchar(50) NULL DEFAULT NULL ,
[oldindexno] varchar(15) NULL ,
[oldpin] varchar(15) NULL ,
[fullname] varchar(250) NULL ,
[address] varchar(250) NULL 
)


GO

-- ----------------------------
-- Table structure for batchcapture_collection
-- ----------------------------
CREATE TABLE [batchcapture_collection] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[state] varchar(20) NOT NULL ,
[txndate] datetime NOT NULL ,
[defaultreceiptdate] datetime NOT NULL ,
[txnmode] varchar(10) NOT NULL ,
[stub] int NOT NULL ,
[formno] varchar(50) NOT NULL ,
[formtype] varchar(10) NOT NULL ,
[controlid] varchar(50) NOT NULL ,
[serieslength] int NOT NULL ,
[prefix] varchar(10) NULL ,
[suffix] varchar(10) NULL ,
[startseries] int NOT NULL ,
[endseries] int NOT NULL ,
[totalamount] decimal(16,2) NOT NULL ,
[totalcash] decimal(16,2) NOT NULL ,
[totalnoncash] decimal(16,2) NOT NULL ,
[collectiontype_objid] varchar(50) NULL ,
[collectiontype_name] varchar(100) NULL ,
[collector_objid] varchar(50) NULL ,
[collector_name] varchar(100) NULL ,
[collector_title] varchar(50) NULL ,
[capturedby_objid] varchar(50) NULL ,
[capturedby_name] varchar(100) NULL ,
[capturedby_title] varchar(50) NULL ,
[org_objid] varchar(50) NOT NULL ,
[org_name] varchar(50) NOT NULL ,
[postedby_objid] varchar(50) NULL ,
[postedby_name] varchar(100) NULL ,
[postedby_date] datetime NULL 
)


GO

-- ----------------------------
-- Table structure for batchcapture_collection_entry
-- ----------------------------
CREATE TABLE [batchcapture_collection_entry] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[receiptno] varchar(50) NOT NULL ,
[receiptdate] datetime NOT NULL ,
[paidby] varchar(100) NOT NULL ,
[paidbyaddress] varchar(255) NOT NULL ,
[amount] decimal(16,2) NOT NULL ,
[totalcash] decimal(16,2) NOT NULL ,
[totalnoncash] decimal(16,2) NOT NULL ,
[series] int NOT NULL ,
[collectiontype_objid] varchar(50) NULL ,
[collectiontype_name] varchar(100) NULL ,
[remarks] varchar(255) NULL ,
[particulars] text NULL ,
[voided] int NULL ,
[paymentitems] text NULL 
)


GO

-- ----------------------------
-- Table structure for batchcapture_collection_entry_item
-- ----------------------------
CREATE TABLE [batchcapture_collection_entry_item] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[item_objid] varchar(50) NULL DEFAULT NULL ,
[item_code] varchar(50) NULL DEFAULT NULL ,
[item_title] varchar(50) NULL DEFAULT NULL ,
[fund_objid] varchar(50) NULL DEFAULT NULL ,
[fund_code] varchar(50) NULL DEFAULT NULL ,
[fund_title] varchar(50) NULL DEFAULT NULL ,
[amount] decimal(16,2) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for batchgrerror
-- ----------------------------
CREATE TABLE [batchgrerror] (
[faasid] varchar(50) NOT NULL ,
[ry] int NOT NULL ,
[msg] text NULL 
)


GO

-- ----------------------------
-- Table structure for bldgadditionalitem
-- ----------------------------
CREATE TABLE [bldgadditionalitem] (
[objid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(100) NOT NULL ,
[unit] varchar(25) NOT NULL ,
[expr] varchar(100) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgassesslevel
-- ----------------------------
CREATE TABLE [bldgassesslevel] (
[objid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(50) NOT NULL ,
[fixrate] int NOT NULL ,
[rate] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgassesslevelrange
-- ----------------------------
CREATE TABLE [bldgassesslevelrange] (
[objid] varchar(50) NOT NULL ,
[bldgassesslevelid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[mvfrom] numeric(16,2) NOT NULL ,
[mvto] numeric(16,2) NOT NULL ,
[rate] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgfloor
-- ----------------------------
CREATE TABLE [bldgfloor] (
[objid] varchar(50) NOT NULL ,
[bldguseid] varchar(50) NOT NULL ,
[bldgrpuid] varchar(50) NOT NULL ,
[floorno] varchar(5) NOT NULL ,
[area] numeric(16,2) NOT NULL ,
[storeyrate] numeric(16,2) NOT NULL ,
[basevalue] numeric(16,2) NOT NULL ,
[unitvalue] numeric(16,2) NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[adjustment] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgflooradditional
-- ----------------------------
CREATE TABLE [bldgflooradditional] (
[objid] varchar(50) NOT NULL ,
[bldgfloorid] varchar(50) NOT NULL ,
[bldgrpuid] varchar(50) NOT NULL ,
[additionalitem_objid] varchar(50) NOT NULL ,
[amount] numeric(16,2) NOT NULL ,
[expr] varchar(300) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgflooradditionalparam
-- ----------------------------
CREATE TABLE [bldgflooradditionalparam] (
[objid] varchar(50) NOT NULL ,
[bldgflooradditionalid] varchar(50) NOT NULL ,
[bldgrpuid] varchar(50) NOT NULL ,
[param_objid] varchar(50) NOT NULL ,
[intvalue] int NULL DEFAULT NULL ,
[decimalvalue] numeric(16,2) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgkind
-- ----------------------------
CREATE TABLE [bldgkind] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgkindbucc
-- ----------------------------
CREATE TABLE [bldgkindbucc] (
[objid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[bldgtypeid] varchar(50) NOT NULL ,
[bldgkind_objid] varchar(50) NOT NULL ,
[basevaluetype] varchar(25) NOT NULL ,
[basevalue] numeric(10,2) NOT NULL ,
[minbasevalue] numeric(10,2) NOT NULL ,
[maxbasevalue] numeric(10,2) NOT NULL ,
[gapvalue] int NOT NULL ,
[minarea] numeric(10,2) NOT NULL ,
[maxarea] numeric(10,2) NOT NULL ,
[bldgclass] varchar(50) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgrpu
-- ----------------------------
CREATE TABLE [bldgrpu] (
[objid] varchar(50) NOT NULL ,
[landrpuid] varchar(50) NULL ,
[houseno] varchar(25) NULL DEFAULT NULL ,
[psic] varchar(20) NULL DEFAULT NULL ,
[permitno] varchar(20) NULL DEFAULT NULL ,
[permitdate] datetime NULL DEFAULT NULL ,
[permitissuedby] varchar(50) NULL DEFAULT NULL ,
[bldgtype_objid] varchar(50) NULL ,
[bldgkindbucc_objid] varchar(50) NULL ,
[basevalue] numeric(16,2) NOT NULL ,
[dtcompleted] datetime NULL DEFAULT NULL ,
[dtoccupied] datetime NULL DEFAULT NULL ,
[floorcount] int NOT NULL ,
[depreciation] numeric(16,2) NOT NULL ,
[depreciationvalue] numeric(16,2) NOT NULL ,
[totaladjustment] numeric(16,2) NOT NULL ,
[additionalinfo] varchar(500) NULL DEFAULT NULL ,
[bldgage] int NOT NULL ,
[percentcompleted] int NOT NULL ,
[bldgassesslevel_objid] varchar(50) NULL DEFAULT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[condominium] int NOT NULL ,
[bldgclass] varchar(15) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgrysetting
-- ----------------------------
CREATE TABLE [bldgrysetting] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[ry] int NOT NULL ,
[predominant] int NOT NULL ,
[depreciatecoreanditemseparately] int NOT NULL ,
[computedepreciationbasedonschedule] int NOT NULL ,
[straightdepreciation] varchar(50) NOT NULL ,
[calcbldgagebasedondtoccupied] int NOT NULL ,
[appliedto] text NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgstructure
-- ----------------------------
CREATE TABLE [bldgstructure] (
[objid] varchar(50) NOT NULL ,
[bldgrpuid] varchar(50) NOT NULL ,
[structure_objid] varchar(50) NOT NULL ,
[material_objid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bldgtype
-- ----------------------------
CREATE TABLE [bldgtype] (
[objid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(50) NOT NULL ,
[basevaluetype] varchar(10) NOT NULL ,
[residualrate] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgtype_depreciation
-- ----------------------------
CREATE TABLE [bldgtype_depreciation] (
[objid] varchar(50) NOT NULL ,
[bldgtypeid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[agefrom] int NOT NULL ,
[ageto] int NOT NULL ,
[rate] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bldgtype_storeyadjustment
-- ----------------------------
CREATE TABLE [bldgtype_storeyadjustment] (
[objid] varchar(50) NOT NULL ,
[bldgtypeid] varchar(50) NOT NULL ,
[bldgrysettingid] varchar(50) NOT NULL ,
[floorno] varchar(10) NOT NULL ,
[rate] numeric(16,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for bldguse
-- ----------------------------
CREATE TABLE [bldguse] (
[objid] varchar(50) NOT NULL ,
[bldgrpuid] varchar(50) NOT NULL ,
[actualuse_objid] varchar(50) NOT NULL ,
[basevalue] numeric(16,2) NOT NULL ,
[area] numeric(16,2) NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[depreciationvalue] numeric(16,2) NOT NULL ,
[adjustment] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for bpapplication
-- ----------------------------
CREATE TABLE [bpapplication] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NULL ,
[appno] varchar(50) NULL ,
[apptype] varchar(25) NULL ,
[amendtype] varchar(50) NULL ,
[dtfiled] date NULL ,
[txndate] datetime NULL ,
[tradename] varchar(255) NULL ,
[owner_objid] varchar(50) NULL ,
[owner_name] varchar(255) NULL ,
[owner_address] varchar(255) NULL ,
[businessaddress] varchar(255) NULL ,
[barangay_objid] varchar(50) NULL ,
[barangay_name] varchar(50) NULL ,
[orgtype] varchar(50) NULL ,
[yearstarted] int NULL ,
[appyear] int NULL ,
[txnmode] varchar(25) NULL ,
[businessid] varchar(50) NULL ,
[businessname] varchar(255) NULL ,
[appinfos] text NULL ,
[assessmentinfos] text NULL ,
[lobs] text NULL ,
[requirements] text NULL ,
[taxfees] text NULL ,
[assessedby_objid] varchar(50) NULL ,
[assessedby_name] varchar(255) NULL ,
[createdby_objid] varchar(50) NULL ,
[createdby_name] varchar(255) NULL ,
[approvedby_objid] varchar(50) NULL ,
[approvedby_name] varchar(255) NULL ,
[dtreleased] datetime NULL ,
[task_objid] varchar(50) NULL ,
[totals_tax] decimal(18,2) NULL ,
[totals_regfee] decimal(18,2) NULL ,
[totals_othercharge] decimal(18,2) NULL ,
[totals_total] decimal(18,2) NULL ,
[remarks] varchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for bpapplication_requirement
-- ----------------------------
CREATE TABLE [bpapplication_requirement] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[applicationid] varchar(50) NULL ,
[refid] varchar(50) NULL ,
[reftype] varchar(50) NULL ,
[refno] varchar(50) NULL ,
[issuedby] varchar(100) NULL ,
[placeissued] varchar(100) NULL ,
[title] varchar(50) NULL ,
[remarks] varchar(255) NULL ,
[status] varchar(25) NULL ,
[step] varchar(50) NULL ,
[completedby_objid] varchar(50) NULL ,
[completedby_name] varchar(50) NULL ,
[dtcompleted] datetime NULL 
)


GO

-- ----------------------------
-- Table structure for bpapplication_task
-- ----------------------------
CREATE TABLE [bpapplication_task] (
[objid] varchar(50) NOT NULL ,
[applicationid] varchar(50) NULL ,
[parentid] varchar(50) NULL ,
[channel] varchar(50) NULL ,
[state] varchar(50) NULL ,
[assignee_objid] varchar(50) NULL ,
[assignee_name] varchar(255) NULL ,
[message] varchar(255) NULL ,
[startdate] datetime NULL ,
[enddate] datetime NULL ,
[sender_objid] varchar(50) NULL ,
[sender_name] varchar(255) NULL ,
[action] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bpexpirydate
-- ----------------------------
CREATE TABLE [bpexpirydate] (
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[expirydate] date NULL ,
[reason] varchar(500) NULL 
)


GO

-- ----------------------------
-- Table structure for bppayment
-- ----------------------------
CREATE TABLE [bppayment] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[applicationid] varchar(50) NULL ,
[refno] varchar(50) NULL ,
[refdate] date NULL ,
[amount] decimal(18,2) NULL ,
[remarks] varchar(255) NULL ,
[voided] int NULL ,
[payoption] varchar(50) NULL ,
[qtr] int NULL ,
[reftype] varchar(50) NULL ,
[refid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bppayment_item
-- ----------------------------
CREATE TABLE [bppayment_item] (
[objid] varchar(50) NOT NULL ,
[receivableid] varchar(50) NULL ,
[businessid] varchar(50) NULL ,
[paymentid] varchar(50) NULL ,
[iqtr] int NULL ,
[amtpaid] decimal(16,2) NULL ,
[surchargepaid] decimal(16,2) NULL ,
[interestpaid] decimal(16,2) NULL ,
[discount] decimal(16,2) NULL ,
[iyear] int NULL ,
[voided] int NULL ,
[account_objid] varchar(50) NULL ,
[account_code] varchar(50) NULL ,
[account_title] varchar(100) NULL ,
[lob_objid] varchar(50) NULL ,
[lob_name] varchar(255) NULL ,
[cashreceiptitemid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for bpreceivable
-- ----------------------------
CREATE TABLE [bpreceivable] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[applicationid] varchar(50) NULL ,
[iyear] int NULL ,
[iqtr] int NULL ,
[account_objid] varchar(50) NULL ,
[account_title] varchar(100) NULL ,
[lob_objid] varchar(50) NULL ,
[lob_name] varchar(100) NULL ,
[lob_assessmenttype] varchar(50) NULL ,
[amount] decimal(16,2) NOT NULL ,
[amtpaid] decimal(16,2) NOT NULL ,
[discount] decimal(16,2) NOT NULL ,
[refid] varchar(50) NULL ,
[reftype] varchar(50) NULL ,
[remarks] varchar(255) NULL ,
[department] varchar(50) NULL ,
[taxfeetype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for brgy_taxaccount_mapping
-- ----------------------------
CREATE TABLE [brgy_taxaccount_mapping] (
[barangayid] varchar(50) NOT NULL ,
[advacct_objid] varchar(50) NULL ,
[advintacct_objid] varchar(50) NULL ,
[prevacct_objid] varchar(50) NULL ,
[previntacct_objid] varchar(50) NULL ,
[prioracct_objid] varchar(50) NULL ,
[priorintacct_objid] varchar(50) NULL ,
[curracct_objid] varchar(50) NULL ,
[currintacct_objid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for brgyshare
-- ----------------------------
CREATE TABLE [brgyshare] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[txnno] varchar(15) NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[year] int NULL DEFAULT NULL ,
[month] int NULL DEFAULT NULL ,
[totalshare] numeric(16,2) NOT NULL ,
[createdbyid] varchar(50) NULL DEFAULT NULL ,
[createdby] varchar(150) NOT NULL ,
[createdbytitle] varchar(50) NOT NULL ,
[postedbyid] varchar(50) NULL DEFAULT NULL ,
[postedby] varchar(150) NULL DEFAULT NULL ,
[postedbytitle] varchar(50) NULL DEFAULT NULL ,
[sharetype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for brgyshareitem
-- ----------------------------
CREATE TABLE [brgyshareitem] (
[objid] varchar(50) NOT NULL ,
[brgyshareid] varchar(50) NOT NULL ,
[barangayid] varchar(50) NOT NULL ,
[basic] numeric(16,2) NOT NULL ,
[basicint] numeric(16,2) NOT NULL ,
[basicdisc] numeric(16,2) NOT NULL ,
[basicshare] numeric(16,2) NOT NULL ,
[basicintshare] numeric(16,2) NOT NULL ,
[commonshare] numeric(16,2) NULL ,
[basiccurrent] numeric(16,2) NULL ,
[basicprevious] numeric(16,2) NULL ,
[basiccollection] numeric(16,2) NULL ,
[basicintcollection] numeric(16,2) NULL 
)


GO

-- ----------------------------
-- Table structure for business
-- ----------------------------
CREATE TABLE [business] (
[objid] varchar(50) NOT NULL ,
[apptype] varchar(50) NULL ,
[state] varchar(15) NOT NULL ,
[owner_name] varchar(255) NOT NULL ,
[owner_objid] varchar(50) NOT NULL ,
[owner_address] varchar(255) NULL ,
[barangay_objid] varchar(50) NULL ,
[barangay_name] varchar(50) NULL ,
[businessname] varchar(255) NULL ,
[tradename] varchar(255) NOT NULL ,
[businessaddress] varchar(255) NULL ,
[orgtype] varchar(50) NULL ,
[yearstarted] int NULL ,
[activeyear] int NULL ,
[pin] varchar(50) NULL ,
[taxcredit] decimal(18,2) NULL ,
[currentapplicationid] varchar(50) NULL ,
[currentpermitid] varchar(50) NULL ,
[bin] varchar(50) NULL ,
[qtrpaid] int NULL ,
[appcount] int NULL 
)


GO

-- ----------------------------
-- Table structure for business_assessment_info
-- ----------------------------
CREATE TABLE [business_assessment_info] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NOT NULL ,
[attribute_objid] varchar(50) NULL ,
[attribute_name] varchar(50) NULL ,
[lob_objid] varchar(50) NULL ,
[lob_name] varchar(100) NULL ,
[decimalvalue] decimal(16,2) NULL ,
[intvalue] int NULL ,
[stringvalue] varchar(255) NULL ,
[boolvalue] int NULL ,
[phase] int NULL ,
[level] int NULL 
)


GO

-- ----------------------------
-- Table structure for business_changeinfo
-- ----------------------------
CREATE TABLE [business_changeinfo] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[dtfiled] datetime NULL ,
[filedby_objid] varchar(50) NULL ,
[filedby_name] varchar(100) NULL ,
[owner_name] varchar(100) NULL ,
[owner_objid] varchar(50) NULL ,
[owner_address] varchar(255) NULL ,
[barangay_objid] varchar(50) NULL ,
[barangay_name] varchar(50) NULL ,
[tradename] varchar(255) NULL ,
[businessaddress] varchar(255) NULL ,
[orgtype] varchar(50) NULL ,
[businessname] varchar(255) NULL ,
[pin] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for business_cityengineer
-- ----------------------------
CREATE TABLE [business_cityengineer] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[state] varchar(25) NULL 
)


GO

-- ----------------------------
-- Table structure for business_cityengineer_fee
-- ----------------------------
CREATE TABLE [business_cityengineer_fee] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NOT NULL ,
[state] varchar(50) NULL ,
[account_objid] varchar(50) NOT NULL ,
[account_title] varchar(255) NULL ,
[amount] decimal(18,2) NULL ,
[recurring] int NULL ,
[user_objid] varchar(50) NULL ,
[user_name] varchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for business_info
-- ----------------------------
CREATE TABLE [business_info] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NOT NULL ,
[attribute_objid] varchar(50) NULL ,
[attribute_name] varchar(50) NULL ,
[decimalvalue] decimal(16,2) NULL ,
[intvalue] int NULL ,
[stringvalue] varchar(255) NULL ,
[boolvalue] int NULL ,
[phase] int NULL ,
[level] int NULL 
)


GO

-- ----------------------------
-- Table structure for business_lob
-- ----------------------------
CREATE TABLE [business_lob] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[lobid] varchar(50) NULL ,
[name] varchar(100) NULL ,
[assessmenttype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for business_taxcredit
-- ----------------------------
CREATE TABLE [business_taxcredit] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[totaldr] decimal(18,2) NULL ,
[totalcr] decimal(18,2) NULL ,
[balance] decimal(18,2) NULL ,
[currentlineno] int NULL 
)


GO

-- ----------------------------
-- Table structure for business_taxcredit_detail
-- ----------------------------
CREATE TABLE [business_taxcredit_detail] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[lineno] int NULL ,
[particulars] varchar(100) NULL ,
[refid] varchar(50) NULL ,
[refdate] date NULL ,
[refno] varchar(50) NULL ,
[reftype] varchar(20) NULL ,
[dr] decimal(18,2) NULL ,
[cr] decimal(18,2) NULL 
)


GO

-- ----------------------------
-- Table structure for businesspermit
-- ----------------------------
CREATE TABLE [businesspermit] (
[objid] varchar(50) NOT NULL ,
[state] varchar(20) NULL ,
[permitno] varchar(20) NULL ,
[activeyear] int NULL ,
[version] int NULL ,
[permittype] varchar(20) NULL ,
[apptype] varchar(50) NULL ,
[bin] varchar(50) NULL ,
[pin] varchar(50) NULL ,
[ownername] varchar(255) NULL ,
[tradename] varchar(255) NULL ,
[businessaddress] varchar(255) NULL ,
[businessid] varchar(50) NULL ,
[applicationid] varchar(50) NULL ,
[dtissued] date NULL ,
[issuedby_objid] varchar(50) NULL ,
[issuedby_name] varchar(255) NULL ,
[expirydate] date NULL ,
[remarks] varchar(255) NULL ,
[lobs] text NULL ,
[payments] text NULL ,
[appinfos] text NULL ,
[assessmentinfos] text NULL ,
[owneraddress] varchar(255) NULL ,
[businessname] varchar(255) NULL ,
[orgtype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for businessrequirement
-- ----------------------------
CREATE TABLE [businessrequirement] (
[objid] varchar(50) NOT NULL ,
[code] varchar(50) NULL ,
[title] varchar(255) NULL ,
[type] varchar(50) NULL ,
[department] varchar(50) NULL ,
[account_objid] varchar(50) NULL ,
[account_code] varchar(50) NULL ,
[account_title] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for businessvariable
-- ----------------------------
CREATE TABLE [businessvariable] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[name] varchar(50) NOT NULL ,
[datatype] varchar(20) NOT NULL ,
[caption] varchar(50) NOT NULL ,
[description] varchar(100) NULL ,
[arrayvalues] text NULL ,
[system] int NULL ,
[sortorder] int NULL ,
[category] varchar(100) NULL ,
[handler] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cancelannotation
-- ----------------------------
CREATE TABLE [cancelannotation] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[txnno] varchar(10) NULL DEFAULT NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[annotationid] varchar(50) NOT NULL ,
[fileno] varchar(20) NOT NULL ,
[remarks] varchar(500) NOT NULL ,
[orno] varchar(10) NULL DEFAULT NULL ,
[ordate] datetime NULL DEFAULT NULL ,
[oramount] numeric(16,2) NOT NULL ,
[signedby] varchar(150) NOT NULL ,
[signedbytitle] varchar(50) NOT NULL ,
[dtsigned] datetime NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for cancelledfaas
-- ----------------------------
CREATE TABLE [cancelledfaas] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[txndate] datetime NOT NULL ,
[faasid] varchar(50) NOT NULL ,
[reason_objid] varchar(50) NOT NULL ,
[remarks] varchar(500) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for canceltdreason
-- ----------------------------
CREATE TABLE [canceltdreason] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL ,
[description] varchar(150) NULL 
)


GO

-- ----------------------------
-- Table structure for cashbook
-- ----------------------------
CREATE TABLE [cashbook] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL ,
[code] varchar(50) NULL ,
[title] varchar(100) NULL ,
[description] varchar(100) NULL ,
[type] varchar(50) NULL ,
[subacct_objid] varchar(50) NULL ,
[subacct_name] varchar(50) NULL ,
[fund_objid] varchar(50) NULL ,
[fund_code] varchar(50) NULL ,
[fund_title] varchar(100) NULL ,
[org_objid] varchar(50) NULL ,
[org_code] varchar(50) NULL ,
[org_name] varchar(50) NULL ,
[beginbalance] decimal(16,2) NULL ,
[forwardbalance] decimal(16,2) NULL ,
[totaldr] decimal(16,2) NULL ,
[totalcr] decimal(16,2) NULL ,
[endbalance] decimal(16,2) NULL ,
[currentlineno] int NULL 
)


GO

-- ----------------------------
-- Table structure for cashbook_entry
-- ----------------------------
CREATE TABLE [cashbook_entry] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[txndate] datetime NULL ,
[refdate] datetime NULL ,
[refid] varchar(50) NULL ,
[refno] varchar(50) NULL ,
[reftype] varchar(50) NULL ,
[particulars] varchar(3000) NULL ,
[dr] decimal(16,2) NULL ,
[cr] decimal(16,2) NULL ,
[runbalance] decimal(16,2) NULL ,
[lineno] int NULL ,
[postingrefid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt
-- ----------------------------
CREATE TABLE [cashreceipt] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[txndate] datetime NOT NULL ,
[receiptno] varchar(50) NOT NULL ,
[receiptdate] datetime NOT NULL ,
[txnmode] varchar(10) NOT NULL ,
[payer_objid] varchar(50) NULL ,
[payer_name] varchar(1500) NULL ,
[paidby] varchar(1500) NULL ,
[paidbyaddress] varchar(100) NOT NULL ,
[amount] decimal(16,2) NOT NULL ,
[collector_objid] varchar(50) NOT NULL ,
[collector_name] varchar(100) NOT NULL ,
[collector_title] varchar(50) NOT NULL ,
[totalcash] decimal(16,2) NOT NULL ,
[totalnoncash] decimal(16,2) NOT NULL ,
[cashchange] decimal(16,2) NOT NULL ,
[totalcredit] decimal(16,2) NOT NULL ,
[org_objid] varchar(50) NOT NULL ,
[org_name] varchar(50) NOT NULL ,
[formno] varchar(50) NOT NULL ,
[series] int NOT NULL ,
[controlid] varchar(50) NOT NULL ,
[collectiontype_objid] varchar(50) NULL ,
[collectiontype_name] varchar(100) NULL ,
[user_objid] varchar(50) NULL ,
[user_name] varchar(100) NULL ,
[remarks] varchar(200) NULL ,
[subcollector_objid] varchar(50) NULL ,
[subcollector_name] varchar(100) NULL ,
[subcollector_title] varchar(50) NULL ,
[formtype] varchar(25) NULL ,
[stub] varchar(25) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_burial
-- ----------------------------
CREATE TABLE [cashreceipt_burial] (
[objid] varchar(50) NOT NULL ,
[tocitymuni] varchar(100) NULL DEFAULT NULL ,
[toprovince] varchar(100) NULL DEFAULT NULL ,
[permissiontype] varchar(15) NULL DEFAULT NULL ,
[name] varchar(100) NULL DEFAULT NULL ,
[nationality] varchar(15) NULL DEFAULT NULL ,
[age] int NULL DEFAULT NULL ,
[sex] varchar(10) NULL DEFAULT NULL ,
[dtdeath] varchar(15) NULL DEFAULT NULL ,
[deathcause] varchar(50) NULL DEFAULT NULL ,
[cemetery] varchar(50) NULL DEFAULT NULL ,
[infectious] varchar(50) NULL DEFAULT NULL ,
[embalmed] varchar(50) NULL DEFAULT NULL ,
[disposition] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_business
-- ----------------------------
CREATE TABLE [cashreceipt_business] (
[objid] varchar(50) NOT NULL ,
[businessid] varchar(50) NULL ,
[applicationid] varchar(50) NULL ,
[tradename] varchar(255) NULL ,
[payoption] varchar(50) NULL ,
[qtr] int NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_business_item
-- ----------------------------
CREATE TABLE [cashreceipt_business_item] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[fromqtr] int NULL ,
[toqtr] int NULL ,
[lob_objid] varchar(50) NULL ,
[lob_name] varchar(255) NULL ,
[year] int NULL ,
[paymentmode] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_cancelseries
-- ----------------------------
CREATE TABLE [cashreceipt_cancelseries] (
[objid] varchar(50) NOT NULL ,
[receiptid] varchar(50) NOT NULL ,
[txndate] datetime NOT NULL ,
[postedby_objid] varchar(50) NULL ,
[postedby_name] varchar(100) NULL ,
[reason] varchar(255) NULL ,
[controlid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_cashticket
-- ----------------------------
CREATE TABLE [cashreceipt_cashticket] (
[objid] varchar(50) NOT NULL ,
[qtyissued] int NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_ctc_corporate
-- ----------------------------
CREATE TABLE [cashreceipt_ctc_corporate] (
[objid] varchar(50) NOT NULL ,
[payer_tin] varchar(50) NULL ,
[payer_orgtype] varchar(50) NULL ,
[payer_nature] varchar(50) NULL ,
[payer_dtregistered] datetime NULL ,
[payer_placeregistered] varchar(100) NULL ,
[additional_remarks] varchar(100) NULL ,
[realpropertyav] numeric(16,2) NOT NULL ,
[businessgross] numeric(16,2) NOT NULL ,
[basictax] numeric(16,2) NOT NULL ,
[propertyavtax] numeric(16,2) NOT NULL ,
[businessgrosstax] numeric(16,2) NOT NULL ,
[totaltax] numeric(16,2) NOT NULL ,
[interest] numeric(16,2) NOT NULL ,
[amountdue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_ctc_individual
-- ----------------------------
CREATE TABLE [cashreceipt_ctc_individual] (
[objid] varchar(50) NOT NULL ,
[payer_profession] varchar(50) NULL ,
[payer_citizenship] varchar(50) NULL ,
[payer_civilstatus] varchar(25) NULL ,
[payer_height] varchar(25) NULL ,
[payer_weight] varchar(25) NULL ,
[additional_remarks] varchar(100) NULL ,
[businessgross] numeric(16,2) NOT NULL ,
[annualsalary] numeric(16,2) NOT NULL ,
[propertyincome] numeric(16,2) NOT NULL ,
[basictax] numeric(16,2) NOT NULL ,
[salarytax] numeric(16,2) NOT NULL ,
[businessgrosstax] numeric(16,2) NOT NULL ,
[propertyincometax] numeric(16,2) NOT NULL ,
[additionaltax] numeric(16,2) NOT NULL ,
[totaltax] numeric(16,2) NOT NULL ,
[interest] numeric(16,2) NOT NULL ,
[amountdue] numeric(16,2) NOT NULL ,
[interestdue] numeric(16,2) NOT NULL ,
[barangay_objid] varchar(50) NULL ,
[barangay_name] varchar(50) NULL ,
[brgytaxshare] numeric(16,2) NOT NULL ,
[brgyinterestshare] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_largecattleownership
-- ----------------------------
CREATE TABLE [cashreceipt_largecattleownership] (
[objid] varchar(50) NOT NULL ,
[ownerof] varchar(200) NULL DEFAULT NULL ,
[sex] varchar(10) NULL DEFAULT NULL ,
[age] int NULL DEFAULT NULL ,
[municipalitybrand] varchar(20) NULL DEFAULT NULL ,
[ownerbrand] varchar(20) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_marriage
-- ----------------------------
CREATE TABLE [cashreceipt_marriage] (
[objid] varchar(50) NOT NULL ,
[groomname] varchar(100) NULL DEFAULT NULL ,
[groomaddress] varchar(100) NULL DEFAULT NULL ,
[groomageyear] int NULL DEFAULT NULL ,
[groomagemonth] int NULL DEFAULT NULL ,
[bridename] varchar(100) NULL DEFAULT NULL ,
[brideaddress] varchar(100) NULL DEFAULT NULL ,
[brideageyear] int NULL DEFAULT NULL ,
[brideagemonth] int NULL DEFAULT NULL ,
[registerno] varchar(30) NULL DEFAULT NULL ,
[attachments] varchar(200) NULL DEFAULT NULL ,
[lcrofficer] varchar(100) NULL DEFAULT NULL ,
[lcrofficertitle] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_rpt
-- ----------------------------
CREATE TABLE [cashreceipt_rpt] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[month] int NOT NULL ,
[day] int NOT NULL ,
[txntype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_slaughter
-- ----------------------------
CREATE TABLE [cashreceipt_slaughter] (
[objid] varchar(50) NOT NULL ,
[acctid] varchar(50) NULL DEFAULT NULL ,
[acctno] varchar(50) NULL DEFAULT NULL ,
[acctitle] varchar(100) NULL DEFAULT NULL ,
[permitamount] decimal(18,2) NULL DEFAULT NULL ,
[slaughterof] varchar(25) NULL DEFAULT NULL ,
[weight] decimal(18,2) NULL DEFAULT NULL ,
[ordinanceno] varchar(50) NULL DEFAULT NULL ,
[ordinancedate] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipt_void
-- ----------------------------
CREATE TABLE [cashreceipt_void] (
[objid] varchar(50) NOT NULL ,
[receiptid] varchar(50) NOT NULL ,
[txndate] datetime NOT NULL ,
[postedby_objid] varchar(50) NOT NULL ,
[postedby_name] varchar(100) NOT NULL ,
[reason] varchar(255) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceiptitem
-- ----------------------------
CREATE TABLE [cashreceiptitem] (
[objid] varchar(50) NOT NULL ,
[receiptid] varchar(50) NULL ,
[item_objid] varchar(50) NULL ,
[item_code] varchar(100) NULL ,
[item_title] varchar(100) NULL ,
[amount] decimal(16,2) NULL ,
[remarks] varchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceiptitem_discount
-- ----------------------------
CREATE TABLE [cashreceiptitem_discount] (
[objid] varchar(50) NOT NULL ,
[receiptid] varchar(50) NULL ,
[receiptitemid] varchar(50) NULL ,
[acctid] varchar(50) NULL ,
[amount] decimal(16,2) NULL ,
[title] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceiptitem_rpt
-- ----------------------------
CREATE TABLE [cashreceiptitem_rpt] (
[objid] varchar(100) NOT NULL ,
[rptreceiptid] varchar(50) NOT NULL ,
[rptledgerid] varchar(50) NULL DEFAULT NULL ,
[barangayid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[basic] decimal(12,2) NOT NULL ,
[basicint] decimal(12,2) NOT NULL ,
[basicdisc] decimal(12,2) NOT NULL ,
[basiccredit] decimal(12,2) NOT NULL ,
[basicamnesty] decimal(12,2) NOT NULL ,
[basicintamnesty] decimal(12,2) NOT NULL ,
[basicacct_objid] varchar(50) NULL ,
[basicintacct_objid] varchar(50) NULL ,
[sef] decimal(12,2) NOT NULL ,
[sefint] decimal(12,2) NOT NULL ,
[sefdisc] decimal(12,2) NOT NULL ,
[sefcredit] decimal(12,2) NOT NULL ,
[sefamnesty] decimal(12,2) NOT NULL ,
[sefintamnesty] decimal(12,2) NOT NULL ,
[sefacct_objid] varchar(50) NULL ,
[sefintacct_objid] varchar(50) NULL ,
[firecode] decimal(12,2) NOT NULL ,
[firecodeacct_objid] varchar(50) NULL DEFAULT NULL ,
[revtype] varchar(15) NOT NULL ,
[partialled] int NULL ,
[rptledgerfaasid] varchar(50) NULL ,
[fromqtr] int NULL ,
[toqtr] int NULL ,
[lgushare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[lguintshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[brgyshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[brgyintshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[brgyshareacctid] varchar(50) NULL ,
[brgyintshareacctid] varchar(50) NULL ,
[provshare] decimal(16,2) NOT NULL DEFAULT ((0)) ,
[provintshare] decimal(16,2) NOT NULL DEFAULT ((0)) ,
[provshareacctid] varchar(50) NULL ,
[provintshareacctid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceiptitem_rpt_account
-- ----------------------------
CREATE TABLE [cashreceiptitem_rpt_account] (
[objid] varchar(50) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[revperiod] varchar(25) NOT NULL ,
[revtype] varchar(25) NOT NULL ,
[item_objid] varchar(50) NOT NULL ,
[amount] numeric(16,2) NOT NULL ,
[rptreceiptid] varchar(50) NULL ,
[sharetype] varchar(25) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceiptitem_rpt_noledger
-- ----------------------------
CREATE TABLE [cashreceiptitem_rpt_noledger] (
[objid] varchar(50) NOT NULL ,
[tdno] varchar(25) NOT NULL ,
[pin] varchar(25) NOT NULL ,
[rputype] varchar(15) NOT NULL ,
[cadastrallotno] varchar(200) NULL ,
[txntype_objid] varchar(5) NULL ,
[classification_objid] varchar(50) NOT NULL ,
[actualuse_objid] varchar(50) NOT NULL ,
[barangay_objid] varchar(50) NOT NULL ,
[av] numeric(16,2) NOT NULL ,
[originalav] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceiptitem_rpt_online
-- ----------------------------
CREATE TABLE [cashreceiptitem_rpt_online] (
[objid] varchar(50) NOT NULL ,
[rptledgerid] varchar(50) NULL ,
[rptledgerfaasid] varchar(50) NULL ,
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[fromqtr] int NOT NULL ,
[toqtr] int NOT NULL ,
[basic] numeric(16,2) NOT NULL ,
[basicint] numeric(16,2) NOT NULL ,
[basicdisc] numeric(16,2) NOT NULL ,
[sef] numeric(16,2) NOT NULL ,
[sefint] numeric(16,2) NOT NULL ,
[sefdisc] numeric(16,2) NOT NULL ,
[firecode] decimal(10,2) NULL ,
[revperiod] varchar(25) NULL ,
[basicnet] numeric(16,2) NULL ,
[sefnet] numeric(16,2) NULL ,
[total] numeric(16,2) NULL ,
[rptreceiptid] varchar(50) NULL ,
[partialled] int NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Table structure for cashreceiptpayment_check
-- ----------------------------
CREATE TABLE [cashreceiptpayment_check] (
[objid] varchar(50) NOT NULL ,
[receiptid] varchar(50) NULL ,
[bank] varchar(50) NULL ,
[checkno] varchar(25) NULL ,
[checkdate] datetime NULL ,
[amount] decimal(16,2) NULL ,
[particulars] varchar(255) NULL ,
[bankid] varchar(50) NULL ,
[deposittype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashreceipts
-- ----------------------------
CREATE TABLE [cashreceipts] (
[objid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashticket
-- ----------------------------
CREATE TABLE [cashticket] (
[objid] varchar(50) NOT NULL ,
[denomination] decimal(10,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for cashticket_control
-- ----------------------------
CREATE TABLE [cashticket_control] (
[objid] varchar(50) NOT NULL ,
[controlid] varchar(50) NULL DEFAULT '' ,
[assignee_objid] varchar(50) NULL DEFAULT '' ,
[assignee_name] varchar(50) NULL DEFAULT NULL ,
[qtyin] int NULL DEFAULT NULL ,
[qtyissued] int NULL DEFAULT NULL ,
[qtybalance] int NULL DEFAULT NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for cashticket_inventory
-- ----------------------------
CREATE TABLE [cashticket_inventory] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[afid] varchar(50) NULL DEFAULT NULL ,
[respcenter_objid] varchar(50) NULL DEFAULT NULL ,
[respcenter_name] varchar(50) NULL DEFAULT NULL ,
[respcenter_type] varchar(25) NULL DEFAULT NULL ,
[startstub] int NULL DEFAULT NULL ,
[endstub] int NULL DEFAULT NULL ,
[currentstub] int NULL DEFAULT NULL ,
[qtyin] int NULL DEFAULT NULL ,
[qtyout] int NULL DEFAULT NULL ,
[qtycancelled] int NULL DEFAULT NULL ,
[qtybalance] int NULL ,
[currentlineno] int NULL DEFAULT NULL ,
[cost] decimal(10,2) NULL 
)


GO

-- ----------------------------
-- Table structure for cashticket_inventory_detail
-- ----------------------------
CREATE TABLE [cashticket_inventory_detail] (
[objid] varchar(50) NOT NULL ,
[controlid] varchar(50) NULL ,
[lineno] int NULL ,
[refid] varchar(50) NULL ,
[refno] varchar(50) NULL ,
[reftype] varchar(50) NULL ,
[refdate] datetime NULL ,
[txndate] datetime NULL ,
[txntype] varchar(25) NULL ,
[qtyreceived] int NULL ,
[qtybegin] int NULL ,
[qtyissued] int NULL ,
[qtyending] int NULL ,
[qtycancelled] int NULL DEFAULT NULL ,
[remarks] varchar(255) NULL DEFAULT NULL ,
[remittanceid] varchar(50) NULL ,
[cost] decimal(10,2) NULL 
)


GO

-- ----------------------------
-- Table structure for certification
-- ----------------------------
CREATE TABLE [certification] (
[objid] varchar(50) NOT NULL ,
[txnno] varchar(25) NOT NULL ,
[txndate] datetime NOT NULL ,
[type] varchar(50) NOT NULL ,
[refid] varchar(50) NULL DEFAULT NULL ,
[name] varchar(200) NOT NULL DEFAULT NULL ,
[address] varchar(300) NOT NULL DEFAULT NULL ,
[requestedby] text NOT NULL ,
[requestedbyaddress] varchar(100) NOT NULL ,
[purpose] varchar(500) NULL ,
[certifiedby] varchar(150) NOT NULL ,
[certifiedbytitle] varchar(50) NOT NULL ,
[byauthority] varchar(150) NULL DEFAULT NULL ,
[byauthoritytitle] varchar(50) NULL DEFAULT NULL ,
[orno] varchar(25) NULL DEFAULT NULL ,
[ordate] datetime NULL DEFAULT NULL ,
[oramount] numeric(16,2) NOT NULL ,
[stampamount] numeric(16,2) NOT NULL ,
[createdbyid] varchar(50) NULL DEFAULT NULL ,
[createdby] varchar(150) NOT NULL ,
[createdbytitle] varchar(50) NOT NULL ,
[office] varchar(50) NULL ,
[info] varchar(3000) NULL 
)


GO

-- ----------------------------
-- Table structure for city
-- ----------------------------
CREATE TABLE [city] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL DEFAULT NULL ,
[indexno] varchar(15) NULL DEFAULT NULL ,
[pin] varchar(15) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[mayor_name] varchar(100) NULL DEFAULT NULL ,
[mayor_title] varchar(50) NULL DEFAULT NULL ,
[mayor_office] varchar(50) NULL DEFAULT NULL ,
[assessor_name] varchar(100) NULL DEFAULT NULL ,
[assessor_title] varchar(50) NULL DEFAULT NULL ,
[assessor_office] varchar(50) NULL DEFAULT NULL ,
[treasurer_name] varchar(100) NULL DEFAULT NULL ,
[treasurer_title] varchar(50) NULL DEFAULT NULL ,
[treasurer_office] varchar(50) NULL DEFAULT NULL ,
[address] varchar(100) NULL DEFAULT NULL ,
[fullname] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for collectionform
-- ----------------------------
CREATE TABLE [collectionform] (
[objid] varchar(50) NOT NULL ,
[title] varchar(255) NULL ,
[formtype] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for collectiongroup
-- ----------------------------
CREATE TABLE [collectiongroup] (
[objid] varchar(50) NOT NULL ,
[state] varchar(30) NULL ,
[name] varchar(150) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for collectiongroup_revenueitem
-- ----------------------------
CREATE TABLE [collectiongroup_revenueitem] (
[collectiongroupid] varchar(50) NOT NULL ,
[revenueitemid] varchar(50) NOT NULL ,
[orderno] int NULL 
)


GO

-- ----------------------------
-- Table structure for collectiontype
-- ----------------------------
CREATE TABLE [collectiontype] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL ,
[name] varchar(50) NULL ,
[title] varchar(50) NULL ,
[formno] varchar(10) NULL ,
[handler] varchar(25) NULL ,
[allowbatch] int NULL ,
[barcodekey] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for consolidatedland
-- ----------------------------
CREATE TABLE [consolidatedland] (
[objid] varchar(50) NOT NULL ,
[consolidationid] varchar(50) NOT NULL ,
[landfaasid] varchar(50) NOT NULL ,
[rpuid] varchar(50) NOT NULL ,
[rpid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for consolidation
-- ----------------------------
CREATE TABLE [consolidation] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[txnno] varchar(6) NULL DEFAULT NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[ry] int NOT NULL ,
[txntype_objid] varchar(5) NOT NULL ,
[autonumber] int NOT NULL ,
[effectivityyear] int NOT NULL ,
[effectivityqtr] int NOT NULL ,
[newtdno] varchar(25) NULL ,
[newutdno] varchar(25) NOT NULL ,
[newtitletype] varchar(25) NULL DEFAULT NULL ,
[newtitleno] varchar(25) NULL DEFAULT NULL ,
[newtitledate] datetime NULL DEFAULT NULL ,
[memoranda] varchar(1500) NULL ,
[lguid] varchar(50) NOT NULL ,
[lgutype] varchar(50) NOT NULL ,
[newrpid] varchar(50) NULL ,
[newrpuid] varchar(50) NULL ,
[newfaasid] varchar(50) NULL DEFAULT NULL ,
[taxpayer_objid] varchar(50) NULL ,
[taxpayer_name] varchar(800) NULL ,
[taxpayer_address] varchar(100) NULL ,
[owner_name] varchar(800) NULL ,
[owner_address] varchar(100) NULL ,
[administrator_objid] varchar(50) NULL DEFAULT NULL ,
[administrator_name] varchar(100) NULL DEFAULT NULL ,
[administrator_address] varchar(100) NULL DEFAULT NULL ,
[administratorid] varchar(50) NULL DEFAULT NULL ,
[administratorname] varchar(150) NULL DEFAULT NULL ,
[administratoraddress] varchar(100) NULL DEFAULT NULL ,
[signatories] varchar(1000) NULL 
)


GO

-- ----------------------------
-- Table structure for consolidationaffectedrpu
-- ----------------------------
CREATE TABLE [consolidationaffectedrpu] (
[objid] varchar(50) NOT NULL ,
[consolidationid] varchar(50) NOT NULL ,
[landfaasid] varchar(50) NOT NULL ,
[prevfaasid] varchar(50) NOT NULL ,
[newrpid] varchar(50) NOT NULL ,
[newrpuid] varchar(50) NOT NULL ,
[newfaasid] varchar(50) NULL ,
[newtdno] varchar(25) NULL ,
[newutdno] varchar(25) NOT NULL ,
[newsuffix] int NOT NULL ,
[memoranda] varchar(800) NULL 
)


GO

-- ----------------------------
-- Table structure for directcash_collection
-- ----------------------------
CREATE TABLE [directcash_collection] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[payee] varchar(150) NOT NULL ,
[refdate] date NOT NULL ,
[refno] varchar(25) NOT NULL ,
[amount] numeric(16,2) NOT NULL ,
[remarks] varchar(250) NULL 
)


GO

-- ----------------------------
-- Table structure for directcash_collection_item
-- ----------------------------
CREATE TABLE [directcash_collection_item] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL ,
[item_objid] varchar(50) NOT NULL ,
[amount] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for district
-- ----------------------------
CREATE TABLE [district] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL DEFAULT NULL ,
[indexno] varchar(15) NULL DEFAULT NULL ,
[pin] varchar(15) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[oldindexno] varchar(15) NULL ,
[oldpin] varchar(15) NULL 
)


GO

-- ----------------------------
-- Table structure for entity
-- ----------------------------
CREATE TABLE [entity] (
[objid] varchar(50) NOT NULL ,
[entityno] varchar(50) NOT NULL ,
[name] text NOT NULL ,
[address] varchar(255) NOT NULL ,
[mailingaddress] varchar(255) NULL DEFAULT NULL ,
[type] varchar(25) NOT NULL ,
[sys_lastupdate] varchar(25) NULL ,
[sys_lastupdateby] varchar(50) NULL ,
[remarks] varchar(300) NULL DEFAULT NULL ,
[entityname] varchar(300) NULL 
)


GO

-- ----------------------------
-- Table structure for entitycontact
-- ----------------------------
CREATE TABLE [entitycontact] (
[objid] varchar(50) NOT NULL ,
[entityid] varchar(50) NOT NULL ,
[contacttype] varchar(25) NOT NULL ,
[contact] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for entityid
-- ----------------------------
CREATE TABLE [entityid] (
[objid] varchar(50) NOT NULL ,
[entityid] varchar(50) NOT NULL ,
[idtype] varchar(50) NOT NULL ,
[idno] varchar(25) NOT NULL ,
[dtissued] date NULL ,
[dtexpiry] date NULL 
)


GO

-- ----------------------------
-- Table structure for entityindividual
-- ----------------------------
CREATE TABLE [entityindividual] (
[objid] varchar(50) NOT NULL ,
[lastname] varchar(800) NOT NULL ,
[firstname] varchar(800) NOT NULL ,
[middlename] varchar(800) NULL DEFAULT NULL ,
[birthdate] datetime NULL DEFAULT NULL ,
[birthplace] varchar(160) NULL DEFAULT NULL ,
[citizenship] varchar(50) NULL DEFAULT NULL ,
[gender] varchar(10) NULL DEFAULT NULL ,
[civilstatus] varchar(15) NULL DEFAULT NULL ,
[profession] varchar(50) NULL DEFAULT NULL ,
[tin] varchar(25) NULL DEFAULT NULL ,
[sss] varchar(25) NULL DEFAULT NULL ,
[height] varchar(10) NULL DEFAULT NULL ,
[weight] varchar(10) NULL DEFAULT NULL ,
[acr] varchar(50) NULL ,
[religion] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for entityjuridical
-- ----------------------------
CREATE TABLE [entityjuridical] (
[objid] varchar(50) NOT NULL ,
[tin] varchar(25) NULL DEFAULT NULL ,
[dtregistered] datetime NULL DEFAULT NULL ,
[orgtype] varchar(25) NULL DEFAULT NULL ,
[nature] varchar(50) NULL DEFAULT NULL ,
[placeregistered] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for entitymember
-- ----------------------------
CREATE TABLE [entitymember] (
[objid] varchar(50) NOT NULL ,
[entityid] varchar(50) NOT NULL ,
[itemno] int NOT NULL ,
[prefix] varchar(25) NULL DEFAULT NULL ,
[member_objid] varchar(50) NOT NULL ,
[member_name] varchar(800) NOT NULL ,
[member_address] varchar(160) NOT NULL ,
[suffix] varchar(25) NULL DEFAULT NULL ,
[remarks] varchar(160) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for entitymultiple
-- ----------------------------
CREATE TABLE [entitymultiple] (
[objid] varchar(50) NOT NULL ,
[fullname] text NULL 
)


GO

-- ----------------------------
-- Table structure for examiner_finding
-- ----------------------------
CREATE TABLE [examiner_finding] (
[objid] varchar(50) NOT NULL ,
[findings] varchar(2500) NULL 
)


GO

-- ----------------------------
-- Table structure for exemptiontype
-- ----------------------------
CREATE TABLE [exemptiontype] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL ,
[orderno] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for faas
-- ----------------------------
CREATE TABLE [faas] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[rpuid] varchar(50) NULL ,
[datacapture] int NOT NULL ,
[autonumber] int NOT NULL ,
[utdno] varchar(25) NOT NULL ,
[tdno] varchar(25) NULL ,
[txntype_objid] varchar(10) NULL ,
[effectivityyear] int NOT NULL ,
[effectivityqtr] int NOT NULL ,
[titletype] varchar(10) NULL DEFAULT NULL ,
[titleno] varchar(50) NULL DEFAULT NULL ,
[titledate] datetime NULL DEFAULT NULL ,
[taxpayer_objid] varchar(50) NULL ,
[taxpayer_name] text NULL ,
[taxpayer_address] varchar(150) NULL ,
[owner_name] text NULL ,
[owner_address] varchar(150) NULL ,
[administrator_objid] varchar(50) NULL DEFAULT NULL ,
[administrator_name] varchar(800) NULL DEFAULT NULL ,
[administrator_address] varchar(150) NULL DEFAULT NULL ,
[beneficiary_objid] varchar(50) NULL DEFAULT NULL ,
[beneficiary_name] varchar(150) NULL ,
[beneficiary_address] varchar(150) NULL DEFAULT NULL ,
[memoranda] varchar(1000) NULL DEFAULT NULL ,
[cancelnote] varchar(250) NULL DEFAULT NULL ,
[restrictionid] varchar(50) NULL DEFAULT NULL ,
[backtaxyrs] int NOT NULL ,
[prevtdno] varchar(500) NULL DEFAULT NULL ,
[prevpin] varchar(500) NULL DEFAULT NULL ,
[prevowner] text NULL ,
[prevav] numeric(16,2) NOT NULL ,
[prevmv] numeric(16,2) NOT NULL ,
[cancelreason] varchar(5) NULL DEFAULT NULL ,
[canceldate] datetime NULL DEFAULT NULL ,
[cancelledbytdnos] varchar(2500) NULL DEFAULT NULL ,
[lguid] varchar(50) NOT NULL ,
[txntimestamp] varchar(25) NOT NULL ,
[cancelledtimestamp] varchar(25) NULL ,
[name] varchar(100) NULL ,
[dtapproved] date NULL ,
[realpropertyid] varchar(50) NULL ,
[lgutype] varchar(25) NULL ,
[signatories] varchar(1000) NULL 
)


GO

-- ----------------------------
-- Table structure for faasannotation
-- ----------------------------
CREATE TABLE [faasannotation] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[annotationtype_objid] varchar(50) NOT NULL ,
[faasid] varchar(50) NOT NULL ,
[txnno] varchar(6) NULL DEFAULT NULL ,
[txndate] datetime NULL DEFAULT NULL ,
[fileno] varchar(25) NOT NULL ,
[orno] varchar(10) NOT NULL ,
[ordate] datetime NOT NULL ,
[oramount] numeric(16,2) NOT NULL ,
[memoranda] varchar(2000) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for faasannotationtype
-- ----------------------------
CREATE TABLE [faasannotationtype] (
[objid] varchar(50) NOT NULL ,
[type] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for faasbacktax
-- ----------------------------
CREATE TABLE [faasbacktax] (
[objid] varchar(50) NOT NULL ,
[faasid] varchar(50) NOT NULL ,
[ry] int NOT NULL ,
[tdno] varchar(25) NOT NULL ,
[bmv] numeric(16,2) NOT NULL ,
[mv] numeric(16,2) NOT NULL ,
[av] numeric(16,2) NOT NULL ,
[effectivityyear] int NOT NULL ,
[effectivityqtr] int NOT NULL ,
[taxable] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for faasupdate
-- ----------------------------
CREATE TABLE [faasupdate] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[txnno] varchar(10) NOT NULL ,
[txndate] datetime NOT NULL ,
[faasid] varchar(50) NOT NULL ,
[prevtitletype] varchar(25) NULL DEFAULT NULL ,
[prevtitleno] varchar(25) NULL DEFAULT NULL ,
[prevtitledate] datetime NULL DEFAULT NULL ,
[prevtaxpayerid] varchar(50) NOT NULL ,
[prevtaxpayername] varchar(800) NOT NULL ,
[prevtaxpayeraddress] varchar(150) NOT NULL ,
[prevownername] varchar(800) NOT NULL ,
[prevowneraddress] varchar(150) NOT NULL ,
[prevadministratorid] varchar(50) NULL DEFAULT NULL ,
[prevadministratorname] varchar(150) NULL DEFAULT NULL ,
[prevadministratoraddress] varchar(100) NULL DEFAULT NULL ,
[prevrestrictionid] varchar(50) NULL DEFAULT NULL ,
[prevmemoranda] varchar(500) NOT NULL ,
[prevsurveyno] varchar(100) NULL DEFAULT NULL ,
[prevcadastrallotno] varchar(100) NOT NULL ,
[prevblockno] varchar(50) NULL DEFAULT NULL ,
[prevpurok] varchar(50) NULL DEFAULT NULL ,
[prevstreet] varchar(100) NULL DEFAULT NULL ,
[prevnorth] varchar(150) NOT NULL ,
[preveast] varchar(150) NOT NULL ,
[prevsouth] varchar(150) NOT NULL ,
[prevwest] varchar(150) NOT NULL ,
[faas_titletype] varchar(25) NULL DEFAULT NULL ,
[faas_titleno] varchar(25) NULL DEFAULT NULL ,
[faas_titledate] datetime NULL DEFAULT NULL ,
[faas_restrictionid] varchar(50) NULL DEFAULT NULL ,
[faas_memoranda] varchar(500) NOT NULL ,
[rp_surveyno] varchar(100) NULL DEFAULT NULL ,
[rp_cadastrallotno] varchar(100) NOT NULL ,
[rp_blockno] varchar(50) NULL DEFAULT NULL ,
[rp_street] varchar(100) NULL DEFAULT NULL ,
[rp_north] varchar(150) NOT NULL ,
[rp_east] varchar(150) NOT NULL ,
[rp_south] varchar(150) NOT NULL ,
[rp_west] varchar(150) NOT NULL ,
[faas_taxpayer_objid] varchar(50) NOT NULL ,
[faas_taxpayer_name] varchar(800) NOT NULL ,
[faas_taxpayer_address] varchar(150) NOT NULL ,
[faas_owner_address] varchar(800) NOT NULL ,
[faas_owner_name] varchar(800) NOT NULL ,
[faas_administrator_name] varchar(200) NULL ,
[faas_administrator_objid] varchar(50) NULL ,
[faas_administrator_address] varchar(150) NULL 
)


GO

-- ----------------------------
-- Table structure for fund
-- ----------------------------
CREATE TABLE [fund] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[state] varchar(10) NULL ,
[code] varchar(50) NULL ,
[title] varchar(255) NULL ,
[type] varchar(20) NULL ,
[special] int NULL DEFAULT ((0)) ,
[system] int NULL 
)


GO

-- ----------------------------
-- Table structure for landadjustment
-- ----------------------------
CREATE TABLE [landadjustment] (
[objid] varchar(50) NOT NULL ,
[landrpuid] varchar(50) NULL DEFAULT NULL ,
[landdetailid] varchar(50) NULL DEFAULT NULL ,
[adjustmenttype_objid] varchar(50) NOT NULL ,
[expr] varchar(250) NOT NULL ,
[adjustment] numeric(16,2) NOT NULL ,
[type] varchar(2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for landadjustmentparameter
-- ----------------------------
CREATE TABLE [landadjustmentparameter] (
[objid] varchar(50) NOT NULL ,
[landadjustmentid] varchar(50) NOT NULL ,
[landrpuid] varchar(50) NOT NULL ,
[parameter_objid] varchar(50) NOT NULL ,
[value] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for landadjustmenttype
-- ----------------------------
CREATE TABLE [landadjustmenttype] (
[objid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(100) NOT NULL ,
[expr] varchar(1000) NOT NULL ,
[appliedto] varchar(150) NULL DEFAULT NULL ,
[previd] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for landadjustmenttype_classification
-- ----------------------------
CREATE TABLE [landadjustmenttype_classification] (
[landadjustmenttypeid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for landassesslevel
-- ----------------------------
CREATE TABLE [landassesslevel] (
[objid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL ,
[fixrate] int NOT NULL ,
[rate] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for landassesslevelrange
-- ----------------------------
CREATE TABLE [landassesslevelrange] (
[objid] varchar(50) NOT NULL ,
[landassesslevelid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL ,
[mvfrom] numeric(16,2) NOT NULL ,
[mvto] numeric(16,2) NOT NULL ,
[rate] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for landdetail
-- ----------------------------
CREATE TABLE [landdetail] (
[objid] varchar(50) NOT NULL ,
[landrpuid] varchar(50) NOT NULL ,
[subclass_objid] varchar(50) NOT NULL ,
[specificclass_objid] varchar(50) NOT NULL ,
[actualuse_objid] varchar(50) NOT NULL ,
[stripping_objid] varchar(50) NULL DEFAULT NULL ,
[striprate] numeric(16,2) NOT NULL ,
[areatype] varchar(10) NOT NULL ,
[addlinfo] varchar(250) NULL DEFAULT NULL ,
[area] numeric(18,6) NOT NULL ,
[areasqm] numeric(18,2) NOT NULL ,
[areaha] numeric(18,6) NOT NULL ,
[basevalue] numeric(16,2) NOT NULL ,
[unitvalue] numeric(16,2) NOT NULL ,
[taxable] int NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[adjustment] numeric(16,2) NOT NULL ,
[landvalueadjustment] numeric(16,2) NOT NULL ,
[actualuseadjustment] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for landrpu
-- ----------------------------
CREATE TABLE [landrpu] (
[objid] varchar(50) NOT NULL ,
[idleland] int NOT NULL ,
[totallandbmv] numeric(16,2) NOT NULL ,
[totallandmv] numeric(16,2) NOT NULL ,
[totallandav] numeric(16,2) NOT NULL ,
[totalplanttreebmv] numeric(16,2) NOT NULL ,
[totalplanttreemv] numeric(16,2) NOT NULL ,
[totalplanttreeadjustment] numeric(16,2) NOT NULL ,
[totalplanttreeav] numeric(16,2) NOT NULL ,
[landvalueadjustment] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for landrysetting
-- ----------------------------
CREATE TABLE [landrysetting] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[ry] int NOT NULL ,
[appliedto] varchar(500) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for lcuvspecificclass
-- ----------------------------
CREATE TABLE [lcuvspecificclass] (
[objid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL ,
[areatype] varchar(10) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for lcuvstripping
-- ----------------------------
CREATE TABLE [lcuvstripping] (
[objid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NOT NULL ,
[striplevel] int NOT NULL ,
[rate] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for lcuvsubclass
-- ----------------------------
CREATE TABLE [lcuvsubclass] (
[objid] varchar(50) NOT NULL ,
[specificclass_objid] varchar(50) NOT NULL ,
[landrysettingid] varchar(50) NOT NULL ,
[code] varchar(50) NOT NULL ,
[name] varchar(25) NOT NULL ,
[unitvalue] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for liquidation
-- ----------------------------
CREATE TABLE [liquidation] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NOT NULL ,
[txnno] varchar(50) NOT NULL ,
[dtposted] datetime NOT NULL ,
[liquidatingofficer_objid] varchar(50) NOT NULL ,
[liquidatingofficer_name] varchar(100) NOT NULL ,
[liquidatingofficer_title] varchar(50) NOT NULL ,
[amount] decimal(18,2) NULL ,
[totalcash] decimal(18,2) NULL ,
[totalnoncash] decimal(18,2) NULL ,
[cashbreakdown] varchar(600) NULL 
)


GO

-- ----------------------------
-- Table structure for liquidation_cashier_fund
-- ----------------------------
CREATE TABLE [liquidation_cashier_fund] (
[objid] varchar(50) NOT NULL ,
[liquidationid] varchar(50) NULL ,
[fund_objid] varchar(50) NULL ,
[fund_title] varchar(100) NULL ,
[cashier_objid] varchar(50) NULL ,
[cashier_name] varchar(50) NULL ,
[amount] decimal(16,2) NULL ,
[totalcash] decimal(16,2) NULL ,
[totalnoncash] decimal(16,2) NULL ,
[cashbreakdown] varchar(600) NULL 
)


GO

-- ----------------------------
-- Table structure for liquidation_checkpayment
-- ----------------------------
CREATE TABLE [liquidation_checkpayment] (
[objid] varchar(50) NOT NULL ,
[liquidationid] varchar(50) NOT NULL ,
[liquidationfundid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for liquidation_remittance
-- ----------------------------
CREATE TABLE [liquidation_remittance] (
[objid] varchar(50) NOT NULL ,
[liquidationid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for lob
-- ----------------------------
CREATE TABLE [lob] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[name] varchar(100) NOT NULL ,
[classification_objid] varchar(50) NOT NULL ,
[psic] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for lob_lobattribute
-- ----------------------------
CREATE TABLE [lob_lobattribute] (
[lobid] varchar(50) NOT NULL ,
[lobattributeid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for lobattribute
-- ----------------------------
CREATE TABLE [lobattribute] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[name] varchar(50) NOT NULL ,
[description] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for lobclassification
-- ----------------------------
CREATE TABLE [lobclassification] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[name] varchar(100) NOT NULL ,
[remarks] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for machassesslevel
-- ----------------------------
CREATE TABLE [machassesslevel] (
[objid] varchar(50) NOT NULL ,
[machrysettingid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(50) NOT NULL ,
[fixrate] int NOT NULL ,
[rate] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for machassesslevelrange
-- ----------------------------
CREATE TABLE [machassesslevelrange] (
[objid] varchar(50) NOT NULL ,
[machassesslevelid] varchar(50) NOT NULL ,
[machrysettingid] varchar(50) NOT NULL ,
[mvfrom] numeric(16,2) NOT NULL ,
[mvto] numeric(16,2) NOT NULL ,
[rate] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for machdetail
-- ----------------------------
CREATE TABLE [machdetail] (
[objid] varchar(50) NOT NULL ,
[machuseid] varchar(50) NOT NULL ,
[machrpuid] varchar(50) NOT NULL ,
[machine_objid] varchar(50) NOT NULL ,
[operationyear] int NULL DEFAULT NULL ,
[replacementcost] numeric(16,2) NOT NULL ,
[depreciation] numeric(16,2) NOT NULL ,
[depreciationvalue] numeric(16,2) NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL ,
[brand] varchar(50) NULL DEFAULT NULL ,
[capacity] varchar(50) NULL DEFAULT NULL ,
[model] varchar(50) NULL DEFAULT NULL ,
[serialno] varchar(50) NULL DEFAULT NULL ,
[status] varchar(50) NULL DEFAULT NULL ,
[yearacquired] int NULL DEFAULT NULL ,
[estimatedlife] int NULL DEFAULT NULL ,
[remaininglife] int NULL DEFAULT NULL ,
[yearinstalled] int NULL DEFAULT NULL ,
[yearsused] int NULL DEFAULT NULL ,
[originalcost] numeric(16,2) NOT NULL ,
[freightcost] numeric(16,2) NOT NULL ,
[insurancecost] numeric(16,2) NOT NULL ,
[installationcost] numeric(16,2) NOT NULL ,
[brokeragecost] numeric(16,2) NOT NULL ,
[arrastrecost] numeric(16,2) NOT NULL ,
[othercost] numeric(16,2) NOT NULL ,
[acquisitioncost] numeric(16,2) NOT NULL ,
[feracid] varchar(50) NULL DEFAULT NULL ,
[ferac] numeric(16,2) NULL DEFAULT NULL ,
[forexid] varchar(50) NULL DEFAULT NULL ,
[forex] numeric(16,4) NULL DEFAULT NULL ,
[residualrate] numeric(16,2) NOT NULL ,
[conversionfactor] numeric(16,2) NOT NULL ,
[swornamount] numeric(16,2) NOT NULL ,
[useswornamount] int NOT NULL ,
[imported] int NOT NULL ,
[newlyinstalled] int NOT NULL ,
[autodepreciate] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for machforex
-- ----------------------------
CREATE TABLE [machforex] (
[objid] varchar(50) NOT NULL ,
[machrysettingid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[forex] numeric(10,6) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for machine
-- ----------------------------
CREATE TABLE [machine] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(50) NOT NULL ,
[name] varchar(250) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for machrpu
-- ----------------------------
CREATE TABLE [machrpu] (
[objid] varchar(50) NOT NULL ,
[landrpuid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for machrysetting
-- ----------------------------
CREATE TABLE [machrysetting] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[ry] int NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[appliedto] text NULL ,
[residualrate] numeric(10,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for machuse
-- ----------------------------
CREATE TABLE [machuse] (
[objid] varchar(50) NOT NULL ,
[machrpuid] varchar(50) NOT NULL ,
[actualuse_objid] varchar(50) NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for material
-- ----------------------------
CREATE TABLE [material] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for mcsettlement
-- ----------------------------
CREATE TABLE [mcsettlement] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NULL ,
[txnno] varchar(25) NULL ,
[effectivityyear] int NOT NULL ,
[effectivityqtr] int NOT NULL ,
[memoranda] varchar(2000) NULL ,
[prevfaas_objid] varchar(50) NULL ,
[newfaas_objid] varchar(50) NULL ,
[newtdno] varchar(25) NULL ,
[signatories] varchar(1000) NOT NULL ,
[lgutype] varchar(25) NOT NULL ,
[lguid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for mcsettlement_affectedrpu
-- ----------------------------
CREATE TABLE [mcsettlement_affectedrpu] (
[objid] varchar(50) NOT NULL ,
[mcsettlementid] varchar(50) NOT NULL ,
[rputype] varchar(15) NOT NULL ,
[prevfaas_objid] varchar(50) NOT NULL ,
[newfaas_objid] varchar(50) NULL ,
[newtdno] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for mcsettlement_otherclaim
-- ----------------------------
CREATE TABLE [mcsettlement_otherclaim] (
[objid] varchar(50) NOT NULL ,
[mcsettlementid] varchar(50) NOT NULL ,
[faas_objid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for miscassesslevel
-- ----------------------------
CREATE TABLE [miscassesslevel] (
[objid] varchar(50) NOT NULL ,
[miscrysettingid] varchar(50) NOT NULL ,
[classification_objid] varchar(50) NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(50) NOT NULL ,
[fixrate] int NOT NULL ,
[rate] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for miscassesslevelrange
-- ----------------------------
CREATE TABLE [miscassesslevelrange] (
[objid] varchar(50) NOT NULL ,
[miscassesslevelid] varchar(50) NOT NULL ,
[miscrysettingid] varchar(50) NOT NULL ,
[mvfrom] numeric(16,2) NOT NULL ,
[mvto] numeric(16,2) NOT NULL ,
[rate] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for miscitem
-- ----------------------------
CREATE TABLE [miscitem] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for miscitemvalue
-- ----------------------------
CREATE TABLE [miscitemvalue] (
[objid] varchar(50) NOT NULL ,
[miscrysettingid] varchar(50) NOT NULL ,
[miscitem_objid] varchar(50) NOT NULL ,
[expr] varchar(100) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for miscrpu
-- ----------------------------
CREATE TABLE [miscrpu] (
[objid] varchar(50) NOT NULL ,
[actualuse_objid] varchar(50) NULL ,
[landrpuid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for miscrpuitem
-- ----------------------------
CREATE TABLE [miscrpuitem] (
[objid] varchar(50) NOT NULL ,
[miscrpuid] varchar(50) NOT NULL ,
[miv_objid] varchar(50) NOT NULL ,
[miscitem_objid] varchar(50) NOT NULL ,
[expr] varchar(255) NOT NULL ,
[depreciation] numeric(16,2) NOT NULL ,
[depreciatedvalue] numeric(16,2) NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for miscrpuitem_rptparameter
-- ----------------------------
CREATE TABLE [miscrpuitem_rptparameter] (
[miscrpuitemid] varchar(50) NOT NULL ,
[param_objid] varchar(50) NOT NULL ,
[miscrpuid] varchar(50) NOT NULL ,
[intvalue] int NULL DEFAULT NULL ,
[decimalvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for miscrysetting
-- ----------------------------
CREATE TABLE [miscrysetting] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[ry] int NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[appliedto] text NULL 
)


GO

-- ----------------------------
-- Table structure for municipality
-- ----------------------------
CREATE TABLE [municipality] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL DEFAULT NULL ,
[indexno] varchar(15) NULL DEFAULT NULL ,
[pin] varchar(15) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[mayor_name] varchar(100) NULL DEFAULT NULL ,
[mayor_title] varchar(50) NULL DEFAULT NULL ,
[mayor_office] varchar(50) NULL DEFAULT NULL ,
[assessor_name] varchar(100) NULL DEFAULT NULL ,
[assessor_title] varchar(50) NULL DEFAULT NULL ,
[assessor_office] varchar(50) NULL DEFAULT NULL ,
[treasurer_name] varchar(100) NULL DEFAULT NULL ,
[treasurer_title] varchar(50) NULL DEFAULT NULL ,
[treasurer_office] varchar(50) NULL DEFAULT NULL ,
[address] varchar(100) NULL DEFAULT NULL ,
[fullname] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for ngas_revenue
-- ----------------------------
CREATE TABLE [ngas_revenue] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[type] varchar(50) NOT NULL ,
[txndate] datetime NOT NULL ,
[dtposted] datetime NOT NULL ,
[postedby_objid] varchar(50) NOT NULL ,
[postedby_name] varchar(100) NOT NULL ,
[postedby_title] varchar(50) NOT NULL ,
[amount] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for ngas_revenue_deposit
-- ----------------------------
CREATE TABLE [ngas_revenue_deposit] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for ngas_revenue_remittance
-- ----------------------------
CREATE TABLE [ngas_revenue_remittance] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for ngas_revenueitem
-- ----------------------------
CREATE TABLE [ngas_revenueitem] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL ,
[refid] varchar(50) NOT NULL ,
[refsource] varchar(50) NOT NULL ,
[refno] varchar(25) NOT NULL ,
[refdate] datetime NOT NULL ,
[item_objid] varchar(50) NOT NULL ,
[fund_objid] varchar(50) NOT NULL ,
[acct_objid] varchar(50) NULL ,
[subacct_objid] varchar(50) NULL ,
[collectiontype_objid] varchar(50) NOT NULL ,
[amount] numeric(16,2) NOT NULL ,
[remittanceid] varchar(50) NULL ,
[liquidationid] varchar(50) NULL ,
[depositid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for pin
-- ----------------------------
CREATE TABLE [pin] (
[objid] varchar(50) NOT NULL ,
[state] varchar(20) NOT NULL ,
[barangayid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for planttree
-- ----------------------------
CREATE TABLE [planttree] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for planttreeassesslevel
-- ----------------------------
CREATE TABLE [planttreeassesslevel] (
[objid] varchar(50) NOT NULL ,
[planttreerysettingid] varchar(50) NOT NULL ,
[code] varchar(25) NOT NULL ,
[name] varchar(50) NOT NULL ,
[rate] numeric(16,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for planttreedetail
-- ----------------------------
CREATE TABLE [planttreedetail] (
[objid] varchar(50) NOT NULL ,
[planttreerpuid] varchar(50) NULL DEFAULT NULL ,
[landrpuid] varchar(50) NULL DEFAULT NULL ,
[planttreeunitvalue_objid] varchar(50) NOT NULL ,
[planttree_objid] varchar(50) NOT NULL ,
[actualuse_objid] varchar(50) NOT NULL ,
[productive] numeric(16,2) NOT NULL ,
[nonproductive] numeric(16,2) NOT NULL ,
[nonproductiveage] numeric(16,2) NULL DEFAULT NULL ,
[unitvalue] numeric(16,2) NOT NULL ,
[basemarketvalue] numeric(16,2) NOT NULL ,
[adjustment] numeric(16,2) NOT NULL ,
[adjustmentrate] numeric(16,2) NOT NULL ,
[marketvalue] numeric(16,2) NOT NULL ,
[assesslevel] numeric(16,2) NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for planttreerpu
-- ----------------------------
CREATE TABLE [planttreerpu] (
[objid] varchar(50) NOT NULL ,
[landrpuid] varchar(50) NOT NULL ,
[productive] numeric(16,2) NOT NULL ,
[nonproductive] numeric(16,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for planttreerysetting
-- ----------------------------
CREATE TABLE [planttreerysetting] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NOT NULL ,
[ry] int NOT NULL ,
[applyagriadjustment] int NOT NULL ,
[appliedto] text NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for planttreeunitvalue
-- ----------------------------
CREATE TABLE [planttreeunitvalue] (
[objid] varchar(50) NOT NULL ,
[planttreerysettingid] varchar(50) NOT NULL ,
[planttree_objid] varchar(50) NOT NULL ,
[code] varchar(10) NOT NULL ,
[name] varchar(25) NOT NULL ,
[unitvalue] numeric(10,2) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for previousfaas
-- ----------------------------
CREATE TABLE [previousfaas] (
[faasid] varchar(50) NOT NULL ,
[prevfaasid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for profession
-- ----------------------------
CREATE TABLE [profession] (
[objid] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for propertyclassification
-- ----------------------------
CREATE TABLE [propertyclassification] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL ,
[special] int NOT NULL ,
[orderno] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for province
-- ----------------------------
CREATE TABLE [province] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL DEFAULT NULL ,
[indexno] varchar(15) NULL DEFAULT NULL ,
[pin] varchar(15) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[governor_name] varchar(100) NULL DEFAULT NULL ,
[governor_title] varchar(50) NULL DEFAULT NULL ,
[governor_office] varchar(50) NULL DEFAULT NULL ,
[assessor_name] varchar(100) NULL DEFAULT NULL ,
[assessor_title] varchar(50) NULL DEFAULT NULL ,
[assessor_office] varchar(50) NULL DEFAULT NULL ,
[treasurer_name] varchar(100) NULL DEFAULT NULL ,
[treasurer_title] varchar(50) NULL DEFAULT NULL ,
[treasurer_office] varchar(50) NULL DEFAULT NULL ,
[address] varchar(100) NULL DEFAULT NULL ,
[fullname] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for realproperty
-- ----------------------------
CREATE TABLE [realproperty] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[autonumber] int NOT NULL ,
[pintype] varchar(5) NOT NULL ,
[pin] varchar(30) NOT NULL ,
[ry] int NOT NULL ,
[claimno] varchar(5) NULL ,
[section] varchar(3) NULL ,
[parcel] varchar(3) NULL ,
[cadastrallotno] varchar(300) NULL ,
[blockno] varchar(255) NULL DEFAULT NULL ,
[surveyno] varchar(30) NULL DEFAULT NULL ,
[street] varchar(100) NULL DEFAULT NULL ,
[purok] varchar(100) NULL DEFAULT NULL ,
[north] varchar(255) NULL ,
[south] varchar(255) NULL ,
[east] varchar(255) NULL ,
[west] varchar(255) NULL ,
[barangayid] varchar(50) NOT NULL ,
[lgutype] varchar(50) NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[lguid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for remittance
-- ----------------------------
CREATE TABLE [remittance] (
[objid] varchar(50) NOT NULL ,
[state] varchar(20) NOT NULL ,
[txnno] varchar(20) NOT NULL ,
[dtposted] datetime NOT NULL ,
[collector_objid] varchar(50) NOT NULL ,
[collector_name] varchar(100) NOT NULL ,
[collector_title] varchar(50) NOT NULL ,
[liquidatingofficer_objid] varchar(50) NOT NULL ,
[liquidatingofficer_name] varchar(100) NOT NULL ,
[liquidatingofficer_title] varchar(50) NOT NULL ,
[amount] decimal(18,2) NOT NULL ,
[totalcash] decimal(18,2) NOT NULL ,
[totalnoncash] decimal(18,2) NOT NULL ,
[cashbreakdown] varchar(600) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for remittance_afserial
-- ----------------------------
CREATE TABLE [remittance_afserial] (
[objid] varchar(50) NOT NULL ,
[remittanceid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for remittance_cashreceipt
-- ----------------------------
CREATE TABLE [remittance_cashreceipt] (
[objid] varchar(50) NOT NULL ,
[remittanceid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for remittance_cashticket
-- ----------------------------
CREATE TABLE [remittance_cashticket] (
[objid] varchar(50) NOT NULL ,
[remittanceid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for remittance_checkpayment
-- ----------------------------
CREATE TABLE [remittance_checkpayment] (
[objid] varchar(50) NOT NULL ,
[remittanceid] varchar(50) NULL ,
[amount] decimal(16,2) NULL ,
[voided] int NULL 
)


GO

-- ----------------------------
-- Table structure for remittance_fund
-- ----------------------------
CREATE TABLE [remittance_fund] (
[objid] varchar(50) NOT NULL ,
[remittanceid] varchar(50) NULL ,
[fund_objid] varchar(50) NULL ,
[fund_title] varchar(100) NULL ,
[amount] decimal(16,2) NULL 
)


GO

-- ----------------------------
-- Table structure for remoteserverdata
-- ----------------------------
CREATE TABLE [remoteserverdata] (
[objid] varchar(50) NOT NULL ,
[data] text NOT NULL 
)


GO

-- ----------------------------
-- Table structure for report_rptdelinquency
-- ----------------------------
CREATE TABLE [report_rptdelinquency] (
[objid] varchar(50) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[barangayid] varchar(50) NOT NULL ,
[basic] numeric(16,2) NOT NULL ,
[basicint] numeric(16,2) NOT NULL ,
[basicdisc] numeric(16,2) NOT NULL ,
[sef] numeric(16,2) NOT NULL ,
[sefint] numeric(16,2) NOT NULL ,
[sefdisc] numeric(16,2) NOT NULL ,
[firecode] numeric(16,2) NOT NULL ,
[dtgenerated] datetime NOT NULL ,
[generatedby_name] varchar(75) NULL ,
[generatedby_title] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for resection
-- ----------------------------
CREATE TABLE [resection] (
[objid] varchar(50) NOT NULL ,
[state] varchar(20) NOT NULL ,
[pintype] varchar(5) NOT NULL ,
[barangayid] varchar(50) NOT NULL ,
[barangaypin] varchar(15) NOT NULL ,
[section] varchar(3) NOT NULL ,
[ry] int NOT NULL ,
[txntype_objid] varchar(5) NOT NULL ,
[txnno] varchar(10) NOT NULL ,
[txndate] datetime NOT NULL ,
[autonumber] int NOT NULL ,
[effectivityyear] int NOT NULL ,
[effectivityqtr] int NOT NULL ,
[memoranda] varchar(500) NOT NULL ,
[signatories] varchar(2000) NULL 
)


GO

-- ----------------------------
-- Table structure for resectionaffectedrpu
-- ----------------------------
CREATE TABLE [resectionaffectedrpu] (
[objid] varchar(50) NOT NULL ,
[resectionid] varchar(50) NOT NULL ,
[rputype] varchar(10) NOT NULL ,
[prevfaasid] varchar(50) NOT NULL ,
[prevrpuid] varchar(50) NOT NULL ,
[prevrpid] varchar(50) NOT NULL ,
[newsection] varchar(3) NULL DEFAULT NULL ,
[newparcel] varchar(3) NULL DEFAULT NULL ,
[newtdno] varchar(20) NULL DEFAULT NULL ,
[newutdno] varchar(20) NOT NULL ,
[newpin] varchar(25) NULL DEFAULT NULL ,
[newsuffix] int NULL DEFAULT NULL ,
[newfaasid] varchar(50) NULL DEFAULT NULL ,
[newrpuid] varchar(50) NULL DEFAULT NULL ,
[newrpid] varchar(50) NULL DEFAULT NULL ,
[memoranda] varchar(500) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for resectionitem
-- ----------------------------
CREATE TABLE [resectionitem] (
[objid] varchar(50) NOT NULL ,
[resectionid] varchar(50) NOT NULL ,
[newsection] varchar(3) NOT NULL ,
[landcount] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for revenueitem
-- ----------------------------
CREATE TABLE [revenueitem] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL ,
[code] varchar(50) NULL ,
[title] varchar(255) NULL ,
[description] varchar(255) NULL ,
[type] varchar(25) NULL ,
[fund_objid] varchar(50) NULL ,
[fund_code] varchar(50) NULL ,
[fund_title] varchar(50) NULL ,
[defaultvalue] decimal(16,2) NULL ,
[valuetype] varchar(10) NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for revenueitem_attribute
-- ----------------------------
CREATE TABLE [revenueitem_attribute] (
[objid] varchar(50) NOT NULL ,
[revitemid] varchar(50) NULL ,
[attribute_objid] varchar(50) NULL ,
[account_objid] varchar(50) NULL ,
[account_code] varchar(50) NULL ,
[account_title] varchar(250) NULL 
)


GO

-- ----------------------------
-- Table structure for revenueitem_attribute_type
-- ----------------------------
CREATE TABLE [revenueitem_attribute_type] (
[objid] varchar(50) NOT NULL ,
[title] varchar(50) NULL ,
[handler] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for revenueitem_collectiongroup
-- ----------------------------
CREATE TABLE [revenueitem_collectiongroup] (
[objid] varchar(50) NOT NULL ,
[acctid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpt_requirement
-- ----------------------------
CREATE TABLE [rpt_requirement] (
[objid] varchar(50) NOT NULL ,
[requirementtypeid] varchar(50) NOT NULL ,
[handler] varchar(50) NOT NULL ,
[refid] varchar(50) NOT NULL ,
[value_objid] varchar(50) NULL ,
[value_txnno] varchar(50) NULL ,
[value_txndate] date NULL ,
[value_txnamount] numeric(16,2) NULL ,
[value_remarks] varchar(2000) NULL ,
[complied] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpt_requirement_type
-- ----------------------------
CREATE TABLE [rpt_requirement_type] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NOT NULL ,
[name] varchar(100) NOT NULL ,
[description] varchar(150) NULL ,
[handler] varchar(100) NULL ,
[sortorder] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpt_sales_data
-- ----------------------------
CREATE TABLE [rpt_sales_data] (
[objid] varchar(50) NOT NULL ,
[seller_name] varchar(250) NOT NULL ,
[seller_address] varchar(100) NOT NULL ,
[buyer_name] varchar(250) NOT NULL ,
[buyer_address] varchar(100) NOT NULL ,
[saledate] date NOT NULL ,
[amount] numeric(16,2) NOT NULL ,
[remarks] varchar(1000) NULL 
)


GO

-- ----------------------------
-- Table structure for rpt_sms
-- ----------------------------
CREATE TABLE [rpt_sms] (
[objid] varchar(50) NOT NULL ,
[traceid] varchar(50) NOT NULL ,
[phoneno] varchar(50) NOT NULL ,
[logdate] datetime NOT NULL ,
[message] varchar(500) NULL ,
[amount] numeric(10,2) NOT NULL ,
[amtpaid] numeric(10,2) NOT NULL ,
[action] varchar(100) NULL ,
[status] varchar(25) NULL 
)


GO

-- ----------------------------
-- Table structure for rpt_sms_registration
-- ----------------------------
CREATE TABLE [rpt_sms_registration] (
[phoneno] varchar(25) NOT NULL ,
[refid] varchar(50) NOT NULL ,
[dtregistered] datetime NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rptbill
-- ----------------------------
CREATE TABLE [rptbill] (
[objid] varchar(50) NOT NULL ,
[taxpayer_objid] varchar(50) NOT NULL ,
[barcode] varchar(25) NOT NULL ,
[expirydate] date NOT NULL ,
[postedby] varchar(100) NOT NULL ,
[postedbytitle] varchar(50) NULL ,
[billtoyear] int NULL ,
[billtoqtr] int NULL ,
[dtposted] datetime NULL ,
[taxpayer_name] varchar(3000) NULL ,
[taxpayer_address] varchar(150) NULL 
)


GO

-- ----------------------------
-- Table structure for rptbill_ledger
-- ----------------------------
CREATE TABLE [rptbill_ledger] (
[rptledgerid] varchar(50) NOT NULL ,
[rptbillid] varchar(50) NOT NULL ,
[partialbasic] numeric(16,2) NULL DEFAULT ((0)) ,
[partialbasicint] numeric(16,2) NULL DEFAULT ((0)) ,
[partialbasicdisc] numeric(16,2) NULL DEFAULT ((0)) ,
[partialsef] numeric(16,2) NULL DEFAULT ((0)) ,
[partialsefint] numeric(16,2) NULL DEFAULT ((0)) ,
[partialsefdisc] numeric(16,2) NULL DEFAULT ((0)) ,
[partialledyear] int NULL ,
[partialledqtr] int NULL 
)


GO

-- ----------------------------
-- Table structure for rptbill_ledger_account
-- ----------------------------
CREATE TABLE [rptbill_ledger_account] (
[objid] varchar(50) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[revperiod] varchar(25) NOT NULL ,
[revtype] varchar(25) NOT NULL ,
[item_objid] varchar(50) NOT NULL ,
[amount] numeric(16,2) NOT NULL ,
[sharetype] varchar(25) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rptbill_ledger_item
-- ----------------------------
CREATE TABLE [rptbill_ledger_item] (
[objid] varchar(75) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[rptledgerfaasid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[fromqtr] int NOT NULL ,
[toqtr] int NOT NULL ,
[basic] numeric(16,2) NOT NULL ,
[basicint] numeric(16,2) NOT NULL ,
[basicdisc] numeric(16,2) NOT NULL ,
[sef] numeric(16,2) NOT NULL ,
[sefint] numeric(16,2) NOT NULL ,
[sefdisc] numeric(16,2) NOT NULL ,
[firecode] decimal(10,2) NULL ,
[revperiod] varchar(25) NULL ,
[basicnet] numeric(16,2) NULL ,
[sefnet] numeric(16,2) NULL ,
[total] numeric(16,2) NULL ,
[partialled] int NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Table structure for rptcertification
-- ----------------------------
CREATE TABLE [rptcertification] (
[objid] varchar(50) NOT NULL ,
[txnno] varchar(25) NOT NULL ,
[txndate] datetime NOT NULL ,
[opener] varchar(50) NOT NULL ,
[faasid] varchar(50) NULL DEFAULT NULL ,
[taxpayer_objid] varchar(50) NULL DEFAULT NULL ,
[taxpayer_name] text NOT NULL ,
[taxpayer_address] varchar(150) NULL DEFAULT NULL ,
[requestedby] text NOT NULL ,
[requestedbyaddress] varchar(100) NOT NULL ,
[purpose] varchar(500) NULL ,
[certifiedby] varchar(150) NOT NULL ,
[certifiedbytitle] varchar(50) NOT NULL ,
[byauthority] varchar(150) NULL DEFAULT NULL ,
[byauthoritytitle] varchar(50) NULL DEFAULT NULL ,
[official] int NOT NULL ,
[orno] varchar(25) NULL DEFAULT NULL ,
[ordate] datetime NULL DEFAULT NULL ,
[oramount] numeric(16,2) NOT NULL ,
[stampamount] numeric(16,2) NOT NULL ,
[createdbyid] varchar(50) NULL DEFAULT NULL ,
[createdby] varchar(150) NOT NULL ,
[createdbytitle] varchar(50) NOT NULL ,
[office] varchar(50) NULL ,
[addlinfo] varchar(500) NULL 
)


GO

-- ----------------------------
-- Table structure for rptcertificationitem
-- ----------------------------
CREATE TABLE [rptcertificationitem] (
[rptcertificationid] varchar(50) NOT NULL ,
[refid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rptexpiry
-- ----------------------------
CREATE TABLE [rptexpiry] (
[iyear] int NOT NULL ,
[iqtr] int NOT NULL ,
[expirytype] varchar(50) NOT NULL ,
[expirydate] datetime NULL DEFAULT NULL ,
[reason] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for rptledger
-- ----------------------------
CREATE TABLE [rptledger] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[faasid] varchar(50) NOT NULL ,
[nextbilldate] date NULL ,
[lastyearpaid] int NOT NULL ,
[lastqtrpaid] int NOT NULL ,
[firstqtrpaidontime] int NOT NULL ,
[qtrlypaymentavailed] int NOT NULL ,
[qtrlypaymentpaidontime] int NOT NULL ,
[lastitemyear] int NULL ,
[lastreceiptid] varchar(50) NULL DEFAULT NULL ,
[barangayid] varchar(50) NOT NULL ,
[advancebill] int NOT NULL DEFAULT ((0)) ,
[lastbilledyear] int NULL DEFAULT ((0)) ,
[lastbilledqtr] int NULL DEFAULT ((0)) ,
[partialbasic] numeric(16,2) NULL DEFAULT ((0.0)) ,
[partialbasicint] numeric(16,2) NULL DEFAULT ((0.0)) ,
[partialbasicdisc] numeric(16,2) NULL DEFAULT ((0.0)) ,
[partialsef] numeric(16,2) NULL DEFAULT ((0.0)) ,
[partialsefint] numeric(16,2) NULL DEFAULT ((0.0)) ,
[partialsefdisc] numeric(16,2) NULL DEFAULT ((0.0)) ,
[partialledyear] int NULL DEFAULT ((0)) ,
[partialledqtr] int NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Table structure for rptledgerbill
-- ----------------------------
CREATE TABLE [rptledgerbill] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[ledgerfaasid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[av] numeric(16,2) NOT NULL ,
[type] varchar(25) NOT NULL ,
[revenueitemid] varchar(50) NULL DEFAULT NULL ,
[amount] numeric(16,2) NOT NULL ,
[amtpaid] numeric(16,2) NOT NULL ,
[interest] numeric(16,2) NOT NULL ,
[discount] numeric(16,2) NOT NULL ,
[revtype] varchar(25) NOT NULL ,
[refid] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for rptledgerbillitem
-- ----------------------------
CREATE TABLE [rptledgerbillitem] (
[objid] varchar(75) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[rptledgerfaasid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[qtr] int NOT NULL ,
[fromqtr] int NOT NULL ,
[toqtr] int NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL ,
[qtrlyav] numeric(16,2) NOT NULL ,
[basic] numeric(16,2) NOT NULL ,
[basicpaid] numeric(16,2) NOT NULL ,
[basicint] numeric(16,2) NOT NULL ,
[basicintpaid] numeric(16,2) NOT NULL ,
[basicdisc] numeric(16,2) NOT NULL ,
[basicdisctaken] numeric(16,2) NOT NULL ,
[sef] numeric(16,2) NOT NULL ,
[sefpaid] numeric(16,2) NOT NULL ,
[sefint] numeric(16,2) NOT NULL ,
[sefintpaid] numeric(16,2) NOT NULL ,
[sefdisc] numeric(16,2) NOT NULL ,
[sefdisctaken] numeric(16,2) NOT NULL ,
[firecode] decimal(10,2) NULL ,
[firecodepaid] decimal(10,2) NULL ,
[revtype] varchar(15) NULL ,
[forpayment] int NOT NULL ,
[partial] int NULL ,
[partialapplied] int NULL ,
[partialbasic] decimal(10,2) NULL ,
[partialbasicint] decimal(10,2) NULL ,
[partialbasicdisc] decimal(10,2) NULL ,
[partialsef] decimal(10,2) NULL ,
[partialsefint] decimal(10,2) NULL ,
[partialsefdisc] decimal(10,2) NULL ,
[firecodeacctid] varchar(50) NULL ,
[brgyshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[brgyintshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[brgyshareacctid] varchar(50) NULL ,
[brgyintshareacctid] varchar(50) NULL ,
[provshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[provintshare] numeric(16,2) NOT NULL DEFAULT ((0)) ,
[provshareacctid] varchar(50) NULL ,
[provintshareacctid] varchar(50) NULL ,
[cityshare] numeric(16,2) NULL DEFAULT ((0)) ,
[cityintshare] numeric(16,2) NULL DEFAULT ((0)) ,
[citysefshare] numeric(16,2) NULL DEFAULT ((0)) ,
[citysefintshare] numeric(16,2) NULL DEFAULT ((0)) ,
[cityshareacctid] varchar(50) NULL ,
[cityintshareacctid] varchar(50) NULL ,
[citysefshareacctid] varchar(50) NULL ,
[citysefintshareacctid] varchar(50) NULL ,
[provsefshare] numeric(16,2) NULL DEFAULT ((0)) ,
[provsefintshare] numeric(16,2) NULL DEFAULT ((0)) ,
[provsefshareacctid] varchar(50) NULL ,
[provsefintshareacctid] varchar(50) NULL ,
[municipalityintshare] numeric(16,2) NULL DEFAULT ((0)) ,
[municipalitysefshare] numeric(16,2) NULL DEFAULT ((0)) ,
[municipalitysefintshare] numeric(16,2) NULL DEFAULT ((0)) ,
[municipalityshareacctid] varchar(50) NULL ,
[municipalityintshareacctid] varchar(50) NULL ,
[municipalitysefshareacctid] varchar(50) NULL ,
[municipalitysefintshareacctid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for rptledgerfaas
-- ----------------------------
CREATE TABLE [rptledgerfaas] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[faasid] varchar(50) NULL DEFAULT NULL ,
[tdno] varchar(25) NOT NULL ,
[txntype_objid] varchar(10) NULL ,
[classification_objid] varchar(50) NULL ,
[actualuse_objid] varchar(50) NULL ,
[taxable] int NOT NULL ,
[backtax] int NOT NULL ,
[fromyear] int NOT NULL ,
[fromqtr] int NOT NULL ,
[toyear] int NOT NULL ,
[toqtr] int NOT NULL ,
[assessedvalue] numeric(16,2) NOT NULL ,
[systemcreated] int NOT NULL ,
[reclassed] int NULL 
)


GO

-- ----------------------------
-- Table structure for rptparameter
-- ----------------------------
CREATE TABLE [rptparameter] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[name] varchar(100) NOT NULL ,
[caption] varchar(100) NOT NULL ,
[description] varchar(1000) NULL DEFAULT NULL ,
[paramtype] varchar(20) NOT NULL ,
[minvalue] numeric(10,2) NOT NULL ,
[maxvalue] numeric(10,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rptreceipt_capture
-- ----------------------------
CREATE TABLE [rptreceipt_capture] (
[objid] varchar(100) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[receiptno] varchar(25) NOT NULL ,
[receiptdate] date NOT NULL ,
[payorid] varchar(50) NULL ,
[paidby_name] text NOT NULL ,
[paidby_address] varchar(150) NOT NULL ,
[collector] varchar(100) NOT NULL ,
[amount] decimal(12,2) NOT NULL ,
[postedby] varchar(100) NOT NULL ,
[postedbytitle] varchar(50) NOT NULL ,
[dtposted] datetime NOT NULL ,
[paidby] varchar(50) NOT NULL ,
[fromyear] int NOT NULL ,
[fromqtr] int NOT NULL ,
[toyear] int NOT NULL ,
[toqtr] int NOT NULL ,
[period] varchar(50) NOT NULL ,
[basic] decimal(12,2) NOT NULL ,
[basicint] decimal(12,2) NOT NULL ,
[basicdisc] decimal(12,2) NOT NULL ,
[sef] decimal(12,2) NOT NULL ,
[sefint] decimal(12,2) NOT NULL ,
[sefdisc] decimal(12,2) NOT NULL ,
[firecode] decimal(12,2) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpttask
-- ----------------------------
CREATE TABLE [rpttask] (
[taskid] varchar(50) NOT NULL ,
[objid] varchar(50) NOT NULL ,
[action] varchar(50) NOT NULL ,
[refno] varchar(50) NOT NULL ,
[filetype] varchar(50) NOT NULL ,
[msg] varchar(100) NULL ,
[startdate] datetime NOT NULL ,
[enddate] datetime NULL ,
[createdby_objid] varchar(50) NOT NULL ,
[createdby_name] varchar(150) NOT NULL ,
[createdby_title] varchar(50) NULL ,
[assignedto_objid] varchar(50) NULL ,
[assignedto_name] varchar(150) NULL ,
[assignedto_title] varchar(50) NULL ,
[workflowid] varchar(50) NULL ,
[signatory] varchar(50) NULL ,
[docname] varchar(50) NULL ,
[status] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for rpttaxclearance
-- ----------------------------
CREATE TABLE [rpttaxclearance] (
[objid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[qtr] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpttaxincentive
-- ----------------------------
CREATE TABLE [rpttaxincentive] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[txnno] varchar(25) NULL ,
[txndate] date NULL ,
[taxpayer_objid] varchar(50) NOT NULL ,
[taxpayer_name] text NOT NULL ,
[taxpayer_address] varchar(150) NOT NULL ,
[name] varchar(100) NOT NULL ,
[remarks] varchar(250) NOT NULL ,
[createdby_objid] varchar(50) NOT NULL ,
[createdby_name] varchar(100) NOT NULL ,
[createdby_title] varchar(50) NOT NULL ,
[createdby_date] datetime NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpttaxincentive_item
-- ----------------------------
CREATE TABLE [rpttaxincentive_item] (
[objid] varchar(50) NOT NULL ,
[rpttaxincentiveid] varchar(50) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[fromyear] int NOT NULL ,
[toyear] int NOT NULL ,
[basicrate] int NOT NULL ,
[sefrate] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpttracking
-- ----------------------------
CREATE TABLE [rpttracking] (
[objid] varchar(50) NOT NULL ,
[filetype] varchar(50) NOT NULL ,
[trackingno] varchar(25) NOT NULL ,
[msg] varchar(150) NULL 
)


GO

-- ----------------------------
-- Table structure for rptvariable
-- ----------------------------
CREATE TABLE [rptvariable] (
[objid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rptworkflow
-- ----------------------------
CREATE TABLE [rptworkflow] (
[objid] varchar(50) NOT NULL ,
[name] varchar(100) NULL ,
[appliedto] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rptworkflow_state
-- ----------------------------
CREATE TABLE [rptworkflow_state] (
[objid] varchar(50) NOT NULL ,
[workflowid] varchar(50) NOT NULL ,
[fromstate] varchar(50) NULL ,
[tostate] varchar(50) NULL ,
[type] varchar(50) NOT NULL ,
[active] int NOT NULL ,
[signatory] varchar(50) NULL ,
[message] varchar(100) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rpu
-- ----------------------------
CREATE TABLE [rpu] (
[objid] varchar(50) NOT NULL ,
[state] varchar(25) NOT NULL ,
[realpropertyid] varchar(50) NULL ,
[rputype] varchar(10) NOT NULL ,
[ry] int NOT NULL ,
[fullpin] varchar(30) NULL ,
[suffix] int NOT NULL ,
[subsuffix] int NULL DEFAULT NULL ,
[classification_objid] varchar(50) NULL ,
[exemptiontype_objid] varchar(50) NULL ,
[taxable] int NOT NULL ,
[totalareaha] numeric(18,6) NOT NULL ,
[totalareasqm] numeric(18,6) NOT NULL ,
[totalbmv] numeric(16,2) NOT NULL ,
[totalmv] numeric(16,2) NOT NULL ,
[totalav] numeric(16,2) NOT NULL ,
[hasswornamount] int NOT NULL ,
[swornamount] numeric(16,2) NOT NULL ,
[useswornamount] int NOT NULL ,
[previd] varchar(50) NULL DEFAULT NULL ,
[rpumasterid] varchar(50) NULL DEFAULT NULL ,
[reclassed] int NULL 
)


GO

-- ----------------------------
-- Table structure for rpumaster
-- ----------------------------
CREATE TABLE [rpumaster] (
[objid] varchar(50) NOT NULL ,
[currentfaasid] varchar(50) NULL ,
[currentrpuid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for rysetting_lgu
-- ----------------------------
CREATE TABLE [rysetting_lgu] (
[rysettingid] varchar(50) NOT NULL ,
[lguid] varchar(50) NOT NULL ,
[lguname] varchar(100) NOT NULL ,
[settingtype] varchar(15) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for rysettinginfo
-- ----------------------------
CREATE TABLE [rysettinginfo] (
[ry] int NOT NULL ,
[ordinanceno] varchar(50) NULL ,
[ordinancedate] datetime NULL ,
[sangguniangname] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for signatory
-- ----------------------------
CREATE TABLE [signatory] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[doctype] varchar(50) NOT NULL ,
[indexno] int NOT NULL ,
[lastname] varchar(50) NOT NULL ,
[firstname] varchar(50) NOT NULL ,
[middlename] varchar(50) NULL DEFAULT NULL ,
[name] varchar(150) NULL DEFAULT NULL ,
[title] varchar(50) NOT NULL ,
[department] varchar(50) NULL DEFAULT NULL ,
[personnelid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sms_rpt_registration
-- ----------------------------
CREATE TABLE [sms_rpt_registration] (
[mobileno] varchar(25) NOT NULL ,
[rptledgerid] varchar(50) NOT NULL ,
[dtregistered] datetime NOT NULL 
)


GO

-- ----------------------------
-- Table structure for specialaccountsetting
-- ----------------------------
CREATE TABLE [specialaccountsetting] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[item_objid] varchar(50) NOT NULL DEFAULT '' ,
[amount] decimal(16,2) NOT NULL ,
[collectiontypeid] varchar(50) NOT NULL ,
[revtype] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for sreaccount
-- ----------------------------
CREATE TABLE [sreaccount] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[state] varchar(10) NULL ,
[chartid] varchar(50) NULL ,
[code] varchar(50) NULL ,
[title] varchar(255) NULL ,
[type] varchar(20) NULL ,
[acctgroup] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sreaccount_incometarget
-- ----------------------------
CREATE TABLE [sreaccount_incometarget] (
[objid] varchar(50) NOT NULL ,
[year] int NOT NULL ,
[target] decimal(18,2) NULL 
)


GO

-- ----------------------------
-- Table structure for stockissue
-- ----------------------------
CREATE TABLE [stockissue] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NULL ,
[request_objid] varchar(50) NULL ,
[request_reqno] varchar(50) NULL ,
[issueno] varchar(50) NULL ,
[dtfiled] datetime NULL ,
[reqtype] varchar(10) NULL ,
[user_objid] varchar(50) NULL ,
[user_name] varchar(100) NULL ,
[issueto_objid] varchar(50) NULL ,
[issueto_name] varchar(100) NULL ,
[issueto_title] varchar(50) NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL ,
[itemclass] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for stockissueitem
-- ----------------------------
CREATE TABLE [stockissueitem] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL ,
[item_objid] varchar(50) NULL ,
[item_code] varchar(50) NULL ,
[item_title] varchar(255) NULL ,
[unit] varchar(20) NULL ,
[qtyrequested] int NULL ,
[qtyissued] int NULL ,
[remarks] varchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for stockitem
-- ----------------------------
CREATE TABLE [stockitem] (
[objid] varchar(50) NOT NULL ,
[state] varchar(20) NULL ,
[code] varchar(20) NULL ,
[type] varchar(50) NULL ,
[itemclass] varchar(50) NULL ,
[title] varchar(150) NULL ,
[description] varchar(255) NULL ,
[baseunit] varchar(10) NULL ,
[defaultunit] varchar(10) NULL 
)


GO

-- ----------------------------
-- Table structure for stockitem_unit
-- ----------------------------
CREATE TABLE [stockitem_unit] (
[itemid] varchar(50) NOT NULL ,
[unit] varchar(10) NOT NULL ,
[qty] int NULL 
)


GO

-- ----------------------------
-- Table structure for stockreceipt
-- ----------------------------
CREATE TABLE [stockreceipt] (
[objid] varchar(50) NOT NULL ,
[receiptno] varchar(50) NULL ,
[state] varchar(50) NULL ,
[request_objid] varchar(50) NULL ,
[request_reqno] varchar(50) NULL ,
[dtfiled] datetime NULL ,
[reqtype] varchar(25) NULL ,
[user_objid] varchar(50) NULL ,
[user_name] varchar(100) NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL ,
[itemclass] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for stockreceiptitem
-- ----------------------------
CREATE TABLE [stockreceiptitem] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL ,
[item_objid] varchar(50) NULL ,
[item_code] varchar(50) NULL ,
[item_title] varchar(255) NULL ,
[unit] varchar(20) NULL ,
[qtyrequested] int NULL ,
[qtyreceived] int NULL ,
[remarks] varchar(255) NULL ,
[cost] decimal(10,2) NULL 
)


GO

-- ----------------------------
-- Table structure for stockrequest
-- ----------------------------
CREATE TABLE [stockrequest] (
[objid] varchar(50) NOT NULL ,
[reqno] varchar(20) NULL ,
[state] varchar(10) NULL ,
[dtfiled] datetime NULL ,
[reqtype] varchar(10) NULL ,
[itemclass] varchar(50) NULL ,
[requester_objid] varchar(50) NULL ,
[requester_name] varchar(50) NULL ,
[requester_title] varchar(50) NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL ,
[vendor] varchar(100) NULL 
)


GO

-- ----------------------------
-- Table structure for stockrequestitem
-- ----------------------------
CREATE TABLE [stockrequestitem] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[item_objid] varchar(50) NULL ,
[item_code] varchar(50) NULL ,
[item_title] varchar(255) NULL ,
[unit] varchar(10) NULL ,
[qty] int NULL ,
[qtyreceived] int NULL 
)


GO

-- ----------------------------
-- Table structure for stocksale
-- ----------------------------
CREATE TABLE [stocksale] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NULL ,
[request_objid] varchar(50) NULL ,
[request_reqno] varchar(50) NULL ,
[issueno] varchar(50) NULL ,
[dtfiled] datetime NULL ,
[reqtype] varchar(10) NULL ,
[user_objid] varchar(50) NULL ,
[user_name] varchar(100) NULL ,
[soldto_objid] varchar(50) NULL ,
[soldto_name] varchar(100) NULL ,
[soldto_title] varchar(50) NULL ,
[org_objid] varchar(50) NULL ,
[org_name] varchar(50) NULL ,
[itemclass] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for stocksaleitem
-- ----------------------------
CREATE TABLE [stocksaleitem] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NOT NULL ,
[item_objid] varchar(50) NULL ,
[item_code] varchar(50) NULL ,
[item_title] varchar(255) NULL ,
[unit] varchar(20) NULL ,
[qtyrequested] int NULL ,
[qtyissued] int NULL ,
[cost] decimal(10,2) NULL ,
[remarks] varchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for structure
-- ----------------------------
CREATE TABLE [structure] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NOT NULL ,
[code] varchar(20) NOT NULL ,
[name] varchar(100) NOT NULL ,
[indexno] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for structurematerial
-- ----------------------------
CREATE TABLE [structurematerial] (
[structure_objid] varchar(50) NOT NULL ,
[material_objid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for subcollector_remittance
-- ----------------------------
CREATE TABLE [subcollector_remittance] (
[objid] varchar(50) NOT NULL ,
[state] varchar(20) NOT NULL ,
[txnno] varchar(20) NOT NULL ,
[dtposted] datetime NOT NULL ,
[collector_objid] varchar(50) NOT NULL ,
[collector_name] varchar(100) NOT NULL ,
[collector_title] varchar(30) NOT NULL ,
[subcollector_objid] varchar(50) NOT NULL ,
[subcollector_name] varchar(100) NOT NULL ,
[subcollector_title] varchar(50) NULL ,
[amount] decimal(18,2) NOT NULL ,
[totalcash] numeric(12,2) NULL ,
[totalnoncash] numeric(12,2) NULL ,
[cashbreakdown] varchar(800) NULL ,
[collectionsummaries] text NULL 
)


GO

-- ----------------------------
-- Table structure for subcollector_remittance_cashreceipt
-- ----------------------------
CREATE TABLE [subcollector_remittance_cashreceipt] (
[objid] varchar(50) NOT NULL ,
[remittanceid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for subdividedland
-- ----------------------------
CREATE TABLE [subdividedland] (
[objid] varchar(50) NOT NULL ,
[subdivisionid] varchar(50) NOT NULL ,
[itemno] varchar(5) NOT NULL ,
[newtdno] varchar(25) NULL ,
[newutdno] varchar(25) NOT NULL ,
[newpin] varchar(25) NOT NULL ,
[newtitletype] varchar(25) NULL DEFAULT NULL ,
[newtitleno] varchar(25) NULL DEFAULT NULL ,
[newtitledate] datetime NULL DEFAULT NULL ,
[areasqm] numeric(16,2) NOT NULL ,
[areaha] numeric(16,6) NOT NULL ,
[memoranda] varchar(2000) NOT NULL ,
[administrator_objid] varchar(50) NULL DEFAULT NULL ,
[administrator_name] varchar(150) NULL DEFAULT NULL ,
[administrator_address] varchar(100) NULL DEFAULT NULL ,
[taxpayer_objid] varchar(50) NULL ,
[taxpayer_name] varchar(800) NULL ,
[taxpayer_address] varchar(100) NULL ,
[owner_name] varchar(800) NULL ,
[owner_address] varchar(100) NULL ,
[newrpid] varchar(50) NOT NULL ,
[newrpuid] varchar(50) NULL ,
[newfaasid] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for subdivision
-- ----------------------------
CREATE TABLE [subdivision] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NOT NULL ,
[ry] int NOT NULL ,
[txntype_objid] varchar(5) NOT NULL ,
[txnno] varchar(10) NOT NULL ,
[txndate] datetime NOT NULL ,
[autonumber] int NOT NULL ,
[effectivityyear] int NOT NULL ,
[effectivityqtr] int NOT NULL ,
[memoranda] varchar(2000) NOT NULL ,
[motherfaasid] varchar(50) NOT NULL ,
[lguid] varchar(50) NULL ,
[signatories] varchar(1000) NULL 
)


GO

-- ----------------------------
-- Table structure for subdivisionaffectedrpu
-- ----------------------------
CREATE TABLE [subdivisionaffectedrpu] (
[objid] varchar(50) NOT NULL ,
[subdivisionid] varchar(50) NOT NULL ,
[itemno] varchar(5) NULL ,
[subdividedlandid] varchar(50) NULL ,
[prevfaasid] varchar(50) NOT NULL ,
[newfaasid] varchar(50) NULL ,
[newtdno] varchar(25) NULL ,
[newutdno] varchar(25) NOT NULL ,
[newsuffix] int NOT NULL ,
[newpin] varchar(25) NULL ,
[newrpuid] varchar(50) NULL ,
[newrpid] varchar(50) NULL DEFAULT NULL ,
[memoranda] varchar(2000) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_dataset
-- ----------------------------
CREATE TABLE [sys_dataset] (
[objid] varchar(50) NOT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[title] varchar(255) NULL DEFAULT NULL ,
[input] text NULL ,
[output] text NULL ,
[statement] varchar(50) NULL DEFAULT NULL ,
[datasource] varchar(50) NULL DEFAULT NULL ,
[servicename] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
CREATE TABLE [sys_org] (
[objid] varchar(50) NOT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[orgclass] varchar(50) NULL DEFAULT NULL ,
[parent_objid] varchar(50) NULL DEFAULT NULL ,
[parent_orgclass] varchar(50) NULL DEFAULT NULL ,
[code] varchar(50) NULL ,
[root] int NOT NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Table structure for sys_orgclass
-- ----------------------------
CREATE TABLE [sys_orgclass] (
[name] varchar(50) NOT NULL ,
[title] varchar(255) NULL DEFAULT NULL ,
[parentclass] varchar(255) NULL ,
[handler] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_quarter
-- ----------------------------
CREATE TABLE [sys_quarter] (
[qtrid] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_report
-- ----------------------------
CREATE TABLE [sys_report] (
[objid] varchar(50) NOT NULL DEFAULT NULL ,
[reportfolderid] varchar(50) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[title] varchar(255) NULL DEFAULT NULL ,
[filetype] varchar(25) NULL DEFAULT NULL ,
[dtcreated] datetime NULL DEFAULT NULL ,
[createdby] varchar(50) NULL DEFAULT NULL ,
[datasetid] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_report_admin
-- ----------------------------
CREATE TABLE [sys_report_admin] (
[objid] varchar(50) NOT NULL ,
[userid] varchar(50) NULL DEFAULT NULL ,
[reportfolderid] varchar(50) NULL DEFAULT NULL ,
[exclude] text NULL 
)


GO

-- ----------------------------
-- Table structure for sys_report_folder
-- ----------------------------
CREATE TABLE [sys_report_folder] (
[objid] varchar(50) NOT NULL ,
[name] varchar(255) NULL DEFAULT NULL ,
[title] varchar(255) NULL DEFAULT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_report_member
-- ----------------------------
CREATE TABLE [sys_report_member] (
[objid] varchar(50) NOT NULL DEFAULT NULL ,
[reportfolderid] varchar(50) NULL DEFAULT NULL ,
[userid] varchar(50) NULL DEFAULT NULL ,
[usergroupid] varchar(50) NULL DEFAULT NULL ,
[exclude] text NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule
-- ----------------------------
CREATE TABLE [sys_rule] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[state] varchar(25) NULL DEFAULT NULL ,
[name] varchar(50) NOT NULL DEFAULT '' ,
[ruleset] varchar(50) NOT NULL ,
[rulegroup] varchar(50) NULL DEFAULT NULL ,
[title] varchar(250) NULL DEFAULT NULL ,
[description] text NULL ,
[salience] int NULL DEFAULT ('0') ,
[effectivefrom] date NULL DEFAULT NULL ,
[effectiveto] date NULL DEFAULT NULL ,
[dtfiled] datetime NULL DEFAULT NULL ,
[user_objid] varchar(50) NULL DEFAULT NULL ,
[user_name] varchar(100) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_action
-- ----------------------------
CREATE TABLE [sys_rule_action] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[actiondef_objid] varchar(50) NULL DEFAULT NULL ,
[actiondef_name] varchar(50) NULL DEFAULT NULL ,
[pos] int NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_action_param
-- ----------------------------
CREATE TABLE [sys_rule_action_param] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[actiondefparam_objid] varchar(50) NULL DEFAULT NULL ,
[stringvalue] varchar(255) NULL DEFAULT NULL ,
[booleanvalue] int NULL DEFAULT NULL ,
[var_objid] varchar(50) NULL DEFAULT NULL ,
[var_name] varchar(50) NULL DEFAULT NULL ,
[expr] text NULL ,
[exprtype] varchar(25) NULL DEFAULT NULL ,
[pos] int NULL DEFAULT NULL ,
[obj_key] varchar(50) NULL DEFAULT NULL ,
[obj_value] varchar(255) NULL DEFAULT NULL ,
[listvalue] text NULL ,
[lov] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_actiondef
-- ----------------------------
CREATE TABLE [sys_rule_actiondef] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[name] varchar(50) NOT NULL DEFAULT '' ,
[title] varchar(250) NULL DEFAULT NULL ,
[sortorder] int NULL DEFAULT NULL ,
[actionname] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_actiondef_param
-- ----------------------------
CREATE TABLE [sys_rule_actiondef_param] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[name] varchar(50) NOT NULL DEFAULT '' ,
[sortorder] int NULL DEFAULT NULL ,
[title] varchar(50) NULL DEFAULT NULL ,
[datatype] varchar(50) NULL DEFAULT NULL ,
[handler] varchar(50) NULL DEFAULT NULL ,
[lookuphandler] varchar(50) NULL DEFAULT NULL ,
[lookupkey] varchar(50) NULL DEFAULT NULL ,
[lookupvalue] varchar(50) NULL DEFAULT NULL ,
[vardatatype] varchar(50) NULL DEFAULT NULL ,
[lovname] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_condition
-- ----------------------------
CREATE TABLE [sys_rule_condition] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL ,
[fact_name] varchar(50) NULL DEFAULT NULL ,
[fact_objid] varchar(50) NULL DEFAULT NULL ,
[varname] varchar(50) NULL DEFAULT NULL ,
[pos] int NULL DEFAULT NULL ,
[ruletext] text NULL ,
[displaytext] text NULL ,
[dynamic_datatype] varchar(50) NULL ,
[dynamic_key] varchar(50) NULL ,
[dynamic_value] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_condition_constraint
-- ----------------------------
CREATE TABLE [sys_rule_condition_constraint] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[field_objid] varchar(50) NULL DEFAULT NULL ,
[fieldname] varchar(50) NULL DEFAULT NULL ,
[varname] varchar(50) NULL DEFAULT NULL ,
[operator_caption] varchar(50) NULL DEFAULT NULL ,
[operator_symbol] varchar(50) NULL DEFAULT NULL ,
[usevar] int NULL DEFAULT NULL ,
[var_objid] varchar(50) NULL DEFAULT NULL ,
[var_name] varchar(50) NULL DEFAULT NULL ,
[decimalvalue] decimal(16,2) NULL DEFAULT NULL ,
[intvalue] int NULL DEFAULT NULL ,
[stringvalue] varchar(255) NULL DEFAULT NULL ,
[listvalue] text NULL ,
[datevalue] date NULL ,
[pos] int NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_condition_var
-- ----------------------------
CREATE TABLE [sys_rule_condition_var] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[ruleid] varchar(50) NULL DEFAULT NULL ,
[varname] varchar(50) NULL DEFAULT NULL ,
[datatype] varchar(50) NULL DEFAULT NULL ,
[pos] int NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_deployed
-- ----------------------------
CREATE TABLE [sys_rule_deployed] (
[objid] varchar(50) NOT NULL DEFAULT '' ,
[ruletext] text NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_fact
-- ----------------------------
CREATE TABLE [sys_rule_fact] (
[objid] varchar(50) NOT NULL ,
[name] varchar(50) NOT NULL DEFAULT '' ,
[title] varchar(160) NULL DEFAULT NULL ,
[factclass] varchar(50) NULL DEFAULT NULL ,
[sortorder] int NULL DEFAULT NULL ,
[handler] varchar(50) NULL DEFAULT NULL ,
[defaultvarname] varchar(25) NULL DEFAULT NULL ,
[dynamic] int NULL ,
[lookuphandler] varchar(50) NULL ,
[lookupkey] varchar(50) NULL ,
[lookupvalue] varchar(50) NULL ,
[lookupdatatype] varchar(50) NULL ,
[dynamicfieldname] varchar(50) NULL ,
[builtinconstraints] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rule_fact_field
-- ----------------------------
CREATE TABLE [sys_rule_fact_field] (
[objid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[name] varchar(50) NOT NULL DEFAULT '' ,
[title] varchar(160) NULL DEFAULT NULL ,
[datatype] varchar(50) NULL DEFAULT NULL ,
[sortorder] int NULL DEFAULT NULL ,
[handler] varchar(50) NULL DEFAULT NULL ,
[lookuphandler] varchar(50) NULL DEFAULT NULL ,
[lookupkey] varchar(50) NULL DEFAULT NULL ,
[lookupvalue] varchar(50) NULL DEFAULT NULL ,
[lookupdatatype] varchar(50) NULL DEFAULT NULL ,
[multivalued] int NULL DEFAULT NULL ,
[required] int NULL DEFAULT NULL ,
[vardatatype] varchar(50) NULL DEFAULT NULL ,
[lovname] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_rulegroup
-- ----------------------------
CREATE TABLE [sys_rulegroup] (
[name] varchar(50) NOT NULL ,
[ruleset] varchar(50) NOT NULL ,
[title] varchar(160) NULL DEFAULT NULL ,
[sortorder] int NULL DEFAULT ('0') 
)


GO

-- ----------------------------
-- Table structure for sys_ruleset
-- ----------------------------
CREATE TABLE [sys_ruleset] (
[name] varchar(50) NOT NULL ,
[title] varchar(160) NULL DEFAULT NULL ,
[packagename] varchar(50) NULL DEFAULT NULL ,
[domain] varchar(50) NULL DEFAULT NULL ,
[role] varchar(50) NULL DEFAULT NULL ,
[permission] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_ruleset_actiondef
-- ----------------------------
CREATE TABLE [sys_ruleset_actiondef] (
[ruleset] varchar(50) NOT NULL ,
[actiondef] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_ruleset_fact
-- ----------------------------
CREATE TABLE [sys_ruleset_fact] (
[ruleset] varchar(50) NOT NULL ,
[rulefact] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_script
-- ----------------------------
CREATE TABLE [sys_script] (
[name] varchar(50) NOT NULL ,
[title] varbinary(255) NULL DEFAULT NULL ,
[content] text NULL ,
[category] varchar(20) NULL DEFAULT NULL ,
[dtcreated] datetime NULL DEFAULT NULL ,
[createdby] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_securitygroup
-- ----------------------------
CREATE TABLE [sys_securitygroup] (
[objid] varchar(50) NOT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[usergroup_objid] varchar(50) NULL DEFAULT NULL ,
[exclude] text NULL 
)


GO

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
CREATE TABLE [sys_sequence] (
[objid] varchar(100) NOT NULL ,
[nextSeries] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
CREATE TABLE [sys_session] (
[sessionid] varchar(50) NOT NULL ,
[userid] varchar(50) NULL DEFAULT NULL ,
[username] varchar(50) NULL DEFAULT NULL ,
[clienttype] varchar(12) NULL DEFAULT NULL ,
[accesstime] datetime NULL DEFAULT NULL ,
[accessexpiry] datetime NULL DEFAULT NULL ,
[timein] datetime NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_session_log
-- ----------------------------
CREATE TABLE [sys_session_log] (
[sessionid] varchar(50) NOT NULL ,
[userid] varchar(50) NULL DEFAULT NULL ,
[username] varchar(50) NULL DEFAULT NULL ,
[clienttype] varchar(12) NULL DEFAULT NULL ,
[accesstime] datetime NULL DEFAULT NULL ,
[accessexpiry] datetime NULL DEFAULT NULL ,
[timein] datetime NULL DEFAULT NULL ,
[timeout] datetime NULL DEFAULT NULL ,
[state] varchar(10) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_terminal
-- ----------------------------
CREATE TABLE [sys_terminal] (
[terminalid] varchar(50) NOT NULL ,
[parentid] varchar(50) NULL DEFAULT NULL ,
[parentcode] varchar(50) NULL DEFAULT NULL ,
[parenttype] varchar(50) NULL DEFAULT NULL ,
[macaddress] varchar(50) NULL ,
[dtregistered] datetime NULL DEFAULT NULL ,
[registeredby] varchar(50) NULL DEFAULT NULL ,
[info] text NULL ,
[state] int NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
CREATE TABLE [sys_user] (
[objid] varchar(50) NOT NULL ,
[state] varchar(15) NULL DEFAULT NULL ,
[dtcreated] datetime NULL DEFAULT NULL ,
[createdby] varchar(50) NULL DEFAULT NULL ,
[username] varchar(50) NULL DEFAULT NULL ,
[pwd] varchar(50) NULL DEFAULT NULL ,
[firstname] varchar(50) NULL DEFAULT NULL ,
[lastname] varchar(50) NULL DEFAULT NULL ,
[middlename] varchar(50) NULL DEFAULT NULL ,
[name] varchar(50) NULL DEFAULT NULL ,
[jobtitle] varchar(50) NULL DEFAULT NULL ,
[pwdlogincount] int NULL DEFAULT NULL ,
[pwdexpirydate] datetime NULL ,
[usedpwds] text NULL ,
[lockid] varchar(32) NULL DEFAULT NULL ,
[txncode] varchar(10) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_usergroup
-- ----------------------------
CREATE TABLE [sys_usergroup] (
[objid] varchar(50) NOT NULL ,
[title] varchar(255) NULL DEFAULT NULL ,
[domain] varchar(25) NULL DEFAULT NULL ,
[userclass] varchar(25) NULL DEFAULT NULL ,
[orgclass] varchar(50) NULL DEFAULT NULL ,
[role] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_usergroup_admin
-- ----------------------------
CREATE TABLE [sys_usergroup_admin] (
[objid] varchar(50) NOT NULL ,
[usergroupid] varchar(50) NULL DEFAULT NULL ,
[user_objid] varchar(50) NULL DEFAULT NULL ,
[user_username] varchar(50) NULL DEFAULT NULL ,
[user_firstname] varchar(50) NOT NULL ,
[user_lastname] varchar(50) NULL DEFAULT NULL ,
[exclude] varchar(255) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_usergroup_member
-- ----------------------------
CREATE TABLE [sys_usergroup_member] (
[objid] varchar(50) NOT NULL ,
[state] varchar(10) NULL DEFAULT NULL ,
[usergroup_objid] varchar(50) NULL DEFAULT NULL ,
[user_objid] varchar(50) NOT NULL ,
[user_username] varchar(50) NULL DEFAULT NULL ,
[user_firstname] varchar(50) NOT NULL ,
[user_lastname] varchar(50) NOT NULL ,
[org_objid] varchar(50) NULL DEFAULT NULL ,
[org_name] varchar(50) NULL DEFAULT NULL ,
[org_orgclass] varchar(50) NULL DEFAULT NULL ,
[securitygroup_objid] varchar(50) NULL DEFAULT NULL ,
[exclude] varchar(255) NULL DEFAULT NULL ,
[displayname] varchar(50) NULL DEFAULT NULL ,
[jobtitle] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for sys_usergroup_permission
-- ----------------------------
CREATE TABLE [sys_usergroup_permission] (
[objid] varchar(50) NOT NULL ,
[usergroup_objid] varchar(50) NULL DEFAULT NULL ,
[object] varchar(25) NULL DEFAULT NULL ,
[permission] varchar(25) NULL DEFAULT NULL ,
[title] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for sys_var
-- ----------------------------
CREATE TABLE [sys_var] (
[name] varchar(50) NOT NULL ,
[value] text NULL ,
[description] varchar(255) NULL DEFAULT NULL ,
[datatype] varchar(15) NULL DEFAULT NULL ,
[category] varchar(50) NULL DEFAULT NULL 
)


GO

-- ----------------------------
-- Table structure for tbletracsaccountmapping
-- ----------------------------
CREATE TABLE [tbletracsaccountmapping] (
[taxfeeid] varchar(50) NOT NULL ,
[item_objid] varchar(50) NOT NULL ,
[item_code] varchar(50) NULL ,
[item_title] varchar(255) NULL ,
[fund_objid] varchar(50) NULL ,
[fund_code] varchar(50) NULL ,
[fund_title] varchar(50) NULL 
)


GO

-- ----------------------------
-- Table structure for tracs_cashreceipt
-- ----------------------------
CREATE TABLE [tracs_cashreceipt] (
[objid] varchar(50) NOT NULL ,
[formno] varchar(50) NOT NULL ,
[formtype] varchar(25) NOT NULL ,
[receiptno] varchar(50) NOT NULL ,
[receiptdate] datetime NOT NULL ,
[paidby] varchar(255) NOT NULL ,
[paidbyaddress] varchar(100) NULL ,
[amount] decimal(16,2) NOT NULL ,
[collector_objid] varchar(50) NOT NULL ,
[collector_name] varchar(100) NOT NULL ,
[collector_title] varchar(30) NOT NULL ,
[collectiontype_objid] varchar(50) NOT NULL ,
[collectiontype_name] varchar(100) NOT NULL ,
[remittanceid] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for tracs_cashreceiptitem
-- ----------------------------
CREATE TABLE [tracs_cashreceiptitem] (
[objid] varchar(50) NOT NULL ,
[receiptid] varchar(50) NULL ,
[item_objid] varchar(50) NULL ,
[item_code] varchar(255) NULL ,
[item_title] varchar(255) NULL ,
[amount] decimal(16,2) NULL ,
[barangayid] varchar(50) NULL ,
[lgushare] numeric(16,2) NULL ,
[brgyshare] numeric(16,2) NULL 
)


GO

-- ----------------------------
-- Table structure for tracs_remittance
-- ----------------------------
CREATE TABLE [tracs_remittance] (
[objid] varchar(50) NOT NULL ,
[txnno] varchar(20) NOT NULL ,
[dtposted] datetime NOT NULL ,
[collector_objid] varchar(50) NOT NULL ,
[collector_name] varchar(100) NOT NULL ,
[collector_title] varchar(30) NOT NULL ,
[amount] decimal(18,2) NOT NULL ,
[postedby] varchar(50) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for txnlog
-- ----------------------------
CREATE TABLE [txnlog] (
[objid] varchar(50) NOT NULL ,
[ref] varchar(100) NOT NULL ,
[refid] varchar(500) NOT NULL ,
[txndate] datetime NOT NULL ,
[action] varchar(50) NOT NULL ,
[userid] varchar(50) NOT NULL ,
[remarks] varchar(500) NULL DEFAULT NULL ,
[diff] text NULL ,
[username] varchar(150) NULL 
)


GO

-- ----------------------------
-- Table structure for txnref
-- ----------------------------
CREATE TABLE [txnref] (
[oid] int NOT NULL IDENTITY(1,1) NOT FOR REPLICATION ,
[objid] varchar(50) NOT NULL ,
[refid] varchar(50) NOT NULL ,
[msg] varchar(255) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[txnref]', RESEED, 22)
GO

-- ----------------------------
-- Table structure for txnsignatory
-- ----------------------------
CREATE TABLE [txnsignatory] (
[objid] varchar(50) NOT NULL ,
[refid] varchar(50) NOT NULL ,
[personnelid] varchar(50) NULL DEFAULT NULL ,
[type] varchar(25) NOT NULL ,
[caption] varchar(25) NULL DEFAULT NULL ,
[name] varchar(200) NULL ,
[title] varchar(50) NULL ,
[dtsigned] datetime NULL DEFAULT NULL ,
[seqno] int NOT NULL 
)


GO

-- ----------------------------
-- Table structure for workflowstate
-- ----------------------------
CREATE TABLE [workflowstate] (
[objid] varchar(50) NOT NULL ,
[state] varchar(50) NOT NULL ,
[txndate] datetime NULL ,
[userid] varchar(50) NULL ,
[username] varchar(100) NULL 
)


GO

-- ----------------------------
-- Indexes structure for table account
-- ----------------------------
CREATE INDEX [ix_parentid] ON [account]
([parentid] ASC) 
GO
CREATE INDEX [ix_title] ON [account]
([title] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table account
-- ----------------------------
ALTER TABLE [account] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table account
-- ----------------------------
ALTER TABLE [account] ADD UNIQUE ([code] ASC)
GO

-- ----------------------------
-- Indexes structure for table account_incometarget
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table account_incometarget
-- ----------------------------
ALTER TABLE [account_incometarget] ADD PRIMARY KEY ([objid], [year])
GO

-- ----------------------------
-- Indexes structure for table afserial
-- ----------------------------
CREATE INDEX [FK_stockitem_afserial_cashreceiptform] ON [afserial]
([objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table afserial
-- ----------------------------
ALTER TABLE [afserial] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table afserial_control
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table afserial_control
-- ----------------------------
ALTER TABLE [afserial_control] ADD PRIMARY KEY ([controlid])
GO

-- ----------------------------
-- Uniques structure for table afserial_control
-- ----------------------------
ALTER TABLE [afserial_control] ADD UNIQUE ([controlid] ASC, [txnmode] ASC, [assignee_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table afserial_inventory
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table afserial_inventory
-- ----------------------------
ALTER TABLE [afserial_inventory] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table afserial_inventory_detail
-- ----------------------------
CREATE INDEX [FK_afcontrol_detail_afcontrol] ON [afserial_inventory_detail]
([controlid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table afserial_inventory_detail
-- ----------------------------
ALTER TABLE [afserial_inventory_detail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table afserial_inventory_detail_cancelseries
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table afserial_inventory_detail_cancelseries
-- ----------------------------
ALTER TABLE [afserial_inventory_detail_cancelseries] ADD PRIMARY KEY ([objid], [series])
GO

-- ----------------------------
-- Indexes structure for table afserialcapture
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table afserialcapture
-- ----------------------------
ALTER TABLE [afserialcapture] ADD PRIMARY KEY ([controlid])
GO

-- ----------------------------
-- Indexes structure for table afstockcontrol
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table afstockcontrol
-- ----------------------------
ALTER TABLE [afstockcontrol] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ap
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ap
-- ----------------------------
ALTER TABLE [ap] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ap_detail
-- ----------------------------
CREATE INDEX [ap_detail_ap] ON [ap_detail]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ap_detail
-- ----------------------------
ALTER TABLE [ap_detail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ar
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ar
-- ----------------------------
ALTER TABLE [ar] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ar_detail
-- ----------------------------
CREATE INDEX [ar_detail_ar] ON [ar_detail]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ar_detail
-- ----------------------------
ALTER TABLE [ar_detail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table ar_detail
-- ----------------------------
ALTER TABLE [ar_detail] ADD UNIQUE ([txnrefno] ASC, [txnreftype] ASC)
GO

-- ----------------------------
-- Indexes structure for table assessmentnotice
-- ----------------------------
CREATE INDEX [ix_assessmentnotice_receivedby] ON [assessmentnotice]
([receivedby] ASC) 
GO
CREATE INDEX [ix_assessmentnotice_state] ON [assessmentnotice]
([state] ASC) 
GO
CREATE INDEX [ix_assessmentnotice_taxpayerid] ON [assessmentnotice]
([taxpayerid] ASC) 
GO
CREATE INDEX [ix_assessmentnotice_taxpayername] ON [assessmentnotice]
([taxpayername] ASC) 
GO
CREATE INDEX [ix_assessmentnotice_txnno] ON [assessmentnotice]
([txnno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table assessmentnotice
-- ----------------------------
ALTER TABLE [assessmentnotice] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table assessmentnoticeitem
-- ----------------------------
CREATE INDEX [FK_assessmentnoticeitem_assessmentnotice] ON [assessmentnoticeitem]
([assessmentnoticeid] ASC) 
GO
CREATE INDEX [FK_assessmentnoticeitem_faas] ON [assessmentnoticeitem]
([faasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table assessmentnoticeitem
-- ----------------------------
ALTER TABLE [assessmentnoticeitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bank
-- ----------------------------
CREATE INDEX [ix_bank_state] ON [bank]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bank
-- ----------------------------
ALTER TABLE [bank] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bank
-- ----------------------------
ALTER TABLE [bank] ADD UNIQUE ([code] ASC, [branchname] ASC)
GO
ALTER TABLE [bank] ADD UNIQUE ([name] ASC, [branchname] ASC)
GO

-- ----------------------------
-- Indexes structure for table bankaccount
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bankaccount
-- ----------------------------
ALTER TABLE [bankaccount] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bankaccount_account
-- ----------------------------
CREATE INDEX [FK_bankaccount_account_account] ON [bankaccount_account]
([acctid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bankaccount_account
-- ----------------------------
ALTER TABLE [bankaccount_account] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bankaccount_entry
-- ----------------------------
CREATE INDEX [bankaccount_parent] ON [bankaccount_entry]
([parentid] ASC) 
GO
CREATE INDEX [idx_bankaccount_refid] ON [bankaccount_entry]
([refid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bankaccount_entry
-- ----------------------------
ALTER TABLE [bankaccount_entry] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bankaccount_entry
-- ----------------------------
ALTER TABLE [bankaccount_entry] ADD UNIQUE ([parentid] ASC, [refid] ASC, [reftype] ASC)
GO
ALTER TABLE [bankaccount_entry] ADD UNIQUE ([parentid] ASC, [lineno] ASC)
GO

-- ----------------------------
-- Indexes structure for table bankdeposit
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bankdeposit
-- ----------------------------
ALTER TABLE [bankdeposit] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bankdeposit_entry
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bankdeposit_entry
-- ----------------------------
ALTER TABLE [bankdeposit_entry] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bankdeposit_entry
-- ----------------------------
ALTER TABLE [bankdeposit_entry] ADD UNIQUE ([parentid] ASC, [bankaccount_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table bankdeposit_entry_check
-- ----------------------------
CREATE INDEX [FK_bankdeposit_check] ON [bankdeposit_entry_check]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bankdeposit_entry_check
-- ----------------------------
ALTER TABLE [bankdeposit_entry_check] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bankdeposit_liquidation
-- ----------------------------
CREATE INDEX [FK_bankdeposit_liquidation] ON [bankdeposit_liquidation]
([bankdepositid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bankdeposit_liquidation
-- ----------------------------
ALTER TABLE [bankdeposit_liquidation] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table barangay
-- ----------------------------
CREATE INDEX [ix_lgu_barangay_indexno] ON [barangay]
([indexno] ASC) 
GO
CREATE INDEX [ix_lgu_barangay_parentid] ON [barangay]
([parentid] ASC) 
GO
CREATE INDEX [ix_lgu_barangay_previd] ON [barangay]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table barangay
-- ----------------------------
ALTER TABLE [barangay] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table barangay
-- ----------------------------
ALTER TABLE [barangay] ADD UNIQUE ([name] ASC)
GO
ALTER TABLE [barangay] ADD UNIQUE ([name] ASC, [state] ASC)
GO

-- ----------------------------
-- Indexes structure for table batchcapture_collection
-- ----------------------------
CREATE INDEX [ix_batchcapture_collection_capturedbyname] ON [batchcapture_collection]
([capturedby_name] ASC) 
GO
CREATE INDEX [ix_batchcapture_collection_collectorname] ON [batchcapture_collection]
([collector_name] ASC) 
GO
CREATE INDEX [ix_batchcapture_collection_txndate] ON [batchcapture_collection]
([txndate] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table batchcapture_collection
-- ----------------------------
ALTER TABLE [batchcapture_collection] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table batchcapture_collection_entry
-- ----------------------------
CREATE INDEX [ix_batchcapture_collection_entry_parentid] ON [batchcapture_collection_entry]
([parentid] ASC) 
GO
CREATE INDEX [ix_batchcapture_collection_entry_receiptdate] ON [batchcapture_collection_entry]
([receiptdate] ASC) 
GO
CREATE INDEX [ix_batchcapture_collection_entry_receiptno] ON [batchcapture_collection_entry]
([receiptno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table batchcapture_collection_entry
-- ----------------------------
ALTER TABLE [batchcapture_collection_entry] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table batchcapture_collection_entry_item
-- ----------------------------
CREATE INDEX [ix_batchcapture_collection_entry_item_item_code] ON [batchcapture_collection_entry_item]
([item_code] ASC) 
GO
CREATE INDEX [ix_batchcapture_collection_entry_item_parentid] ON [batchcapture_collection_entry_item]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table batchcapture_collection_entry_item
-- ----------------------------
ALTER TABLE [batchcapture_collection_entry_item] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table batchgrerror
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table batchgrerror
-- ----------------------------
ALTER TABLE [batchgrerror] ADD PRIMARY KEY ([faasid])
GO

-- ----------------------------
-- Indexes structure for table bldgadditionalitem
-- ----------------------------
CREATE INDEX [FK_bldgadditionalitem] ON [bldgadditionalitem]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [bldgadditionalitem]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgadditionalitem
-- ----------------------------
ALTER TABLE [bldgadditionalitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgadditionalitem
-- ----------------------------
ALTER TABLE [bldgadditionalitem] ADD UNIQUE ([bldgrysettingid] ASC, [code] ASC)
GO
ALTER TABLE [bldgadditionalitem] ADD UNIQUE ([bldgrysettingid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgassesslevel
-- ----------------------------
CREATE INDEX [FK_bldgassesslevel_bldgrysettingid] ON [bldgassesslevel]
([bldgrysettingid] ASC) 
GO
CREATE INDEX [FK_bldgassesslevel_propertyclassification] ON [bldgassesslevel]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_previd] ON [bldgassesslevel]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgassesslevel
-- ----------------------------
ALTER TABLE [bldgassesslevel] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgassesslevel
-- ----------------------------
ALTER TABLE [bldgassesslevel] ADD UNIQUE ([bldgrysettingid] ASC, [name] ASC)
GO
ALTER TABLE [bldgassesslevel] ADD UNIQUE ([bldgrysettingid] ASC, [code] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgassesslevelrange
-- ----------------------------
CREATE INDEX [FK_bldgassesslevelrange_bldgrysetting] ON [bldgassesslevelrange]
([bldgrysettingid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgassesslevelrange
-- ----------------------------
ALTER TABLE [bldgassesslevelrange] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgassesslevelrange
-- ----------------------------
ALTER TABLE [bldgassesslevelrange] ADD UNIQUE ([bldgassesslevelid] ASC, [mvfrom] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgfloor
-- ----------------------------
CREATE INDEX [FK_bldgfloor_bldgrpu] ON [bldgfloor]
([bldgrpuid] ASC) 
GO
CREATE INDEX [FK_bldgfloor_bldguse] ON [bldgfloor]
([bldguseid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgfloor
-- ----------------------------
ALTER TABLE [bldgfloor] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bldgflooradditional
-- ----------------------------
CREATE INDEX [FK_bldgflooradditional_additionalitem] ON [bldgflooradditional]
([additionalitem_objid] ASC) 
GO
CREATE INDEX [FK_bldgflooradditional_bldgfloor] ON [bldgflooradditional]
([bldgfloorid] ASC) 
GO
CREATE INDEX [FK_bldgflooradditional_bldgrpu] ON [bldgflooradditional]
([bldgrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgflooradditional
-- ----------------------------
ALTER TABLE [bldgflooradditional] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bldgflooradditionalparam
-- ----------------------------
CREATE INDEX [FK_bldgflooradditionalparam_bldgflooradditional] ON [bldgflooradditionalparam]
([bldgflooradditionalid] ASC) 
GO
CREATE INDEX [FK_bldgflooradditionalparam_bldgrpu] ON [bldgflooradditionalparam]
([bldgrpuid] ASC) 
GO
CREATE INDEX [FK_bldgflooradditionalparam_param] ON [bldgflooradditionalparam]
([param_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgflooradditionalparam
-- ----------------------------
ALTER TABLE [bldgflooradditionalparam] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bldgkind
-- ----------------------------
CREATE INDEX [ix_bldgkind_state] ON [bldgkind]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgkind
-- ----------------------------
ALTER TABLE [bldgkind] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgkind
-- ----------------------------
ALTER TABLE [bldgkind] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [bldgkind] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgkindbucc
-- ----------------------------
CREATE INDEX [FK_bldgkindbucc_bldgkind] ON [bldgkindbucc]
([bldgkind_objid] ASC) 
GO
CREATE INDEX [FK_bldgkindbucc_bldgkindbucc] ON [bldgkindbucc]
([previd] ASC) 
GO
CREATE INDEX [FK_bldgkindbucc_bldgtype] ON [bldgkindbucc]
([bldgtypeid] ASC) 
GO
CREATE INDEX [ix_previd] ON [bldgkindbucc]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgkindbucc
-- ----------------------------
ALTER TABLE [bldgkindbucc] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgkindbucc
-- ----------------------------
ALTER TABLE [bldgkindbucc] ADD UNIQUE ([bldgrysettingid] ASC, [bldgtypeid] ASC, [bldgkind_objid] ASC, [bldgclass] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgrpu
-- ----------------------------
CREATE INDEX [FK_bldgrpu_bldgassesslevel] ON [bldgrpu]
([bldgassesslevel_objid] ASC) 
GO
CREATE INDEX [FK_bldgrpu_bldgkindbucc] ON [bldgrpu]
([bldgkindbucc_objid] ASC) 
GO
CREATE INDEX [FK_bldgrpu_bldgtype] ON [bldgrpu]
([bldgtype_objid] ASC) 
GO
CREATE INDEX [FK_bldgrpu_landrpu] ON [bldgrpu]
([landrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgrpu
-- ----------------------------
ALTER TABLE [bldgrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bldgrysetting
-- ----------------------------
CREATE INDEX [ix_bldgrysetting_previd] ON [bldgrysetting]
([previd] ASC) 
GO
CREATE INDEX [ix_bldgrysetting_state] ON [bldgrysetting]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgrysetting
-- ----------------------------
ALTER TABLE [bldgrysetting] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bldgstructure
-- ----------------------------
CREATE CLUSTERED INDEX [FK_bldgstructure_bldgrpu] ON [bldgstructure]
([bldgrpuid] ASC) 
GO
CREATE INDEX [FK_bldgstructure_material] ON [bldgstructure]
([material_objid] ASC) 
GO
CREATE INDEX [FK_bldgstructure_structure] ON [bldgstructure]
([structure_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgstructure
-- ----------------------------
ALTER TABLE [bldgstructure] ADD PRIMARY KEY NONCLUSTERED ([objid])
GO

-- ----------------------------
-- Indexes structure for table bldgtype
-- ----------------------------
CREATE INDEX [ix_previd] ON [bldgtype]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgtype
-- ----------------------------
ALTER TABLE [bldgtype] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgtype
-- ----------------------------
ALTER TABLE [bldgtype] ADD UNIQUE ([bldgrysettingid] ASC, [code] ASC)
GO
ALTER TABLE [bldgtype] ADD UNIQUE ([bldgrysettingid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgtype_depreciation
-- ----------------------------
CREATE INDEX [FK_bldgtype_depreciation_bldgrysetting] ON [bldgtype_depreciation]
([bldgrysettingid] ASC) 
GO
CREATE INDEX [ix_bldgtypeid] ON [bldgtype_depreciation]
([bldgtypeid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgtype_depreciation
-- ----------------------------
ALTER TABLE [bldgtype_depreciation] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgtype_depreciation
-- ----------------------------
ALTER TABLE [bldgtype_depreciation] ADD UNIQUE ([bldgtypeid] ASC, [bldgrysettingid] ASC, [agefrom] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldgtype_storeyadjustment
-- ----------------------------
CREATE INDEX [FK_bldgtype_storeyadjustment] ON [bldgtype_storeyadjustment]
([previd] ASC) 
GO
CREATE INDEX [FK_bldgtype_storeyadjustment_bldgrysetting] ON [bldgtype_storeyadjustment]
([bldgrysettingid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldgtype_storeyadjustment
-- ----------------------------
ALTER TABLE [bldgtype_storeyadjustment] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table bldgtype_storeyadjustment
-- ----------------------------
ALTER TABLE [bldgtype_storeyadjustment] ADD UNIQUE ([bldgtypeid] ASC, [bldgrysettingid] ASC, [floorno] ASC)
GO

-- ----------------------------
-- Indexes structure for table bldguse
-- ----------------------------
CREATE INDEX [FK_bldguse_bldgassesslevel] ON [bldguse]
([actualuse_objid] ASC) 
GO
CREATE INDEX [FK_bldguse_bldgrpu] ON [bldguse]
([bldgrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table bldguse
-- ----------------------------
ALTER TABLE [bldguse] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bpapplication
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bpapplication
-- ----------------------------
ALTER TABLE [bpapplication] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bpapplication_requirement
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bpapplication_requirement
-- ----------------------------
ALTER TABLE [bpapplication_requirement] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bpapplication_task
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bpapplication_task
-- ----------------------------
ALTER TABLE [bpapplication_task] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bpexpirydate
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bpexpirydate
-- ----------------------------
ALTER TABLE [bpexpirydate] ADD PRIMARY KEY ([year], [qtr])
GO

-- ----------------------------
-- Indexes structure for table bppayment
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bppayment
-- ----------------------------
ALTER TABLE [bppayment] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bppayment_item
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bppayment_item
-- ----------------------------
ALTER TABLE [bppayment_item] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table bpreceivable
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bpreceivable
-- ----------------------------
ALTER TABLE [bpreceivable] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table brgy_taxaccount_mapping
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table brgy_taxaccount_mapping
-- ----------------------------
ALTER TABLE [brgy_taxaccount_mapping] ADD PRIMARY KEY ([barangayid])
GO

-- ----------------------------
-- Indexes structure for table brgyshare
-- ----------------------------
CREATE INDEX [ix_brgyshare_state] ON [brgyshare]
([state] ASC) 
GO
CREATE INDEX [ix_brgyshare_yq] ON [brgyshare]
([year] ASC) 
GO
CREATE INDEX [ix_brgyshare_yqm] ON [brgyshare]
([year] ASC, [month] ASC) 
GO
CREATE INDEX [ix_brgyshare_yr] ON [brgyshare]
([year] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table brgyshare
-- ----------------------------
ALTER TABLE [brgyshare] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table brgyshare
-- ----------------------------
ALTER TABLE [brgyshare] ADD UNIQUE ([year] ASC, [month] ASC)
GO

-- ----------------------------
-- Indexes structure for table brgyshareitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table brgyshareitem
-- ----------------------------
ALTER TABLE [brgyshareitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table brgyshareitem
-- ----------------------------
ALTER TABLE [brgyshareitem] ADD UNIQUE ([brgyshareid] ASC, [barangayid] ASC)
GO

-- ----------------------------
-- Indexes structure for table business
-- ----------------------------
CREATE UNIQUE INDEX [UIX_business_bin] ON [business]
([bin] ASC) 
WITH (IGNORE_DUP_KEY = ON)
GO

-- ----------------------------
-- Primary Key structure for table business
-- ----------------------------
ALTER TABLE [business] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_assessment_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_assessment_info
-- ----------------------------
ALTER TABLE [business_assessment_info] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_changeinfo
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_changeinfo
-- ----------------------------
ALTER TABLE [business_changeinfo] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_cityengineer
-- ----------------------------
CREATE UNIQUE INDEX [UIX_business_cityengineer_businessid] ON [business_cityengineer]
([businessid] ASC) 
WITH (IGNORE_DUP_KEY = ON)
GO

-- ----------------------------
-- Primary Key structure for table business_cityengineer
-- ----------------------------
ALTER TABLE [business_cityengineer] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_cityengineer_fee
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_cityengineer_fee
-- ----------------------------
ALTER TABLE [business_cityengineer_fee] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_info
-- ----------------------------
ALTER TABLE [business_info] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_lob
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_lob
-- ----------------------------
ALTER TABLE [business_lob] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_taxcredit
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_taxcredit
-- ----------------------------
ALTER TABLE [business_taxcredit] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table business_taxcredit_detail
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table business_taxcredit_detail
-- ----------------------------
ALTER TABLE [business_taxcredit_detail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table businesspermit
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table businesspermit
-- ----------------------------
ALTER TABLE [businesspermit] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table businessrequirement
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table businessrequirement
-- ----------------------------
ALTER TABLE [businessrequirement] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table businessvariable
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table businessvariable
-- ----------------------------
ALTER TABLE [businessvariable] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cancelannotation
-- ----------------------------
CREATE INDEX [FK_cancelannotation_faasannotation] ON [cancelannotation]
([annotationid] ASC) 
GO
CREATE INDEX [ix_cancelannotation_fileno] ON [cancelannotation]
([fileno] ASC) 
GO
CREATE INDEX [ix_cancelannotation_txnno] ON [cancelannotation]
([txnno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cancelannotation
-- ----------------------------
ALTER TABLE [cancelannotation] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cancelledfaas
-- ----------------------------
CREATE INDEX [FK_cancelledfaas_faas] ON [cancelledfaas]
([faasid] ASC) 
GO
CREATE INDEX [FK_cancelledfaas_reason] ON [cancelledfaas]
([reason_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cancelledfaas
-- ----------------------------
ALTER TABLE [cancelledfaas] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table canceltdreason
-- ----------------------------
CREATE INDEX [ix_canceltdreason_state] ON [canceltdreason]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table canceltdreason
-- ----------------------------
ALTER TABLE [canceltdreason] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table canceltdreason
-- ----------------------------
ALTER TABLE [canceltdreason] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [canceltdreason] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table cashbook
-- ----------------------------
CREATE INDEX [FK_cashbook_fund] ON [cashbook]
([fund_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashbook
-- ----------------------------
ALTER TABLE [cashbook] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table cashbook
-- ----------------------------
ALTER TABLE [cashbook] ADD UNIQUE ([subacct_objid] ASC, [fund_objid] ASC, [type] ASC)
GO

-- ----------------------------
-- Indexes structure for table cashbook_entry
-- ----------------------------
CREATE INDEX [cashbook_parent] ON [cashbook_entry]
([parentid] ASC) 
GO
CREATE INDEX [idx_refid] ON [cashbook_entry]
([refid] ASC) 
GO
CREATE INDEX [uix_parent_refid_reftype] ON [cashbook_entry]
([parentid] ASC, [refid] ASC, [reftype] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashbook_entry
-- ----------------------------
ALTER TABLE [cashbook_entry] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table cashbook_entry
-- ----------------------------
ALTER TABLE [cashbook_entry] ADD UNIQUE ([parentid] ASC, [lineno] ASC)
GO

-- ----------------------------
-- Indexes structure for table cashreceipt
-- ----------------------------
CREATE INDEX [FK_cashereceipt_userid] ON [cashreceipt]
([user_objid] ASC) 
GO
CREATE INDEX [FK_cashreceipt_afcontrol] ON [cashreceipt]
([controlid] ASC) 
GO
CREATE INDEX [ix_collectorid] ON [cashreceipt]
([collector_objid] ASC) 
GO
CREATE INDEX [ix_collectorname] ON [cashreceipt]
([collector_name] ASC) 
GO
CREATE INDEX [ix_receiptno] ON [cashreceipt]
([receiptno] ASC) 
GO
CREATE INDEX [ix_state] ON [cashreceipt]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceipt
-- ----------------------------
ALTER TABLE [cashreceipt] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_burial
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_burial
-- ----------------------------
ALTER TABLE [cashreceipt_burial] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_business
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_business
-- ----------------------------
ALTER TABLE [cashreceipt_business] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_business_item
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_business_item
-- ----------------------------
ALTER TABLE [cashreceipt_business_item] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_cancelseries
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_cancelseries
-- ----------------------------
ALTER TABLE [cashreceipt_cancelseries] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_cashticket
-- ----------------------------
CREATE INDEX [FK_cashreceipt_cashticket_cashreceipt] ON [cashreceipt_cashticket]
([objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceipt_cashticket
-- ----------------------------
ALTER TABLE [cashreceipt_cashticket] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_ctc_corporate
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_ctc_corporate
-- ----------------------------
ALTER TABLE [cashreceipt_ctc_corporate] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_ctc_individual
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_ctc_individual
-- ----------------------------
ALTER TABLE [cashreceipt_ctc_individual] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_largecattleownership
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_largecattleownership
-- ----------------------------
ALTER TABLE [cashreceipt_largecattleownership] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_marriage
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_marriage
-- ----------------------------
ALTER TABLE [cashreceipt_marriage] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_rpt
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_rpt
-- ----------------------------
ALTER TABLE [cashreceipt_rpt] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_slaughter
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_slaughter
-- ----------------------------
ALTER TABLE [cashreceipt_slaughter] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipt_void
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipt_void
-- ----------------------------
ALTER TABLE [cashreceipt_void] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table cashreceipt_void
-- ----------------------------
ALTER TABLE [cashreceipt_void] ADD UNIQUE ([receiptid] ASC)
GO

-- ----------------------------
-- Indexes structure for table cashreceiptitem
-- ----------------------------
CREATE INDEX [FK_cashreceiptitem] ON [cashreceiptitem]
([receiptid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceiptitem
-- ----------------------------
ALTER TABLE [cashreceiptitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceiptitem_discount
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceiptitem_discount
-- ----------------------------
ALTER TABLE [cashreceiptitem_discount] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceiptitem_rpt
-- ----------------------------
CREATE INDEX [FK_rptreceiptitem_rptledger] ON [cashreceiptitem_rpt]
([rptledgerid] ASC) 
GO
CREATE INDEX [FK_rptreceiptitem_rptreceipt] ON [cashreceiptitem_rpt]
([rptreceiptid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceiptitem_rpt
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceiptitem_rpt_account
-- ----------------------------
CREATE INDEX [ix_rptbillledgeraccount_revenueitem] ON [cashreceiptitem_rpt_account]
([item_objid] ASC) 
GO
CREATE INDEX [FK_cashreceiptitemrptaccount_cashreceiptrpt] ON [cashreceiptitem_rpt_account]
([rptreceiptid] ASC) 
GO
CREATE INDEX [ix_cashreceiptitem_rpt_account_rptledger] ON [cashreceiptitem_rpt_account]
([rptledgerid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceiptitem_rpt_account
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt_account] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceiptitem_rpt_noledger
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceiptitem_rpt_noledger
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt_noledger] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceiptitem_rpt_online
-- ----------------------------
CREATE INDEX [ix_rptledgerbillitem_rptledgerfaasid] ON [cashreceiptitem_rpt_online]
([rptledgerfaasid] ASC) 
GO
CREATE INDEX [ix_rptledgerbillitem_rptledgerid] ON [cashreceiptitem_rpt_online]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_cashreceiptitem_rpt_online_rptledger] ON [cashreceiptitem_rpt_online]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_cashreceiptitem_rpt_online_rptledgerfaas] ON [cashreceiptitem_rpt_online]
([rptledgerfaasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceiptitem_rpt_online
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt_online] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceiptpayment_check
-- ----------------------------
CREATE INDEX [FK_cashreceiptpayment_check] ON [cashreceiptpayment_check]
([receiptid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashreceiptpayment_check
-- ----------------------------
ALTER TABLE [cashreceiptpayment_check] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashreceipts
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashreceipts
-- ----------------------------
ALTER TABLE [cashreceipts] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashticket
-- ----------------------------
CREATE INDEX [FK_stockitem_cashticket_cashreceiptform] ON [cashticket]
([objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashticket
-- ----------------------------
ALTER TABLE [cashticket] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashticket_control
-- ----------------------------
CREATE INDEX [cashticket_control_controlid] ON [cashticket_control]
([controlid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table cashticket_control
-- ----------------------------
ALTER TABLE [cashticket_control] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table cashticket_control
-- ----------------------------
ALTER TABLE [cashticket_control] ADD UNIQUE ([controlid] ASC, [assignee_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table cashticket_inventory
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashticket_inventory
-- ----------------------------
ALTER TABLE [cashticket_inventory] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table cashticket_inventory_detail
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table cashticket_inventory_detail
-- ----------------------------
ALTER TABLE [cashticket_inventory_detail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table certification
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table certification
-- ----------------------------
ALTER TABLE [certification] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table certification
-- ----------------------------
ALTER TABLE [certification] ADD UNIQUE ([txnno] ASC)
GO

-- ----------------------------
-- Indexes structure for table city
-- ----------------------------
CREATE INDEX [ix_lgu_city_indexno] ON [city]
([indexno] ASC) 
GO
CREATE INDEX [ix_lgu_city_parentid] ON [city]
([parentid] ASC) 
GO
CREATE INDEX [ix_lgu_city_previd] ON [city]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table city
-- ----------------------------
ALTER TABLE [city] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table city
-- ----------------------------
ALTER TABLE [city] ADD UNIQUE ([name] ASC)
GO
ALTER TABLE [city] ADD UNIQUE ([name] ASC, [state] ASC)
GO

-- ----------------------------
-- Indexes structure for table collectionform
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table collectionform
-- ----------------------------
ALTER TABLE [collectionform] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table collectiongroup
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table collectiongroup
-- ----------------------------
ALTER TABLE [collectiongroup] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table collectiongroup
-- ----------------------------
ALTER TABLE [collectiongroup] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table collectiongroup_revenueitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table collectiongroup_revenueitem
-- ----------------------------
ALTER TABLE [collectiongroup_revenueitem] ADD PRIMARY KEY ([collectiongroupid], [revenueitemid])
GO

-- ----------------------------
-- Indexes structure for table collectiontype
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table collectiontype
-- ----------------------------
ALTER TABLE [collectiontype] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table consolidatedland
-- ----------------------------
CREATE INDEX [FK_consolidatedland_consolidation] ON [consolidatedland]
([consolidationid] ASC) 
GO
CREATE INDEX [FK_consolidatedland_faas] ON [consolidatedland]
([landfaasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table consolidatedland
-- ----------------------------
ALTER TABLE [consolidatedland] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table consolidation
-- ----------------------------
CREATE INDEX [FK_consolidation_newfaas] ON [consolidation]
([newfaasid] ASC) 
GO
CREATE INDEX [FK_consolidation_newrp] ON [consolidation]
([newrpid] ASC) 
GO
CREATE INDEX [FK_consolidation_newrpu] ON [consolidation]
([newrpuid] ASC) 
GO
CREATE INDEX [ix_consolidation_newtdno] ON [consolidation]
([newtdno] ASC) 
GO
CREATE INDEX [ix_consolidation_ownername] ON [consolidation]
([owner_name] ASC) 
GO
CREATE INDEX [ix_consolidation_taxpayername] ON [consolidation]
([taxpayer_name] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table consolidation
-- ----------------------------
ALTER TABLE [consolidation] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table consolidation
-- ----------------------------
ALTER TABLE [consolidation] ADD UNIQUE ([newutdno] ASC)
GO

-- ----------------------------
-- Indexes structure for table consolidationaffectedrpu
-- ----------------------------
CREATE INDEX [FK_consolidationaffectedrpu_consolidation] ON [consolidationaffectedrpu]
([consolidationid] ASC) 
GO
CREATE INDEX [FK_consolidationaffectedrpu_newfaas] ON [consolidationaffectedrpu]
([newfaasid] ASC) 
GO
CREATE INDEX [FK_consolidationaffectedrpu_newrpu] ON [consolidationaffectedrpu]
([newrpuid] ASC) 
GO
CREATE INDEX [FK_consolidationaffectedrpu_prevfaas] ON [consolidationaffectedrpu]
([prevfaasid] ASC) 
GO
CREATE INDEX [ix_consolidationaffectedrpu_landfaasid] ON [consolidationaffectedrpu]
([landfaasid] ASC) 
GO
CREATE INDEX [ix_consolidationaffectedrpu_newtdno] ON [consolidationaffectedrpu]
([newtdno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table consolidationaffectedrpu
-- ----------------------------
ALTER TABLE [consolidationaffectedrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table consolidationaffectedrpu
-- ----------------------------
ALTER TABLE [consolidationaffectedrpu] ADD UNIQUE ([newutdno] ASC)
GO

-- ----------------------------
-- Indexes structure for table directcash_collection
-- ----------------------------
CREATE INDEX [ix_directcash_collection_refdate] ON [directcash_collection]
([refdate] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table directcash_collection
-- ----------------------------
ALTER TABLE [directcash_collection] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table directcash_collection_item
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table directcash_collection_item
-- ----------------------------
ALTER TABLE [directcash_collection_item] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table district
-- ----------------------------
CREATE INDEX [ix_lgu_district_indexno] ON [district]
([indexno] ASC) 
GO
CREATE INDEX [ix_lgu_district_parentid] ON [district]
([parentid] ASC) 
GO
CREATE INDEX [ix_lgu_district_previd] ON [district]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table district
-- ----------------------------
ALTER TABLE [district] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table district
-- ----------------------------
ALTER TABLE [district] ADD UNIQUE ([name] ASC)
GO
ALTER TABLE [district] ADD UNIQUE ([name] ASC, [state] ASC)
GO

-- ----------------------------
-- Indexes structure for table entity
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table entity
-- ----------------------------
ALTER TABLE [entity] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table entitycontact
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table entitycontact
-- ----------------------------
ALTER TABLE [entitycontact] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table entityid
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table entityid
-- ----------------------------
ALTER TABLE [entityid] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table entityid
-- ----------------------------
ALTER TABLE [entityid] ADD UNIQUE ([idtype] ASC, [idno] ASC)
GO

-- ----------------------------
-- Indexes structure for table entityindividual
-- ----------------------------
CREATE INDEX [ix_entityindividual_firstname] ON [entityindividual]
([firstname] ASC) 
GO
CREATE INDEX [ix_entityindividual_lastname] ON [entityindividual]
([lastname] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table entityindividual
-- ----------------------------
ALTER TABLE [entityindividual] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table entityjuridical
-- ----------------------------
CREATE INDEX [ix_tin] ON [entityjuridical]
([tin] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table entityjuridical
-- ----------------------------
ALTER TABLE [entityjuridical] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table entitymember
-- ----------------------------
CREATE INDEX [FK_entitymember_entity] ON [entitymember]
([entityid] ASC) 
GO
CREATE INDEX [ix_taxpayer_name] ON [entitymember]
([member_name] ASC) 
GO
CREATE INDEX [ix_taxpayer_objid] ON [entitymember]
([member_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table entitymember
-- ----------------------------
ALTER TABLE [entitymember] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table entitymultiple
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table entitymultiple
-- ----------------------------
ALTER TABLE [entitymultiple] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table examiner_finding
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table examiner_finding
-- ----------------------------
ALTER TABLE [examiner_finding] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table exemptiontype
-- ----------------------------
CREATE INDEX [ix_exemptiontype_state] ON [exemptiontype]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table exemptiontype
-- ----------------------------
ALTER TABLE [exemptiontype] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table exemptiontype
-- ----------------------------
ALTER TABLE [exemptiontype] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [exemptiontype] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table faas
-- ----------------------------
CREATE INDEX [FK_faas_entity] ON [faas]
([taxpayer_objid] ASC) 
GO
CREATE INDEX [FK_faas_entity_admin] ON [faas]
([administrator_objid] ASC) 
GO
CREATE INDEX [FK_faas_entity_beneficiary] ON [faas]
([beneficiary_objid] ASC) 
GO
CREATE INDEX [FK_faas_rpu] ON [faas]
([rpuid] ASC) 
GO
CREATE INDEX [ix_canceldate] ON [faas]
([canceldate] ASC) 
GO
CREATE INDEX [ix_faas_administratorname] ON [faas]
([administrator_name] ASC) 
GO
CREATE INDEX [ix_faas_appraisedby] ON [faas]
([objid] ASC) 
GO
CREATE INDEX [ix_faas_beneficiary] ON [faas]
([beneficiary_name] ASC) 
GO
CREATE INDEX [ix_faas_cancelledtimestamp] ON [faas]
([cancelledtimestamp] ASC) 
GO
CREATE INDEX [ix_faas_name] ON [faas]
([name] ASC) 
GO
CREATE INDEX [ix_faas_prevpin] ON [faas]
([prevpin] ASC) 
GO
CREATE INDEX [ix_faas_prevtdno] ON [faas]
([prevtdno] ASC) 
GO
CREATE INDEX [ix_faas_realproperty] ON [faas]
([realpropertyid] ASC) 
INCLUDE ([objid]) 
GO
CREATE INDEX [ix_faas_restrictionid] ON [faas]
([restrictionid] ASC) 
GO
CREATE INDEX [ix_faas_state] ON [faas]
([state] ASC) 
GO
CREATE INDEX [ix_faas_tdno] ON [faas]
([tdno] ASC) 
GO
CREATE INDEX [ix_faas_titleno] ON [faas]
([titleno] ASC) 
GO
CREATE INDEX [ix_faas_txntimestamp] ON [faas]
([txntimestamp] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table faas
-- ----------------------------
ALTER TABLE [faas] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table faas
-- ----------------------------
ALTER TABLE [faas] ADD UNIQUE ([utdno] ASC)
GO

-- ----------------------------
-- Indexes structure for table faasannotation
-- ----------------------------
CREATE INDEX [FK_faasannotation_faas] ON [faasannotation]
([faasid] ASC) 
GO
CREATE INDEX [FK_faasannotation_faasannotationtype] ON [faasannotation]
([annotationtype_objid] ASC) 
GO
CREATE INDEX [ix_faasannotation_fileno] ON [faasannotation]
([fileno] ASC) 
GO
CREATE INDEX [ix_faasannotation_orno] ON [faasannotation]
([orno] ASC) 
GO
CREATE INDEX [ix_faasannotation_state] ON [faasannotation]
([state] ASC) 
GO
CREATE INDEX [ix_faasannotation_txnno] ON [faasannotation]
([txnno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table faasannotation
-- ----------------------------
ALTER TABLE [faasannotation] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table faasannotationtype
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table faasannotationtype
-- ----------------------------
ALTER TABLE [faasannotationtype] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table faasannotationtype
-- ----------------------------
ALTER TABLE [faasannotationtype] ADD UNIQUE ([type] ASC)
GO

-- ----------------------------
-- Indexes structure for table faasbacktax
-- ----------------------------
CREATE INDEX [FK_faasbacktax] ON [faasbacktax]
([faasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table faasbacktax
-- ----------------------------
ALTER TABLE [faasbacktax] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table faasupdate
-- ----------------------------
CREATE INDEX [FK_faasupdate_faas] ON [faasupdate]
([faasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table faasupdate
-- ----------------------------
ALTER TABLE [faasupdate] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table faasupdate
-- ----------------------------
ALTER TABLE [faasupdate] ADD UNIQUE ([txnno] ASC)
GO

-- ----------------------------
-- Indexes structure for table fund
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table fund
-- ----------------------------
ALTER TABLE [fund] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landadjustment
-- ----------------------------
CREATE INDEX [FK_landadjustment_landadjustmenttype] ON [landadjustment]
([adjustmenttype_objid] ASC) 
GO
CREATE INDEX [FK_landadjustment_landdetail] ON [landadjustment]
([landdetailid] ASC) 
GO
CREATE INDEX [FK_landadjustment_landrpu] ON [landadjustment]
([landrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landadjustment
-- ----------------------------
ALTER TABLE [landadjustment] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landadjustmentparameter
-- ----------------------------
CREATE INDEX [FK_landadjustmentparameter_landadjustment] ON [landadjustmentparameter]
([landadjustmentid] ASC) 
GO
CREATE INDEX [FK_landadjustmentparameter_landrpu] ON [landadjustmentparameter]
([landrpuid] ASC) 
GO
CREATE INDEX [FK_landadjustmentparameter_rptparameter] ON [landadjustmentparameter]
([parameter_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landadjustmentparameter
-- ----------------------------
ALTER TABLE [landadjustmentparameter] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landadjustmenttype
-- ----------------------------
CREATE INDEX [FK_landadjustment_landrysetting] ON [landadjustmenttype]
([landrysettingid] ASC) 
GO
CREATE INDEX [ix_landadjustmenttype] ON [landadjustmenttype]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [landadjustmenttype]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landadjustmenttype
-- ----------------------------
ALTER TABLE [landadjustmenttype] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landadjustmenttype_classification
-- ----------------------------
CREATE INDEX [FK_landadjustment_classification_landrysetting] ON [landadjustmenttype_classification]
([landrysettingid] ASC) 
GO
CREATE INDEX [FK_landadjustmenttype_classification_classification] ON [landadjustmenttype_classification]
([classification_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landadjustmenttype_classification
-- ----------------------------
ALTER TABLE [landadjustmenttype_classification] ADD PRIMARY KEY ([landadjustmenttypeid], [classification_objid])
GO

-- ----------------------------
-- Indexes structure for table landassesslevel
-- ----------------------------
CREATE INDEX [FK_landassesslevel_propertyclassification] ON [landassesslevel]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_landassesslevel_previd] ON [landassesslevel]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [landassesslevel]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landassesslevel
-- ----------------------------
ALTER TABLE [landassesslevel] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table landassesslevel
-- ----------------------------
ALTER TABLE [landassesslevel] ADD UNIQUE ([landrysettingid] ASC, [code] ASC)
GO
ALTER TABLE [landassesslevel] ADD UNIQUE ([landrysettingid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table landassesslevelrange
-- ----------------------------
CREATE INDEX [FK_landassesslevelrange_landassesslevel] ON [landassesslevelrange]
([landassesslevelid] ASC) 
GO
CREATE INDEX [ix_landassesslevelrange_rootid] ON [landassesslevelrange]
([landrysettingid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landassesslevelrange
-- ----------------------------
ALTER TABLE [landassesslevelrange] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landdetail
-- ----------------------------
CREATE INDEX [FK_landdetail_actualuse] ON [landdetail]
([actualuse_objid] ASC) 
GO
CREATE INDEX [FK_landdetail_landrpu] ON [landdetail]
([landrpuid] ASC) 
GO
CREATE INDEX [FK_landdetail_lcuvspecificclass] ON [landdetail]
([specificclass_objid] ASC) 
GO
CREATE INDEX [FK_landdetail_lcuvstripping] ON [landdetail]
([stripping_objid] ASC) 
GO
CREATE INDEX [FK_landdetail_lcuvsubclass] ON [landdetail]
([subclass_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landdetail
-- ----------------------------
ALTER TABLE [landdetail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landrpu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table landrpu
-- ----------------------------
ALTER TABLE [landrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table landrysetting
-- ----------------------------
CREATE INDEX [ix_landrysetting_previd] ON [landrysetting]
([previd] ASC) 
GO
CREATE INDEX [ix_landrysetting_ry] ON [landrysetting]
([ry] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table landrysetting
-- ----------------------------
ALTER TABLE [landrysetting] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table lcuvspecificclass
-- ----------------------------
CREATE INDEX [FK_lcuvspecificclass_propertyclassification] ON [lcuvspecificclass]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_lcuvspecificclass_previd] ON [lcuvspecificclass]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [lcuvspecificclass]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table lcuvspecificclass
-- ----------------------------
ALTER TABLE [lcuvspecificclass] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table lcuvspecificclass
-- ----------------------------
ALTER TABLE [lcuvspecificclass] ADD UNIQUE ([landrysettingid] ASC, [classification_objid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table lcuvstripping
-- ----------------------------
CREATE INDEX [FK_lcuvstripping_landrysetting] ON [lcuvstripping]
([landrysettingid] ASC) 
GO
CREATE INDEX [FK_lcuvstripping_propertyclassification] ON [lcuvstripping]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_lcuvstripping_previd] ON [lcuvstripping]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table lcuvstripping
-- ----------------------------
ALTER TABLE [lcuvstripping] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table lcuvsubclass
-- ----------------------------
CREATE INDEX [FK_lcuvsubclass_lcuvspecificclass] ON [lcuvsubclass]
([specificclass_objid] ASC) 
GO
CREATE INDEX [ix_lcuvsubclass_previd] ON [lcuvsubclass]
([previd] ASC) 
GO
CREATE INDEX [ix_lcuvsubclass_rootid] ON [lcuvsubclass]
([landrysettingid] ASC) 
GO
CREATE INDEX [ix_previd] ON [lcuvsubclass]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table lcuvsubclass
-- ----------------------------
ALTER TABLE [lcuvsubclass] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table lcuvsubclass
-- ----------------------------
ALTER TABLE [lcuvsubclass] ADD UNIQUE ([landrysettingid] ASC, [specificclass_objid] ASC, [code] ASC)
GO
ALTER TABLE [lcuvsubclass] ADD UNIQUE ([landrysettingid] ASC, [specificclass_objid] ASC, [code] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table liquidation
-- ----------------------------
CREATE INDEX [ix_liquidation_state] ON [liquidation]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table liquidation
-- ----------------------------
ALTER TABLE [liquidation] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table liquidation
-- ----------------------------
ALTER TABLE [liquidation] ADD UNIQUE ([txnno] ASC)
GO

-- ----------------------------
-- Indexes structure for table liquidation_cashier_fund
-- ----------------------------
CREATE INDEX [FK_liquidation_cashier_fund_liquidation] ON [liquidation_cashier_fund]
([liquidationid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table liquidation_cashier_fund
-- ----------------------------
ALTER TABLE [liquidation_cashier_fund] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table liquidation_checkpayment
-- ----------------------------
CREATE INDEX [FK_liquidation_checkpayment] ON [liquidation_checkpayment]
([objid] ASC) 
GO
CREATE INDEX [FK_liquidation_checkpayment_liquidation] ON [liquidation_checkpayment]
([liquidationid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table liquidation_checkpayment
-- ----------------------------
ALTER TABLE [liquidation_checkpayment] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table liquidation_remittance
-- ----------------------------
CREATE INDEX [FK_liquidationitem_liquidation] ON [liquidation_remittance]
([liquidationid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table liquidation_remittance
-- ----------------------------
ALTER TABLE [liquidation_remittance] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table machassesslevel
-- ----------------------------
CREATE INDEX [FK_machassesslevel_propertyclassification] ON [machassesslevel]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_machassesslevel_previd] ON [machassesslevel]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [machassesslevel]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machassesslevel
-- ----------------------------
ALTER TABLE [machassesslevel] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table machassesslevel
-- ----------------------------
ALTER TABLE [machassesslevel] ADD UNIQUE ([machrysettingid] ASC, [code] ASC)
GO
ALTER TABLE [machassesslevel] ADD UNIQUE ([machrysettingid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table machassesslevelrange
-- ----------------------------
CREATE INDEX [FK_machassesslevelrange_machassesslevel] ON [machassesslevelrange]
([machassesslevelid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machassesslevelrange
-- ----------------------------
ALTER TABLE [machassesslevelrange] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table machassesslevelrange
-- ----------------------------
ALTER TABLE [machassesslevelrange] ADD UNIQUE ([machrysettingid] ASC, [machassesslevelid] ASC, [mvfrom] ASC)
GO

-- ----------------------------
-- Indexes structure for table machdetail
-- ----------------------------
CREATE INDEX [FK_machdetail_machforex] ON [machdetail]
([feracid] ASC) 
GO
CREATE INDEX [FK_machdetail_machforexid] ON [machdetail]
([forexid] ASC) 
GO
CREATE INDEX [FK_machdetail_machine] ON [machdetail]
([machine_objid] ASC) 
GO
CREATE INDEX [FK_machdetail_machrpu] ON [machdetail]
([machrpuid] ASC) 
GO
CREATE INDEX [FK_machdetail_machuse] ON [machdetail]
([machuseid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machdetail
-- ----------------------------
ALTER TABLE [machdetail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table machforex
-- ----------------------------
CREATE INDEX [ix_machforex_previd] ON [machforex]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [machforex]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machforex
-- ----------------------------
ALTER TABLE [machforex] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table machforex
-- ----------------------------
ALTER TABLE [machforex] ADD UNIQUE ([machrysettingid] ASC, [year] ASC)
GO

-- ----------------------------
-- Indexes structure for table machine
-- ----------------------------
CREATE INDEX [ix_machine_state] ON [machine]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machine
-- ----------------------------
ALTER TABLE [machine] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table machine
-- ----------------------------
ALTER TABLE [machine] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [machine] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table machrpu
-- ----------------------------
CREATE INDEX [FK_machrpu_landrpu] ON [machrpu]
([landrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machrpu
-- ----------------------------
ALTER TABLE [machrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table machrysetting
-- ----------------------------
CREATE INDEX [FK_machrysetting_machrysetting] ON [machrysetting]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machrysetting
-- ----------------------------
ALTER TABLE [machrysetting] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table machuse
-- ----------------------------
CREATE INDEX [FK_machuse_machassesslevel] ON [machuse]
([actualuse_objid] ASC) 
GO
CREATE INDEX [FK_machuse_machrpu] ON [machuse]
([machrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table machuse
-- ----------------------------
ALTER TABLE [machuse] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table material
-- ----------------------------
CREATE INDEX [ix_material_state] ON [material]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table material
-- ----------------------------
ALTER TABLE [material] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table material
-- ----------------------------
ALTER TABLE [material] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [material] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table mcsettlement
-- ----------------------------
CREATE INDEX [ix_mcsettlement_state] ON [mcsettlement]
([state] ASC) 
GO
CREATE INDEX [ix_mcsettlement_txnno] ON [mcsettlement]
([txnno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table mcsettlement
-- ----------------------------
ALTER TABLE [mcsettlement] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table mcsettlement_affectedrpu
-- ----------------------------
CREATE INDEX [ix_mcaffectedrpu_mcid] ON [mcsettlement_affectedrpu]
([mcsettlementid] ASC) 
GO
CREATE INDEX [ix_mcaffectedrpu_newfaas_objid] ON [mcsettlement_affectedrpu]
([newfaas_objid] ASC) 
GO
CREATE INDEX [ix_mcaffectedrpu_prevfaas_objid] ON [mcsettlement_affectedrpu]
([prevfaas_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table mcsettlement_affectedrpu
-- ----------------------------
ALTER TABLE [mcsettlement_affectedrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table mcsettlement_affectedrpu
-- ----------------------------
ALTER TABLE [mcsettlement_affectedrpu] ADD UNIQUE ([prevfaas_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table mcsettlement_otherclaim
-- ----------------------------
CREATE INDEX [ix_mcotherclaim_faas_objid] ON [mcsettlement_otherclaim]
([faas_objid] ASC) 
GO
CREATE INDEX [ix_mcotherclaim_mcid] ON [mcsettlement_otherclaim]
([mcsettlementid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table mcsettlement_otherclaim
-- ----------------------------
ALTER TABLE [mcsettlement_otherclaim] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table mcsettlement_otherclaim
-- ----------------------------
ALTER TABLE [mcsettlement_otherclaim] ADD UNIQUE ([faas_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table miscassesslevel
-- ----------------------------
CREATE INDEX [FK_miscassesslevel_classification] ON [miscassesslevel]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_miscassesslevel_previd] ON [miscassesslevel]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [miscassesslevel]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscassesslevel
-- ----------------------------
ALTER TABLE [miscassesslevel] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table miscassesslevel
-- ----------------------------
ALTER TABLE [miscassesslevel] ADD UNIQUE ([miscrysettingid] ASC, [code] ASC)
GO
ALTER TABLE [miscassesslevel] ADD UNIQUE ([miscrysettingid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table miscassesslevelrange
-- ----------------------------
CREATE INDEX [FK_miscassesslevelrange_miscassesslevel] ON [miscassesslevelrange]
([miscassesslevelid] ASC) 
GO
CREATE INDEX [FK_miscassesslevelrange_miscrysetting] ON [miscassesslevelrange]
([miscrysettingid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscassesslevelrange
-- ----------------------------
ALTER TABLE [miscassesslevelrange] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table miscitem
-- ----------------------------
CREATE INDEX [ix_miscitem_state] ON [miscitem]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscitem
-- ----------------------------
ALTER TABLE [miscitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table miscitem
-- ----------------------------
ALTER TABLE [miscitem] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [miscitem] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table miscitemvalue
-- ----------------------------
CREATE INDEX [FK_miscitemvalue_miscitem] ON [miscitemvalue]
([miscitem_objid] ASC) 
GO
CREATE INDEX [ix_miscitemvalue_previd] ON [miscitemvalue]
([previd] ASC) 
GO
CREATE INDEX [ix_previd] ON [miscitemvalue]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscitemvalue
-- ----------------------------
ALTER TABLE [miscitemvalue] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table miscitemvalue
-- ----------------------------
ALTER TABLE [miscitemvalue] ADD UNIQUE ([miscrysettingid] ASC, [miscitem_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table miscrpu
-- ----------------------------
CREATE INDEX [FK_miscrpu_miscassesslevel] ON [miscrpu]
([actualuse_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscrpu
-- ----------------------------
ALTER TABLE [miscrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table miscrpuitem
-- ----------------------------
CREATE INDEX [FK_miscrpuitem_miscitem] ON [miscrpuitem]
([miscitem_objid] ASC) 
GO
CREATE INDEX [FK_miscrpuitem_miscitemvalue] ON [miscrpuitem]
([miv_objid] ASC) 
GO
CREATE INDEX [FK_miscrpuitem_miscrpu] ON [miscrpuitem]
([miscrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscrpuitem
-- ----------------------------
ALTER TABLE [miscrpuitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table miscrpuitem_rptparameter
-- ----------------------------
CREATE INDEX [FK_miscrpuitem_rptparameter_] ON [miscrpuitem_rptparameter]
([miscrpuid] ASC) 
GO
CREATE INDEX [FK_miscrpuitem_rptparameter_rptparamer] ON [miscrpuitem_rptparameter]
([param_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscrpuitem_rptparameter
-- ----------------------------
ALTER TABLE [miscrpuitem_rptparameter] ADD PRIMARY KEY ([miscrpuitemid], [param_objid])
GO

-- ----------------------------
-- Indexes structure for table miscrysetting
-- ----------------------------
CREATE INDEX [ix_miscrysetting_ry] ON [miscrysetting]
([ry] ASC) 
GO
CREATE INDEX [ix_miscrysetting_state] ON [miscrysetting]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table miscrysetting
-- ----------------------------
ALTER TABLE [miscrysetting] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table municipality
-- ----------------------------
CREATE INDEX [ix_lgu_municipality_indexno] ON [municipality]
([indexno] ASC) 
GO
CREATE INDEX [ix_lgu_municipality_parentid] ON [municipality]
([parentid] ASC) 
GO
CREATE INDEX [ix_lgu_municipality_previd] ON [municipality]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table municipality
-- ----------------------------
ALTER TABLE [municipality] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table municipality
-- ----------------------------
ALTER TABLE [municipality] ADD UNIQUE ([name] ASC)
GO
ALTER TABLE [municipality] ADD UNIQUE ([name] ASC, [state] ASC)
GO

-- ----------------------------
-- Indexes structure for table ngas_revenue
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ngas_revenue
-- ----------------------------
ALTER TABLE [ngas_revenue] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ngas_revenue_deposit
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ngas_revenue_deposit
-- ----------------------------
ALTER TABLE [ngas_revenue_deposit] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ngas_revenue_remittance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ngas_revenue_remittance
-- ----------------------------
ALTER TABLE [ngas_revenue_remittance] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table ngas_revenueitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ngas_revenueitem
-- ----------------------------
ALTER TABLE [ngas_revenueitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table pin
-- ----------------------------
CREATE INDEX [FK_lgu_barangay] ON [pin]
([barangayid] ASC) 
GO
CREATE INDEX [ix_pin_state] ON [pin]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table pin
-- ----------------------------
ALTER TABLE [pin] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table planttree
-- ----------------------------
CREATE INDEX [ix_planttree_state] ON [planttree]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table planttree
-- ----------------------------
ALTER TABLE [planttree] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table planttree
-- ----------------------------
ALTER TABLE [planttree] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [planttree] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table planttreeassesslevel
-- ----------------------------
CREATE INDEX [FK_planttreeassesslevel_planttreeassesslevel] ON [planttreeassesslevel]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table planttreeassesslevel
-- ----------------------------
ALTER TABLE [planttreeassesslevel] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table planttreeassesslevel
-- ----------------------------
ALTER TABLE [planttreeassesslevel] ADD UNIQUE ([planttreerysettingid] ASC, [code] ASC)
GO
ALTER TABLE [planttreeassesslevel] ADD UNIQUE ([planttreerysettingid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table planttreedetail
-- ----------------------------
CREATE INDEX [FK_planttreedetail_landrpu] ON [planttreedetail]
([landrpuid] ASC) 
GO
CREATE INDEX [FK_planttreedetail_plantreeassesslevel] ON [planttreedetail]
([actualuse_objid] ASC) 
GO
CREATE INDEX [FK_planttreedetail_planttree] ON [planttreedetail]
([planttree_objid] ASC) 
GO
CREATE INDEX [FK_planttreedetail_planttreerpu] ON [planttreedetail]
([planttreerpuid] ASC) 
GO
CREATE INDEX [FK_planttreedetail_planttreeunitvalue] ON [planttreedetail]
([planttreeunitvalue_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table planttreedetail
-- ----------------------------
ALTER TABLE [planttreedetail] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table planttreerpu
-- ----------------------------
CREATE INDEX [FK_planttreerpu_landrpu] ON [planttreerpu]
([landrpuid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table planttreerpu
-- ----------------------------
ALTER TABLE [planttreerpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table planttreerysetting
-- ----------------------------
CREATE INDEX [ix_planttreerysetting_ry] ON [planttreerysetting]
([ry] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table planttreerysetting
-- ----------------------------
ALTER TABLE [planttreerysetting] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table planttreeunitvalue
-- ----------------------------
CREATE INDEX [FK_planttreeunitvalue_planttree] ON [planttreeunitvalue]
([planttree_objid] ASC) 
GO
CREATE INDEX [FK_planttreeunitvalue_planttreeunitvalue] ON [planttreeunitvalue]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table planttreeunitvalue
-- ----------------------------
ALTER TABLE [planttreeunitvalue] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table planttreeunitvalue
-- ----------------------------
ALTER TABLE [planttreeunitvalue] ADD UNIQUE ([planttreerysettingid] ASC, [planttree_objid] ASC, [code] ASC)
GO
ALTER TABLE [planttreeunitvalue] ADD UNIQUE ([planttreerysettingid] ASC, [planttree_objid] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table previousfaas
-- ----------------------------
CREATE INDEX [FK_previousfaas_prevfaas] ON [previousfaas]
([prevfaasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table previousfaas
-- ----------------------------
ALTER TABLE [previousfaas] ADD PRIMARY KEY ([faasid], [prevfaasid])
GO

-- ----------------------------
-- Indexes structure for table profession
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table profession
-- ----------------------------
ALTER TABLE [profession] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table propertyclassification
-- ----------------------------
CREATE INDEX [ix_propertyclassification_state] ON [propertyclassification]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table propertyclassification
-- ----------------------------
ALTER TABLE [propertyclassification] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table propertyclassification
-- ----------------------------
ALTER TABLE [propertyclassification] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [propertyclassification] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table province
-- ----------------------------
CREATE INDEX [ix_lgu_province_indexno] ON [province]
([indexno] ASC) 
GO
CREATE INDEX [ix_lgu_province_parentid] ON [province]
([parentid] ASC) 
GO
CREATE INDEX [ix_lgu_province_previd] ON [province]
([previd] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table province
-- ----------------------------
ALTER TABLE [province] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table province
-- ----------------------------
ALTER TABLE [province] ADD UNIQUE ([name] ASC)
GO
ALTER TABLE [province] ADD UNIQUE ([name] ASC, [state] ASC)
GO

-- ----------------------------
-- Indexes structure for table realproperty
-- ----------------------------
CREATE INDEX [ix_barangayid] ON [realproperty]
([barangayid] ASC) 
GO
CREATE INDEX [ix_realproperty_blockno] ON [realproperty]
([blockno] ASC) 
GO
CREATE INDEX [ix_realproperty_brgysection] ON [realproperty]
([barangayid] ASC, [section] ASC) 
GO
CREATE INDEX [ix_realproperty_brgystate] ON [realproperty]
([barangayid] ASC, [state] ASC) 
GO
CREATE INDEX [ix_realproperty_cadastrallotno] ON [realproperty]
([cadastrallotno] ASC) 
GO
CREATE INDEX [ix_realproperty_pin] ON [realproperty]
([pin] ASC) 
GO
CREATE INDEX [ix_realproperty_ry] ON [realproperty]
([ry] ASC) 
GO
CREATE INDEX [ix_realproperty_surveyno] ON [realproperty]
([surveyno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table realproperty
-- ----------------------------
ALTER TABLE [realproperty] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table remittance
-- ----------------------------
CREATE INDEX [ix_remittance_state] ON [remittance]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table remittance
-- ----------------------------
ALTER TABLE [remittance] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table remittance
-- ----------------------------
ALTER TABLE [remittance] ADD UNIQUE ([txnno] ASC)
GO

-- ----------------------------
-- Indexes structure for table remittance_afserial
-- ----------------------------
CREATE INDEX [FK_remittance_afserial_remittance] ON [remittance_afserial]
([remittanceid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table remittance_afserial
-- ----------------------------
ALTER TABLE [remittance_afserial] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table remittance_cashreceipt
-- ----------------------------
CREATE INDEX [FK_remittanceitem_remittance] ON [remittance_cashreceipt]
([remittanceid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table remittance_cashreceipt
-- ----------------------------
ALTER TABLE [remittance_cashreceipt] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table remittance_cashticket
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table remittance_cashticket
-- ----------------------------
ALTER TABLE [remittance_cashticket] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table remittance_checkpayment
-- ----------------------------
CREATE INDEX [FK_remittance_checkpayment_remittance] ON [remittance_checkpayment]
([remittanceid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table remittance_checkpayment
-- ----------------------------
ALTER TABLE [remittance_checkpayment] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table remittance_fund
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table remittance_fund
-- ----------------------------
ALTER TABLE [remittance_fund] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table remittance_fund
-- ----------------------------
ALTER TABLE [remittance_fund] ADD UNIQUE ([remittanceid] ASC, [fund_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table remoteserverdata
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table remoteserverdata
-- ----------------------------
ALTER TABLE [remoteserverdata] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table report_rptdelinquency
-- ----------------------------
CREATE INDEX [ix_report_rptdelinquency_rptledgerid] ON [report_rptdelinquency]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_report_rptdelinquency_barangayid] ON [report_rptdelinquency]
([barangayid] ASC) 
GO
CREATE INDEX [ix_report_rptdelinquency_year] ON [report_rptdelinquency]
([year] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table report_rptdelinquency
-- ----------------------------
ALTER TABLE [report_rptdelinquency] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table resection
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table resection
-- ----------------------------
ALTER TABLE [resection] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table resection
-- ----------------------------
ALTER TABLE [resection] ADD UNIQUE ([barangayid] ASC, [section] ASC)
GO

-- ----------------------------
-- Indexes structure for table resectionaffectedrpu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table resectionaffectedrpu
-- ----------------------------
ALTER TABLE [resectionaffectedrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table resectionaffectedrpu
-- ----------------------------
ALTER TABLE [resectionaffectedrpu] ADD UNIQUE ([newutdno] ASC)
GO

-- ----------------------------
-- Indexes structure for table resectionitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table resectionitem
-- ----------------------------
ALTER TABLE [resectionitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table resectionitem
-- ----------------------------
ALTER TABLE [resectionitem] ADD UNIQUE ([resectionid] ASC, [newsection] ASC)
GO

-- ----------------------------
-- Indexes structure for table revenueitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table revenueitem
-- ----------------------------
ALTER TABLE [revenueitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table revenueitem_attribute
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table revenueitem_attribute
-- ----------------------------
ALTER TABLE [revenueitem_attribute] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table revenueitem_attribute
-- ----------------------------
ALTER TABLE [revenueitem_attribute] ADD UNIQUE ([revitemid] ASC, [attribute_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table revenueitem_attribute_type
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table revenueitem_attribute_type
-- ----------------------------
ALTER TABLE [revenueitem_attribute_type] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table revenueitem_collectiongroup
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table revenueitem_collectiongroup
-- ----------------------------
ALTER TABLE [revenueitem_collectiongroup] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpt_requirement
-- ----------------------------
CREATE INDEX [ix_rptrequirement_refid] ON [rpt_requirement]
([refid] ASC) 
GO
CREATE INDEX [ix_rptrequirement_requirementtypeid] ON [rpt_requirement]
([requirementtypeid] ASC) 
GO
CREATE INDEX [ix_rptrequirement_valueobjid] ON [rpt_requirement]
([value_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpt_requirement
-- ----------------------------
ALTER TABLE [rpt_requirement] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpt_requirement_type
-- ----------------------------
CREATE INDEX [ix_rptrequirementtype_name] ON [rpt_requirement_type]
([name] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpt_requirement_type
-- ----------------------------
ALTER TABLE [rpt_requirement_type] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table rpt_requirement_type
-- ----------------------------
ALTER TABLE [rpt_requirement_type] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table rpt_sales_data
-- ----------------------------
CREATE INDEX [ix_buyername] ON [rpt_sales_data]
([buyer_name] ASC) 
GO
CREATE INDEX [ix_FK_faas_sales_data] ON [rpt_sales_data]
([objid] ASC) 
GO
CREATE INDEX [ix_sellername] ON [rpt_sales_data]
([seller_name] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpt_sales_data
-- ----------------------------
ALTER TABLE [rpt_sales_data] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpt_sms
-- ----------------------------
CREATE INDEX [ix_rptsms_phoneno] ON [rpt_sms]
([phoneno] ASC) 
GO
CREATE INDEX [ix_rptsms_traceid] ON [rpt_sms]
([traceid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpt_sms
-- ----------------------------
ALTER TABLE [rpt_sms] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpt_sms_registration
-- ----------------------------
CREATE INDEX [ix_rptsmsreg_refid] ON [rpt_sms_registration]
([refid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpt_sms_registration
-- ----------------------------
ALTER TABLE [rpt_sms_registration] ADD PRIMARY KEY ([phoneno], [refid])
GO

-- ----------------------------
-- Indexes structure for table rptbill
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rptbill
-- ----------------------------
ALTER TABLE [rptbill] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table rptbill
-- ----------------------------
ALTER TABLE [rptbill] ADD UNIQUE ([barcode] ASC)
GO

-- ----------------------------
-- Indexes structure for table rptbill_ledger
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rptbill_ledger
-- ----------------------------
ALTER TABLE [rptbill_ledger] ADD PRIMARY KEY ([rptledgerid], [rptbillid])
GO

-- ----------------------------
-- Indexes structure for table rptbill_ledger_account
-- ----------------------------
CREATE INDEX [ix_rptbillledgeraccount_revenueitem] ON [rptbill_ledger_account]
([item_objid] ASC) 
GO
CREATE INDEX [ix_rptbill_ledger_account_rptledger] ON [rptbill_ledger_account]
([rptledgerid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptbill_ledger_account
-- ----------------------------
ALTER TABLE [rptbill_ledger_account] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptbill_ledger_item
-- ----------------------------
CREATE INDEX [ix_rptbill_ledger_item_rptledger] ON [rptbill_ledger_item]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_rptledgerbillitem_rptledgerfaasid] ON [rptbill_ledger_item]
([rptledgerfaasid] ASC) 
GO
CREATE INDEX [ix_rptledgerbillitem_rptledgerid] ON [rptbill_ledger_item]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_rptbill_ledger_item_rptledgerfaas] ON [rptbill_ledger_item]
([rptledgerfaasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptbill_ledger_item
-- ----------------------------
ALTER TABLE [rptbill_ledger_item] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptcertification
-- ----------------------------
CREATE INDEX [FK_rptcertification_faas] ON [rptcertification]
([faasid] ASC) 
GO
CREATE INDEX [ix_rptcertification_office] ON [rptcertification]
([office] ASC) 
GO
CREATE INDEX [ix_rptcertification_office_txnno] ON [rptcertification]
([office] ASC, [txnno] ASC) 
GO
CREATE INDEX [ix_rptcertification_taxpayerid] ON [rptcertification]
([taxpayer_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptcertification
-- ----------------------------
ALTER TABLE [rptcertification] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table rptcertification
-- ----------------------------
ALTER TABLE [rptcertification] ADD UNIQUE ([txnno] ASC)
GO

-- ----------------------------
-- Indexes structure for table rptcertificationitem
-- ----------------------------
CREATE INDEX [FK_rptcertificationitem_rptcertification] ON [rptcertificationitem]
([rptcertificationid] ASC) 
GO
CREATE INDEX [ix_rptcertificationitem_refid] ON [rptcertificationitem]
([refid] ASC) 
GO

-- ----------------------------
-- Indexes structure for table rptexpiry
-- ----------------------------
CREATE INDEX [ix_rptexpiry_yrqtr] ON [rptexpiry]
([iyear] ASC, [iqtr] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptexpiry
-- ----------------------------
ALTER TABLE [rptexpiry] ADD PRIMARY KEY ([iqtr], [iyear], [expirytype])
GO

-- ----------------------------
-- Indexes structure for table rptledger
-- ----------------------------
CREATE INDEX [FK_rptledger_faas] ON [rptledger]
([faasid] ASC) 
GO
CREATE INDEX [ix_rptledger_faasid] ON [rptledger]
([faasid] ASC) 
GO
CREATE INDEX [ix_rptledger_state] ON [rptledger]
([state] ASC) 
GO
CREATE INDEX [ix_rptledger_state_barangay] ON [rptledger]
([state] ASC, [barangayid] ASC) 
GO
CREATE INDEX [ix_rptledger_state_faasid] ON [rptledger]
([state] ASC, [faasid] ASC) 
INCLUDE ([objid], [lastyearpaid], [lastqtrpaid], [firstqtrpaidontime], [qtrlypaymentpaidontime], [lastitemyear]) 
GO
CREATE INDEX [ix_rptledger_state_lastyearpaid] ON [rptledger]
([state] ASC, [lastyearpaid] ASC) 
GO
CREATE INDEX [ix_rptledgerlastyearpaidqtr] ON [rptledger]
([lastyearpaid] ASC, [lastqtrpaid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptledger
-- ----------------------------
ALTER TABLE [rptledger] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptledgerbill
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rptledgerbill
-- ----------------------------
ALTER TABLE [rptledgerbill] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptledgerbillitem
-- ----------------------------
CREATE INDEX [ix_rptledgerbillitem_rptledgerfaasid] ON [rptledgerbillitem]
([rptledgerfaasid] ASC) 
GO
CREATE INDEX [ix_rptledgerbillitem_rptledgerid] ON [rptledgerbillitem]
([rptledgerid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptledgerbillitem
-- ----------------------------
ALTER TABLE [rptledgerbillitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table rptledgerbillitem
-- ----------------------------
ALTER TABLE [rptledgerbillitem] ADD UNIQUE ([rptledgerid] ASC, [year] ASC, [qtr] ASC)
GO

-- ----------------------------
-- Indexes structure for table rptledgerfaas
-- ----------------------------
CREATE INDEX [FK_rptledgerhistory_rptledger] ON [rptledgerfaas]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_rptledgerfaas_rptledgerid_faasid] ON [rptledgerfaas]
([rptledgerid] ASC, [faasid] ASC) 
GO
CREATE INDEX [ix_rptledgerhistory_ledgerid_toyear] ON [rptledgerfaas]
([rptledgerid] ASC, [toyear] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptledgerfaas
-- ----------------------------
ALTER TABLE [rptledgerfaas] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptparameter
-- ----------------------------
CREATE INDEX [ix_rptparameter_caption] ON [rptparameter]
([caption] ASC) 
GO
CREATE INDEX [ix_rptparameter_state] ON [rptparameter]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptparameter
-- ----------------------------
ALTER TABLE [rptparameter] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table rptparameter
-- ----------------------------
ALTER TABLE [rptparameter] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table rptreceipt_capture
-- ----------------------------
CREATE INDEX [ix_rptreceipt_capture_paidby] ON [rptreceipt_capture]
([paidby] ASC) 
GO
CREATE INDEX [ix_rptreceipt_payorid] ON [rptreceipt_capture]
([payorid] ASC) 
GO
CREATE INDEX [ix_rptreceipt_receiptno] ON [rptreceipt_capture]
([receiptno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptreceipt_capture
-- ----------------------------
ALTER TABLE [rptreceipt_capture] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpttask
-- ----------------------------
CREATE INDEX [ix_rpttask_assignedto_enddate] ON [rpttask]
([assignedto_objid] ASC, [enddate] ASC) 
GO
CREATE INDEX [ix_rpttask_assignedto_name] ON [rpttask]
([assignedto_name] ASC) 
GO
CREATE INDEX [ix_rpttask_assignedto_objid] ON [rpttask]
([assignedto_objid] ASC) 
GO
CREATE INDEX [ix_rpttask_createdby_name] ON [rpttask]
([createdby_name] ASC) 
GO
CREATE INDEX [ix_rpttask_createdby_objid] ON [rpttask]
([createdby_objid] ASC) 
GO
CREATE INDEX [ix_rpttask_enddate] ON [rpttask]
([enddate] ASC) 
GO
CREATE INDEX [ix_rpttask_objid] ON [rpttask]
([objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpttask
-- ----------------------------
ALTER TABLE [rpttask] ADD PRIMARY KEY ([taskid])
GO

-- ----------------------------
-- Indexes structure for table rpttaxclearance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rpttaxclearance
-- ----------------------------
ALTER TABLE [rpttaxclearance] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpttaxincentive
-- ----------------------------
CREATE INDEX [ix_rpttaxincentive_name] ON [rpttaxincentive]
([name] ASC) 
GO
CREATE INDEX [ix_rpttaxincentive_state] ON [rpttaxincentive]
([state] ASC) 
GO
CREATE INDEX [ix_rpttaxincentive_taxpayerid] ON [rpttaxincentive]
([taxpayer_objid] ASC) 
GO
CREATE INDEX [ix_rpttaxincentive_txnno] ON [rpttaxincentive]
([txnno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpttaxincentive
-- ----------------------------
ALTER TABLE [rpttaxincentive] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpttaxincentive_item
-- ----------------------------
CREATE INDEX [ix_rpttaxincentiveitem_rptledgerid] ON [rpttaxincentive_item]
([rptledgerid] ASC) 
GO
CREATE INDEX [ix_rpttaxincentiveitem_rpttaxincentiveid] ON [rpttaxincentive_item]
([rpttaxincentiveid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpttaxincentive_item
-- ----------------------------
ALTER TABLE [rpttaxincentive_item] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpttracking
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rpttracking
-- ----------------------------
ALTER TABLE [rpttracking] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table rpttracking
-- ----------------------------
ALTER TABLE [rpttracking] ADD UNIQUE ([trackingno] ASC)
GO

-- ----------------------------
-- Indexes structure for table rptvariable
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rptvariable
-- ----------------------------
ALTER TABLE [rptvariable] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptworkflow
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rptworkflow
-- ----------------------------
ALTER TABLE [rptworkflow] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rptworkflow_state
-- ----------------------------
CREATE INDEX [ix_rptworkflowstate_workflowid] ON [rptworkflow_state]
([workflowid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rptworkflow_state
-- ----------------------------
ALTER TABLE [rptworkflow_state] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpu
-- ----------------------------
CREATE INDEX [FK_rpu_realpropertyid] ON [rpu]
([realpropertyid] ASC) 
GO
CREATE INDEX [ix_classification_objid] ON [rpu]
([classification_objid] ASC) 
GO
CREATE INDEX [ix_previd] ON [rpu]
([previd] ASC) 
GO
CREATE INDEX [ix_rpu_fullpin] ON [rpu]
([fullpin] ASC) 
GO
CREATE INDEX [ix_rpu_ry_fullpin] ON [rpu]
([fullpin] ASC, [ry] ASC) 
GO
CREATE INDEX [ix_rpu_ry_state] ON [rpu]
([state] ASC) 
GO
CREATE INDEX [ix_rpu_state] ON [rpu]
([state] ASC) 
GO
CREATE INDEX [ix_rpy_ry] ON [rpu]
([ry] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table rpu
-- ----------------------------
ALTER TABLE [rpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rpumaster
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rpumaster
-- ----------------------------
ALTER TABLE [rpumaster] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table rysetting_lgu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rysetting_lgu
-- ----------------------------
ALTER TABLE [rysetting_lgu] ADD PRIMARY KEY ([rysettingid], [lguid])
GO

-- ----------------------------
-- Indexes structure for table rysettinginfo
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table rysettinginfo
-- ----------------------------
ALTER TABLE [rysettinginfo] ADD PRIMARY KEY ([ry])
GO

-- ----------------------------
-- Indexes structure for table signatory
-- ----------------------------
CREATE INDEX [ix_signatory_doctype] ON [signatory]
([doctype] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table signatory
-- ----------------------------
ALTER TABLE [signatory] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sms_rpt_registration
-- ----------------------------
CREATE INDEX [ix_smsrptreg_rptledgerid] ON [sms_rpt_registration]
([rptledgerid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sms_rpt_registration
-- ----------------------------
ALTER TABLE [sms_rpt_registration] ADD PRIMARY KEY ([mobileno], [rptledgerid])
GO

-- ----------------------------
-- Indexes structure for table specialaccountsetting
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table specialaccountsetting
-- ----------------------------
ALTER TABLE [specialaccountsetting] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sreaccount
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sreaccount
-- ----------------------------
ALTER TABLE [sreaccount] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sreaccount_incometarget
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sreaccount_incometarget
-- ----------------------------
ALTER TABLE [sreaccount_incometarget] ADD PRIMARY KEY ([objid], [year])
GO

-- ----------------------------
-- Indexes structure for table stockissue
-- ----------------------------
CREATE INDEX [FK_stockissue_request] ON [stockissue]
([request_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table stockissue
-- ----------------------------
ALTER TABLE [stockissue] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table stockissue
-- ----------------------------
ALTER TABLE [stockissue] ADD UNIQUE ([issueno] ASC)
GO

-- ----------------------------
-- Indexes structure for table stockissueitem
-- ----------------------------
CREATE INDEX [FK_stockissueitem_stockissue] ON [stockissueitem]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table stockissueitem
-- ----------------------------
ALTER TABLE [stockissueitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table stockitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table stockitem
-- ----------------------------
ALTER TABLE [stockitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table stockitem
-- ----------------------------
ALTER TABLE [stockitem] ADD UNIQUE ([code] ASC)
GO

-- ----------------------------
-- Indexes structure for table stockitem_unit
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table stockitem_unit
-- ----------------------------
ALTER TABLE [stockitem_unit] ADD PRIMARY KEY ([itemid], [unit])
GO

-- ----------------------------
-- Indexes structure for table stockreceipt
-- ----------------------------
CREATE INDEX [FK_stockreceipt_request] ON [stockreceipt]
([request_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table stockreceipt
-- ----------------------------
ALTER TABLE [stockreceipt] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table stockreceipt
-- ----------------------------
ALTER TABLE [stockreceipt] ADD UNIQUE ([receiptno] ASC)
GO

-- ----------------------------
-- Indexes structure for table stockreceiptitem
-- ----------------------------
CREATE INDEX [FK_stockreceiptitem_stockreceipt] ON [stockreceiptitem]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table stockreceiptitem
-- ----------------------------
ALTER TABLE [stockreceiptitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table stockrequest
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table stockrequest
-- ----------------------------
ALTER TABLE [stockrequest] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table stockrequestitem
-- ----------------------------
CREATE INDEX [FK_afrequestitem_af] ON [stockrequestitem]
([item_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table stockrequestitem
-- ----------------------------
ALTER TABLE [stockrequestitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table stockrequestitem
-- ----------------------------
ALTER TABLE [stockrequestitem] ADD UNIQUE ([parentid] ASC, [item_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table stocksale
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table stocksale
-- ----------------------------
ALTER TABLE [stocksale] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table stocksale
-- ----------------------------
ALTER TABLE [stocksale] ADD UNIQUE ([issueno] ASC)
GO

-- ----------------------------
-- Indexes structure for table stocksaleitem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table stocksaleitem
-- ----------------------------
ALTER TABLE [stocksaleitem] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table structure
-- ----------------------------
CREATE INDEX [ix_structure_state] ON [structure]
([state] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table structure
-- ----------------------------
ALTER TABLE [structure] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table structure
-- ----------------------------
ALTER TABLE [structure] ADD UNIQUE ([code] ASC)
GO
ALTER TABLE [structure] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table structurematerial
-- ----------------------------
CREATE INDEX [FK_structurematerial_material] ON [structurematerial]
([material_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table structurematerial
-- ----------------------------
ALTER TABLE [structurematerial] ADD PRIMARY KEY ([structure_objid], [material_objid])
GO

-- ----------------------------
-- Indexes structure for table subcollector_remittance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table subcollector_remittance
-- ----------------------------
ALTER TABLE [subcollector_remittance] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table subcollector_remittance_cashreceipt
-- ----------------------------
CREATE INDEX [FK_subcollector_remittance_cashreceipt_remittance] ON [subcollector_remittance_cashreceipt]
([remittanceid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table subcollector_remittance_cashreceipt
-- ----------------------------
ALTER TABLE [subcollector_remittance_cashreceipt] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table subdividedland
-- ----------------------------
CREATE INDEX [FK_subdividedland_faas] ON [subdividedland]
([newfaasid] ASC) 
GO
CREATE INDEX [FK_subdividedland_newrp] ON [subdividedland]
([newrpid] ASC) 
GO
CREATE INDEX [FK_subdividedland_newrpu] ON [subdividedland]
([newrpuid] ASC) 
GO
CREATE INDEX [FK_subdividedland_subdivision] ON [subdividedland]
([subdivisionid] ASC) 
GO
CREATE INDEX [ix_subdividedland_administrator_name] ON [subdividedland]
([administrator_name] ASC) 
GO
CREATE INDEX [ix_subdividedland_newpin] ON [subdividedland]
([newpin] ASC) 
GO
CREATE INDEX [ix_subdividedland_newtdno] ON [subdividedland]
([newtdno] ASC) 
GO
CREATE INDEX [ix_subdividedland_taxpayer_name] ON [subdividedland]
([taxpayer_name] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table subdividedland
-- ----------------------------
ALTER TABLE [subdividedland] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table subdividedland
-- ----------------------------
ALTER TABLE [subdividedland] ADD UNIQUE ([subdivisionid] ASC, [newrpid] ASC)
GO
ALTER TABLE [subdividedland] ADD UNIQUE ([newutdno] ASC)
GO

-- ----------------------------
-- Indexes structure for table subdivision
-- ----------------------------
CREATE INDEX [FK_subdivision_faas] ON [subdivision]
([motherfaasid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table subdivision
-- ----------------------------
ALTER TABLE [subdivision] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table subdivision
-- ----------------------------
ALTER TABLE [subdivision] ADD UNIQUE ([txnno] ASC)
GO

-- ----------------------------
-- Indexes structure for table subdivisionaffectedrpu
-- ----------------------------
CREATE INDEX [FK_subdivisionaffectedpru_newfaas] ON [subdivisionaffectedrpu]
([newfaasid] ASC) 
GO
CREATE INDEX [FK_subdivisionaffectedpru_newrpu] ON [subdivisionaffectedrpu]
([newrpuid] ASC) 
GO
CREATE INDEX [FK_subdivisionaffectedpru_prevfaas] ON [subdivisionaffectedrpu]
([prevfaasid] ASC) 
GO
CREATE INDEX [FK_subdivisionaffectedpru_subdividedland] ON [subdivisionaffectedrpu]
([subdividedlandid] ASC) 
GO
CREATE INDEX [FK_subdivisionaffectedpru_subdivision] ON [subdivisionaffectedrpu]
([subdivisionid] ASC) 
GO
CREATE INDEX [ix_subdivisionaffectedrpu_newtdno] ON [subdivisionaffectedrpu]
([newtdno] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table subdivisionaffectedrpu
-- ----------------------------
ALTER TABLE [subdivisionaffectedrpu] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table subdivisionaffectedrpu
-- ----------------------------
ALTER TABLE [subdivisionaffectedrpu] ADD UNIQUE ([newutdno] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_dataset
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_dataset
-- ----------------------------
ALTER TABLE [sys_dataset] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_org
-- ----------------------------
CREATE INDEX [FK_sys_org] ON [sys_org]
([parent_orgclass] ASC) 
GO
CREATE INDEX [FK_sys_org_orgclass] ON [sys_org]
([orgclass] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_org
-- ----------------------------
ALTER TABLE [sys_org] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_org
-- ----------------------------
ALTER TABLE [sys_org] ADD UNIQUE ([name] ASC, [parent_objid] ASC)
GO
ALTER TABLE [sys_org] ADD UNIQUE ([code] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_orgclass
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_orgclass
-- ----------------------------
ALTER TABLE [sys_orgclass] ADD PRIMARY KEY ([name])
GO

-- ----------------------------
-- Indexes structure for table sys_quarter
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_quarter
-- ----------------------------
ALTER TABLE [sys_quarter] ADD PRIMARY KEY ([qtrid])
GO

-- ----------------------------
-- Indexes structure for table sys_report
-- ----------------------------
CREATE INDEX [FK_sys_report_dataset] ON [sys_report]
([datasetid] ASC) 
GO
CREATE INDEX [FK_sys_report_entry_folder] ON [sys_report]
([reportfolderid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_report
-- ----------------------------
ALTER TABLE [sys_report] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_report_admin
-- ----------------------------
CREATE INDEX [FK_sys_report_admin_folder] ON [sys_report_admin]
([reportfolderid] ASC) 
GO
CREATE INDEX [FK_sys_report_admin_user] ON [sys_report_admin]
([userid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_report_admin
-- ----------------------------
ALTER TABLE [sys_report_admin] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_report_folder
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_report_folder
-- ----------------------------
ALTER TABLE [sys_report_folder] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_report_folder
-- ----------------------------
ALTER TABLE [sys_report_folder] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_report_member
-- ----------------------------
CREATE INDEX [FK_sys_report_member_folder] ON [sys_report_member]
([reportfolderid] ASC) 
GO
CREATE INDEX [FK_sys_report_member_user] ON [sys_report_member]
([userid] ASC) 
GO
CREATE INDEX [FK_sys_report_member_usergroup] ON [sys_report_member]
([usergroupid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_report_member
-- ----------------------------
ALTER TABLE [sys_report_member] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule
-- ----------------------------
ALTER TABLE [sys_rule] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_rule
-- ----------------------------
ALTER TABLE [sys_rule] ADD UNIQUE ([name] ASC, [ruleset] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_rule_action
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_action
-- ----------------------------
ALTER TABLE [sys_rule_action] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_action_param
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_action_param
-- ----------------------------
ALTER TABLE [sys_rule_action_param] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_actiondef
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_actiondef
-- ----------------------------
ALTER TABLE [sys_rule_actiondef] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_actiondef_param
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_actiondef_param
-- ----------------------------
ALTER TABLE [sys_rule_actiondef_param] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_rule_actiondef_param
-- ----------------------------
ALTER TABLE [sys_rule_actiondef_param] ADD UNIQUE ([name] ASC, [parentid] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_rule_condition
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_condition
-- ----------------------------
ALTER TABLE [sys_rule_condition] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_condition_constraint
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_condition_constraint
-- ----------------------------
ALTER TABLE [sys_rule_condition_constraint] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_condition_var
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_condition_var
-- ----------------------------
ALTER TABLE [sys_rule_condition_var] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_rule_condition_var
-- ----------------------------
ALTER TABLE [sys_rule_condition_var] ADD UNIQUE ([varname] ASC, [ruleid] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_rule_deployed
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_deployed
-- ----------------------------
ALTER TABLE [sys_rule_deployed] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_fact
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_fact
-- ----------------------------
ALTER TABLE [sys_rule_fact] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_rule_fact_field
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rule_fact_field
-- ----------------------------
ALTER TABLE [sys_rule_fact_field] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_rule_fact_field
-- ----------------------------
ALTER TABLE [sys_rule_fact_field] ADD UNIQUE ([name] ASC, [parentid] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_rulegroup
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_rulegroup
-- ----------------------------
ALTER TABLE [sys_rulegroup] ADD PRIMARY KEY ([name], [ruleset])
GO

-- ----------------------------
-- Indexes structure for table sys_ruleset
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_ruleset
-- ----------------------------
ALTER TABLE [sys_ruleset] ADD PRIMARY KEY ([name])
GO

-- ----------------------------
-- Indexes structure for table sys_ruleset_actiondef
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_ruleset_actiondef
-- ----------------------------
ALTER TABLE [sys_ruleset_actiondef] ADD PRIMARY KEY ([ruleset], [actiondef])
GO

-- ----------------------------
-- Indexes structure for table sys_ruleset_fact
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_ruleset_fact
-- ----------------------------
ALTER TABLE [sys_ruleset_fact] ADD PRIMARY KEY ([ruleset], [rulefact])
GO

-- ----------------------------
-- Indexes structure for table sys_script
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_script
-- ----------------------------
ALTER TABLE [sys_script] ADD PRIMARY KEY ([name])
GO

-- ----------------------------
-- Indexes structure for table sys_securitygroup
-- ----------------------------
CREATE INDEX [FK_sys_securitygroup_usergroup] ON [sys_securitygroup]
([usergroup_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_securitygroup
-- ----------------------------
ALTER TABLE [sys_securitygroup] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_securitygroup
-- ----------------------------
ALTER TABLE [sys_securitygroup] ADD UNIQUE ([name] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_sequence
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_sequence
-- ----------------------------
ALTER TABLE [sys_sequence] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_session
-- ----------------------------
CREATE INDEX [ix_timein] ON [sys_session]
([timein] ASC) 
GO
CREATE INDEX [ix_userid] ON [sys_session]
([userid] ASC) 
GO
CREATE INDEX [ix_username] ON [sys_session]
([username] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_session
-- ----------------------------
ALTER TABLE [sys_session] ADD PRIMARY KEY ([sessionid])
GO

-- ----------------------------
-- Indexes structure for table sys_session_log
-- ----------------------------
CREATE INDEX [ix_timein] ON [sys_session_log]
([timein] ASC) 
GO
CREATE INDEX [ix_timeout] ON [sys_session_log]
([timeout] ASC) 
GO
CREATE INDEX [ix_userid] ON [sys_session_log]
([userid] ASC) 
GO
CREATE INDEX [ix_username] ON [sys_session_log]
([username] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_session_log
-- ----------------------------
ALTER TABLE [sys_session_log] ADD PRIMARY KEY ([sessionid])
GO

-- ----------------------------
-- Indexes structure for table sys_terminal
-- ----------------------------
CREATE INDEX [FK_terminal] ON [sys_terminal]
([parentid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_terminal
-- ----------------------------
ALTER TABLE [sys_terminal] ADD PRIMARY KEY ([terminalid])
GO

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX [ix_lastname_firstname] ON [sys_user]
([lastname] ASC, [firstname] ASC) 
GO
CREATE INDEX [ix_name] ON [sys_user]
([name] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE [sys_user] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_user
-- ----------------------------
ALTER TABLE [sys_user] ADD UNIQUE ([username] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_usergroup
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_usergroup
-- ----------------------------
ALTER TABLE [sys_usergroup] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_usergroup_admin
-- ----------------------------
CREATE INDEX [FK_sys_usergroup_admin] ON [sys_usergroup_admin]
([user_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_usergroup_admin
-- ----------------------------
ALTER TABLE [sys_usergroup_admin] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Uniques structure for table sys_usergroup_admin
-- ----------------------------
ALTER TABLE [sys_usergroup_admin] ADD UNIQUE ([usergroupid] ASC, [user_objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table sys_usergroup_member
-- ----------------------------
CREATE INDEX [FK_sys_usergroup_member] ON [sys_usergroup_member]
([user_objid] ASC) 
GO
CREATE INDEX [FK_sys_usergroup_member_org] ON [sys_usergroup_member]
([org_objid] ASC) 
GO
CREATE INDEX [FK_sys_usergroup_member_securitygorup] ON [sys_usergroup_member]
([securitygroup_objid] ASC) 
GO
CREATE INDEX [ix_user_firstname] ON [sys_usergroup_member]
([user_firstname] ASC) 
GO
CREATE INDEX [ix_user_lastname_firstname] ON [sys_usergroup_member]
([user_lastname] ASC, [user_firstname] ASC) 
GO
CREATE INDEX [ix_username] ON [sys_usergroup_member]
([user_username] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_usergroup_member
-- ----------------------------
ALTER TABLE [sys_usergroup_member] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_usergroup_permission
-- ----------------------------
CREATE INDEX [FK_sys_usergroup_permission_usergroup] ON [sys_usergroup_permission]
([usergroup_objid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table sys_usergroup_permission
-- ----------------------------
ALTER TABLE [sys_usergroup_permission] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table sys_var
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_var
-- ----------------------------
ALTER TABLE [sys_var] ADD PRIMARY KEY ([name])
GO

-- ----------------------------
-- Indexes structure for table tbletracsaccountmapping
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbletracsaccountmapping
-- ----------------------------
ALTER TABLE [tbletracsaccountmapping] ADD PRIMARY KEY ([taxfeeid], [item_objid])
GO

-- ----------------------------
-- Indexes structure for table tracs_remittance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tracs_remittance
-- ----------------------------
ALTER TABLE [tracs_remittance] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table txnlog
-- ----------------------------
CREATE INDEX [ix_txndate] ON [txnlog]
([txndate] ASC) 
INCLUDE ([ref], [action], [userid], [username]) 
GO
CREATE INDEX [ix_txnlog_action] ON [txnlog]
([action] ASC) 
GO
CREATE INDEX [ix_txnlog_ref] ON [txnlog]
([ref] ASC) 
GO
CREATE INDEX [ix_txnlog_refid] ON [txnlog]
([refid] ASC) 
GO
CREATE INDEX [ix_txnlog_userid] ON [txnlog]
([userid] ASC) 
GO
CREATE INDEX [ix_txnlog_useridaction] ON [txnlog]
([userid] ASC, [action] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table txnlog
-- ----------------------------
ALTER TABLE [txnlog] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table txnref
-- ----------------------------
CREATE INDEX [ix_txnref_refid] ON [txnref]
([refid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table txnref
-- ----------------------------
ALTER TABLE [txnref] ADD PRIMARY KEY ([oid])
GO

-- ----------------------------
-- Uniques structure for table txnref
-- ----------------------------
ALTER TABLE [txnref] ADD UNIQUE ([objid] ASC)
GO

-- ----------------------------
-- Indexes structure for table txnsignatory
-- ----------------------------
CREATE INDEX [FK_signatory_personnel] ON [txnsignatory]
([personnelid] ASC) 
GO
CREATE INDEX [ix_signatory_refid] ON [txnsignatory]
([refid] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table txnsignatory
-- ----------------------------
ALTER TABLE [txnsignatory] ADD PRIMARY KEY ([objid])
GO

-- ----------------------------
-- Indexes structure for table workflowstate
-- ----------------------------
CREATE INDEX [ix_txndate] ON [workflowstate]
([txndate] ASC) 
GO
CREATE INDEX [ix_userid] ON [workflowstate]
([userid] ASC) 
GO
CREATE INDEX [ix_username] ON [workflowstate]
([username] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table workflowstate
-- ----------------------------
ALTER TABLE [workflowstate] ADD PRIMARY KEY ([objid], [state])
GO

-- ----------------------------
-- Foreign Key structure for table [account_incometarget]
-- ----------------------------
ALTER TABLE [account_incometarget] ADD FOREIGN KEY ([objid]) REFERENCES [account] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [afserial]
-- ----------------------------
ALTER TABLE [afserial] ADD FOREIGN KEY ([objid]) REFERENCES [stockitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [afserial] ADD FOREIGN KEY ([objid]) REFERENCES [collectionform] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [afserial_control]
-- ----------------------------
ALTER TABLE [afserial_control] ADD FOREIGN KEY ([controlid]) REFERENCES [afserial_inventory] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [afserial_inventory_detail]
-- ----------------------------
ALTER TABLE [afserial_inventory_detail] ADD FOREIGN KEY ([controlid]) REFERENCES [afserial_inventory] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [ap_detail]
-- ----------------------------
ALTER TABLE [ap_detail] ADD FOREIGN KEY ([parentid]) REFERENCES [ap] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [ar_detail]
-- ----------------------------
ALTER TABLE [ar_detail] ADD FOREIGN KEY ([parentid]) REFERENCES [ar] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [assessmentnoticeitem]
-- ----------------------------
ALTER TABLE [assessmentnoticeitem] ADD FOREIGN KEY ([assessmentnoticeid]) REFERENCES [assessmentnotice] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [assessmentnoticeitem] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bankaccount_account]
-- ----------------------------
ALTER TABLE [bankaccount_account] ADD FOREIGN KEY ([acctid]) REFERENCES [account] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bankaccount_account] ADD FOREIGN KEY ([objid]) REFERENCES [bankaccount] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bankaccount_entry]
-- ----------------------------
ALTER TABLE [bankaccount_entry] ADD FOREIGN KEY ([parentid]) REFERENCES [bankaccount] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bankdeposit_entry_check]
-- ----------------------------
ALTER TABLE [bankdeposit_entry_check] ADD FOREIGN KEY ([parentid]) REFERENCES [bankdeposit_entry] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bankdeposit_entry_check] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceiptpayment_check] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bankdeposit_liquidation]
-- ----------------------------
ALTER TABLE [bankdeposit_liquidation] ADD FOREIGN KEY ([bankdepositid]) REFERENCES [bankdeposit] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bankdeposit_liquidation] ADD FOREIGN KEY ([objid]) REFERENCES [liquidation_cashier_fund] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgadditionalitem]
-- ----------------------------
ALTER TABLE [bldgadditionalitem] ADD FOREIGN KEY ([previd]) REFERENCES [bldgadditionalitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgadditionalitem] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgassesslevel]
-- ----------------------------
ALTER TABLE [bldgassesslevel] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgassesslevel] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgassesslevelrange]
-- ----------------------------
ALTER TABLE [bldgassesslevelrange] ADD FOREIGN KEY ([bldgassesslevelid]) REFERENCES [bldgassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgassesslevelrange] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgfloor]
-- ----------------------------
ALTER TABLE [bldgfloor] ADD FOREIGN KEY ([bldgrpuid]) REFERENCES [bldgrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgfloor] ADD FOREIGN KEY ([bldguseid]) REFERENCES [bldguse] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgflooradditional]
-- ----------------------------
ALTER TABLE [bldgflooradditional] ADD FOREIGN KEY ([additionalitem_objid]) REFERENCES [bldgadditionalitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgflooradditional] ADD FOREIGN KEY ([bldgfloorid]) REFERENCES [bldgfloor] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgflooradditional] ADD FOREIGN KEY ([bldgrpuid]) REFERENCES [bldgrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgflooradditionalparam]
-- ----------------------------
ALTER TABLE [bldgflooradditionalparam] ADD FOREIGN KEY ([bldgflooradditionalid]) REFERENCES [bldgflooradditional] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgflooradditionalparam] ADD FOREIGN KEY ([bldgrpuid]) REFERENCES [bldgrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgflooradditionalparam] ADD FOREIGN KEY ([param_objid]) REFERENCES [rptparameter] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgkindbucc]
-- ----------------------------
ALTER TABLE [bldgkindbucc] ADD FOREIGN KEY ([bldgkind_objid]) REFERENCES [bldgkind] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgkindbucc] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgkindbucc] ADD FOREIGN KEY ([bldgtypeid]) REFERENCES [bldgtype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgrpu]
-- ----------------------------
ALTER TABLE [bldgrpu] ADD FOREIGN KEY ([bldgassesslevel_objid]) REFERENCES [bldgassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgrpu] ADD FOREIGN KEY ([bldgkindbucc_objid]) REFERENCES [bldgkindbucc] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgrpu] ADD FOREIGN KEY ([bldgtype_objid]) REFERENCES [bldgtype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgrpu] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgrpu] ADD FOREIGN KEY ([objid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgstructure]
-- ----------------------------
ALTER TABLE [bldgstructure] ADD FOREIGN KEY ([bldgrpuid]) REFERENCES [bldgrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgstructure] ADD FOREIGN KEY ([material_objid]) REFERENCES [material] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgstructure] ADD FOREIGN KEY ([structure_objid]) REFERENCES [structure] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgtype]
-- ----------------------------
ALTER TABLE [bldgtype] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgtype] ADD FOREIGN KEY ([previd]) REFERENCES [bldgtype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgtype_depreciation]
-- ----------------------------
ALTER TABLE [bldgtype_depreciation] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgtype_depreciation] ADD FOREIGN KEY ([bldgtypeid]) REFERENCES [bldgtype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldgtype_storeyadjustment]
-- ----------------------------
ALTER TABLE [bldgtype_storeyadjustment] ADD FOREIGN KEY ([previd]) REFERENCES [bldgtype_storeyadjustment] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgtype_storeyadjustment] ADD FOREIGN KEY ([bldgrysettingid]) REFERENCES [bldgrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldgtype_storeyadjustment] ADD FOREIGN KEY ([bldgtypeid]) REFERENCES [bldgtype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bldguse]
-- ----------------------------
ALTER TABLE [bldguse] ADD FOREIGN KEY ([actualuse_objid]) REFERENCES [bldgassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [bldguse] ADD FOREIGN KEY ([bldgrpuid]) REFERENCES [bldgrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bpapplication]
-- ----------------------------
ALTER TABLE [bpapplication] ADD FOREIGN KEY ([businessid]) REFERENCES [business] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bpapplication_requirement]
-- ----------------------------
ALTER TABLE [bpapplication_requirement] ADD FOREIGN KEY ([businessid]) REFERENCES [business] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bpapplication_task]
-- ----------------------------
ALTER TABLE [bpapplication_task] ADD FOREIGN KEY ([applicationid]) REFERENCES [bpapplication] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [bppayment]
-- ----------------------------
ALTER TABLE [bppayment] ADD FOREIGN KEY ([businessid]) REFERENCES [business] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [brgyshareitem]
-- ----------------------------
ALTER TABLE [brgyshareitem] ADD FOREIGN KEY ([brgyshareid]) REFERENCES [brgyshare] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [business_changeinfo]
-- ----------------------------
ALTER TABLE [business_changeinfo] ADD FOREIGN KEY ([businessid]) REFERENCES [business] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [business_taxcredit]
-- ----------------------------
ALTER TABLE [business_taxcredit] ADD FOREIGN KEY ([businessid]) REFERENCES [business] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [business_taxcredit_detail]
-- ----------------------------
ALTER TABLE [business_taxcredit_detail] ADD FOREIGN KEY ([parentid]) REFERENCES [business_taxcredit] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cancelannotation]
-- ----------------------------
ALTER TABLE [cancelannotation] ADD FOREIGN KEY ([annotationid]) REFERENCES [faasannotation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cancelledfaas]
-- ----------------------------
ALTER TABLE [cancelledfaas] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cancelledfaas] ADD FOREIGN KEY ([reason_objid]) REFERENCES [canceltdreason] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashbook]
-- ----------------------------
ALTER TABLE [cashbook] ADD FOREIGN KEY ([fund_objid]) REFERENCES [fund] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashbook_entry]
-- ----------------------------
ALTER TABLE [cashbook_entry] ADD FOREIGN KEY ([parentid]) REFERENCES [cashbook] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt]
-- ----------------------------
ALTER TABLE [cashreceipt] ADD FOREIGN KEY ([collector_objid]) REFERENCES [sys_user] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_business]
-- ----------------------------
ALTER TABLE [cashreceipt_business] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_business_item]
-- ----------------------------
ALTER TABLE [cashreceipt_business_item] ADD FOREIGN KEY ([parentid]) REFERENCES [cashreceipt_business] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashreceipt_business_item] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceiptitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_cancelseries]
-- ----------------------------
ALTER TABLE [cashreceipt_cancelseries] ADD FOREIGN KEY ([receiptid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_cashticket]
-- ----------------------------
ALTER TABLE [cashreceipt_cashticket] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_ctc_corporate]
-- ----------------------------
ALTER TABLE [cashreceipt_ctc_corporate] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_ctc_individual]
-- ----------------------------
ALTER TABLE [cashreceipt_ctc_individual] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceipt_void]
-- ----------------------------
ALTER TABLE [cashreceipt_void] ADD FOREIGN KEY ([receiptid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceiptitem]
-- ----------------------------
ALTER TABLE [cashreceiptitem] ADD FOREIGN KEY ([receiptid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceiptitem_rpt]
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt] ADD FOREIGN KEY ([rptledgerid]) REFERENCES [rptledger] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashreceiptitem_rpt] ADD FOREIGN KEY ([rptreceiptid]) REFERENCES [cashreceipt_rpt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceiptitem_rpt_account]
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt_account] ADD FOREIGN KEY ([item_objid]) REFERENCES [revenueitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashreceiptitem_rpt_account] ADD FOREIGN KEY ([rptreceiptid]) REFERENCES [cashreceipt_rpt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceiptitem_rpt_online]
-- ----------------------------
ALTER TABLE [cashreceiptitem_rpt_online] ADD FOREIGN KEY ([rptledgerid]) REFERENCES [rptledger] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashreceiptitem_rpt_online] ADD FOREIGN KEY ([rptledgerfaasid]) REFERENCES [rptledgerfaas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashreceiptitem_rpt_online] ADD FOREIGN KEY ([rptreceiptid]) REFERENCES [cashreceipt_rpt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashreceiptpayment_check]
-- ----------------------------
ALTER TABLE [cashreceiptpayment_check] ADD FOREIGN KEY ([receiptid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashreceiptpayment_check] ADD FOREIGN KEY ([bankid]) REFERENCES [bank] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashticket]
-- ----------------------------
ALTER TABLE [cashticket] ADD FOREIGN KEY ([objid]) REFERENCES [stockitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [cashticket] ADD FOREIGN KEY ([objid]) REFERENCES [collectionform] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [cashticket_control]
-- ----------------------------
ALTER TABLE [cashticket_control] ADD FOREIGN KEY ([controlid]) REFERENCES [cashticket_inventory] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [consolidatedland]
-- ----------------------------
ALTER TABLE [consolidatedland] ADD FOREIGN KEY ([consolidationid]) REFERENCES [consolidation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [consolidatedland] ADD FOREIGN KEY ([landfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [consolidation]
-- ----------------------------
ALTER TABLE [consolidation] ADD FOREIGN KEY ([newfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [consolidation] ADD FOREIGN KEY ([newrpid]) REFERENCES [realproperty] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [consolidation] ADD FOREIGN KEY ([newrpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [consolidationaffectedrpu]
-- ----------------------------
ALTER TABLE [consolidationaffectedrpu] ADD FOREIGN KEY ([consolidationid]) REFERENCES [consolidation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [consolidationaffectedrpu] ADD FOREIGN KEY ([newfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [consolidationaffectedrpu] ADD FOREIGN KEY ([newrpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [consolidationaffectedrpu] ADD FOREIGN KEY ([prevfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [directcash_collection_item]
-- ----------------------------
ALTER TABLE [directcash_collection_item] ADD FOREIGN KEY ([parentid]) REFERENCES [directcash_collection] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [directcash_collection_item] ADD FOREIGN KEY ([item_objid]) REFERENCES [revenueitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [faas]
-- ----------------------------
ALTER TABLE [faas] ADD FOREIGN KEY ([rpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [faasannotation]
-- ----------------------------
ALTER TABLE [faasannotation] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [faasannotation] ADD FOREIGN KEY ([annotationtype_objid]) REFERENCES [faasannotationtype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [faasbacktax]
-- ----------------------------
ALTER TABLE [faasbacktax] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [faasupdate]
-- ----------------------------
ALTER TABLE [faasupdate] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landadjustment]
-- ----------------------------
ALTER TABLE [landadjustment] ADD FOREIGN KEY ([adjustmenttype_objid]) REFERENCES [landadjustmenttype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landadjustment] ADD FOREIGN KEY ([landdetailid]) REFERENCES [landdetail] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landadjustment] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landadjustmentparameter]
-- ----------------------------
ALTER TABLE [landadjustmentparameter] ADD FOREIGN KEY ([landadjustmentid]) REFERENCES [landadjustment] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landadjustmentparameter] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landadjustmentparameter] ADD FOREIGN KEY ([parameter_objid]) REFERENCES [rptparameter] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landadjustmenttype]
-- ----------------------------
ALTER TABLE [landadjustmenttype] ADD FOREIGN KEY ([landrysettingid]) REFERENCES [landrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landadjustmenttype_classification]
-- ----------------------------
ALTER TABLE [landadjustmenttype_classification] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landadjustmenttype_classification] ADD FOREIGN KEY ([landadjustmenttypeid]) REFERENCES [landadjustmenttype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landassesslevel]
-- ----------------------------
ALTER TABLE [landassesslevel] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landassesslevel] ADD FOREIGN KEY ([landrysettingid]) REFERENCES [landrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landassesslevelrange]
-- ----------------------------
ALTER TABLE [landassesslevelrange] ADD FOREIGN KEY ([landrysettingid]) REFERENCES [landrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landassesslevelrange] ADD FOREIGN KEY ([landassesslevelid]) REFERENCES [landassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landdetail]
-- ----------------------------
ALTER TABLE [landdetail] ADD FOREIGN KEY ([actualuse_objid]) REFERENCES [landassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landdetail] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landdetail] ADD FOREIGN KEY ([specificclass_objid]) REFERENCES [lcuvspecificclass] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [landdetail] ADD FOREIGN KEY ([subclass_objid]) REFERENCES [lcuvsubclass] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [landrpu]
-- ----------------------------
ALTER TABLE [landrpu] ADD FOREIGN KEY ([objid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [lcuvspecificclass]
-- ----------------------------
ALTER TABLE [lcuvspecificclass] ADD FOREIGN KEY ([landrysettingid]) REFERENCES [landrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [lcuvspecificclass] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [lcuvstripping]
-- ----------------------------
ALTER TABLE [lcuvstripping] ADD FOREIGN KEY ([landrysettingid]) REFERENCES [landrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [lcuvstripping] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [lcuvsubclass]
-- ----------------------------
ALTER TABLE [lcuvsubclass] ADD FOREIGN KEY ([landrysettingid]) REFERENCES [landrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [lcuvsubclass] ADD FOREIGN KEY ([specificclass_objid]) REFERENCES [lcuvspecificclass] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [liquidation_cashier_fund]
-- ----------------------------
ALTER TABLE [liquidation_cashier_fund] ADD FOREIGN KEY ([liquidationid]) REFERENCES [liquidation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [liquidation_checkpayment]
-- ----------------------------
ALTER TABLE [liquidation_checkpayment] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceiptpayment_check] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [liquidation_checkpayment] ADD FOREIGN KEY ([liquidationid]) REFERENCES [liquidation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [liquidation_remittance]
-- ----------------------------
ALTER TABLE [liquidation_remittance] ADD FOREIGN KEY ([liquidationid]) REFERENCES [liquidation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [liquidation_remittance] ADD FOREIGN KEY ([objid]) REFERENCES [remittance] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [machassesslevel]
-- ----------------------------
ALTER TABLE [machassesslevel] ADD FOREIGN KEY ([machrysettingid]) REFERENCES [machrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machassesslevel] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [machassesslevelrange]
-- ----------------------------
ALTER TABLE [machassesslevelrange] ADD FOREIGN KEY ([machassesslevelid]) REFERENCES [machassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machassesslevelrange] ADD FOREIGN KEY ([machrysettingid]) REFERENCES [machrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [machdetail]
-- ----------------------------
ALTER TABLE [machdetail] ADD FOREIGN KEY ([feracid]) REFERENCES [machforex] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machdetail] ADD FOREIGN KEY ([forexid]) REFERENCES [machforex] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machdetail] ADD FOREIGN KEY ([machine_objid]) REFERENCES [machine] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machdetail] ADD FOREIGN KEY ([machrpuid]) REFERENCES [machrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machdetail] ADD FOREIGN KEY ([machuseid]) REFERENCES [machuse] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [machforex]
-- ----------------------------
ALTER TABLE [machforex] ADD FOREIGN KEY ([machrysettingid]) REFERENCES [machrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [machrpu]
-- ----------------------------
ALTER TABLE [machrpu] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machrpu] ADD FOREIGN KEY ([objid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [machuse]
-- ----------------------------
ALTER TABLE [machuse] ADD FOREIGN KEY ([actualuse_objid]) REFERENCES [machassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [machuse] ADD FOREIGN KEY ([machrpuid]) REFERENCES [machrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [mcsettlement]
-- ----------------------------
ALTER TABLE [mcsettlement] ADD FOREIGN KEY ([newfaas_objid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [mcsettlement] ADD FOREIGN KEY ([prevfaas_objid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [mcsettlement_affectedrpu]
-- ----------------------------
ALTER TABLE [mcsettlement_affectedrpu] ADD FOREIGN KEY ([mcsettlementid]) REFERENCES [mcsettlement] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [mcsettlement_affectedrpu] ADD FOREIGN KEY ([newfaas_objid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [mcsettlement_affectedrpu] ADD FOREIGN KEY ([prevfaas_objid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [mcsettlement_otherclaim]
-- ----------------------------
ALTER TABLE [mcsettlement_otherclaim] ADD FOREIGN KEY ([faas_objid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [mcsettlement_otherclaim] ADD FOREIGN KEY ([mcsettlementid]) REFERENCES [mcsettlement] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [miscassesslevel]
-- ----------------------------
ALTER TABLE [miscassesslevel] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscassesslevel] ADD FOREIGN KEY ([miscrysettingid]) REFERENCES [miscrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [miscassesslevelrange]
-- ----------------------------
ALTER TABLE [miscassesslevelrange] ADD FOREIGN KEY ([miscassesslevelid]) REFERENCES [miscassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscassesslevelrange] ADD FOREIGN KEY ([miscrysettingid]) REFERENCES [miscrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [miscitemvalue]
-- ----------------------------
ALTER TABLE [miscitemvalue] ADD FOREIGN KEY ([miscitem_objid]) REFERENCES [miscitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscitemvalue] ADD FOREIGN KEY ([miscrysettingid]) REFERENCES [miscrysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [miscrpu]
-- ----------------------------
ALTER TABLE [miscrpu] ADD FOREIGN KEY ([actualuse_objid]) REFERENCES [miscassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscrpu] ADD FOREIGN KEY ([objid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [miscrpuitem]
-- ----------------------------
ALTER TABLE [miscrpuitem] ADD FOREIGN KEY ([miscitem_objid]) REFERENCES [miscitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscrpuitem] ADD FOREIGN KEY ([miv_objid]) REFERENCES [miscitemvalue] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscrpuitem] ADD FOREIGN KEY ([miscrpuid]) REFERENCES [miscrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [miscrpuitem_rptparameter]
-- ----------------------------
ALTER TABLE [miscrpuitem_rptparameter] ADD FOREIGN KEY ([miscrpuid]) REFERENCES [miscrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscrpuitem_rptparameter] ADD FOREIGN KEY ([miscrpuitemid]) REFERENCES [miscrpuitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [miscrpuitem_rptparameter] ADD FOREIGN KEY ([param_objid]) REFERENCES [rptparameter] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [ngas_revenue_deposit]
-- ----------------------------
ALTER TABLE [ngas_revenue_deposit] ADD FOREIGN KEY ([objid]) REFERENCES [bankdeposit] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [ngas_revenue_deposit] ADD FOREIGN KEY ([parentid]) REFERENCES [ngas_revenue] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [ngas_revenue_remittance]
-- ----------------------------
ALTER TABLE [ngas_revenue_remittance] ADD FOREIGN KEY ([parentid]) REFERENCES [ngas_revenue] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [ngas_revenueitem]
-- ----------------------------
ALTER TABLE [ngas_revenueitem] ADD FOREIGN KEY ([collectiontype_objid]) REFERENCES [collectiontype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [ngas_revenueitem] ADD FOREIGN KEY ([depositid]) REFERENCES [bankdeposit] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [ngas_revenueitem] ADD FOREIGN KEY ([fund_objid]) REFERENCES [fund] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [ngas_revenueitem] ADD FOREIGN KEY ([liquidationid]) REFERENCES [liquidation] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [ngas_revenueitem] ADD FOREIGN KEY ([parentid]) REFERENCES [ngas_revenue] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [ngas_revenueitem] ADD FOREIGN KEY ([item_objid]) REFERENCES [revenueitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [pin]
-- ----------------------------
ALTER TABLE [pin] ADD FOREIGN KEY ([barangayid]) REFERENCES [barangay] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [planttreeassesslevel]
-- ----------------------------
ALTER TABLE [planttreeassesslevel] ADD FOREIGN KEY ([planttreerysettingid]) REFERENCES [planttreerysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [planttreedetail]
-- ----------------------------
ALTER TABLE [planttreedetail] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [planttreedetail] ADD FOREIGN KEY ([actualuse_objid]) REFERENCES [planttreeassesslevel] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [planttreedetail] ADD FOREIGN KEY ([planttree_objid]) REFERENCES [planttree] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [planttreedetail] ADD FOREIGN KEY ([planttreerpuid]) REFERENCES [planttreerpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [planttreedetail] ADD FOREIGN KEY ([planttreeunitvalue_objid]) REFERENCES [planttreeunitvalue] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [planttreerpu]
-- ----------------------------
ALTER TABLE [planttreerpu] ADD FOREIGN KEY ([landrpuid]) REFERENCES [landrpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [planttreerpu] ADD FOREIGN KEY ([objid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [planttreerysetting]
-- ----------------------------
ALTER TABLE [planttreerysetting] ADD FOREIGN KEY ([previd]) REFERENCES [planttreerysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [planttreeunitvalue]
-- ----------------------------
ALTER TABLE [planttreeunitvalue] ADD FOREIGN KEY ([planttree_objid]) REFERENCES [planttree] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [planttreeunitvalue] ADD FOREIGN KEY ([planttreerysettingid]) REFERENCES [planttreerysetting] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [previousfaas]
-- ----------------------------
ALTER TABLE [previousfaas] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [previousfaas] ADD FOREIGN KEY ([prevfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [realproperty]
-- ----------------------------
ALTER TABLE [realproperty] ADD FOREIGN KEY ([barangayid]) REFERENCES [barangay] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [remittance_afserial]
-- ----------------------------
ALTER TABLE [remittance_afserial] ADD FOREIGN KEY ([objid]) REFERENCES [afserial_inventory_detail] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [remittance_afserial] ADD FOREIGN KEY ([remittanceid]) REFERENCES [remittance] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [remittance_cashreceipt]
-- ----------------------------
ALTER TABLE [remittance_cashreceipt] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [remittance_cashreceipt] ADD FOREIGN KEY ([remittanceid]) REFERENCES [remittance] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [remittance_cashticket]
-- ----------------------------
ALTER TABLE [remittance_cashticket] ADD FOREIGN KEY ([objid]) REFERENCES [cashticket_inventory_detail] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [remittance_checkpayment]
-- ----------------------------
ALTER TABLE [remittance_checkpayment] ADD FOREIGN KEY ([remittanceid]) REFERENCES [remittance] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [remittance_fund]
-- ----------------------------
ALTER TABLE [remittance_fund] ADD FOREIGN KEY ([remittanceid]) REFERENCES [remittance] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [resectionaffectedrpu]
-- ----------------------------
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([newfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([newrpid]) REFERENCES [realproperty] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([newrpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([prevfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([prevrpid]) REFERENCES [realproperty] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([prevrpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [resectionaffectedrpu] ADD FOREIGN KEY ([resectionid]) REFERENCES [resection] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [resectionitem]
-- ----------------------------
ALTER TABLE [resectionitem] ADD FOREIGN KEY ([resectionid]) REFERENCES [resection] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [revenueitem_attribute]
-- ----------------------------
ALTER TABLE [revenueitem_attribute] ADD FOREIGN KEY ([attribute_objid]) REFERENCES [revenueitem_attribute_type] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [revenueitem_attribute] ADD FOREIGN KEY ([revitemid]) REFERENCES [revenueitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rpt_requirement]
-- ----------------------------
ALTER TABLE [rpt_requirement] ADD FOREIGN KEY ([requirementtypeid]) REFERENCES [rpt_requirement_type] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rpt_sales_data]
-- ----------------------------
ALTER TABLE [rpt_sales_data] ADD FOREIGN KEY ([objid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptbill_ledger]
-- ----------------------------
ALTER TABLE [rptbill_ledger] ADD FOREIGN KEY ([rptbillid]) REFERENCES [rptbill] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptbill_ledger_account]
-- ----------------------------
ALTER TABLE [rptbill_ledger_account] ADD FOREIGN KEY ([item_objid]) REFERENCES [revenueitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptbill_ledger_item]
-- ----------------------------
ALTER TABLE [rptbill_ledger_item] ADD FOREIGN KEY ([rptledgerid]) REFERENCES [rptledger] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rptbill_ledger_item] ADD FOREIGN KEY ([rptledgerfaasid]) REFERENCES [rptledgerfaas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptcertification]
-- ----------------------------
ALTER TABLE [rptcertification] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptcertificationitem]
-- ----------------------------
ALTER TABLE [rptcertificationitem] ADD FOREIGN KEY ([rptcertificationid]) REFERENCES [rptcertification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptledger]
-- ----------------------------
ALTER TABLE [rptledger] ADD FOREIGN KEY ([barangayid]) REFERENCES [barangay] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rptledger] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptledgerbillitem]
-- ----------------------------
ALTER TABLE [rptledgerbillitem] ADD FOREIGN KEY ([rptledgerid]) REFERENCES [rptledger] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rptledgerbillitem] ADD FOREIGN KEY ([rptledgerfaasid]) REFERENCES [rptledgerfaas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptledgerfaas]
-- ----------------------------
ALTER TABLE [rptledgerfaas] ADD FOREIGN KEY ([faasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rptledgerfaas] ADD FOREIGN KEY ([rptledgerid]) REFERENCES [rptledger] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rpttaxclearance]
-- ----------------------------
ALTER TABLE [rpttaxclearance] ADD FOREIGN KEY ([objid]) REFERENCES [rptcertification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rpttaxincentive_item]
-- ----------------------------
ALTER TABLE [rpttaxincentive_item] ADD FOREIGN KEY ([rptledgerid]) REFERENCES [rptledger] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rpttaxincentive_item] ADD FOREIGN KEY ([rpttaxincentiveid]) REFERENCES [rpttaxincentive] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rptworkflow_state]
-- ----------------------------
ALTER TABLE [rptworkflow_state] ADD FOREIGN KEY ([workflowid]) REFERENCES [rptworkflow] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [rpu]
-- ----------------------------
ALTER TABLE [rpu] ADD FOREIGN KEY ([exemptiontype_objid]) REFERENCES [exemptiontype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rpu] ADD FOREIGN KEY ([classification_objid]) REFERENCES [propertyclassification] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rpu] ADD FOREIGN KEY ([realpropertyid]) REFERENCES [realproperty] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [rpu] ADD FOREIGN KEY ([rpumasterid]) REFERENCES [rpumaster] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [specialaccountsetting]
-- ----------------------------
ALTER TABLE [specialaccountsetting] ADD FOREIGN KEY ([collectiontypeid]) REFERENCES [collectiontype] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stockissue]
-- ----------------------------
ALTER TABLE [stockissue] ADD FOREIGN KEY ([request_objid]) REFERENCES [stockrequest] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stockissueitem]
-- ----------------------------
ALTER TABLE [stockissueitem] ADD FOREIGN KEY ([parentid]) REFERENCES [stockissue] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stockitem_unit]
-- ----------------------------
ALTER TABLE [stockitem_unit] ADD FOREIGN KEY ([itemid]) REFERENCES [stockitem] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stockreceipt]
-- ----------------------------
ALTER TABLE [stockreceipt] ADD FOREIGN KEY ([request_objid]) REFERENCES [stockrequest] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stockreceiptitem]
-- ----------------------------
ALTER TABLE [stockreceiptitem] ADD FOREIGN KEY ([parentid]) REFERENCES [stockreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stocksale]
-- ----------------------------
ALTER TABLE [stocksale] ADD FOREIGN KEY ([request_objid]) REFERENCES [stockrequest] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [stocksaleitem]
-- ----------------------------
ALTER TABLE [stocksaleitem] ADD FOREIGN KEY ([parentid]) REFERENCES [stocksale] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [structurematerial]
-- ----------------------------
ALTER TABLE [structurematerial] ADD FOREIGN KEY ([material_objid]) REFERENCES [material] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [structurematerial] ADD FOREIGN KEY ([structure_objid]) REFERENCES [structure] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [subcollector_remittance_cashreceipt]
-- ----------------------------
ALTER TABLE [subcollector_remittance_cashreceipt] ADD FOREIGN KEY ([objid]) REFERENCES [cashreceipt] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subcollector_remittance_cashreceipt] ADD FOREIGN KEY ([remittanceid]) REFERENCES [subcollector_remittance] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [subdividedland]
-- ----------------------------
ALTER TABLE [subdividedland] ADD FOREIGN KEY ([newfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdividedland] ADD FOREIGN KEY ([newrpid]) REFERENCES [realproperty] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdividedland] ADD FOREIGN KEY ([newrpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdividedland] ADD FOREIGN KEY ([subdivisionid]) REFERENCES [subdivision] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [subdivision]
-- ----------------------------
ALTER TABLE [subdivision] ADD FOREIGN KEY ([motherfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [subdivisionaffectedrpu]
-- ----------------------------
ALTER TABLE [subdivisionaffectedrpu] ADD FOREIGN KEY ([newfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdivisionaffectedrpu] ADD FOREIGN KEY ([newrpuid]) REFERENCES [rpu] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdivisionaffectedrpu] ADD FOREIGN KEY ([prevfaasid]) REFERENCES [faas] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdivisionaffectedrpu] ADD FOREIGN KEY ([subdividedlandid]) REFERENCES [subdividedland] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [subdivisionaffectedrpu] ADD FOREIGN KEY ([subdivisionid]) REFERENCES [subdivision] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_org]
-- ----------------------------
ALTER TABLE [sys_org] ADD FOREIGN KEY ([parent_orgclass]) REFERENCES [sys_orgclass] ([name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_org] ADD FOREIGN KEY ([orgclass]) REFERENCES [sys_orgclass] ([name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_report]
-- ----------------------------
ALTER TABLE [sys_report] ADD FOREIGN KEY ([datasetid]) REFERENCES [sys_dataset] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_report] ADD FOREIGN KEY ([reportfolderid]) REFERENCES [sys_report_folder] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_report_admin]
-- ----------------------------
ALTER TABLE [sys_report_admin] ADD FOREIGN KEY ([reportfolderid]) REFERENCES [sys_report_folder] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_report_admin] ADD FOREIGN KEY ([userid]) REFERENCES [sys_user] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_report_member]
-- ----------------------------
ALTER TABLE [sys_report_member] ADD FOREIGN KEY ([reportfolderid]) REFERENCES [sys_report_folder] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_report_member] ADD FOREIGN KEY ([userid]) REFERENCES [sys_user] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_report_member] ADD FOREIGN KEY ([usergroupid]) REFERENCES [sys_usergroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule]
-- ----------------------------
ALTER TABLE [sys_rule] ADD FOREIGN KEY ([rulegroup], [ruleset]) REFERENCES [sys_rulegroup] ([name], [ruleset]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_rule] ADD FOREIGN KEY ([ruleset]) REFERENCES [sys_ruleset] ([name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_action]
-- ----------------------------
ALTER TABLE [sys_rule_action] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_action_param]
-- ----------------------------
ALTER TABLE [sys_rule_action_param] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule_action] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_rule_action_param] ADD FOREIGN KEY ([var_objid]) REFERENCES [sys_rule_condition_var] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_actiondef_param]
-- ----------------------------
ALTER TABLE [sys_rule_actiondef_param] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule_actiondef] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_condition]
-- ----------------------------
ALTER TABLE [sys_rule_condition] ADD FOREIGN KEY ([fact_objid]) REFERENCES [sys_rule_fact] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_rule_condition] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_condition_constraint]
-- ----------------------------
ALTER TABLE [sys_rule_condition_constraint] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule_condition] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_rule_condition_constraint] ADD FOREIGN KEY ([var_objid]) REFERENCES [sys_rule_condition_var] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_condition_var]
-- ----------------------------
ALTER TABLE [sys_rule_condition_var] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule_condition] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_deployed]
-- ----------------------------
ALTER TABLE [sys_rule_deployed] ADD FOREIGN KEY ([objid]) REFERENCES [sys_rule] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rule_fact_field]
-- ----------------------------
ALTER TABLE [sys_rule_fact_field] ADD FOREIGN KEY ([parentid]) REFERENCES [sys_rule_fact] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_rulegroup]
-- ----------------------------
ALTER TABLE [sys_rulegroup] ADD FOREIGN KEY ([ruleset]) REFERENCES [sys_ruleset] ([name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_ruleset_actiondef]
-- ----------------------------
ALTER TABLE [sys_ruleset_actiondef] ADD FOREIGN KEY ([actiondef]) REFERENCES [sys_rule_actiondef] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_ruleset_actiondef] ADD FOREIGN KEY ([ruleset]) REFERENCES [sys_ruleset] ([name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_ruleset_fact]
-- ----------------------------
ALTER TABLE [sys_ruleset_fact] ADD FOREIGN KEY ([rulefact]) REFERENCES [sys_rule_fact] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_ruleset_fact] ADD FOREIGN KEY ([ruleset]) REFERENCES [sys_ruleset] ([name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_securitygroup]
-- ----------------------------
ALTER TABLE [sys_securitygroup] ADD FOREIGN KEY ([usergroup_objid]) REFERENCES [sys_usergroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_usergroup_admin]
-- ----------------------------
ALTER TABLE [sys_usergroup_admin] ADD FOREIGN KEY ([user_objid]) REFERENCES [sys_user] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_usergroup_admin] ADD FOREIGN KEY ([usergroupid]) REFERENCES [sys_usergroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_usergroup_member]
-- ----------------------------
ALTER TABLE [sys_usergroup_member] ADD FOREIGN KEY ([user_objid]) REFERENCES [sys_user] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_usergroup_member] ADD FOREIGN KEY ([org_objid]) REFERENCES [sys_org] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_usergroup_member] ADD FOREIGN KEY ([securitygroup_objid]) REFERENCES [sys_securitygroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_usergroup_member] ADD FOREIGN KEY ([usergroup_objid]) REFERENCES [sys_usergroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [sys_usergroup_permission]
-- ----------------------------
ALTER TABLE [sys_usergroup_permission] ADD FOREIGN KEY ([usergroup_objid]) REFERENCES [sys_usergroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [sys_usergroup_permission] ADD FOREIGN KEY ([usergroup_objid]) REFERENCES [sys_usergroup] ([objid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
