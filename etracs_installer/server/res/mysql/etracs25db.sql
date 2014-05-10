-- MySQL dump 10.10
--
-- Host: 192.168.254.119    Database: etracs25
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `etracs25`
--

CREATE DATABASE IF NOT EXISTS `@dbname`;
USE `@dbname`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `state` varchar(10) default NULL,
  `chartid` varchar(50) default NULL,
  `code` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(20) default NULL,
  `acctgroup` varchar(50) default NULL,
  `target` decimal(12,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `account_incometarget`
--

DROP TABLE IF EXISTS `account_incometarget`;
CREATE TABLE `account_incometarget` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(18,2) default NULL,
  PRIMARY KEY  (`objid`,`year`),
  CONSTRAINT `account_incometarget_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afserial`
--

DROP TABLE IF EXISTS `afserial`;
CREATE TABLE `afserial` (
  `objid` varchar(50) NOT NULL,
  `serieslength` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `afserial_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `stockitem` (`objid`),
  CONSTRAINT `afserial_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `collectionform` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afserial_control`
--

DROP TABLE IF EXISTS `afserial_control`;
CREATE TABLE `afserial_control` (
  `controlid` varchar(50) NOT NULL,
  `txnmode` varchar(10) default NULL,
  `assignee_objid` varchar(50) default NULL,
  `assignee_name` varchar(50) default NULL,
  `currentseries` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `active` int(11) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  PRIMARY KEY  (`controlid`),
  CONSTRAINT `afserial_control_ibfk_1` FOREIGN KEY (`controlid`) REFERENCES `afserial_inventory` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afserial_inventory`
--

DROP TABLE IF EXISTS `afserial_inventory`;
CREATE TABLE `afserial_inventory` (
  `objid` varchar(50) NOT NULL,
  `afid` varchar(50) default NULL,
  `respcenter_objid` varchar(50) default NULL,
  `respcenter_name` varchar(50) default NULL,
  `respcenter_type` varchar(25) default NULL,
  `startseries` int(11) default NULL,
  `endseries` int(11) default NULL,
  `currentseries` int(11) default NULL,
  `startstub` int(11) default NULL,
  `endstub` int(11) default NULL,
  `currentstub` int(11) default NULL,
  `prefix` varchar(10) default NULL,
  `suffix` varchar(10) default NULL,
  `unit` varchar(10) default NULL,
  `qtyin` int(11) default NULL,
  `qtyout` int(11) default NULL,
  `qtycancelled` int(11) default NULL,
  `qtybalance` int(11) default NULL,
  `currentlineno` int(11) default NULL,
  `cost` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afserial_inventory_detail`
--

DROP TABLE IF EXISTS `afserial_inventory_detail`;
CREATE TABLE `afserial_inventory_detail` (
  `objid` varchar(50) NOT NULL,
  `controlid` varchar(50) default NULL,
  `lineno` int(11) default NULL,
  `refid` varchar(50) default NULL,
  `refno` varchar(50) default NULL,
  `reftype` varchar(50) default NULL,
  `refdate` datetime default NULL,
  `txndate` datetime default NULL,
  `txntype` varchar(25) default NULL,
  `receivedstartseries` int(11) default NULL,
  `receivedendseries` int(11) default NULL,
  `beginstartseries` int(11) default NULL,
  `beginendseries` int(11) default NULL,
  `issuedstartseries` int(11) default NULL,
  `issuedendseries` int(11) default NULL,
  `endingstartseries` int(11) default NULL,
  `endingendseries` int(11) default NULL,
  `cancelledstartseries` int(11) default NULL,
  `cancelledendseries` int(11) default NULL,
  `qtyreceived` int(11) default NULL,
  `qtybegin` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `qtyending` int(11) default NULL,
  `qtycancelled` int(11) default NULL,
  `remarks` varchar(255) default NULL,
  `cost` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_afcontrol_detail_afcontrol` (`controlid`),
  CONSTRAINT `afserial_inventory_detail_ibfk_1` FOREIGN KEY (`controlid`) REFERENCES `afserial_inventory` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afserial_inventory_detail_cancelseries`
--

DROP TABLE IF EXISTS `afserial_inventory_detail_cancelseries`;
CREATE TABLE `afserial_inventory_detail_cancelseries` (
  `objid` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `controlid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afserialcapture`
--

DROP TABLE IF EXISTS `afserialcapture`;
CREATE TABLE `afserialcapture` (
  `controlid` varchar(50) NOT NULL,
  PRIMARY KEY  (`controlid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `afstockcontrol`
--

DROP TABLE IF EXISTS `afstockcontrol`;
CREATE TABLE `afstockcontrol` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `af` varchar(10) default NULL,
  `refid` varchar(50) default NULL,
  `reftype` varchar(25) default NULL,
  `refdate` datetime default NULL,
  `startstub` int(11) default NULL,
  `endstub` int(11) default NULL,
  `currentstub` int(11) default NULL,
  `startseries` int(11) default NULL,
  `endseries` int(11) default NULL,
  `currentseries` int(11) default NULL,
  `prefix` varchar(50) default NULL,
  `suffix` varchar(50) default NULL,
  `qtyreceived` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `qtybalance` int(11) default NULL,
  `qtycancelled` int(11) default NULL,
  `currentindexno` int(11) default NULL,
  `unit` varchar(10) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ap`
--

DROP TABLE IF EXISTS `ap`;
CREATE TABLE `ap` (
  `objid` varchar(50) NOT NULL,
  `subacctid` varchar(50) default NULL,
  `subacctclass` varchar(50) default NULL,
  `subaccttitle` varchar(50) default NULL,
  `sltype` varchar(10) default NULL,
  `totaldr` decimal(10,2) default NULL,
  `totalcr` decimal(10,2) default NULL,
  `balance` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ap_detail`
--

DROP TABLE IF EXISTS `ap_detail`;
CREATE TABLE `ap_detail` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `txndate` datetime default NULL,
  `txnrefid` varchar(50) default NULL,
  `txnrefno` varchar(50) default NULL,
  `txnreftype` varchar(50) default NULL,
  `particulars` varchar(255) default NULL,
  `dr` decimal(16,2) default NULL,
  `cr` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ap_detail_ap` (`parentid`),
  CONSTRAINT `ap_detail_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `ap` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ar`
--

DROP TABLE IF EXISTS `ar`;
CREATE TABLE `ar` (
  `objid` varchar(50) NOT NULL,
  `subacctid` varchar(50) default NULL,
  `subacctclass` varchar(50) default NULL,
  `subaccttitle` varchar(50) default NULL,
  `sltype` varchar(10) default NULL,
  `totaldr` decimal(10,2) default NULL,
  `totalcr` decimal(10,2) default NULL,
  `balance` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ar_detail`
--

DROP TABLE IF EXISTS `ar_detail`;
CREATE TABLE `ar_detail` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `txndate` datetime default NULL,
  `txnrefid` varchar(50) default NULL,
  `txnrefno` varchar(50) default NULL,
  `txnreftype` varchar(50) default NULL,
  `particulars` varchar(255) default NULL,
  `dr` decimal(16,2) default NULL,
  `cr` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ar_detail_ar` (`parentid`),
  CONSTRAINT `ar_detail_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `ar` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `assessmentnotice`
--

DROP TABLE IF EXISTS `assessmentnotice`;
CREATE TABLE `assessmentnotice` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txnno` varchar(10) default NULL,
  `txndate` datetime default NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayername` text NOT NULL,
  `taxpayeraddress` varchar(150) NOT NULL,
  `createdbyid` varchar(50) default NULL,
  `createdbyname` varchar(100) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `approvedbyid` varchar(50) default NULL,
  `approvedbyname` varchar(100) default NULL,
  `approvedbytitle` varchar(50) default NULL,
  `dtdelivered` datetime default NULL,
  `receivedby` varchar(150) default NULL,
  `remarks` text,
  `assessmentyear` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_assessmentnotice_receivedby` (`receivedby`),
  KEY `ix_assessmentnotice_state` (`state`),
  KEY `ix_assessmentnotice_taxpayerid` (`taxpayerid`),
  KEY `ix_assessmentnotice_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `assessmentnoticeitem`
--

DROP TABLE IF EXISTS `assessmentnoticeitem`;
CREATE TABLE `assessmentnoticeitem` (
  `objid` varchar(50) NOT NULL,
  `assessmentnoticeid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_assessmentnoticeitem_assessmentnotice` (`assessmentnoticeid`),
  KEY `FK_assessmentnoticeitem_faas` (`faasid`),
  CONSTRAINT `assessmentnoticeitem_ibfk_1` FOREIGN KEY (`assessmentnoticeid`) REFERENCES `assessmentnotice` (`objid`),
  CONSTRAINT `assessmentnoticeitem_ibfk_2` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `address` varchar(255) default NULL,
  `manager` varchar(50) default NULL,
  `deposittype` varchar(50) default NULL,
  `depository` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_bank_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
CREATE TABLE `bankaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) default NULL,
  `accttype` varchar(50) NOT NULL,
  `bank_objid` varchar(50) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `fund_objid` varchar(50) NOT NULL,
  `fund_code` varchar(50) NOT NULL,
  `fund_title` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `cashreport` varchar(50) default NULL,
  `cashbreakdownreport` varchar(50) default NULL,
  `checkreport` varchar(50) default NULL,
  `forwardbalance` decimal(16,2) default NULL,
  `beginbalance` decimal(16,2) default NULL,
  `totaldr` decimal(16,2) default NULL,
  `totalcr` decimal(16,2) default NULL,
  `endbalance` decimal(16,2) default NULL,
  `currentlineno` int(11) default NULL,
  `checkbreakdownreport` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankaccount_account`
--

DROP TABLE IF EXISTS `bankaccount_account`;
CREATE TABLE `bankaccount_account` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bankaccount_account_account` (`acctid`),
  CONSTRAINT `bankaccount_account_ibfk_1` FOREIGN KEY (`acctid`) REFERENCES `account` (`objid`),
  CONSTRAINT `bankaccount_account_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `bankaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankaccount_entry`
--

DROP TABLE IF EXISTS `bankaccount_entry`;
CREATE TABLE `bankaccount_entry` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `txndate` datetime default NULL,
  `refdate` datetime default NULL,
  `refid` varchar(50) default NULL,
  `refno` varchar(50) default NULL,
  `reftype` varchar(50) default NULL,
  `particulars` varchar(255) default NULL,
  `dr` decimal(16,2) default NULL,
  `cr` decimal(16,2) default NULL,
  `runbalance` decimal(16,2) default NULL,
  `lineno` int(11) default NULL,
  `postingrefid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `bankaccount_parent` (`parentid`),
  KEY `idx_bankaccount_refid` (`refid`),
  CONSTRAINT `bankaccount_entry_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `bankaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankdeposit`
--

DROP TABLE IF EXISTS `bankdeposit`;
CREATE TABLE `bankdeposit` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(50) default NULL,
  `dtposted` datetime default NULL,
  `cashier_objid` varchar(50) default NULL,
  `cashier_name` varchar(100) default NULL,
  `cashier_title` varchar(50) default NULL,
  `totalcash` decimal(16,2) default NULL,
  `totalnoncash` decimal(16,2) default NULL,
  `amount` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankdeposit_entry`
--

DROP TABLE IF EXISTS `bankdeposit_entry`;
CREATE TABLE `bankdeposit_entry` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `bankaccount_objid` varchar(50) NOT NULL,
  `bankaccount_code` varchar(50) NOT NULL,
  `bankaccount_title` varchar(255) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `cashbreakdown` text NOT NULL,
  `summaries` longtext,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankdeposit_entry_check`
--

DROP TABLE IF EXISTS `bankdeposit_entry_check`;
CREATE TABLE `bankdeposit_entry_check` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bankdeposit_check` (`parentid`),
  CONSTRAINT `bankdeposit_entry_check_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `bankdeposit_entry` (`objid`),
  CONSTRAINT `bankdeposit_entry_check_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `cashreceiptpayment_check` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bankdeposit_liquidation`
--

DROP TABLE IF EXISTS `bankdeposit_liquidation`;
CREATE TABLE `bankdeposit_liquidation` (
  `objid` varchar(50) NOT NULL,
  `bankdepositid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bankdeposit_liquidation` (`bankdepositid`),
  CONSTRAINT `bankdeposit_liquidation_ibfk_1` FOREIGN KEY (`bankdepositid`) REFERENCES `bankdeposit` (`objid`),
  CONSTRAINT `bankdeposit_liquidation_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `liquidation_cashier_fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
CREATE TABLE `barangay` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `indexno` varchar(15) default NULL,
  `pin` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `captain_name` varchar(100) default NULL,
  `captain_title` varchar(50) default NULL,
  `captain_office` varchar(50) default NULL,
  `treasurer_name` varchar(100) default NULL,
  `treasurer_title` varchar(50) default NULL,
  `treasurer_office` varchar(50) default NULL,
  `oldindexno` varchar(15) default NULL,
  `oldpin` varchar(15) default NULL,
  `fullname` varchar(250) default NULL,
  `address` varchar(250) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lgu_barangay_indexno` (`indexno`),
  KEY `ix_lgu_barangay_parentid` (`parentid`),
  KEY `ix_lgu_barangay_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `batchcapture_collection`
--

DROP TABLE IF EXISTS `batchcapture_collection`;
CREATE TABLE `batchcapture_collection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txndate` datetime NOT NULL,
  `defaultreceiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `stub` int(11) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `formtype` varchar(10) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `serieslength` int(11) NOT NULL,
  `prefix` varchar(10) default NULL,
  `suffix` varchar(10) default NULL,
  `startseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `totalamount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `collectiontype_objid` varchar(50) default NULL,
  `collectiontype_name` varchar(100) default NULL,
  `collector_objid` varchar(50) default NULL,
  `collector_name` varchar(100) default NULL,
  `collector_title` varchar(50) default NULL,
  `capturedby_objid` varchar(50) default NULL,
  `capturedby_name` varchar(100) default NULL,
  `capturedby_title` varchar(50) default NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `postedby_objid` varchar(50) default NULL,
  `postedby_name` varchar(100) default NULL,
  `postedby_date` datetime default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_batchcapture_collection_capturedbyname` (`capturedby_name`),
  KEY `ix_batchcapture_collection_collectorname` (`collector_name`),
  KEY `ix_batchcapture_collection_txndate` (`txndate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `batchcapture_collection_entry`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry`;
CREATE TABLE `batchcapture_collection_entry` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `paidby` varchar(100) NOT NULL,
  `paidbyaddress` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `series` int(11) NOT NULL,
  `collectiontype_objid` varchar(50) default NULL,
  `collectiontype_name` varchar(100) default NULL,
  `remarks` varchar(255) default NULL,
  `particulars` longtext,
  `voided` int(11) default NULL,
  `paymentitems` longtext,
  PRIMARY KEY  (`objid`),
  KEY `ix_batchcapture_collection_entry_parentid` (`parentid`),
  KEY `ix_batchcapture_collection_entry_receiptdate` (`receiptdate`),
  KEY `ix_batchcapture_collection_entry_receiptno` (`receiptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `batchcapture_collection_entry_item`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry_item`;
CREATE TABLE `batchcapture_collection_entry_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `item_objid` varchar(50) default NULL,
  `item_code` varchar(50) default NULL,
  `item_title` varchar(50) default NULL,
  `fund_objid` varchar(50) default NULL,
  `fund_code` varchar(50) default NULL,
  `fund_title` varchar(50) default NULL,
  `amount` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_batchcapture_collection_entry_item_item_code` (`item_code`),
  KEY `ix_batchcapture_collection_entry_item_parentid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `batchgrerror`
--

DROP TABLE IF EXISTS `batchgrerror`;
CREATE TABLE `batchgrerror` (
  `faasid` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `msg` longtext,
  PRIMARY KEY  (`faasid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgadditionalitem`
--

DROP TABLE IF EXISTS `bldgadditionalitem`;
CREATE TABLE `bldgadditionalitem` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit` varchar(25) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `bldgrysettingid` (`bldgrysettingid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `bldgadditionalitem_ibfk_1` FOREIGN KEY (`previd`) REFERENCES `bldgadditionalitem` (`objid`),
  CONSTRAINT `bldgadditionalitem_ibfk_2` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgassesslevel`
--

DROP TABLE IF EXISTS `bldgassesslevel`;
CREATE TABLE `bldgassesslevel` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) default NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgassesslevel_bldgrysettingid` (`bldgrysettingid`),
  KEY `FK_bldgassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `bldgassesslevel_ibfk_1` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `bldgassesslevel_ibfk_2` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgassesslevelrange`
--

DROP TABLE IF EXISTS `bldgassesslevelrange`;
CREATE TABLE `bldgassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `bldgassesslevelid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(16,2) NOT NULL,
  `mvto` decimal(16,2) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `bldgassesslevelid` (`bldgassesslevelid`),
  KEY `FK_bldgassesslevelrange_bldgrysetting` (`bldgrysettingid`),
  CONSTRAINT `bldgassesslevelrange_ibfk_1` FOREIGN KEY (`bldgassesslevelid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `bldgassesslevelrange_ibfk_2` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgfloor`
--

DROP TABLE IF EXISTS `bldgfloor`;
CREATE TABLE `bldgfloor` (
  `objid` varchar(50) NOT NULL,
  `bldguseid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `floorno` varchar(5) NOT NULL,
  `area` decimal(16,2) NOT NULL,
  `storeyrate` decimal(16,2) NOT NULL,
  `basevalue` decimal(16,2) NOT NULL,
  `unitvalue` decimal(16,2) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgfloor_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgfloor_bldguse` (`bldguseid`),
  CONSTRAINT `bldgfloor_ibfk_1` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `bldgfloor_ibfk_2` FOREIGN KEY (`bldguseid`) REFERENCES `bldguse` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgflooradditional`
--

DROP TABLE IF EXISTS `bldgflooradditional`;
CREATE TABLE `bldgflooradditional` (
  `objid` varchar(50) NOT NULL,
  `bldgfloorid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `additionalitem_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `expr` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgflooradditional_additionalitem` (`additionalitem_objid`),
  KEY `FK_bldgflooradditional_bldgfloor` (`bldgfloorid`),
  KEY `FK_bldgflooradditional_bldgrpu` (`bldgrpuid`),
  CONSTRAINT `bldgflooradditional_ibfk_1` FOREIGN KEY (`additionalitem_objid`) REFERENCES `bldgadditionalitem` (`objid`),
  CONSTRAINT `bldgflooradditional_ibfk_2` FOREIGN KEY (`bldgfloorid`) REFERENCES `bldgfloor` (`objid`),
  CONSTRAINT `bldgflooradditional_ibfk_3` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgflooradditionalparam`
--

DROP TABLE IF EXISTS `bldgflooradditionalparam`;
CREATE TABLE `bldgflooradditionalparam` (
  `objid` varchar(50) NOT NULL,
  `bldgflooradditionalid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `param_objid` varchar(50) NOT NULL,
  `intvalue` int(11) default NULL,
  `decimalvalue` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgflooradditionalparam_bldgflooradditional` (`bldgflooradditionalid`),
  KEY `FK_bldgflooradditionalparam_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgflooradditionalparam_param` (`param_objid`),
  CONSTRAINT `bldgflooradditionalparam_ibfk_1` FOREIGN KEY (`bldgflooradditionalid`) REFERENCES `bldgflooradditional` (`objid`),
  CONSTRAINT `bldgflooradditionalparam_ibfk_2` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `bldgflooradditionalparam_ibfk_3` FOREIGN KEY (`param_objid`) REFERENCES `rptparameter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgkind`
--

DROP TABLE IF EXISTS `bldgkind`;
CREATE TABLE `bldgkind` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_bldgkind_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgkindbucc`
--

DROP TABLE IF EXISTS `bldgkindbucc`;
CREATE TABLE `bldgkindbucc` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgkind_objid` varchar(50) NOT NULL,
  `basevaluetype` varchar(25) NOT NULL,
  `basevalue` decimal(10,2) NOT NULL,
  `minbasevalue` decimal(10,2) NOT NULL,
  `maxbasevalue` decimal(10,2) NOT NULL,
  `gapvalue` int(11) NOT NULL,
  `minarea` decimal(10,2) NOT NULL,
  `maxarea` decimal(10,2) NOT NULL,
  `bldgclass` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `bldgrysettingid` (`bldgrysettingid`),
  KEY `FK_bldgkindbucc_bldgkind` (`bldgkind_objid`),
  KEY `FK_bldgkindbucc_bldgtype` (`bldgtypeid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `bldgkindbucc_ibfk_1` FOREIGN KEY (`bldgkind_objid`) REFERENCES `bldgkind` (`objid`),
  CONSTRAINT `bldgkindbucc_ibfk_2` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `bldgkindbucc_ibfk_3` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgrpu`
--

DROP TABLE IF EXISTS `bldgrpu`;
CREATE TABLE `bldgrpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) default NULL,
  `houseno` varchar(25) default NULL,
  `psic` varchar(255) default NULL,
  `permitno` varchar(255) default NULL,
  `permitdate` datetime default NULL,
  `permitissuedby` varchar(255) default NULL,
  `bldgtype_objid` varchar(50) default NULL,
  `bldgkindbucc_objid` varchar(50) default NULL,
  `basevalue` decimal(16,2) NOT NULL,
  `dtcompleted` datetime default NULL,
  `dtoccupied` datetime default NULL,
  `floorcount` int(11) NOT NULL,
  `depreciation` decimal(16,2) NOT NULL,
  `depreciationvalue` decimal(16,2) NOT NULL,
  `totaladjustment` decimal(16,2) NOT NULL,
  `additionalinfo` text,
  `bldgage` int(11) NOT NULL,
  `percentcompleted` int(11) NOT NULL,
  `bldgassesslevel_objid` varchar(50) default NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `condominium` int(11) NOT NULL,
  `bldgclass` varchar(15) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgrpu_bldgassesslevel` (`bldgassesslevel_objid`),
  KEY `FK_bldgrpu_bldgkindbucc` (`bldgkindbucc_objid`),
  KEY `FK_bldgrpu_bldgtype` (`bldgtype_objid`),
  KEY `FK_bldgrpu_landrpu` (`landrpuid`),
  CONSTRAINT `bldgrpu_ibfk_1` FOREIGN KEY (`bldgassesslevel_objid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `bldgrpu_ibfk_2` FOREIGN KEY (`bldgkindbucc_objid`) REFERENCES `bldgkindbucc` (`objid`),
  CONSTRAINT `bldgrpu_ibfk_3` FOREIGN KEY (`bldgtype_objid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `bldgrpu_ibfk_4` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `bldgrpu_ibfk_5` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgrysetting`
--

DROP TABLE IF EXISTS `bldgrysetting`;
CREATE TABLE `bldgrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `predominant` int(11) NOT NULL,
  `depreciatecoreanditemseparately` int(11) NOT NULL,
  `computedepreciationbasedonschedule` int(11) NOT NULL,
  `straightdepreciation` varchar(50) NOT NULL,
  `calcbldgagebasedondtoccupied` int(11) NOT NULL,
  `appliedto` longtext,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_bldgrysetting_previd` (`previd`),
  KEY `ix_bldgrysetting_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgstructure`
--

DROP TABLE IF EXISTS `bldgstructure`;
CREATE TABLE `bldgstructure` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `structure_objid` varchar(50) NOT NULL,
  `material_objid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgstructure_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgstructure_material` (`material_objid`),
  KEY `FK_bldgstructure_structure` (`structure_objid`),
  CONSTRAINT `bldgstructure_ibfk_1` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `bldgstructure_ibfk_2` FOREIGN KEY (`material_objid`) REFERENCES `material` (`objid`),
  CONSTRAINT `bldgstructure_ibfk_3` FOREIGN KEY (`structure_objid`) REFERENCES `structure` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgtype`
--

DROP TABLE IF EXISTS `bldgtype`;
CREATE TABLE `bldgtype` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `basevaluetype` varchar(10) NOT NULL,
  `residualrate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `bldgrysettingid` (`bldgrysettingid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `bldgtype_ibfk_1` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `bldgtype_ibfk_2` FOREIGN KEY (`previd`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgtype_depreciation`
--

DROP TABLE IF EXISTS `bldgtype_depreciation`;
CREATE TABLE `bldgtype_depreciation` (
  `objid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `agefrom` int(11) NOT NULL,
  `ageto` int(11) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldgtype_depreciation_bldgrysetting` (`bldgrysettingid`),
  KEY `ix_bldgtypeid` (`bldgtypeid`),
  CONSTRAINT `bldgtype_depreciation_ibfk_1` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `bldgtype_depreciation_ibfk_2` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldgtype_storeyadjustment`
--

DROP TABLE IF EXISTS `bldgtype_storeyadjustment`;
CREATE TABLE `bldgtype_storeyadjustment` (
  `objid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `floorno` varchar(10) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `bldgtypeid` (`bldgtypeid`),
  KEY `FK_bldgtype_storeyadjustment` (`previd`),
  KEY `FK_bldgtype_storeyadjustment_bldgrysetting` (`bldgrysettingid`),
  CONSTRAINT `bldgtype_storeyadjustment_ibfk_1` FOREIGN KEY (`previd`) REFERENCES `bldgtype_storeyadjustment` (`objid`),
  CONSTRAINT `bldgtype_storeyadjustment_ibfk_2` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `bldgtype_storeyadjustment_ibfk_3` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bldguse`
--

DROP TABLE IF EXISTS `bldguse`;
CREATE TABLE `bldguse` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `basevalue` decimal(16,2) NOT NULL,
  `area` decimal(16,2) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `depreciationvalue` decimal(16,2) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_bldguse_bldgassesslevel` (`actualuse_objid`),
  KEY `FK_bldguse_bldgrpu` (`bldgrpuid`),
  CONSTRAINT `bldguse_ibfk_1` FOREIGN KEY (`actualuse_objid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `bldguse_ibfk_2` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bpapplication`
--

DROP TABLE IF EXISTS `bpapplication`;
CREATE TABLE `bpapplication` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) default NULL,
  `appno` varchar(50) default NULL,
  `apptype` varchar(25) default NULL,
  `amendtype` varchar(50) default NULL,
  `dtfiled` date default NULL,
  `txndate` datetime default NULL,
  `tradename` varchar(255) default NULL,
  `owner_objid` varchar(50) default NULL,
  `owner_name` varchar(255) default NULL,
  `owner_address_text` varchar(255) default NULL,
  `businessaddress_text` varchar(255) default NULL,
  `orgtype` varchar(50) default NULL,
  `yearstarted` int(11) default NULL,
  `appyear` int(11) default NULL,
  `txnmode` varchar(25) default NULL,
  `businessid` varchar(50) default NULL,
  `businessname` varchar(255) default NULL,
  `appinfos` longtext,
  `assessmentinfos` longtext,
  `lobs` longtext,
  `requirements` longtext,
  `taxfees` longtext,
  `assessedby_objid` varchar(50) default NULL,
  `assessedby_name` varchar(255) default NULL,
  `createdby_objid` varchar(50) default NULL,
  `createdby_name` varchar(255) default NULL,
  `approvedby_objid` varchar(50) default NULL,
  `approvedby_name` varchar(255) default NULL,
  `dtreleased` datetime default NULL,
  `task_objid` varchar(50) default NULL,
  `totals_tax` decimal(18,2) default NULL,
  `totals_regfee` decimal(18,2) default NULL,
  `totals_othercharge` decimal(18,2) default NULL,
  `totals_total` decimal(18,2) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `businessid` (`businessid`),
  CONSTRAINT `bpapplication_ibfk_1` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bpapplication_requirement`
--

DROP TABLE IF EXISTS `bpapplication_requirement`;
CREATE TABLE `bpapplication_requirement` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `applicationid` varchar(50) default NULL,
  `refid` varchar(50) default NULL,
  `reftype` varchar(50) default NULL,
  `refno` varchar(50) default NULL,
  `issuedby` varchar(100) default NULL,
  `placeissued` varchar(100) default NULL,
  `title` varchar(50) default NULL,
  `remarks` varchar(255) default NULL,
  `status` varchar(25) default NULL,
  `step` varchar(50) default NULL,
  `completedby_objid` varchar(50) default NULL,
  `completedby_name` varchar(50) default NULL,
  `dtcompleted` datetime default NULL,
  PRIMARY KEY  (`objid`),
  KEY `businessid` (`businessid`),
  CONSTRAINT `bpapplication_requirement_ibfk_1` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bpapplication_task`
--

DROP TABLE IF EXISTS `bpapplication_task`;
CREATE TABLE `bpapplication_task` (
  `objid` varchar(50) NOT NULL,
  `applicationid` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `channel` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `assignee_objid` varchar(50) default NULL,
  `assignee_name` varchar(255) default NULL,
  `message` varchar(255) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `sender_objid` varchar(50) default NULL,
  `sender_name` varchar(255) default NULL,
  `action` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `applicationid` (`applicationid`),
  CONSTRAINT `bpapplication_task_ibfk_1` FOREIGN KEY (`applicationid`) REFERENCES `bpapplication` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bpexpirydate`
--

DROP TABLE IF EXISTS `bpexpirydate`;
CREATE TABLE `bpexpirydate` (
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `expirydate` date default NULL,
  `reason` text,
  PRIMARY KEY  (`year`,`qtr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bppayment`
--

DROP TABLE IF EXISTS `bppayment`;
CREATE TABLE `bppayment` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `applicationid` varchar(50) default NULL,
  `refno` varchar(50) default NULL,
  `refdate` date default NULL,
  `amount` decimal(18,2) default NULL,
  `remarks` varchar(255) default NULL,
  `voided` int(11) default NULL,
  `payoption` varchar(50) default NULL,
  `qtr` int(11) default NULL,
  `reftype` varchar(50) default NULL,
  `refid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `businessid` (`businessid`),
  CONSTRAINT `bppayment_ibfk_1` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bppayment_item`
--

DROP TABLE IF EXISTS `bppayment_item`;
CREATE TABLE `bppayment_item` (
  `objid` varchar(50) NOT NULL,
  `receivableid` varchar(50) default NULL,
  `businessid` varchar(50) default NULL,
  `paymentid` varchar(50) default NULL,
  `iqtr` int(11) default NULL,
  `amtpaid` decimal(16,2) default NULL,
  `surchargepaid` decimal(16,2) default NULL,
  `interestpaid` decimal(16,2) default NULL,
  `discount` decimal(16,2) default NULL,
  `iyear` int(11) default NULL,
  `voided` int(11) default NULL,
  `account_objid` varchar(50) default NULL,
  `account_code` varchar(50) default NULL,
  `account_title` varchar(100) default NULL,
  `lob_objid` varchar(50) default NULL,
  `lob_name` varchar(255) default NULL,
  `cashreceiptitemid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bpreceivable`
--

DROP TABLE IF EXISTS `bpreceivable`;
CREATE TABLE `bpreceivable` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `applicationid` varchar(50) default NULL,
  `iyear` int(11) default NULL,
  `iqtr` int(11) default NULL,
  `account_objid` varchar(50) default NULL,
  `account_title` varchar(100) default NULL,
  `lob_objid` varchar(50) default NULL,
  `lob_name` varchar(100) default NULL,
  `lob_assessmenttype` varchar(50) default NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `refid` varchar(50) default NULL,
  `reftype` varchar(50) default NULL,
  `remarks` varchar(255) default NULL,
  `department` varchar(50) default NULL,
  `taxfeetype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `brgy_taxaccount_mapping`
--

DROP TABLE IF EXISTS `brgy_taxaccount_mapping`;
CREATE TABLE `brgy_taxaccount_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `advacct_objid` varchar(50) default NULL,
  `advintacct_objid` varchar(50) default NULL,
  `prevacct_objid` varchar(50) default NULL,
  `previntacct_objid` varchar(50) default NULL,
  `prioracct_objid` varchar(50) default NULL,
  `priorintacct_objid` varchar(50) default NULL,
  `curracct_objid` varchar(50) default NULL,
  `currintacct_objid` varchar(50) default NULL,
  PRIMARY KEY  (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Table structure for table `brgyshare`
--

DROP TABLE IF EXISTS `brgyshare`;
CREATE TABLE `brgyshare` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(15) default NULL,
  `txndate` datetime default NULL,
  `year` int(11) default NULL,
  `month` int(11) default NULL,
  `totalshare` decimal(16,2) NOT NULL,
  `createdbyid` varchar(50) default NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `postedbyid` varchar(50) default NULL,
  `postedby` varchar(150) default NULL,
  `postedbytitle` varchar(50) default NULL,
  `sharetype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_brgyshare_state` (`state`),
  KEY `ix_brgyshare_yq` (`year`),
  KEY `ix_brgyshare_yqm` (`year`,`month`),
  KEY `ix_brgyshare_yr` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `brgyshare_account_mapping`
--

DROP TABLE IF EXISTS `brgyshare_account_mapping`;
CREATE TABLE `brgyshare_account_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `acct_objid` varchar(50) NOT NULL,
  `penaltyacct_objid` varchar(50) default NULL,
  PRIMARY KEY  (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `brgyshareitem`
--

DROP TABLE IF EXISTS `brgyshareitem`;
CREATE TABLE `brgyshareitem` (
  `objid` varchar(50) NOT NULL,
  `brgyshareid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `basicshare` decimal(16,2) NOT NULL,
  `basicintshare` decimal(16,2) NOT NULL,
  `commonshare` decimal(16,2) default NULL,
  `basiccurrent` decimal(16,2) default NULL,
  `basicprevious` decimal(16,2) default NULL,
  `basiccollection` decimal(16,2) default NULL,
  `basicintcollection` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `brgyshareid` (`brgyshareid`),
  CONSTRAINT `brgyshareitem_ibfk_1` FOREIGN KEY (`brgyshareid`) REFERENCES `brgyshare` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `objid` varchar(50) NOT NULL,
  `apptype` varchar(50) default NULL,
  `state` varchar(15) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_objid` varchar(50) NOT NULL,
  `owner_address_text` varchar(255) default NULL,
  `businessname` varchar(255) default NULL,
  `tradename` varchar(255) NOT NULL,
  `businessaddress_text` varchar(255) default NULL,
  `businessaddress_objid` varchar(50) default NULL,
  `orgtype` varchar(50) default NULL,
  `yearstarted` int(11) default NULL,
  `activeyear` int(11) default NULL,
  `pin` varchar(50) default NULL,
  `taxcredit` decimal(18,2) default NULL,
  `currentapplicationid` varchar(50) default NULL,
  `currentpermitid` varchar(50) default NULL,
  `bin` varchar(50) default NULL,
  `qtrpaid` int(11) default NULL,
  `appcount` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_assessment_info`
--

DROP TABLE IF EXISTS `business_assessment_info`;
CREATE TABLE `business_assessment_info` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `attribute_objid` varchar(50) default NULL,
  `attribute_name` varchar(50) default NULL,
  `lob_objid` varchar(50) default NULL,
  `lob_name` varchar(100) default NULL,
  `decimalvalue` decimal(16,2) default NULL,
  `intvalue` int(11) default NULL,
  `stringvalue` varchar(255) default NULL,
  `boolvalue` int(11) default NULL,
  `phase` int(11) default NULL,
  `level` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_changeinfo`
--

DROP TABLE IF EXISTS `business_changeinfo`;
CREATE TABLE `business_changeinfo` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `dtfiled` datetime default NULL,
  `filedby_objid` varchar(50) default NULL,
  `filedby_name` varchar(100) default NULL,
  `owner_name` varchar(100) default NULL,
  `owner_objid` varchar(50) default NULL,
  `owner_address` varchar(255) default NULL,
  `barangay_objid` varchar(50) default NULL,
  `barangay_name` varchar(50) default NULL,
  `tradename` varchar(255) default NULL,
  `businessaddress` varchar(255) default NULL,
  `orgtype` varchar(50) default NULL,
  `businessname` varchar(255) default NULL,
  `pin` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `businessid` (`businessid`),
  CONSTRAINT `business_changeinfo_ibfk_1` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_cityengineer`
--

DROP TABLE IF EXISTS `business_cityengineer`;
CREATE TABLE `business_cityengineer` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `state` varchar(25) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_cityengineer_fee`
--

DROP TABLE IF EXISTS `business_cityengineer_fee`;
CREATE TABLE `business_cityengineer_fee` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `state` varchar(50) default NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(255) default NULL,
  `amount` decimal(18,2) default NULL,
  `recurring` int(11) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_name` varchar(255) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_info`
--

DROP TABLE IF EXISTS `business_info`;
CREATE TABLE `business_info` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `attribute_objid` varchar(50) default NULL,
  `attribute_name` varchar(50) default NULL,
  `decimalvalue` decimal(16,2) default NULL,
  `intvalue` int(11) default NULL,
  `stringvalue` varchar(255) default NULL,
  `boolvalue` int(11) default NULL,
  `phase` int(11) default NULL,
  `level` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_lob`
--

DROP TABLE IF EXISTS `business_lob`;
CREATE TABLE `business_lob` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `lobid` varchar(50) default NULL,
  `name` varchar(100) default NULL,
  `assessmenttype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_redflag`
--

DROP TABLE IF EXISTS `business_redflag`;
CREATE TABLE `business_redflag` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `message` varchar(255) default NULL,
  `severity` int(11) default NULL,
  `dtposted` datetime default NULL,
  `postedby_objid` varchar(50) default NULL,
  `postedby_name` varchar(255) default NULL,
  `resolved` int(11) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_sms`
--

DROP TABLE IF EXISTS `business_sms`;
CREATE TABLE `business_sms` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `traceid` varchar(50) default NULL,
  `phoneno` varchar(50) default NULL,
  `logdate` datetime default NULL,
  `message` varchar(255) default NULL,
  `amount` decimal(10,2) default NULL,
  `amtpaid` decimal(10,2) default NULL,
  `action` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_taxcredit`
--

DROP TABLE IF EXISTS `business_taxcredit`;
CREATE TABLE `business_taxcredit` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `totaldr` decimal(18,2) default NULL,
  `totalcr` decimal(18,2) default NULL,
  `balance` decimal(18,2) default NULL,
  `currentlineno` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `businessid` (`businessid`),
  CONSTRAINT `business_taxcredit_ibfk_1` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `business_taxcredit_detail`
--

DROP TABLE IF EXISTS `business_taxcredit_detail`;
CREATE TABLE `business_taxcredit_detail` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `lineno` int(11) default NULL,
  `particulars` varchar(100) default NULL,
  `refid` varchar(50) default NULL,
  `refdate` date default NULL,
  `refno` varchar(50) default NULL,
  `reftype` varchar(20) default NULL,
  `dr` decimal(18,2) default NULL,
  `cr` decimal(18,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `business_taxcredit_detail_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `business_taxcredit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `businesspermit`
--

DROP TABLE IF EXISTS `businesspermit`;
CREATE TABLE `businesspermit` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) default NULL,
  `permitno` varchar(20) default NULL,
  `activeyear` int(11) default NULL,
  `version` int(11) default NULL,
  `permittype` varchar(20) default NULL,
  `apptype` varchar(50) default NULL,
  `bin` varchar(50) default NULL,
  `pin` varchar(50) default NULL,
  `ownername` varchar(255) default NULL,
  `tradename` varchar(255) default NULL,
  `businessaddress` varchar(255) default NULL,
  `businessid` varchar(50) default NULL,
  `applicationid` varchar(50) default NULL,
  `dtissued` date default NULL,
  `issuedby_objid` varchar(50) default NULL,
  `issuedby_name` varchar(255) default NULL,
  `expirydate` date default NULL,
  `remarks` varchar(255) default NULL,
  `lobs` longtext,
  `payments` longtext,
  `appinfos` longtext,
  `assessmentinfos` longtext,
  `owneraddress` varchar(255) default NULL,
  `businessname` varchar(255) default NULL,
  `orgtype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `businessrequirement`
--

DROP TABLE IF EXISTS `businessrequirement`;
CREATE TABLE `businessrequirement` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(50) default NULL,
  `handler` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `businessvariable`
--

DROP TABLE IF EXISTS `businessvariable`;
CREATE TABLE `businessvariable` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) default NULL,
  `arrayvalues` longtext,
  `system` int(11) default NULL,
  `sortorder` int(11) default NULL,
  `category` varchar(100) default NULL,
  `handler` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cancelannotation`
--

DROP TABLE IF EXISTS `cancelannotation`;
CREATE TABLE `cancelannotation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txnno` varchar(10) default NULL,
  `txndate` datetime default NULL,
  `annotationid` varchar(50) NOT NULL,
  `fileno` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `orno` varchar(10) default NULL,
  `ordate` datetime default NULL,
  `oramount` decimal(16,2) NOT NULL,
  `signedby` varchar(150) NOT NULL,
  `signedbytitle` varchar(50) NOT NULL,
  `dtsigned` datetime default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_cancelannotation_faasannotation` (`annotationid`),
  KEY `ix_cancelannotation_fileno` (`fileno`),
  KEY `ix_cancelannotation_txnno` (`txnno`),
  CONSTRAINT `cancelannotation_ibfk_1` FOREIGN KEY (`annotationid`) REFERENCES `faasannotation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cancelledfaas`
--

DROP TABLE IF EXISTS `cancelledfaas`;
CREATE TABLE `cancelledfaas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txndate` datetime NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `reason_objid` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_cancelledfaas_faas` (`faasid`),
  KEY `FK_cancelledfaas_reason` (`reason_objid`),
  CONSTRAINT `cancelledfaas_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `cancelledfaas_ibfk_2` FOREIGN KEY (`reason_objid`) REFERENCES `canceltdreason` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `canceltdreason`
--

DROP TABLE IF EXISTS `canceltdreason`;
CREATE TABLE `canceltdreason` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_canceltdreason_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashbook`
--

DROP TABLE IF EXISTS `cashbook`;
CREATE TABLE `cashbook` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `code` varchar(50) default NULL,
  `title` varchar(100) default NULL,
  `description` varchar(100) default NULL,
  `type` varchar(50) default NULL,
  `subacct_objid` varchar(50) default NULL,
  `subacct_name` varchar(50) default NULL,
  `fund_objid` varchar(50) default NULL,
  `fund_code` varchar(50) default NULL,
  `fund_title` varchar(100) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_code` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `beginbalance` decimal(16,2) default NULL,
  `forwardbalance` decimal(16,2) default NULL,
  `totaldr` decimal(16,2) default NULL,
  `totalcr` decimal(16,2) default NULL,
  `endbalance` decimal(16,2) default NULL,
  `currentlineno` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_cashbook_fund` (`fund_objid`),
  CONSTRAINT `cashbook_ibfk_1` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashbook_entry`
--

DROP TABLE IF EXISTS `cashbook_entry`;
CREATE TABLE `cashbook_entry` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `txndate` datetime default NULL,
  `refdate` datetime default NULL,
  `refid` varchar(50) default NULL,
  `refno` varchar(50) default NULL,
  `reftype` varchar(50) default NULL,
  `particulars` text,
  `dr` decimal(16,2) default NULL,
  `cr` decimal(16,2) default NULL,
  `runbalance` decimal(16,2) default NULL,
  `lineno` int(11) default NULL,
  `postingrefid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `cashbook_parent` (`parentid`),
  KEY `idx_refid` (`refid`),
  KEY `uix_parent_refid_reftype` (`parentid`,`refid`,`reftype`),
  CONSTRAINT `cashbook_entry_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `cashbook` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt`
--

DROP TABLE IF EXISTS `cashreceipt`;
CREATE TABLE `cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `payer_objid` varchar(50) default NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(100) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `cashchange` decimal(16,2) NOT NULL,
  `totalcredit` decimal(16,2) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `collectiontype_objid` varchar(50) default NULL,
  `collectiontype_name` varchar(100) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_name` varchar(100) default NULL,
  `remarks` varchar(200) default NULL,
  `subcollector_objid` varchar(50) default NULL,
  `subcollector_name` varchar(100) default NULL,
  `subcollector_title` varchar(50) default NULL,
  `formtype` varchar(25) default NULL,
  `stub` varchar(25) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorname` (`collector_name`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `cashreceipt_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_burial`
--

DROP TABLE IF EXISTS `cashreceipt_burial`;
CREATE TABLE `cashreceipt_burial` (
  `objid` varchar(50) NOT NULL,
  `tocitymuni` varchar(100) default NULL,
  `toprovince` varchar(100) default NULL,
  `permissiontype` varchar(15) default NULL,
  `name` varchar(100) default NULL,
  `nationality` varchar(15) default NULL,
  `age` int(11) default NULL,
  `sex` varchar(10) default NULL,
  `dtdeath` varchar(15) default NULL,
  `deathcause` varchar(50) default NULL,
  `cemetery` varchar(50) default NULL,
  `infectious` varchar(50) default NULL,
  `embalmed` varchar(50) default NULL,
  `disposition` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_business`
--

DROP TABLE IF EXISTS `cashreceipt_business`;
CREATE TABLE `cashreceipt_business` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) default NULL,
  `applicationid` varchar(50) default NULL,
  `tradename` varchar(255) default NULL,
  `payoption` varchar(50) default NULL,
  `qtr` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `cashreceipt_business_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_business_item`
--

DROP TABLE IF EXISTS `cashreceipt_business_item`;
CREATE TABLE `cashreceipt_business_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `fromqtr` int(11) default NULL,
  `toqtr` int(11) default NULL,
  `lob_objid` varchar(50) default NULL,
  `lob_name` varchar(255) default NULL,
  `year` int(11) default NULL,
  `paymentmode` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `cashreceipt_business_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `cashreceipt_business` (`objid`),
  CONSTRAINT `cashreceipt_business_item_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `cashreceiptitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_cancelseries`
--

DROP TABLE IF EXISTS `cashreceipt_cancelseries`;
CREATE TABLE `cashreceipt_cancelseries` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) default NULL,
  `postedby_name` varchar(100) default NULL,
  `reason` varchar(255) default NULL,
  `controlid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `receiptid` (`receiptid`),
  CONSTRAINT `cashreceipt_cancelseries_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_cashticket`
--

DROP TABLE IF EXISTS `cashreceipt_cashticket`;
CREATE TABLE `cashreceipt_cashticket` (
  `objid` varchar(50) NOT NULL,
  `qtyissued` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `cashreceipt_cashticket_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_ctc_corporate`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_corporate`;
CREATE TABLE `cashreceipt_ctc_corporate` (
  `objid` varchar(50) NOT NULL,
  `payer_tin` varchar(50) default NULL,
  `payer_orgtype` varchar(50) default NULL,
  `payer_nature` varchar(50) default NULL,
  `payer_dtregistered` datetime default NULL,
  `payer_placeregistered` varchar(100) default NULL,
  `additional_remarks` varchar(100) default NULL,
  `realpropertyav` decimal(16,2) NOT NULL,
  `businessgross` decimal(16,2) NOT NULL,
  `basictax` decimal(16,2) NOT NULL,
  `propertyavtax` decimal(16,2) NOT NULL,
  `businessgrosstax` decimal(16,2) NOT NULL,
  `totaltax` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `amountdue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `cashreceipt_ctc_corporate_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_ctc_individual`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_individual`;
CREATE TABLE `cashreceipt_ctc_individual` (
  `objid` varchar(50) NOT NULL,
  `payer_profession` varchar(50) default NULL,
  `payer_citizenship` varchar(50) default NULL,
  `payer_civilstatus` varchar(25) default NULL,
  `payer_height` varchar(25) default NULL,
  `payer_weight` varchar(25) default NULL,
  `additional_remarks` varchar(100) default NULL,
  `businessgross` decimal(16,2) NOT NULL,
  `annualsalary` decimal(16,2) NOT NULL,
  `propertyincome` decimal(16,2) NOT NULL,
  `basictax` decimal(16,2) NOT NULL,
  `salarytax` decimal(16,2) NOT NULL,
  `businessgrosstax` decimal(16,2) NOT NULL,
  `propertyincometax` decimal(16,2) NOT NULL,
  `additionaltax` decimal(16,2) NOT NULL,
  `totaltax` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `amountdue` decimal(16,2) NOT NULL,
  `interestdue` decimal(16,2) NOT NULL,
  `barangay_objid` varchar(50) default NULL,
  `barangay_name` varchar(50) default NULL,
  `brgytaxshare` decimal(16,2) NOT NULL,
  `brgyinterestshare` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `cashreceipt_ctc_individual_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_largecattleownership`
--

DROP TABLE IF EXISTS `cashreceipt_largecattleownership`;
CREATE TABLE `cashreceipt_largecattleownership` (
  `objid` varchar(50) NOT NULL,
  `ownerof` varchar(200) default NULL,
  `sex` varchar(10) default NULL,
  `age` int(11) default NULL,
  `municipalitybrand` varchar(20) default NULL,
  `ownerbrand` varchar(20) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_largecattletransfer`
--

DROP TABLE IF EXISTS `cashreceipt_largecattletransfer`;
CREATE TABLE `cashreceipt_largecattletransfer` (
  `objid` varchar(50) NOT NULL,
  `purchasedby` varchar(200) default NULL,
  `price` decimal(16,2) default NULL,
  `citymuni` varchar(100) default NULL,
  `province` varchar(100) default NULL,
  `sex` varchar(10) default NULL,
  `age` int(11) default NULL,
  `municipalitybrand` varchar(20) default NULL,
  `ownerbrand` varchar(20) default NULL,
  `certificateno` varchar(30) default NULL,
  `issuedate` date default NULL,
  `issuedcitymuni` varchar(100) default NULL,
  `issuedprovince` varchar(100) default NULL,
  `attestedby` varchar(100) default NULL,
  `treasurer` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `cashreceipt_marriage`
--

DROP TABLE IF EXISTS `cashreceipt_marriage`;
CREATE TABLE `cashreceipt_marriage` (
  `objid` varchar(50) NOT NULL,
  `groomname` varchar(100) default NULL,
  `groomaddress` varchar(100) default NULL,
  `groomageyear` int(11) default NULL,
  `groomagemonth` int(11) default NULL,
  `bridename` varchar(100) default NULL,
  `brideaddress` varchar(100) default NULL,
  `brideageyear` int(11) default NULL,
  `brideagemonth` int(11) default NULL,
  `registerno` varchar(30) default NULL,
  `attachments` varchar(200) default NULL,
  `lcrofficer` varchar(100) default NULL,
  `lcrofficertitle` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_rpt`
--

DROP TABLE IF EXISTS `cashreceipt_rpt`;
CREATE TABLE `cashreceipt_rpt` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `txntype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_slaughter`
--

DROP TABLE IF EXISTS `cashreceipt_slaughter`;
CREATE TABLE `cashreceipt_slaughter` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) default NULL,
  `acctno` varchar(50) default NULL,
  `acctitle` varchar(100) default NULL,
  `permitamount` decimal(18,2) default NULL,
  `slaughterof` varchar(25) default NULL,
  `weight` decimal(18,2) default NULL,
  `ordinanceno` varchar(50) default NULL,
  `ordinancedate` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipt_void`
--

DROP TABLE IF EXISTS `cashreceipt_void`;
CREATE TABLE `cashreceipt_void` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) NOT NULL,
  `postedby_name` varchar(100) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `receiptid` (`receiptid`),
  CONSTRAINT `cashreceipt_void_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceiptitem`
--

DROP TABLE IF EXISTS `cashreceiptitem`;
CREATE TABLE `cashreceiptitem` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) default NULL,
  `item_objid` varchar(50) default NULL,
  `item_code` varchar(100) default NULL,
  `item_title` varchar(100) default NULL,
  `amount` decimal(16,2) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_cashreceiptitem` (`receiptid`),
  CONSTRAINT `cashreceiptitem_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceiptitem_discount`
--

DROP TABLE IF EXISTS `cashreceiptitem_discount`;
CREATE TABLE `cashreceiptitem_discount` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) default NULL,
  `receiptitemid` varchar(50) default NULL,
  `acctid` varchar(50) default NULL,
  `amount` decimal(16,2) default NULL,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceiptitem_rpt`
--

DROP TABLE IF EXISTS `cashreceiptitem_rpt`;
CREATE TABLE `cashreceiptitem_rpt` (
  `objid` varchar(100) NOT NULL,
  `rptreceiptid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) default NULL,
  `barangayid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `basic` decimal(12,2) NOT NULL,
  `basicint` decimal(12,2) NOT NULL,
  `basicdisc` decimal(12,2) NOT NULL,
  `basiccredit` decimal(12,2) NOT NULL,
  `basicamnesty` decimal(12,2) NOT NULL,
  `basicintamnesty` decimal(12,2) NOT NULL,
  `basicacct_objid` varchar(50) default NULL,
  `basicintacct_objid` varchar(50) default NULL,
  `sef` decimal(12,2) NOT NULL,
  `sefint` decimal(12,2) NOT NULL,
  `sefdisc` decimal(12,2) NOT NULL,
  `sefcredit` decimal(12,2) NOT NULL,
  `sefamnesty` decimal(12,2) NOT NULL,
  `sefintamnesty` decimal(12,2) NOT NULL,
  `sefacct_objid` varchar(50) default NULL,
  `sefintacct_objid` varchar(50) default NULL,
  `firecode` decimal(12,2) NOT NULL,
  `firecodeacct_objid` varchar(50) default NULL,
  `revtype` varchar(15) NOT NULL,
  `partialled` int(11) default NULL,
  `rptledgerfaasid` varchar(50) default NULL,
  `fromqtr` int(11) default NULL,
  `toqtr` int(11) default NULL,
  `lgushare` decimal(16,2) NOT NULL,
  `lguintshare` decimal(16,2) NOT NULL,
  `brgyshare` decimal(16,2) NOT NULL,
  `brgyintshare` decimal(16,2) NOT NULL,
  `brgyshareacctid` varchar(50) default NULL,
  `brgyintshareacctid` varchar(50) default NULL,
  `provshare` decimal(16,2) NOT NULL,
  `provintshare` decimal(16,2) NOT NULL,
  `provshareacctid` varchar(50) default NULL,
  `provintshareacctid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_rptreceiptitem_rptledger` (`rptledgerid`),
  KEY `FK_rptreceiptitem_rptreceipt` (`rptreceiptid`),
  CONSTRAINT `cashreceiptitem_rpt_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_ibfk_2` FOREIGN KEY (`rptreceiptid`) REFERENCES `cashreceipt_rpt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceiptitem_rpt_account`
--

DROP TABLE IF EXISTS `cashreceiptitem_rpt_account`;
CREATE TABLE `cashreceiptitem_rpt_account` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `revperiod` varchar(25) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `rptreceiptid` varchar(50) default NULL,
  `sharetype` varchar(25) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `fk_cashreceiptitemrptaccount_cashreceiptrpt` USING BTREE (`rptreceiptid`),
  KEY `ix_cashreceiptitem_rpt_account_rptledger` USING BTREE (`rptledgerid`),
  KEY `ix_rptbillledgeraccount_revenueitem` USING BTREE (`item_objid`),
  CONSTRAINT `cashreceiptitem_rpt_account_ibfk_1` FOREIGN KEY (`item_objid`) REFERENCES `revenueitem` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_account_ibfk_2` FOREIGN KEY (`rptreceiptid`) REFERENCES `cashreceipt_rpt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Table structure for table `cashreceiptitem_rpt_noledger`
--

DROP TABLE IF EXISTS `cashreceiptitem_rpt_noledger`;
CREATE TABLE `cashreceiptitem_rpt_noledger` (
  `objid` varchar(50) NOT NULL,
  `tdno` varchar(25) NOT NULL,
  `pin` varchar(25) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `cadastrallotno` varchar(200) default NULL,
  `txntype_objid` varchar(5) default NULL,
  `classification_objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `originalav` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceiptitem_rpt_online`
--

DROP TABLE IF EXISTS `cashreceiptitem_rpt_online`;
CREATE TABLE `cashreceiptitem_rpt_online` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) default NULL,
  `rptledgerfaasid` varchar(50) default NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `firecode` decimal(10,2) default NULL,
  `revperiod` varchar(25) default NULL,
  `basicnet` decimal(16,2) default NULL,
  `sefnet` decimal(16,2) default NULL,
  `total` decimal(16,2) default NULL,
  `rptreceiptid` varchar(50) default NULL,
  `partialled` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `rptreceiptid` USING BTREE (`rptreceiptid`),
  KEY `ix_cashreceiptitem_rpt_online_rptledger` USING BTREE (`rptledgerid`),
  KEY `ix_cashreceiptitem_rpt_online_rptledgerfaas` USING BTREE (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerfaasid` USING BTREE (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerid` USING BTREE (`rptledgerid`),
  CONSTRAINT `cashreceiptitem_rpt_online_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_online_ibfk_2` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_online_ibfk_3` FOREIGN KEY (`rptreceiptid`) REFERENCES `cashreceipt_rpt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Table structure for table `cashreceiptpayment_check`
--

DROP TABLE IF EXISTS `cashreceiptpayment_check`;
CREATE TABLE `cashreceiptpayment_check` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) default NULL,
  `bank` varchar(50) default NULL,
  `checkno` varchar(25) default NULL,
  `checkdate` datetime default NULL,
  `amount` decimal(16,2) default NULL,
  `particulars` varchar(255) default NULL,
  `bankid` varchar(50) default NULL,
  `deposittype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `bankid` (`bankid`),
  KEY `FK_cashreceiptpayment_check` (`receiptid`),
  CONSTRAINT `cashreceiptpayment_check_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceiptpayment_check_ibfk_2` FOREIGN KEY (`bankid`) REFERENCES `bank` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashreceipts`
--

DROP TABLE IF EXISTS `cashreceipts`;
CREATE TABLE `cashreceipts` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashticket`
--

DROP TABLE IF EXISTS `cashticket`;
CREATE TABLE `cashticket` (
  `objid` varchar(50) NOT NULL,
  `denomination` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `cashticket_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `stockitem` (`objid`),
  CONSTRAINT `cashticket_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `collectionform` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashticket_control`
--

DROP TABLE IF EXISTS `cashticket_control`;
CREATE TABLE `cashticket_control` (
  `objid` varchar(50) NOT NULL,
  `controlid` varchar(50) default NULL,
  `assignee_objid` varchar(50) default NULL,
  `assignee_name` varchar(50) default NULL,
  `qtyin` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `qtybalance` int(11) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `cashticket_control_controlid` (`controlid`),
  CONSTRAINT `cashticket_control_ibfk_1` FOREIGN KEY (`controlid`) REFERENCES `cashticket_inventory` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashticket_inventory`
--

DROP TABLE IF EXISTS `cashticket_inventory`;
CREATE TABLE `cashticket_inventory` (
  `objid` varchar(50) NOT NULL,
  `afid` varchar(50) default NULL,
  `respcenter_objid` varchar(50) default NULL,
  `respcenter_name` varchar(50) default NULL,
  `respcenter_type` varchar(25) default NULL,
  `startstub` int(11) default NULL,
  `endstub` int(11) default NULL,
  `currentstub` int(11) default NULL,
  `qtyin` int(11) default NULL,
  `qtyout` int(11) default NULL,
  `qtycancelled` int(11) default NULL,
  `qtybalance` int(11) default NULL,
  `currentlineno` int(11) default NULL,
  `cost` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `cashticket_inventory_detail`
--

DROP TABLE IF EXISTS `cashticket_inventory_detail`;
CREATE TABLE `cashticket_inventory_detail` (
  `objid` varchar(50) NOT NULL,
  `controlid` varchar(50) default NULL,
  `lineno` int(11) default NULL,
  `refid` varchar(50) default NULL,
  `refno` varchar(50) default NULL,
  `reftype` varchar(50) default NULL,
  `refdate` datetime default NULL,
  `txndate` datetime default NULL,
  `txntype` varchar(25) default NULL,
  `qtyreceived` int(11) default NULL,
  `qtybegin` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `qtyending` int(11) default NULL,
  `qtycancelled` int(11) default NULL,
  `remarks` varchar(255) default NULL,
  `remittanceid` varchar(50) default NULL,
  `cost` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
CREATE TABLE `certification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `refid` varchar(50) default NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(100) NOT NULL,
  `purpose` text,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) default NULL,
  `byauthoritytitle` varchar(50) default NULL,
  `orno` varchar(25) default NULL,
  `ordate` datetime default NULL,
  `oramount` decimal(16,2) NOT NULL,
  `stampamount` decimal(16,2) NOT NULL,
  `createdbyid` varchar(50) default NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) default NULL,
  `info` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `indexno` varchar(15) default NULL,
  `pin` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `mayor_name` varchar(100) default NULL,
  `mayor_title` varchar(50) default NULL,
  `mayor_office` varchar(50) default NULL,
  `assessor_name` varchar(100) default NULL,
  `assessor_title` varchar(50) default NULL,
  `assessor_office` varchar(50) default NULL,
  `treasurer_name` varchar(100) default NULL,
  `treasurer_title` varchar(50) default NULL,
  `treasurer_office` varchar(50) default NULL,
  `address` varchar(100) default NULL,
  `fullname` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lgu_city_indexno` (`indexno`),
  KEY `ix_lgu_city_parentid` (`parentid`),
  KEY `ix_lgu_city_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `collectionform`
--

DROP TABLE IF EXISTS `collectionform`;
CREATE TABLE `collectionform` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) default NULL,
  `formtype` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `collectiongroup`
--

DROP TABLE IF EXISTS `collectiongroup`;
CREATE TABLE `collectiongroup` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(30) default NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `collectiongroup_revenueitem`
--

DROP TABLE IF EXISTS `collectiongroup_revenueitem`;
CREATE TABLE `collectiongroup_revenueitem` (
  `collectiongroupid` varchar(50) NOT NULL,
  `revenueitemid` varchar(50) NOT NULL,
  `orderno` int(11) default NULL,
  PRIMARY KEY  (`collectiongroupid`,`revenueitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `collectiontype`
--

DROP TABLE IF EXISTS `collectiontype`;
CREATE TABLE `collectiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `name` varchar(50) default NULL,
  `title` varchar(50) default NULL,
  `formno` varchar(10) default NULL,
  `handler` varchar(25) default NULL,
  `allowbatch` int(11) default NULL,
  `barcodekey` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `consolidatedland`
--

DROP TABLE IF EXISTS `consolidatedland`;
CREATE TABLE `consolidatedland` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `rpid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_consolidatedland_consolidation` (`consolidationid`),
  KEY `FK_consolidatedland_faas` (`landfaasid`),
  CONSTRAINT `consolidatedland_ibfk_1` FOREIGN KEY (`consolidationid`) REFERENCES `consolidation` (`objid`),
  CONSTRAINT `consolidatedland_ibfk_2` FOREIGN KEY (`landfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `consolidation`
--

DROP TABLE IF EXISTS `consolidation`;
CREATE TABLE `consolidation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(6) default NULL,
  `txndate` datetime default NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(5) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `newtdno` varchar(25) default NULL,
  `newutdno` varchar(25) NOT NULL,
  `newtitletype` varchar(25) default NULL,
  `newtitleno` varchar(25) default NULL,
  `newtitledate` datetime default NULL,
  `memoranda` text,
  `lguid` varchar(50) NOT NULL,
  `lgutype` varchar(50) NOT NULL,
  `newrpid` varchar(50) default NULL,
  `newrpuid` varchar(50) default NULL,
  `newfaasid` varchar(50) default NULL,
  `taxpayer_objid` varchar(50) default NULL,
  `taxpayer_name` text,
  `taxpayer_address` varchar(100) default NULL,
  `owner_name` text,
  `owner_address` varchar(100) default NULL,
  `administrator_objid` varchar(50) default NULL,
  `administrator_name` varchar(100) default NULL,
  `administrator_address` varchar(100) default NULL,
  `administratorid` varchar(50) default NULL,
  `administratorname` varchar(150) default NULL,
  `administratoraddress` varchar(100) default NULL,
  `signatories` text,
  PRIMARY KEY  (`objid`),
  KEY `FK_consolidation_newfaas` (`newfaasid`),
  KEY `FK_consolidation_newrp` (`newrpid`),
  KEY `FK_consolidation_newrpu` (`newrpuid`),
  KEY `ix_consolidation_newtdno` (`newtdno`),
  CONSTRAINT `consolidation_ibfk_1` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `consolidation_ibfk_2` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `consolidation_ibfk_3` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `consolidationaffectedrpu`
--

DROP TABLE IF EXISTS `consolidationaffectedrpu`;
CREATE TABLE `consolidationaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `newrpid` varchar(50) NOT NULL,
  `newrpuid` varchar(50) NOT NULL,
  `newfaasid` varchar(50) default NULL,
  `newtdno` varchar(25) default NULL,
  `newutdno` varchar(25) NOT NULL,
  `newsuffix` int(11) NOT NULL,
  `memoranda` text,
  PRIMARY KEY  (`objid`),
  KEY `FK_consolidationaffectedrpu_consolidation` (`consolidationid`),
  KEY `FK_consolidationaffectedrpu_newfaas` (`newfaasid`),
  KEY `FK_consolidationaffectedrpu_newrpu` (`newrpuid`),
  KEY `FK_consolidationaffectedrpu_prevfaas` (`prevfaasid`),
  KEY `ix_consolidationaffectedrpu_landfaasid` (`landfaasid`),
  KEY `ix_consolidationaffectedrpu_newtdno` (`newtdno`),
  CONSTRAINT `consolidationaffectedrpu_ibfk_1` FOREIGN KEY (`consolidationid`) REFERENCES `consolidation` (`objid`),
  CONSTRAINT `consolidationaffectedrpu_ibfk_2` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `consolidationaffectedrpu_ibfk_3` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `consolidationaffectedrpu_ibfk_4` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `directcash_collection`
--

DROP TABLE IF EXISTS `directcash_collection`;
CREATE TABLE `directcash_collection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `payee` varchar(150) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(25) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(250) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_directcash_collection_refdate` (`refdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `directcash_collection_item`
--

DROP TABLE IF EXISTS `directcash_collection_item`;
CREATE TABLE `directcash_collection_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  KEY `item_objid` (`item_objid`),
  CONSTRAINT `directcash_collection_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `directcash_collection` (`objid`),
  CONSTRAINT `directcash_collection_item_ibfk_2` FOREIGN KEY (`item_objid`) REFERENCES `revenueitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `discounttype`
--

DROP TABLE IF EXISTS `discounttype`;
CREATE TABLE `discounttype` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `indexno` varchar(15) default NULL,
  `pin` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `oldindexno` varchar(15) default NULL,
  `oldpin` varchar(15) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lgu_district_indexno` (`indexno`),
  KEY `ix_lgu_district_parentid` (`parentid`),
  KEY `ix_lgu_district_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
CREATE TABLE `entity` (
  `objid` varchar(50) NOT NULL,
  `entityno` varchar(50) NOT NULL,
  `name` longtext NOT NULL,
  `address_text` varchar(255) NOT NULL default '',
  `mailingaddress` varchar(255) default NULL,
  `type` varchar(25) NOT NULL,
  `sys_lastupdate` varchar(25) default NULL,
  `sys_lastupdateby` varchar(50) default NULL,
  `remarks` text,
  `entityname` text,
  `address_objid` varchar(50) default NULL,
  `mobileno` varchar(25) default NULL,
  `phoneno` varchar(25) default NULL,
  `email` varchar(25) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `uix_entityno` (`entityno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `entity_address`
--

DROP TABLE IF EXISTS `entity_address`;
CREATE TABLE `entity_address` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `type` varchar(50) default NULL,
  `address1` varchar(100) default NULL,
  `address2` varchar(100) default NULL,
  `barangay_objid` varchar(50) default NULL,
  `barangay_name` varchar(100) default NULL,
  `city` varchar(50) default NULL,
  `province` varchar(50) default NULL,
  `municipality` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `entityid`
--

DROP TABLE IF EXISTS `entityid`;
CREATE TABLE `entityid` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `dtissued` date default NULL,
  `dtexpiry` date default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `entityindividual`
--

DROP TABLE IF EXISTS `entityindividual`;
CREATE TABLE `entityindividual` (
  `objid` varchar(50) NOT NULL,
  `lastname` text NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text,
  `birthdate` datetime default NULL,
  `birthplace` varchar(160) default NULL,
  `citizenship` varchar(50) default NULL,
  `gender` varchar(10) default NULL,
  `civilstatus` varchar(15) default NULL,
  `profession` varchar(50) default NULL,
  `tin` varchar(25) default NULL,
  `sss` varchar(25) default NULL,
  `height` varchar(10) default NULL,
  `weight` varchar(10) default NULL,
  `acr` varchar(50) default NULL,
  `religion` varchar(50) default NULL,
  `photo` mediumblob,
  `thumbnail` blob,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `entityjuridical`
--

DROP TABLE IF EXISTS `entityjuridical`;
CREATE TABLE `entityjuridical` (
  `objid` varchar(50) NOT NULL,
  `tin` varchar(25) default NULL,
  `dtregistered` datetime default NULL,
  `orgtype` varchar(25) default NULL,
  `nature` varchar(50) default NULL,
  `placeregistered` varchar(100) default NULL,
  `administrator_name` varchar(100) default NULL,
  `administrator_address` varchar(100) default NULL,
  `administrator_position` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_tin` (`tin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `entitymember`
--

DROP TABLE IF EXISTS `entitymember`;
CREATE TABLE `entitymember` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `itemno` int(11) NOT NULL,
  `prefix` varchar(25) default NULL,
  `member_objid` varchar(50) NOT NULL,
  `member_name` text NOT NULL,
  `member_address_text` varchar(160) NOT NULL default '',
  `suffix` varchar(25) default NULL,
  `remarks` varchar(160) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_taxpayer_objid` (`member_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `entitymultiple`
--

DROP TABLE IF EXISTS `entitymultiple`;
CREATE TABLE `entitymultiple` (
  `objid` varchar(50) NOT NULL,
  `fullname` longtext,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `examiner_finding`
--

DROP TABLE IF EXISTS `examiner_finding`;
CREATE TABLE `examiner_finding` (
  `objid` varchar(50) NOT NULL,
  `findings` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `exemptiontype`
--

DROP TABLE IF EXISTS `exemptiontype`;
CREATE TABLE `exemptiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_exemptiontype_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `faas`
--

DROP TABLE IF EXISTS `faas`;
CREATE TABLE `faas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rpuid` varchar(50) default NULL,
  `datacapture` int(11) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `utdno` varchar(25) NOT NULL,
  `tdno` varchar(25) default NULL,
  `txntype_objid` varchar(10) default NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `titletype` varchar(10) default NULL,
  `titleno` varchar(50) default NULL,
  `titledate` datetime default NULL,
  `taxpayer_objid` varchar(50) default NULL,
  `taxpayer_name` longtext,
  `taxpayer_address` varchar(150) default NULL,
  `owner_name` longtext,
  `owner_address` varchar(150) default NULL,
  `administrator_objid` varchar(50) default NULL,
  `administrator_name` text,
  `administrator_address` varchar(150) default NULL,
  `beneficiary_objid` varchar(50) default NULL,
  `beneficiary_name` varchar(150) default NULL,
  `beneficiary_address` varchar(150) default NULL,
  `memoranda` text,
  `cancelnote` varchar(250) default NULL,
  `restrictionid` varchar(50) default NULL,
  `backtaxyrs` int(11) NOT NULL,
  `prevtdno` text,
  `prevpin` text,
  `prevowner` longtext,
  `prevav` decimal(16,2) NOT NULL,
  `prevmv` decimal(16,2) NOT NULL,
  `cancelreason` varchar(5) default NULL,
  `canceldate` datetime default NULL,
  `cancelledbytdnos` text,
  `lguid` varchar(50) NOT NULL,
  `txntimestamp` varchar(25) NOT NULL,
  `cancelledtimestamp` varchar(25) default NULL,
  `name` varchar(100) default NULL,
  `dtapproved` date default NULL,
  `realpropertyid` varchar(50) default NULL,
  `lgutype` varchar(25) default NULL,
  `signatories` text,
  PRIMARY KEY  (`objid`),
  KEY `FK_faas_rpu` (`rpuid`),
  KEY `ix_canceldate` (`canceldate`),
  KEY `ix_faas_appraisedby` (`objid`),
  KEY `ix_faas_beneficiary` (`beneficiary_name`),
  KEY `ix_faas_cancelledtimestamp` (`cancelledtimestamp`),
  KEY `ix_faas_name` (`name`),
  KEY `ix_faas_realproperty` (`realpropertyid`),
  KEY `ix_faas_restrictionid` (`restrictionid`),
  KEY `ix_faas_state` (`state`),
  KEY `ix_faas_tdno` (`tdno`),
  KEY `ix_faas_titleno` (`titleno`),
  KEY `ix_faas_txntimestamp` (`txntimestamp`),
  CONSTRAINT `faas_ibfk_1` FOREIGN KEY (`rpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `faas_txntype`
--

DROP TABLE IF EXISTS `faas_txntype`;
CREATE TABLE `faas_txntype` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `newledger` int(11) NOT NULL,
  `newrpu` int(11) NOT NULL,
  `newrealproperty` int(11) NOT NULL,
  `displaycode` varchar(10) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `faasannotation`
--

DROP TABLE IF EXISTS `faasannotation`;
CREATE TABLE `faasannotation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `annotationtype_objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `txnno` varchar(6) default NULL,
  `txndate` datetime default NULL,
  `fileno` varchar(25) NOT NULL,
  `orno` varchar(10) NOT NULL,
  `ordate` datetime NOT NULL,
  `oramount` decimal(16,2) NOT NULL,
  `memoranda` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_faasannotation_faas` (`faasid`),
  KEY `FK_faasannotation_faasannotationtype` (`annotationtype_objid`),
  KEY `ix_faasannotation_fileno` (`fileno`),
  KEY `ix_faasannotation_orno` (`orno`),
  KEY `ix_faasannotation_state` (`state`),
  KEY `ix_faasannotation_txnno` (`txnno`),
  CONSTRAINT `faasannotation_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `faasannotation_ibfk_2` FOREIGN KEY (`annotationtype_objid`) REFERENCES `faasannotationtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `faasannotationtype`
--

DROP TABLE IF EXISTS `faasannotationtype`;
CREATE TABLE `faasannotationtype` (
  `objid` varchar(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `faasbacktax`
--

DROP TABLE IF EXISTS `faasbacktax`;
CREATE TABLE `faasbacktax` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `tdno` varchar(25) NOT NULL,
  `bmv` decimal(16,2) NOT NULL,
  `mv` decimal(16,2) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `taxable` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_faasbacktax` (`faasid`),
  CONSTRAINT `faasbacktax_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `faasupdate`
--

DROP TABLE IF EXISTS `faasupdate`;
CREATE TABLE `faasupdate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevtitletype` varchar(25) default NULL,
  `prevtitleno` varchar(25) default NULL,
  `prevtitledate` datetime default NULL,
  `prevtaxpayerid` varchar(50) NOT NULL,
  `prevtaxpayername` text NOT NULL,
  `prevtaxpayeraddress` varchar(150) NOT NULL,
  `prevownername` text NOT NULL,
  `prevowneraddress` varchar(150) NOT NULL,
  `prevadministratorid` varchar(50) default NULL,
  `prevadministratorname` varchar(150) default NULL,
  `prevadministratoraddress` varchar(100) default NULL,
  `prevrestrictionid` varchar(50) default NULL,
  `prevmemoranda` text NOT NULL,
  `prevsurveyno` varchar(100) default NULL,
  `prevcadastrallotno` varchar(100) NOT NULL,
  `prevblockno` varchar(50) default NULL,
  `prevpurok` varchar(50) default NULL,
  `prevstreet` varchar(100) default NULL,
  `prevnorth` varchar(150) NOT NULL,
  `preveast` varchar(150) NOT NULL,
  `prevsouth` varchar(150) NOT NULL,
  `prevwest` varchar(150) NOT NULL,
  `faas_titletype` varchar(25) default NULL,
  `faas_titleno` varchar(25) default NULL,
  `faas_titledate` datetime default NULL,
  `faas_restrictionid` varchar(50) default NULL,
  `faas_memoranda` text NOT NULL,
  `rp_surveyno` varchar(100) default NULL,
  `rp_cadastrallotno` varchar(100) NOT NULL,
  `rp_blockno` varchar(50) default NULL,
  `rp_street` varchar(100) default NULL,
  `rp_north` varchar(150) NOT NULL,
  `rp_east` varchar(150) NOT NULL,
  `rp_south` varchar(150) NOT NULL,
  `rp_west` varchar(150) NOT NULL,
  `faas_taxpayer_objid` varchar(50) NOT NULL,
  `faas_taxpayer_name` text NOT NULL,
  `faas_taxpayer_address` varchar(150) NOT NULL,
  `faas_owner_address` text NOT NULL,
  `faas_owner_name` text NOT NULL,
  `faas_administrator_name` varchar(200) default NULL,
  `faas_administrator_objid` varchar(50) default NULL,
  `faas_administrator_address` varchar(150) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_faasupdate_faas` (`faasid`),
  CONSTRAINT `faasupdate_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
CREATE TABLE `fund` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `state` varchar(10) default NULL,
  `code` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(20) default NULL,
  `special` int(11) default NULL,
  `system` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landadjustment`
--

DROP TABLE IF EXISTS `landadjustment`;
CREATE TABLE `landadjustment` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) default NULL,
  `landdetailid` varchar(50) default NULL,
  `adjustmenttype_objid` varchar(50) NOT NULL,
  `expr` varchar(250) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `type` varchar(2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_landadjustment_landadjustmenttype` (`adjustmenttype_objid`),
  KEY `FK_landadjustment_landdetail` (`landdetailid`),
  KEY `FK_landadjustment_landrpu` (`landrpuid`),
  CONSTRAINT `landadjustment_ibfk_1` FOREIGN KEY (`adjustmenttype_objid`) REFERENCES `landadjustmenttype` (`objid`),
  CONSTRAINT `landadjustment_ibfk_2` FOREIGN KEY (`landdetailid`) REFERENCES `landdetail` (`objid`),
  CONSTRAINT `landadjustment_ibfk_3` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landadjustmentparameter`
--

DROP TABLE IF EXISTS `landadjustmentparameter`;
CREATE TABLE `landadjustmentparameter` (
  `objid` varchar(50) NOT NULL,
  `landadjustmentid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `parameter_objid` varchar(50) NOT NULL,
  `value` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_landadjustmentparameter_landadjustment` (`landadjustmentid`),
  KEY `FK_landadjustmentparameter_landrpu` (`landrpuid`),
  KEY `FK_landadjustmentparameter_rptparameter` (`parameter_objid`),
  CONSTRAINT `landadjustmentparameter_ibfk_1` FOREIGN KEY (`landadjustmentid`) REFERENCES `landadjustment` (`objid`),
  CONSTRAINT `landadjustmentparameter_ibfk_2` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `landadjustmentparameter_ibfk_3` FOREIGN KEY (`parameter_objid`) REFERENCES `rptparameter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landadjustmenttype`
--

DROP TABLE IF EXISTS `landadjustmenttype`;
CREATE TABLE `landadjustmenttype` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expr` text NOT NULL,
  `appliedto` varchar(150) default NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_landadjustment_landrysetting` (`landrysettingid`),
  KEY `ix_landadjustmenttype` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `landadjustmenttype_ibfk_1` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landadjustmenttype_classification`
--

DROP TABLE IF EXISTS `landadjustmenttype_classification`;
CREATE TABLE `landadjustmenttype_classification` (
  `landadjustmenttypeid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  PRIMARY KEY  (`landadjustmenttypeid`,`classification_objid`),
  KEY `FK_landadjustmenttype_classification_classification` (`classification_objid`),
  CONSTRAINT `landadjustmenttype_classification_ibfk_1` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `landadjustmenttype_classification_ibfk_2` FOREIGN KEY (`landadjustmenttypeid`) REFERENCES `landadjustmenttype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landassesslevel`
--

DROP TABLE IF EXISTS `landassesslevel`;
CREATE TABLE `landassesslevel` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) default NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `landrysettingid` (`landrysettingid`),
  KEY `FK_landassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_landassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `landassesslevel_ibfk_1` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `landassesslevel_ibfk_2` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landassesslevelrange`
--

DROP TABLE IF EXISTS `landassesslevelrange`;
CREATE TABLE `landassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `landassesslevelid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(16,2) NOT NULL,
  `mvto` decimal(16,2) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_landassesslevelrange_landassesslevel` (`landassesslevelid`),
  KEY `ix_landassesslevelrange_rootid` (`landrysettingid`),
  CONSTRAINT `landassesslevelrange_ibfk_1` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `landassesslevelrange_ibfk_2` FOREIGN KEY (`landassesslevelid`) REFERENCES `landassesslevel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landdetail`
--

DROP TABLE IF EXISTS `landdetail`;
CREATE TABLE `landdetail` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `subclass_objid` varchar(50) NOT NULL,
  `specificclass_objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `stripping_objid` varchar(50) default NULL,
  `striprate` decimal(16,2) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `addlinfo` varchar(250) default NULL,
  `area` decimal(18,6) NOT NULL,
  `areasqm` decimal(18,2) NOT NULL,
  `areaha` decimal(18,6) NOT NULL,
  `basevalue` decimal(16,2) NOT NULL,
  `unitvalue` decimal(16,2) NOT NULL,
  `taxable` int(11) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `landvalueadjustment` decimal(16,2) NOT NULL,
  `actualuseadjustment` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_landdetail_actualuse` (`actualuse_objid`),
  KEY `FK_landdetail_landrpu` (`landrpuid`),
  KEY `FK_landdetail_lcuvspecificclass` (`specificclass_objid`),
  KEY `FK_landdetail_lcuvsubclass` (`subclass_objid`),
  CONSTRAINT `landdetail_ibfk_1` FOREIGN KEY (`actualuse_objid`) REFERENCES `landassesslevel` (`objid`),
  CONSTRAINT `landdetail_ibfk_2` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `landdetail_ibfk_3` FOREIGN KEY (`specificclass_objid`) REFERENCES `lcuvspecificclass` (`objid`),
  CONSTRAINT `landdetail_ibfk_4` FOREIGN KEY (`subclass_objid`) REFERENCES `lcuvsubclass` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landrpu`
--

DROP TABLE IF EXISTS `landrpu`;
CREATE TABLE `landrpu` (
  `objid` varchar(50) NOT NULL,
  `idleland` int(11) NOT NULL,
  `totallandbmv` decimal(16,2) NOT NULL,
  `totallandmv` decimal(16,2) NOT NULL,
  `totallandav` decimal(16,2) NOT NULL,
  `totalplanttreebmv` decimal(16,2) NOT NULL,
  `totalplanttreemv` decimal(16,2) NOT NULL,
  `totalplanttreeadjustment` decimal(16,2) NOT NULL,
  `totalplanttreeav` decimal(16,2) NOT NULL,
  `landvalueadjustment` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `landrpu_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `landrysetting`
--

DROP TABLE IF EXISTS `landrysetting`;
CREATE TABLE `landrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `appliedto` text,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_landrysetting_previd` (`previd`),
  KEY `ix_landrysetting_ry` (`ry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lcuvspecificclass`
--

DROP TABLE IF EXISTS `lcuvspecificclass`;
CREATE TABLE `lcuvspecificclass` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `landrysettingid` (`landrysettingid`),
  KEY `FK_lcuvspecificclass_propertyclassification` (`classification_objid`),
  KEY `ix_lcuvspecificclass_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `lcuvspecificclass_ibfk_1` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `lcuvspecificclass_ibfk_2` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lcuvstripping`
--

DROP TABLE IF EXISTS `lcuvstripping`;
CREATE TABLE `lcuvstripping` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `striplevel` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_lcuvstripping_landrysetting` (`landrysettingid`),
  KEY `FK_lcuvstripping_propertyclassification` (`classification_objid`),
  KEY `ix_lcuvstripping_previd` (`previd`),
  CONSTRAINT `lcuvstripping_ibfk_1` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `lcuvstripping_ibfk_2` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lcuvsubclass`
--

DROP TABLE IF EXISTS `lcuvsubclass`;
CREATE TABLE `lcuvsubclass` (
  `objid` varchar(50) NOT NULL,
  `specificclass_objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_lcuvsubclass_lcuvspecificclass` (`specificclass_objid`),
  KEY `ix_lcuvsubclass_previd` (`previd`),
  KEY `ix_lcuvsubclass_rootid` (`landrysettingid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `lcuvsubclass_ibfk_1` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `lcuvsubclass_ibfk_2` FOREIGN KEY (`specificclass_objid`) REFERENCES `lcuvspecificclass` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lessor_building`
--

DROP TABLE IF EXISTS `lessor_building`;
CREATE TABLE `lessor_building` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) default NULL,
  `lessor_objid` varchar(50) default NULL,
  `lessor_name` varchar(100) default NULL,
  `lessor_address_text` varchar(255) default NULL,
  `lessor_address_objid` varchar(50) default NULL,
  `address1` varchar(50) default NULL,
  `address2` varchar(50) default NULL,
  `barangay_objid` varchar(50) default NULL,
  `barangay_name` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `liquidation`
--

DROP TABLE IF EXISTS `liquidation`;
CREATE TABLE `liquidation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `txnno` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `liquidatingofficer_objid` varchar(50) NOT NULL,
  `liquidatingofficer_name` varchar(100) NOT NULL,
  `liquidatingofficer_title` varchar(50) NOT NULL,
  `amount` decimal(18,2) default NULL,
  `totalcash` decimal(18,2) default NULL,
  `totalnoncash` decimal(18,2) default NULL,
  `cashbreakdown` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_liquidation_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `liquidation_cashier_fund`
--

DROP TABLE IF EXISTS `liquidation_cashier_fund`;
CREATE TABLE `liquidation_cashier_fund` (
  `objid` varchar(50) NOT NULL,
  `liquidationid` varchar(50) default NULL,
  `fund_objid` varchar(50) default NULL,
  `fund_title` varchar(100) default NULL,
  `cashier_objid` varchar(50) default NULL,
  `cashier_name` varchar(50) default NULL,
  `amount` decimal(16,2) default NULL,
  `totalcash` decimal(16,2) default NULL,
  `totalnoncash` decimal(16,2) default NULL,
  `cashbreakdown` text,
  PRIMARY KEY  (`objid`),
  KEY `FK_liquidation_cashier_fund_liquidation` (`liquidationid`),
  CONSTRAINT `liquidation_cashier_fund_ibfk_1` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `liquidation_checkpayment`
--

DROP TABLE IF EXISTS `liquidation_checkpayment`;
CREATE TABLE `liquidation_checkpayment` (
  `objid` varchar(50) NOT NULL,
  `liquidationid` varchar(50) NOT NULL,
  `liquidationfundid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_liquidation_checkpayment_liquidation` (`liquidationid`),
  CONSTRAINT `liquidation_checkpayment_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceiptpayment_check` (`objid`),
  CONSTRAINT `liquidation_checkpayment_ibfk_2` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `liquidation_remittance`
--

DROP TABLE IF EXISTS `liquidation_remittance`;
CREATE TABLE `liquidation_remittance` (
  `objid` varchar(50) NOT NULL,
  `liquidationid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_liquidationitem_liquidation` (`liquidationid`),
  CONSTRAINT `liquidation_remittance_ibfk_1` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`),
  CONSTRAINT `liquidation_remittance_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lob`
--

DROP TABLE IF EXISTS `lob`;
CREATE TABLE `lob` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `psic` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lob_lobattribute`
--

DROP TABLE IF EXISTS `lob_lobattribute`;
CREATE TABLE `lob_lobattribute` (
  `lobid` varchar(50) NOT NULL,
  `lobattributeid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lobattribute`
--

DROP TABLE IF EXISTS `lobattribute`;
CREATE TABLE `lobattribute` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `lobclassification`
--

DROP TABLE IF EXISTS `lobclassification`;
CREATE TABLE `lobclassification` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machassesslevel`
--

DROP TABLE IF EXISTS `machassesslevel`;
CREATE TABLE `machassesslevel` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) default NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `machrysettingid` (`machrysettingid`),
  KEY `FK_machassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_machassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `machassesslevel_ibfk_1` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`),
  CONSTRAINT `machassesslevel_ibfk_2` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machassesslevelrange`
--

DROP TABLE IF EXISTS `machassesslevelrange`;
CREATE TABLE `machassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `machassesslevelid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(16,2) NOT NULL,
  `mvto` decimal(16,2) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `machrysettingid` (`machrysettingid`),
  KEY `FK_machassesslevelrange_machassesslevel` (`machassesslevelid`),
  CONSTRAINT `machassesslevelrange_ibfk_1` FOREIGN KEY (`machassesslevelid`) REFERENCES `machassesslevel` (`objid`),
  CONSTRAINT `machassesslevelrange_ibfk_2` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machdetail`
--

DROP TABLE IF EXISTS `machdetail`;
CREATE TABLE `machdetail` (
  `objid` varchar(50) NOT NULL,
  `machuseid` varchar(50) NOT NULL,
  `machrpuid` varchar(50) NOT NULL,
  `machine_objid` varchar(50) NOT NULL,
  `operationyear` int(11) default NULL,
  `replacementcost` decimal(16,2) NOT NULL,
  `depreciation` decimal(16,2) NOT NULL,
  `depreciationvalue` decimal(16,2) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `brand` varchar(50) default NULL,
  `capacity` varchar(50) default NULL,
  `model` varchar(50) default NULL,
  `serialno` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  `yearacquired` int(11) default NULL,
  `estimatedlife` int(11) default NULL,
  `remaininglife` int(11) default NULL,
  `yearinstalled` int(11) default NULL,
  `yearsused` int(11) default NULL,
  `originalcost` decimal(16,2) NOT NULL,
  `freightcost` decimal(16,2) NOT NULL,
  `insurancecost` decimal(16,2) NOT NULL,
  `installationcost` decimal(16,2) NOT NULL,
  `brokeragecost` decimal(16,2) NOT NULL,
  `arrastrecost` decimal(16,2) NOT NULL,
  `othercost` decimal(16,2) NOT NULL,
  `acquisitioncost` decimal(16,2) NOT NULL,
  `feracid` varchar(50) default NULL,
  `ferac` decimal(16,2) default NULL,
  `forexid` varchar(50) default NULL,
  `forex` decimal(16,4) default NULL,
  `residualrate` decimal(16,2) NOT NULL,
  `conversionfactor` decimal(16,2) NOT NULL,
  `swornamount` decimal(16,2) NOT NULL,
  `useswornamount` int(11) NOT NULL,
  `imported` int(11) NOT NULL,
  `newlyinstalled` int(11) NOT NULL,
  `autodepreciate` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_machdetail_machforex` (`feracid`),
  KEY `FK_machdetail_machforexid` (`forexid`),
  KEY `FK_machdetail_machine` (`machine_objid`),
  KEY `FK_machdetail_machrpu` (`machrpuid`),
  KEY `FK_machdetail_machuse` (`machuseid`),
  CONSTRAINT `machdetail_ibfk_1` FOREIGN KEY (`feracid`) REFERENCES `machforex` (`objid`),
  CONSTRAINT `machdetail_ibfk_2` FOREIGN KEY (`forexid`) REFERENCES `machforex` (`objid`),
  CONSTRAINT `machdetail_ibfk_3` FOREIGN KEY (`machine_objid`) REFERENCES `machine` (`objid`),
  CONSTRAINT `machdetail_ibfk_4` FOREIGN KEY (`machrpuid`) REFERENCES `machrpu` (`objid`),
  CONSTRAINT `machdetail_ibfk_5` FOREIGN KEY (`machuseid`) REFERENCES `machuse` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machforex`
--

DROP TABLE IF EXISTS `machforex`;
CREATE TABLE `machforex` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `forex` decimal(10,6) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `machrysettingid` (`machrysettingid`),
  KEY `ix_machforex_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `machforex_ibfk_1` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
CREATE TABLE `machine` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_machine_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machrpu`
--

DROP TABLE IF EXISTS `machrpu`;
CREATE TABLE `machrpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_machrpu_landrpu` (`landrpuid`),
  CONSTRAINT `machrpu_ibfk_1` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `machrpu_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machrysetting`
--

DROP TABLE IF EXISTS `machrysetting`;
CREATE TABLE `machrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  `appliedto` longtext,
  `residualrate` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `machuse`
--

DROP TABLE IF EXISTS `machuse`;
CREATE TABLE `machuse` (
  `objid` varchar(50) NOT NULL,
  `machrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_machuse_machassesslevel` (`actualuse_objid`),
  KEY `FK_machuse_machrpu` (`machrpuid`),
  CONSTRAINT `machuse_ibfk_1` FOREIGN KEY (`actualuse_objid`) REFERENCES `machassesslevel` (`objid`),
  CONSTRAINT `machuse_ibfk_2` FOREIGN KEY (`machrpuid`) REFERENCES `machrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_material_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mcsettlement`
--

DROP TABLE IF EXISTS `mcsettlement`;
CREATE TABLE `mcsettlement` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) default NULL,
  `txnno` varchar(25) default NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` text,
  `prevfaas_objid` varchar(50) default NULL,
  `newfaas_objid` varchar(50) default NULL,
  `newtdno` varchar(25) default NULL,
  `signatories` text NOT NULL,
  `lgutype` varchar(25) NOT NULL,
  `lguid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `newfaas_objid` (`newfaas_objid`),
  KEY `prevfaas_objid` (`prevfaas_objid`),
  KEY `ix_mcsettlement_state` (`state`),
  KEY `ix_mcsettlement_txnno` (`txnno`),
  CONSTRAINT `mcsettlement_ibfk_1` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `mcsettlement_ibfk_2` FOREIGN KEY (`prevfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mcsettlement_affectedrpu`
--

DROP TABLE IF EXISTS `mcsettlement_affectedrpu`;
CREATE TABLE `mcsettlement_affectedrpu` (
  `objid` varchar(50) NOT NULL,
  `mcsettlementid` varchar(50) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `prevfaas_objid` varchar(50) NOT NULL,
  `newfaas_objid` varchar(50) default NULL,
  `newtdno` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_mcaffectedrpu_mcid` (`mcsettlementid`),
  KEY `ix_mcaffectedrpu_newfaas_objid` (`newfaas_objid`),
  KEY `ix_mcaffectedrpu_prevfaas_objid` (`prevfaas_objid`),
  CONSTRAINT `mcsettlement_affectedrpu_ibfk_1` FOREIGN KEY (`mcsettlementid`) REFERENCES `mcsettlement` (`objid`),
  CONSTRAINT `mcsettlement_affectedrpu_ibfk_2` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `mcsettlement_affectedrpu_ibfk_3` FOREIGN KEY (`prevfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mcsettlement_otherclaim`
--

DROP TABLE IF EXISTS `mcsettlement_otherclaim`;
CREATE TABLE `mcsettlement_otherclaim` (
  `objid` varchar(50) NOT NULL,
  `mcsettlementid` varchar(50) NOT NULL,
  `faas_objid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_mcotherclaim_faas_objid` (`faas_objid`),
  KEY `ix_mcotherclaim_mcid` (`mcsettlementid`),
  CONSTRAINT `mcsettlement_otherclaim_ibfk_1` FOREIGN KEY (`faas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `mcsettlement_otherclaim_ibfk_2` FOREIGN KEY (`mcsettlementid`) REFERENCES `mcsettlement` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscassesslevel`
--

DROP TABLE IF EXISTS `miscassesslevel`;
CREATE TABLE `miscassesslevel` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) default NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `miscrysettingid` (`miscrysettingid`),
  KEY `FK_miscassesslevel_classification` (`classification_objid`),
  KEY `ix_miscassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `miscassesslevel_ibfk_1` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `miscassesslevel_ibfk_2` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscassesslevelrange`
--

DROP TABLE IF EXISTS `miscassesslevelrange`;
CREATE TABLE `miscassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `miscassesslevelid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(16,2) NOT NULL,
  `mvto` decimal(16,2) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_miscassesslevelrange_miscassesslevel` (`miscassesslevelid`),
  KEY `FK_miscassesslevelrange_miscrysetting` (`miscrysettingid`),
  CONSTRAINT `miscassesslevelrange_ibfk_1` FOREIGN KEY (`miscassesslevelid`) REFERENCES `miscassesslevel` (`objid`),
  CONSTRAINT `miscassesslevelrange_ibfk_2` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscitem`
--

DROP TABLE IF EXISTS `miscitem`;
CREATE TABLE `miscitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_miscitem_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscitemvalue`
--

DROP TABLE IF EXISTS `miscitemvalue`;
CREATE TABLE `miscitemvalue` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `miscitem_objid` varchar(50) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `miscrysettingid` (`miscrysettingid`),
  KEY `FK_miscitemvalue_miscitem` (`miscitem_objid`),
  KEY `ix_miscitemvalue_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `miscitemvalue_ibfk_1` FOREIGN KEY (`miscitem_objid`) REFERENCES `miscitem` (`objid`),
  CONSTRAINT `miscitemvalue_ibfk_2` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscrpu`
--

DROP TABLE IF EXISTS `miscrpu`;
CREATE TABLE `miscrpu` (
  `objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) default NULL,
  `landrpuid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_miscrpu_miscassesslevel` (`actualuse_objid`),
  CONSTRAINT `miscrpu_ibfk_1` FOREIGN KEY (`actualuse_objid`) REFERENCES `miscassesslevel` (`objid`),
  CONSTRAINT `miscrpu_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscrpuitem`
--

DROP TABLE IF EXISTS `miscrpuitem`;
CREATE TABLE `miscrpuitem` (
  `objid` varchar(50) NOT NULL,
  `miscrpuid` varchar(50) NOT NULL,
  `miv_objid` varchar(50) NOT NULL,
  `miscitem_objid` varchar(50) NOT NULL,
  `expr` varchar(255) NOT NULL,
  `depreciation` decimal(16,2) NOT NULL,
  `depreciatedvalue` decimal(16,2) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_miscrpuitem_miscitem` (`miscitem_objid`),
  KEY `FK_miscrpuitem_miscitemvalue` (`miv_objid`),
  KEY `FK_miscrpuitem_miscrpu` (`miscrpuid`),
  CONSTRAINT `miscrpuitem_ibfk_1` FOREIGN KEY (`miscitem_objid`) REFERENCES `miscitem` (`objid`),
  CONSTRAINT `miscrpuitem_ibfk_2` FOREIGN KEY (`miv_objid`) REFERENCES `miscitemvalue` (`objid`),
  CONSTRAINT `miscrpuitem_ibfk_3` FOREIGN KEY (`miscrpuid`) REFERENCES `miscrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscrpuitem_rptparameter`
--

DROP TABLE IF EXISTS `miscrpuitem_rptparameter`;
CREATE TABLE `miscrpuitem_rptparameter` (
  `miscrpuitemid` varchar(50) NOT NULL,
  `param_objid` varchar(50) NOT NULL,
  `miscrpuid` varchar(50) NOT NULL,
  `intvalue` int(11) default NULL,
  `decimalvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`miscrpuitemid`,`param_objid`),
  KEY `FK_miscrpuitem_rptparameter_` (`miscrpuid`),
  KEY `FK_miscrpuitem_rptparameter_rptparamer` (`param_objid`),
  CONSTRAINT `miscrpuitem_rptparameter_ibfk_1` FOREIGN KEY (`miscrpuid`) REFERENCES `miscrpu` (`objid`),
  CONSTRAINT `miscrpuitem_rptparameter_ibfk_2` FOREIGN KEY (`miscrpuitemid`) REFERENCES `miscrpuitem` (`objid`),
  CONSTRAINT `miscrpuitem_rptparameter_ibfk_3` FOREIGN KEY (`param_objid`) REFERENCES `rptparameter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `miscrysetting`
--

DROP TABLE IF EXISTS `miscrysetting`;
CREATE TABLE `miscrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  `appliedto` longtext,
  PRIMARY KEY  (`objid`),
  KEY `ix_miscrysetting_ry` (`ry`),
  KEY `ix_miscrysetting_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
CREATE TABLE `municipality` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `indexno` varchar(15) default NULL,
  `pin` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `mayor_name` varchar(100) default NULL,
  `mayor_title` varchar(50) default NULL,
  `mayor_office` varchar(50) default NULL,
  `assessor_name` varchar(100) default NULL,
  `assessor_title` varchar(50) default NULL,
  `assessor_office` varchar(50) default NULL,
  `treasurer_name` varchar(100) default NULL,
  `treasurer_title` varchar(50) default NULL,
  `treasurer_office` varchar(50) default NULL,
  `address` varchar(100) default NULL,
  `fullname` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lgu_municipality_indexno` (`indexno`),
  KEY `ix_lgu_municipality_parentid` (`parentid`),
  KEY `ix_lgu_municipality_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ngas_revenue`
--

DROP TABLE IF EXISTS `ngas_revenue`;
CREATE TABLE `ngas_revenue` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `type` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `dtposted` datetime NOT NULL,
  `postedby_objid` varchar(50) NOT NULL,
  `postedby_name` varchar(100) NOT NULL,
  `postedby_title` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ngas_revenue_deposit`
--

DROP TABLE IF EXISTS `ngas_revenue_deposit`;
CREATE TABLE `ngas_revenue_deposit` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `ngas_revenue_deposit_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `bankdeposit` (`objid`),
  CONSTRAINT `ngas_revenue_deposit_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `ngas_revenue` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ngas_revenue_remittance`
--

DROP TABLE IF EXISTS `ngas_revenue_remittance`;
CREATE TABLE `ngas_revenue_remittance` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `ngas_revenue_remittance_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `ngas_revenue` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ngas_revenueitem`
--

DROP TABLE IF EXISTS `ngas_revenueitem`;
CREATE TABLE `ngas_revenueitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refsource` varchar(50) NOT NULL,
  `refno` varchar(25) NOT NULL,
  `refdate` datetime NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `fund_objid` varchar(50) NOT NULL,
  `acct_objid` varchar(50) default NULL,
  `subacct_objid` varchar(50) default NULL,
  `collectiontype_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  `liquidationid` varchar(50) default NULL,
  `depositid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `collectiontype_objid` (`collectiontype_objid`),
  KEY `depositid` (`depositid`),
  KEY `fund_objid` (`fund_objid`),
  KEY `liquidationid` (`liquidationid`),
  KEY `parentid` (`parentid`),
  KEY `item_objid` (`item_objid`),
  CONSTRAINT `ngas_revenueitem_ibfk_1` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `ngas_revenueitem_ibfk_2` FOREIGN KEY (`depositid`) REFERENCES `bankdeposit` (`objid`),
  CONSTRAINT `ngas_revenueitem_ibfk_3` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `ngas_revenueitem_ibfk_4` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`),
  CONSTRAINT `ngas_revenueitem_ibfk_5` FOREIGN KEY (`parentid`) REFERENCES `ngas_revenue` (`objid`),
  CONSTRAINT `ngas_revenueitem_ibfk_6` FOREIGN KEY (`item_objid`) REFERENCES `revenueitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `paymentorder`
--

DROP TABLE IF EXISTS `paymentorder`;
CREATE TABLE `paymentorder` (
  `txnid` varchar(50) NOT NULL default '',
  `txntype` varchar(20) default NULL,
  `info` text,
  PRIMARY KEY  (`txnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
CREATE TABLE `pin` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_lgu_barangay` (`barangayid`),
  KEY `ix_pin_state` (`state`),
  CONSTRAINT `pin_ibfk_1` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `planttree`
--

DROP TABLE IF EXISTS `planttree`;
CREATE TABLE `planttree` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_planttree_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `planttreeassesslevel`
--

DROP TABLE IF EXISTS `planttreeassesslevel`;
CREATE TABLE `planttreeassesslevel` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `code` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `planttreerysettingid` (`planttreerysettingid`),
  CONSTRAINT `planttreeassesslevel_ibfk_1` FOREIGN KEY (`planttreerysettingid`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `planttreedetail`
--

DROP TABLE IF EXISTS `planttreedetail`;
CREATE TABLE `planttreedetail` (
  `objid` varchar(50) NOT NULL,
  `planttreerpuid` varchar(50) default NULL,
  `landrpuid` varchar(50) default NULL,
  `planttreeunitvalue_objid` varchar(50) NOT NULL,
  `planttree_objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `productive` decimal(16,2) NOT NULL,
  `nonproductive` decimal(16,2) NOT NULL,
  `nonproductiveage` decimal(16,2) default NULL,
  `unitvalue` decimal(16,2) NOT NULL,
  `basemarketvalue` decimal(16,2) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `adjustmentrate` decimal(16,2) NOT NULL,
  `marketvalue` decimal(16,2) NOT NULL,
  `assesslevel` decimal(16,2) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_planttreedetail_landrpu` (`landrpuid`),
  KEY `FK_planttreedetail_plantreeassesslevel` (`actualuse_objid`),
  KEY `FK_planttreedetail_planttree` (`planttree_objid`),
  KEY `FK_planttreedetail_planttreerpu` (`planttreerpuid`),
  KEY `FK_planttreedetail_planttreeunitvalue` (`planttreeunitvalue_objid`),
  CONSTRAINT `planttreedetail_ibfk_1` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `planttreedetail_ibfk_2` FOREIGN KEY (`actualuse_objid`) REFERENCES `planttreeassesslevel` (`objid`),
  CONSTRAINT `planttreedetail_ibfk_3` FOREIGN KEY (`planttree_objid`) REFERENCES `planttree` (`objid`),
  CONSTRAINT `planttreedetail_ibfk_4` FOREIGN KEY (`planttreerpuid`) REFERENCES `planttreerpu` (`objid`),
  CONSTRAINT `planttreedetail_ibfk_5` FOREIGN KEY (`planttreeunitvalue_objid`) REFERENCES `planttreeunitvalue` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `planttreerpu`
--

DROP TABLE IF EXISTS `planttreerpu`;
CREATE TABLE `planttreerpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `productive` decimal(16,2) NOT NULL,
  `nonproductive` decimal(16,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_planttreerpu_landrpu` (`landrpuid`),
  CONSTRAINT `planttreerpu_ibfk_1` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `planttreerpu_ibfk_2` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `planttreerysetting`
--

DROP TABLE IF EXISTS `planttreerysetting`;
CREATE TABLE `planttreerysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `applyagriadjustment` int(11) NOT NULL,
  `appliedto` longtext,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `previd` (`previd`),
  KEY `ix_planttreerysetting_ry` (`ry`),
  CONSTRAINT `planttreerysetting_ibfk_1` FOREIGN KEY (`previd`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `planttreeunitvalue`
--

DROP TABLE IF EXISTS `planttreeunitvalue`;
CREATE TABLE `planttreeunitvalue` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `planttree_objid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `planttreerysettingid` (`planttreerysettingid`),
  KEY `FK_planttreeunitvalue_planttree` (`planttree_objid`),
  CONSTRAINT `planttreeunitvalue_ibfk_1` FOREIGN KEY (`planttree_objid`) REFERENCES `planttree` (`objid`),
  CONSTRAINT `planttreeunitvalue_ibfk_2` FOREIGN KEY (`planttreerysettingid`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `previousfaas`
--

DROP TABLE IF EXISTS `previousfaas`;
CREATE TABLE `previousfaas` (
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  PRIMARY KEY  (`faasid`,`prevfaasid`),
  KEY `FK_previousfaas_prevfaas` (`prevfaasid`),
  CONSTRAINT `previousfaas_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `previousfaas_ibfk_2` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `propertyclassification`
--

DROP TABLE IF EXISTS `propertyclassification`;
CREATE TABLE `propertyclassification` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `special` int(11) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_propertyclassification_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `indexno` varchar(15) default NULL,
  `pin` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `governor_name` varchar(100) default NULL,
  `governor_title` varchar(50) default NULL,
  `governor_office` varchar(50) default NULL,
  `assessor_name` varchar(100) default NULL,
  `assessor_title` varchar(50) default NULL,
  `assessor_office` varchar(50) default NULL,
  `treasurer_name` varchar(100) default NULL,
  `treasurer_title` varchar(50) default NULL,
  `treasurer_office` varchar(50) default NULL,
  `address` varchar(100) default NULL,
  `fullname` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lgu_province_indexno` (`indexno`),
  KEY `ix_lgu_province_parentid` (`parentid`),
  KEY `ix_lgu_province_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `realproperty`
--

DROP TABLE IF EXISTS `realproperty`;
CREATE TABLE `realproperty` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `pintype` varchar(5) NOT NULL,
  `pin` varchar(30) NOT NULL,
  `ry` int(11) NOT NULL,
  `claimno` varchar(5) default NULL,
  `section` varchar(3) default NULL,
  `parcel` varchar(3) default NULL,
  `cadastrallotno` text,
  `blockno` varchar(255) default NULL,
  `surveyno` varchar(30) default NULL,
  `street` varchar(100) default NULL,
  `purok` varchar(100) default NULL,
  `north` varchar(255) default NULL,
  `south` varchar(255) default NULL,
  `east` varchar(255) default NULL,
  `west` varchar(255) default NULL,
  `barangayid` varchar(50) NOT NULL,
  `lgutype` varchar(50) NOT NULL,
  `previd` varchar(50) default NULL,
  `lguid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_barangayid` (`barangayid`),
  KEY `ix_realproperty_blockno` (`blockno`),
  KEY `ix_realproperty_brgysection` (`barangayid`,`section`),
  KEY `ix_realproperty_brgystate` (`barangayid`,`state`),
  KEY `ix_realproperty_pin` (`pin`),
  KEY `ix_realproperty_ry` (`ry`),
  KEY `ix_realproperty_surveyno` (`surveyno`),
  CONSTRAINT `realproperty_ibfk_1` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remittance`
--

DROP TABLE IF EXISTS `remittance`;
CREATE TABLE `remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `liquidatingofficer_objid` varchar(50) NOT NULL,
  `liquidatingofficer_name` varchar(100) NOT NULL,
  `liquidatingofficer_title` varchar(50) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `cashbreakdown` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_remittance_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remittance_afserial`
--

DROP TABLE IF EXISTS `remittance_afserial`;
CREATE TABLE `remittance_afserial` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_remittance_afserial_remittance` (`remittanceid`),
  CONSTRAINT `remittance_afserial_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `afserial_inventory_detail` (`objid`),
  CONSTRAINT `remittance_afserial_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remittance_cashreceipt`
--

DROP TABLE IF EXISTS `remittance_cashreceipt`;
CREATE TABLE `remittance_cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_remittanceitem_remittance` (`remittanceid`),
  CONSTRAINT `remittance_cashreceipt_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `remittance_cashreceipt_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remittance_cashticket`
--

DROP TABLE IF EXISTS `remittance_cashticket`;
CREATE TABLE `remittance_cashticket` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `remittance_cashticket_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashticket_inventory_detail` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remittance_checkpayment`
--

DROP TABLE IF EXISTS `remittance_checkpayment`;
CREATE TABLE `remittance_checkpayment` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  `amount` decimal(16,2) default NULL,
  `voided` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_remittance_checkpayment_remittance` (`remittanceid`),
  CONSTRAINT `remittance_checkpayment_ibfk_1` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remittance_fund`
--

DROP TABLE IF EXISTS `remittance_fund`;
CREATE TABLE `remittance_fund` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  `fund_objid` varchar(50) default NULL,
  `fund_title` varchar(100) default NULL,
  `amount` decimal(16,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `remittanceid` (`remittanceid`),
  CONSTRAINT `remittance_fund_ibfk_1` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `remoteserverdata`
--

DROP TABLE IF EXISTS `remoteserverdata`;
CREATE TABLE `remoteserverdata` (
  `objid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_rptdelinquency`
--

DROP TABLE IF EXISTS `report_rptdelinquency`;
CREATE TABLE `report_rptdelinquency` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `firecode` decimal(16,2) NOT NULL,
  `dtgenerated` datetime NOT NULL,
  `generatedby_name` varchar(75) default NULL,
  `generatedby_title` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_report_rptdelinquency_rptledgerid` (`rptledgerid`),
  KEY `ix_report_rptdelinquency_barangayid` (`barangayid`),
  KEY `ix_report_rptdelinquency_year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `resection`
--

DROP TABLE IF EXISTS `resection`;
CREATE TABLE `resection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pintype` varchar(5) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `barangaypin` varchar(15) NOT NULL,
  `section` varchar(3) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(5) NOT NULL,
  `txnno` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `autonumber` int(11) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` text NOT NULL,
  `signatories` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `resectionaffectedrpu`
--

DROP TABLE IF EXISTS `resectionaffectedrpu`;
CREATE TABLE `resectionaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `resectionid` varchar(50) NOT NULL,
  `rputype` varchar(10) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `prevrpuid` varchar(50) NOT NULL,
  `prevrpid` varchar(50) NOT NULL,
  `newsection` varchar(3) default NULL,
  `newparcel` varchar(3) default NULL,
  `newtdno` varchar(20) default NULL,
  `newutdno` varchar(20) NOT NULL,
  `newpin` varchar(25) default NULL,
  `newsuffix` int(11) default NULL,
  `newfaasid` varchar(50) default NULL,
  `newrpuid` varchar(50) default NULL,
  `newrpid` varchar(50) default NULL,
  `memoranda` text,
  PRIMARY KEY  (`objid`),
  KEY `newfaasid` (`newfaasid`),
  KEY `newrpid` (`newrpid`),
  KEY `newrpuid` (`newrpuid`),
  KEY `prevfaasid` (`prevfaasid`),
  KEY `prevrpid` (`prevrpid`),
  KEY `prevrpuid` (`prevrpuid`),
  KEY `resectionid` (`resectionid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_1` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_2` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_3` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_4` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_5` FOREIGN KEY (`prevrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_6` FOREIGN KEY (`prevrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `resectionaffectedrpu_ibfk_7` FOREIGN KEY (`resectionid`) REFERENCES `resection` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `resectionitem`
--

DROP TABLE IF EXISTS `resectionitem`;
CREATE TABLE `resectionitem` (
  `objid` varchar(50) NOT NULL,
  `resectionid` varchar(50) NOT NULL,
  `newsection` varchar(3) NOT NULL,
  `landcount` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `resectionid` (`resectionid`),
  CONSTRAINT `resectionitem_ibfk_1` FOREIGN KEY (`resectionid`) REFERENCES `resection` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `revenueitem`
--

DROP TABLE IF EXISTS `revenueitem`;
CREATE TABLE `revenueitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `code` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `type` varchar(25) default NULL,
  `fund_objid` varchar(50) default NULL,
  `fund_code` varchar(50) default NULL,
  `fund_title` varchar(50) default NULL,
  `defaultvalue` decimal(16,2) default NULL,
  `valuetype` varchar(10) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `revenueitem_attribute`
--

DROP TABLE IF EXISTS `revenueitem_attribute`;
CREATE TABLE `revenueitem_attribute` (
  `objid` varchar(50) NOT NULL,
  `revitemid` varchar(50) default NULL,
  `attribute_objid` varchar(50) default NULL,
  `account_objid` varchar(50) default NULL,
  `account_code` varchar(50) default NULL,
  `account_title` varchar(250) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `attribute_objid` (`attribute_objid`),
  KEY `revitemid` (`revitemid`),
  CONSTRAINT `revenueitem_attribute_ibfk_1` FOREIGN KEY (`attribute_objid`) REFERENCES `revenueitem_attribute_type` (`objid`),
  CONSTRAINT `revenueitem_attribute_ibfk_2` FOREIGN KEY (`revitemid`) REFERENCES `revenueitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `revenueitem_attribute_type`
--

DROP TABLE IF EXISTS `revenueitem_attribute_type`;
CREATE TABLE `revenueitem_attribute_type` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) default NULL,
  `handler` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `revenueitem_collectiongroup`
--

DROP TABLE IF EXISTS `revenueitem_collectiongroup`;
CREATE TABLE `revenueitem_collectiongroup` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpt_requirement`
--

DROP TABLE IF EXISTS `rpt_requirement`;
CREATE TABLE `rpt_requirement` (
  `objid` varchar(50) NOT NULL,
  `requirementtypeid` varchar(50) NOT NULL,
  `handler` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `value_objid` varchar(50) default NULL,
  `value_txnno` varchar(50) default NULL,
  `value_txndate` date default NULL,
  `value_txnamount` decimal(16,2) default NULL,
  `value_remarks` text,
  `complied` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptrequirement_refid` (`refid`),
  KEY `ix_rptrequirement_requirementtypeid` (`requirementtypeid`),
  KEY `ix_rptrequirement_valueobjid` (`value_objid`),
  CONSTRAINT `rpt_requirement_ibfk_1` FOREIGN KEY (`requirementtypeid`) REFERENCES `rpt_requirement_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpt_requirement_type`
--

DROP TABLE IF EXISTS `rpt_requirement_type`;
CREATE TABLE `rpt_requirement_type` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) default NULL,
  `handler` varchar(100) default NULL,
  `sortorder` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptrequirementtype_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpt_sales_data`
--

DROP TABLE IF EXISTS `rpt_sales_data`;
CREATE TABLE `rpt_sales_data` (
  `objid` varchar(50) NOT NULL,
  `seller_name` varchar(250) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `buyer_name` varchar(250) NOT NULL,
  `buyer_address` varchar(100) NOT NULL,
  `saledate` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_buyername` (`buyer_name`),
  KEY `ix_sellername` (`seller_name`),
  CONSTRAINT `rpt_sales_data_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpt_sms`
--

DROP TABLE IF EXISTS `rpt_sms`;
CREATE TABLE `rpt_sms` (
  `objid` varchar(50) NOT NULL,
  `traceid` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `logdate` datetime NOT NULL,
  `message` text,
  `amount` decimal(10,2) NOT NULL,
  `amtpaid` decimal(10,2) NOT NULL,
  `action` varchar(100) default NULL,
  `status` varchar(25) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptsms_phoneno` (`phoneno`),
  KEY `ix_rptsms_traceid` (`traceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpt_sms_registration`
--

DROP TABLE IF EXISTS `rpt_sms_registration`;
CREATE TABLE `rpt_sms_registration` (
  `phoneno` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `dtregistered` datetime NOT NULL,
  PRIMARY KEY  (`phoneno`,`refid`),
  KEY `ix_rptsmsreg_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptbill`
--

DROP TABLE IF EXISTS `rptbill`;
CREATE TABLE `rptbill` (
  `objid` varchar(50) NOT NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `expirydate` date NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) default NULL,
  `billtoyear` int(11) default NULL,
  `billtoqtr` int(11) default NULL,
  `dtposted` datetime default NULL,
  `taxpayer_name` text,
  `taxpayer_address` varchar(150) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptbill_ledger`
--

DROP TABLE IF EXISTS `rptbill_ledger`;
CREATE TABLE `rptbill_ledger` (
  `rptledgerid` varchar(50) NOT NULL,
  `rptbillid` varchar(50) NOT NULL,
  `partialbasic` decimal(16,2) default NULL,
  `partialbasicint` decimal(16,2) default NULL,
  `partialbasicdisc` decimal(16,2) default NULL,
  `partialsef` decimal(16,2) default NULL,
  `partialsefint` decimal(16,2) default NULL,
  `partialsefdisc` decimal(16,2) default NULL,
  `partialledyear` int(11) default NULL,
  `partialledqtr` int(11) default NULL,
  PRIMARY KEY  (`rptledgerid`,`rptbillid`),
  KEY `rptbillid` (`rptbillid`),
  CONSTRAINT `rptbill_ledger_ibfk_1` FOREIGN KEY (`rptbillid`) REFERENCES `rptbill` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptbill_ledger_account`
--

DROP TABLE IF EXISTS `rptbill_ledger_account`;
CREATE TABLE `rptbill_ledger_account` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `revperiod` varchar(25) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `sharetype` varchar(25) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptbill_ledger_account_rptledger` USING BTREE (`rptledgerid`),
  KEY `ix_rptbillledgeraccount_revenueitem` USING BTREE (`item_objid`),
  CONSTRAINT `rptbill_ledger_account_ibfk_1` FOREIGN KEY (`item_objid`) REFERENCES `revenueitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Table structure for table `rptbill_ledger_item`
--

DROP TABLE IF EXISTS `rptbill_ledger_item`;
CREATE TABLE `rptbill_ledger_item` (
  `objid` varchar(75) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `firecode` decimal(10,2) default NULL,
  `revperiod` varchar(25) default NULL,
  `basicnet` decimal(16,2) default NULL,
  `sefnet` decimal(16,2) default NULL,
  `total` decimal(16,2) default NULL,
  `partialled` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptbill_ledger_item_rptledger` USING BTREE (`rptledgerid`),
  KEY `ix_rptbill_ledger_item_rptledgerfaas` USING BTREE (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerfaasid` USING BTREE (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerid` USING BTREE (`rptledgerid`),
  CONSTRAINT `rptbill_ledger_item_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `rptbill_ledger_item_ibfk_2` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Table structure for table `rptcertification`
--

DROP TABLE IF EXISTS `rptcertification`;
CREATE TABLE `rptcertification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `opener` varchar(50) NOT NULL,
  `faasid` varchar(50) default NULL,
  `taxpayer_objid` varchar(50) default NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(150) default NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(100) NOT NULL,
  `purpose` text,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) default NULL,
  `byauthoritytitle` varchar(50) default NULL,
  `official` int(11) NOT NULL,
  `orno` varchar(25) default NULL,
  `ordate` datetime default NULL,
  `oramount` decimal(16,2) NOT NULL,
  `stampamount` decimal(16,2) NOT NULL,
  `createdbyid` varchar(50) default NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) default NULL,
  `addlinfo` text,
  PRIMARY KEY  (`objid`),
  KEY `FK_rptcertification_faas` (`faasid`),
  KEY `ix_rptcertification_office` (`office`),
  KEY `ix_rptcertification_office_txnno` (`office`,`txnno`),
  KEY `ix_rptcertification_taxpayerid` (`taxpayer_objid`),
  CONSTRAINT `rptcertification_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptcertificationitem`
--

DROP TABLE IF EXISTS `rptcertificationitem`;
CREATE TABLE `rptcertificationitem` (
  `rptcertificationid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  KEY `FK_rptcertificationitem_rptcertification` (`rptcertificationid`),
  KEY `ix_rptcertificationitem_refid` (`refid`),
  CONSTRAINT `rptcertificationitem_ibfk_1` FOREIGN KEY (`rptcertificationid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptexpiry`
--

DROP TABLE IF EXISTS `rptexpiry`;
CREATE TABLE `rptexpiry` (
  `iyear` int(11) NOT NULL,
  `iqtr` int(11) NOT NULL,
  `expirytype` varchar(50) NOT NULL,
  `expirydate` datetime default NULL,
  `reason` varchar(100) default NULL,
  PRIMARY KEY  (`iqtr`,`iyear`,`expirytype`),
  KEY `ix_rptexpiry_yrqtr` (`iyear`,`iqtr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptledger`
--

DROP TABLE IF EXISTS `rptledger`;
CREATE TABLE `rptledger` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `nextbilldate` date default NULL,
  `lastyearpaid` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `firstqtrpaidontime` int(11) NOT NULL,
  `qtrlypaymentavailed` int(11) NOT NULL,
  `qtrlypaymentpaidontime` int(11) NOT NULL,
  `lastitemyear` int(11) default NULL,
  `lastreceiptid` varchar(50) default NULL,
  `barangayid` varchar(50) NOT NULL,
  `advancebill` int(11) NOT NULL,
  `lastbilledyear` int(11) default NULL,
  `lastbilledqtr` int(11) default NULL,
  `partialbasic` decimal(16,2) default NULL,
  `partialbasicint` decimal(16,2) default NULL,
  `partialbasicdisc` decimal(16,2) default NULL,
  `partialsef` decimal(16,2) default NULL,
  `partialsefint` decimal(16,2) default NULL,
  `partialsefdisc` decimal(16,2) default NULL,
  `partialledyear` int(11) default NULL,
  `partialledqtr` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `barangayid` (`barangayid`),
  KEY `ix_rptledger_faasid` (`faasid`),
  KEY `ix_rptledger_state` (`state`),
  KEY `ix_rptledger_state_barangay` (`state`,`barangayid`),
  KEY `ix_rptledger_state_faasid` (`state`,`faasid`),
  KEY `ix_rptledger_state_lastyearpaid` (`state`,`lastyearpaid`),
  KEY `ix_rptledgerlastyearpaidqtr` (`lastyearpaid`,`lastqtrpaid`),
  CONSTRAINT `rptledger_ibfk_1` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`),
  CONSTRAINT `rptledger_ibfk_2` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptledgerbill`
--

DROP TABLE IF EXISTS `rptledgerbill`;
CREATE TABLE `rptledgerbill` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `ledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `type` varchar(25) NOT NULL,
  `revenueitemid` varchar(50) default NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `refid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptledgerbillitem`
--

DROP TABLE IF EXISTS `rptledgerbillitem`;
CREATE TABLE `rptledgerbillitem` (
  `objid` varchar(75) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `qtrlyav` decimal(16,2) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicpaid` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicintpaid` decimal(16,2) NOT NULL,
  `basicintpartial` decimal(10,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `basicdisctaken` decimal(16,2) NOT NULL,
  `basicamnesty` decimal(16,2) NOT NULL,
  `basicintamnesty` decimal(16,2) NOT NULL,
  `basiccredit` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefpaid` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefintpaid` decimal(16,2) NOT NULL,
  `sefintpartial` decimal(10,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `sefdisctaken` decimal(16,2) NOT NULL,
  `sefamnesty` decimal(16,2) NOT NULL,
  `sefintamnesty` decimal(16,2) NOT NULL,
  `sefcredit` decimal(16,2) NOT NULL,
  `firecode` decimal(10,2) default NULL,
  `firecodepaid` decimal(10,2) default NULL,
  `revtype` varchar(15) default NULL,
  `amnestyinfo` varchar(50) default NULL,
  `forpayment` int(11) NOT NULL,
  `partial` int(11) default NULL,
  `partialapplied` int(11) default NULL,
  `partialbasic` decimal(10,2) default NULL,
  `partialbasicint` decimal(10,2) default NULL,
  `partialbasicdisc` decimal(10,2) default NULL,
  `partialsef` decimal(10,2) default NULL,
  `partialsefint` decimal(10,2) default NULL,
  `partialsefdisc` decimal(10,2) default NULL,
  `basicacctid` varchar(50) default NULL,
  `basicintacctid` varchar(50) default NULL,
  `sefacctid` varchar(50) default NULL,
  `sefintacctid` varchar(50) default NULL,
  `firecodeacctid` varchar(50) default NULL,
  `lgushare` decimal(16,2) NOT NULL,
  `lguintshare` decimal(16,2) NOT NULL,
  `brgyshare` decimal(16,2) NOT NULL,
  `brgyintshare` decimal(16,2) NOT NULL,
  `brgyshareacctid` varchar(50) default NULL,
  `brgyintshareacctid` varchar(50) default NULL,
  `provshare` decimal(16,2) NOT NULL,
  `provintshare` decimal(16,2) NOT NULL,
  `provshareacctid` varchar(50) default NULL,
  `provintshareacctid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptledgerbillitem_rptledgerfaasid` (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerid` (`rptledgerid`),
  CONSTRAINT `rptledgerbillitem_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `rptledgerbillitem_ibfk_2` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptledgerfaas`
--

DROP TABLE IF EXISTS `rptledgerfaas`;
CREATE TABLE `rptledgerfaas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `faasid` varchar(50) default NULL,
  `tdno` varchar(60) NOT NULL,
  `txntype_objid` varchar(10) default NULL,
  `classification_objid` varchar(50) default NULL,
  `actualuse_objid` varchar(50) default NULL,
  `taxable` int(11) NOT NULL,
  `backtax` int(11) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `systemcreated` int(11) NOT NULL,
  `reclassed` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `faasid` (`faasid`),
  KEY `ix_rptledgerfaas_rptledgerid_faasid` (`rptledgerid`,`faasid`),
  KEY `ix_rptledgerhistory_ledgerid_toyear` (`rptledgerid`,`toyear`),
  KEY `fk_rptledgerhistory_rptledger` USING BTREE (`rptledgerid`),
  CONSTRAINT `rptledgerfaas_ibfk_1` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `rptledgerfaas_ibfk_2` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptledgeritem`
--

DROP TABLE IF EXISTS `rptledgeritem`;
CREATE TABLE `rptledgeritem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicpaid` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicintpaid` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `basicdisctaken` decimal(16,2) NOT NULL,
  `basiccredit` decimal(16,2) NOT NULL,
  `basicintpartial` decimal(16,2) NOT NULL,
  `basicamnesty` decimal(16,2) NOT NULL,
  `basicintamnesty` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefpaid` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefintpaid` decimal(16,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `sefdisctaken` decimal(16,2) NOT NULL,
  `sefcredit` decimal(16,2) NOT NULL,
  `sefintpartial` decimal(16,2) NOT NULL,
  `sefamnesty` decimal(16,2) NOT NULL,
  `sefintamnesty` decimal(16,2) NOT NULL,
  `firecode` decimal(16,2) NOT NULL,
  `firecodepaid` decimal(16,2) NOT NULL,
  `basicacct_objid` varchar(50) default NULL,
  `basicintacct_objid` varchar(50) default NULL,
  `sefacct_objid` varchar(50) default NULL,
  `sefintacct_objid` varchar(50) default NULL,
  `firecodeacct_objid` varchar(50) default NULL,
  `revtype` varchar(15) default NULL,
  `forpayment` int(11) NOT NULL,
  `qtrly` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `amnestyinfo` varchar(50) default NULL,
  `partial` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_rptledgeritem_rptledger` (`rptledgerid`),
  KEY `FK_rptledgeritem_rptledgerfaas` (`rptledgerfaasid`),
  KEY `ix_rptledgeritem_ledgerstate` (`rptledgerid`,`state`),
  CONSTRAINT `rptledgeritem_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `rptledgeritem_ibfk_2` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptledgeritem_qtrly`
--

DROP TABLE IF EXISTS `rptledgeritem_qtrly`;
CREATE TABLE `rptledgeritem_qtrly` (
  `objid` varchar(75) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `rptledgeritemid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `qtrlyav` decimal(16,2) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicpaid` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicintpaid` decimal(16,2) NOT NULL,
  `basicintpartial` decimal(10,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `basicdisctaken` decimal(16,2) NOT NULL,
  `basicamnesty` decimal(16,2) NOT NULL,
  `basicintamnesty` decimal(16,2) NOT NULL,
  `basiccredit` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefpaid` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefintpaid` decimal(16,2) NOT NULL,
  `sefintpartial` decimal(10,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `sefdisctaken` decimal(16,2) NOT NULL,
  `sefamnesty` decimal(16,2) NOT NULL,
  `sefintamnesty` decimal(16,2) NOT NULL,
  `sefcredit` decimal(16,2) NOT NULL,
  `firecode` decimal(10,2) default NULL,
  `firecodepaid` decimal(10,2) default NULL,
  `revtype` varchar(15) default NULL,
  `amnestyinfo` varchar(50) default NULL,
  `forpayment` int(11) NOT NULL,
  `partial` int(11) default NULL,
  `partialbasic` decimal(10,2) default NULL,
  `partialbasicint` decimal(10,2) default NULL,
  `partialbasicdisc` decimal(10,2) default NULL,
  `partialsef` decimal(10,2) default NULL,
  `partialsefint` decimal(10,2) default NULL,
  `partialsefdisc` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_rptledgeritem_rptledger` (`rptledgerid`),
  KEY `FK_rptledgeritem_rptledgeritem` (`rptledgeritemid`),
  CONSTRAINT `rptledgeritem_qtrly_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `rptledgeritem_qtrly_ibfk_2` FOREIGN KEY (`rptledgeritemid`) REFERENCES `rptledgeritem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptparameter`
--

DROP TABLE IF EXISTS `rptparameter`;
CREATE TABLE `rptparameter` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `description` text,
  `paramtype` varchar(20) NOT NULL,
  `minvalue` decimal(10,2) NOT NULL,
  `maxvalue` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptparameter_caption` (`caption`),
  KEY `ix_rptparameter_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptreceipt_capture`
--

DROP TABLE IF EXISTS `rptreceipt_capture`;
CREATE TABLE `rptreceipt_capture` (
  `objid` varchar(100) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` date NOT NULL,
  `payorid` varchar(50) default NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `collector` varchar(80) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `paidby` varchar(255) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `period` varchar(50) NOT NULL,
  `basic` decimal(12,2) NOT NULL,
  `basicint` decimal(12,2) NOT NULL,
  `basicdisc` decimal(12,2) NOT NULL,
  `sef` decimal(12,2) NOT NULL,
  `sefint` decimal(12,2) NOT NULL,
  `sefdisc` decimal(12,2) NOT NULL,
  `firecode` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptreceipt_capture_paidby` (`paidby`),
  KEY `ix_rptreceipt_payorid` (`payorid`),
  KEY `ix_rptreceipt_receiptno` (`receiptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpttask`
--

DROP TABLE IF EXISTS `rpttask`;
CREATE TABLE `rpttask` (
  `taskid` varchar(50) NOT NULL,
  `objid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `msg` varchar(100) default NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime default NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `createdby_title` varchar(50) default NULL,
  `assignedto_objid` varchar(50) default NULL,
  `assignedto_name` varchar(150) default NULL,
  `assignedto_title` varchar(50) default NULL,
  `workflowid` varchar(50) default NULL,
  `signatory` varchar(50) default NULL,
  `docname` varchar(50) default NULL,
  `status` varchar(100) default NULL,
  PRIMARY KEY  (`taskid`),
  KEY `ix_rpttask_assignedto_enddate` (`assignedto_objid`,`enddate`),
  KEY `ix_rpttask_assignedto_name` (`assignedto_name`),
  KEY `ix_rpttask_assignedto_objid` (`assignedto_objid`),
  KEY `ix_rpttask_createdby_name` (`createdby_name`),
  KEY `ix_rpttask_createdby_objid` (`createdby_objid`),
  KEY `ix_rpttask_enddate` (`enddate`),
  KEY `ix_rpttask_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpttaxclearance`
--

DROP TABLE IF EXISTS `rpttaxclearance`;
CREATE TABLE `rpttaxclearance` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `rpttaxclearance_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpttaxincentive`
--

DROP TABLE IF EXISTS `rpttaxincentive`;
CREATE TABLE `rpttaxincentive` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) default NULL,
  `txndate` date default NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(150) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `createdby_title` varchar(50) NOT NULL,
  `createdby_date` datetime NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rpttaxincentive_name` (`name`),
  KEY `ix_rpttaxincentive_state` (`state`),
  KEY `ix_rpttaxincentive_taxpayerid` (`taxpayer_objid`),
  KEY `ix_rpttaxincentive_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpttaxincentive_item`
--

DROP TABLE IF EXISTS `rpttaxincentive_item`;
CREATE TABLE `rpttaxincentive_item` (
  `objid` varchar(50) NOT NULL,
  `rpttaxincentiveid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `basicrate` int(11) NOT NULL,
  `sefrate` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rpttaxincentiveitem_rptledgerid` (`rptledgerid`),
  KEY `ix_rpttaxincentiveitem_rpttaxincentiveid` (`rpttaxincentiveid`),
  CONSTRAINT `rpttaxincentive_item_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `rpttaxincentive_item_ibfk_2` FOREIGN KEY (`rpttaxincentiveid`) REFERENCES `rpttaxincentive` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpttracking`
--

DROP TABLE IF EXISTS `rpttracking`;
CREATE TABLE `rpttracking` (
  `objid` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `trackingno` varchar(25) NOT NULL,
  `msg` varchar(150) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptvariable`
--

DROP TABLE IF EXISTS `rptvariable`;
CREATE TABLE `rptvariable` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Table structure for table `rptworkflow`
--

DROP TABLE IF EXISTS `rptworkflow`;
CREATE TABLE `rptworkflow` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) default NULL,
  `appliedto` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rptworkflow_state`
--

DROP TABLE IF EXISTS `rptworkflow_state`;
CREATE TABLE `rptworkflow_state` (
  `objid` varchar(50) NOT NULL,
  `workflowid` varchar(50) NOT NULL,
  `fromstate` varchar(50) default NULL,
  `tostate` varchar(50) default NULL,
  `type` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `signatory` varchar(50) default NULL,
  `message` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptworkflowstate_workflowid` (`workflowid`),
  CONSTRAINT `rptworkflow_state_ibfk_1` FOREIGN KEY (`workflowid`) REFERENCES `rptworkflow` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpu`
--

DROP TABLE IF EXISTS `rpu`;
CREATE TABLE `rpu` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `realpropertyid` varchar(50) default NULL,
  `rputype` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `fullpin` varchar(30) default NULL,
  `suffix` int(11) NOT NULL,
  `subsuffix` int(11) default NULL,
  `classification_objid` varchar(50) default NULL,
  `exemptiontype_objid` varchar(50) default NULL,
  `taxable` int(11) NOT NULL,
  `totalareaha` decimal(18,6) NOT NULL,
  `totalareasqm` decimal(18,6) NOT NULL,
  `totalbmv` decimal(16,2) NOT NULL,
  `totalmv` decimal(16,2) NOT NULL,
  `totalav` decimal(16,2) NOT NULL,
  `hasswornamount` int(11) NOT NULL,
  `swornamount` decimal(16,2) NOT NULL,
  `useswornamount` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  `rpumasterid` varchar(50) default NULL,
  `reclassed` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `exemptiontype_objid` (`exemptiontype_objid`),
  KEY `rpumasterid` (`rpumasterid`),
  KEY `FK_rpu_realpropertyid` (`realpropertyid`),
  KEY `ix_classification_objid` (`classification_objid`),
  KEY `ix_previd` (`previd`),
  KEY `ix_rpu_fullpin` (`fullpin`),
  KEY `ix_rpu_ry_fullpin` (`fullpin`,`ry`),
  KEY `ix_rpu_ry_state` (`state`),
  KEY `ix_rpu_state` (`state`),
  KEY `ix_rpy_ry` (`ry`),
  CONSTRAINT `rpu_ibfk_1` FOREIGN KEY (`exemptiontype_objid`) REFERENCES `exemptiontype` (`objid`),
  CONSTRAINT `rpu_ibfk_2` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `rpu_ibfk_3` FOREIGN KEY (`realpropertyid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `rpu_ibfk_4` FOREIGN KEY (`rpumasterid`) REFERENCES `rpumaster` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rpumaster`
--

DROP TABLE IF EXISTS `rpumaster`;
CREATE TABLE `rpumaster` (
  `objid` varchar(50) NOT NULL,
  `currentfaasid` varchar(50) default NULL,
  `currentrpuid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rysetting_lgu`
--

DROP TABLE IF EXISTS `rysetting_lgu`;
CREATE TABLE `rysetting_lgu` (
  `rysettingid` varchar(50) NOT NULL,
  `lguid` varchar(50) NOT NULL,
  `lguname` varchar(100) NOT NULL,
  `settingtype` varchar(15) NOT NULL,
  PRIMARY KEY  (`rysettingid`,`lguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rysettinginfo`
--

DROP TABLE IF EXISTS `rysettinginfo`;
CREATE TABLE `rysettinginfo` (
  `ry` int(11) NOT NULL,
  `ordinanceno` varchar(50) default NULL,
  `ordinancedate` datetime default NULL,
  `sangguniangname` varchar(50) default NULL,
  PRIMARY KEY  (`ry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `signatory`
--

DROP TABLE IF EXISTS `signatory`;
CREATE TABLE `signatory` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) default NULL,
  `name` varchar(150) default NULL,
  `title` varchar(50) NOT NULL,
  `department` varchar(50) default NULL,
  `personnelid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_signatory_doctype` (`doctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sms_rpt_registration`
--

DROP TABLE IF EXISTS `sms_rpt_registration`;
CREATE TABLE `sms_rpt_registration` (
  `mobileno` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `dtregistered` datetime NOT NULL,
  PRIMARY KEY  (`mobileno`,`rptledgerid`),
  KEY `ix_smsrptreg_rptledgerid` (`rptledgerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `specialaccountsetting`
--

DROP TABLE IF EXISTS `specialaccountsetting`;
CREATE TABLE `specialaccountsetting` (
  `objid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `collectiontypeid` varchar(50) NOT NULL,
  `revtype` varchar(100) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `collectiontypeid` (`collectiontypeid`),
  CONSTRAINT `specialaccountsetting_ibfk_1` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sreaccount`
--

DROP TABLE IF EXISTS `sreaccount`;
CREATE TABLE `sreaccount` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `state` varchar(10) default NULL,
  `chartid` varchar(50) default NULL,
  `code` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(20) default NULL,
  `acctgroup` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sreaccount_incometarget`
--

DROP TABLE IF EXISTS `sreaccount_incometarget`;
CREATE TABLE `sreaccount_incometarget` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(18,2) default NULL,
  PRIMARY KEY  (`objid`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockissue`
--

DROP TABLE IF EXISTS `stockissue`;
CREATE TABLE `stockissue` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) default NULL,
  `request_objid` varchar(50) default NULL,
  `request_reqno` varchar(50) default NULL,
  `issueno` varchar(50) default NULL,
  `dtfiled` datetime default NULL,
  `reqtype` varchar(10) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_name` varchar(100) default NULL,
  `issueto_objid` varchar(50) default NULL,
  `issueto_name` varchar(100) default NULL,
  `issueto_title` varchar(50) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `itemclass` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_stockissue_request` (`request_objid`),
  CONSTRAINT `stockissue_ibfk_1` FOREIGN KEY (`request_objid`) REFERENCES `stockrequest` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockissueitem`
--

DROP TABLE IF EXISTS `stockissueitem`;
CREATE TABLE `stockissueitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) default NULL,
  `item_code` varchar(50) default NULL,
  `item_title` varchar(255) default NULL,
  `unit` varchar(20) default NULL,
  `qtyrequested` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_stockissueitem_stockissue` (`parentid`),
  CONSTRAINT `stockissueitem_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `stockissue` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockitem`
--

DROP TABLE IF EXISTS `stockitem`;
CREATE TABLE `stockitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) default NULL,
  `code` varchar(20) default NULL,
  `type` varchar(50) default NULL,
  `itemclass` varchar(50) default NULL,
  `title` varchar(150) default NULL,
  `description` varchar(255) default NULL,
  `baseunit` varchar(10) default NULL,
  `defaultunit` varchar(10) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockitem_unit`
--

DROP TABLE IF EXISTS `stockitem_unit`;
CREATE TABLE `stockitem_unit` (
  `itemid` varchar(50) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `qty` int(11) default NULL,
  PRIMARY KEY  (`itemid`,`unit`),
  CONSTRAINT `stockitem_unit_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `stockitem` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockreceipt`
--

DROP TABLE IF EXISTS `stockreceipt`;
CREATE TABLE `stockreceipt` (
  `objid` varchar(50) NOT NULL,
  `receiptno` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `request_objid` varchar(50) default NULL,
  `request_reqno` varchar(50) default NULL,
  `dtfiled` datetime default NULL,
  `reqtype` varchar(25) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_name` varchar(100) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `itemclass` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_stockreceipt_request` (`request_objid`),
  CONSTRAINT `stockreceipt_ibfk_1` FOREIGN KEY (`request_objid`) REFERENCES `stockrequest` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockreceiptitem`
--

DROP TABLE IF EXISTS `stockreceiptitem`;
CREATE TABLE `stockreceiptitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) default NULL,
  `item_code` varchar(50) default NULL,
  `item_title` varchar(255) default NULL,
  `unit` varchar(20) default NULL,
  `qtyrequested` int(11) default NULL,
  `qtyreceived` int(11) default NULL,
  `remarks` varchar(255) default NULL,
  `cost` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_stockreceiptitem_stockreceipt` (`parentid`),
  CONSTRAINT `stockreceiptitem_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `stockreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockrequest`
--

DROP TABLE IF EXISTS `stockrequest`;
CREATE TABLE `stockrequest` (
  `objid` varchar(50) NOT NULL,
  `reqno` varchar(20) default NULL,
  `state` varchar(10) default NULL,
  `dtfiled` datetime default NULL,
  `reqtype` varchar(10) default NULL,
  `itemclass` varchar(50) default NULL,
  `requester_objid` varchar(50) default NULL,
  `requester_name` varchar(50) default NULL,
  `requester_title` varchar(50) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `vendor` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stockrequestitem`
--

DROP TABLE IF EXISTS `stockrequestitem`;
CREATE TABLE `stockrequestitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `item_objid` varchar(50) default NULL,
  `item_code` varchar(50) default NULL,
  `item_title` varchar(255) default NULL,
  `unit` varchar(10) default NULL,
  `qty` int(11) default NULL,
  `qtyreceived` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stocksale`
--

DROP TABLE IF EXISTS `stocksale`;
CREATE TABLE `stocksale` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) default NULL,
  `request_objid` varchar(50) default NULL,
  `request_reqno` varchar(50) default NULL,
  `issueno` varchar(50) default NULL,
  `dtfiled` datetime default NULL,
  `reqtype` varchar(10) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_name` varchar(100) default NULL,
  `soldto_objid` varchar(50) default NULL,
  `soldto_name` varchar(100) default NULL,
  `soldto_title` varchar(50) default NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `itemclass` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `request_objid` USING BTREE (`request_objid`),
  CONSTRAINT `stocksale_ibfk_1` FOREIGN KEY (`request_objid`) REFERENCES `stockrequest` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `stocksaleitem`
--

DROP TABLE IF EXISTS `stocksaleitem`;
CREATE TABLE `stocksaleitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) default NULL,
  `item_code` varchar(50) default NULL,
  `item_title` varchar(255) default NULL,
  `unit` varchar(20) default NULL,
  `qtyrequested` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `cost` decimal(10,2) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` USING BTREE (`parentid`),
  CONSTRAINT `stocksaleitem_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `stocksale` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `structure`
--

DROP TABLE IF EXISTS `structure`;
CREATE TABLE `structure` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `indexno` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_structure_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `structurematerial`
--

DROP TABLE IF EXISTS `structurematerial`;
CREATE TABLE `structurematerial` (
  `structure_objid` varchar(50) NOT NULL,
  `material_objid` varchar(50) NOT NULL,
  PRIMARY KEY  (`structure_objid`,`material_objid`),
  KEY `FK_structurematerial_material` (`material_objid`),
  CONSTRAINT `structurematerial_ibfk_1` FOREIGN KEY (`material_objid`) REFERENCES `material` (`objid`),
  CONSTRAINT `structurematerial_ibfk_2` FOREIGN KEY (`structure_objid`) REFERENCES `structure` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `subcollector_remittance`
--

DROP TABLE IF EXISTS `subcollector_remittance`;
CREATE TABLE `subcollector_remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(30) NOT NULL,
  `subcollector_objid` varchar(50) NOT NULL,
  `subcollector_name` varchar(100) NOT NULL,
  `subcollector_title` varchar(50) default NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(12,2) default NULL,
  `totalnoncash` decimal(12,2) default NULL,
  `cashbreakdown` text,
  `collectionsummaries` longtext,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `subcollector_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `subcollector_remittance_cashreceipt`;
CREATE TABLE `subcollector_remittance_cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_subcollector_remittance_cashreceipt_remittance` (`remittanceid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `subcollector_remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `subdividedland`
--

DROP TABLE IF EXISTS `subdividedland`;
CREATE TABLE `subdividedland` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(5) NOT NULL,
  `newtdno` varchar(25) default NULL,
  `newutdno` varchar(25) NOT NULL,
  `newpin` varchar(25) NOT NULL,
  `newtitletype` varchar(25) default NULL,
  `newtitleno` varchar(25) default NULL,
  `newtitledate` datetime default NULL,
  `areasqm` decimal(16,2) NOT NULL,
  `areaha` decimal(16,6) NOT NULL,
  `memoranda` text NOT NULL,
  `administrator_objid` varchar(50) default NULL,
  `administrator_name` varchar(150) default NULL,
  `administrator_address` varchar(100) default NULL,
  `taxpayer_objid` varchar(50) default NULL,
  `taxpayer_name` text,
  `taxpayer_address` varchar(100) default NULL,
  `owner_name` text,
  `owner_address` varchar(100) default NULL,
  `newrpid` varchar(50) NOT NULL,
  `newrpuid` varchar(50) default NULL,
  `newfaasid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_subdividedland_faas` (`newfaasid`),
  KEY `FK_subdividedland_newrp` (`newrpid`),
  KEY `FK_subdividedland_newrpu` (`newrpuid`),
  KEY `FK_subdividedland_subdivision` (`subdivisionid`),
  KEY `ix_subdividedland_administrator_name` (`administrator_name`),
  KEY `ix_subdividedland_newpin` (`newpin`),
  KEY `ix_subdividedland_newtdno` (`newtdno`),
  CONSTRAINT `subdividedland_ibfk_1` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `subdividedland_ibfk_2` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `subdividedland_ibfk_3` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `subdividedland_ibfk_4` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `subdivision`
--

DROP TABLE IF EXISTS `subdivision`;
CREATE TABLE `subdivision` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(5) NOT NULL,
  `txnno` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `autonumber` int(11) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` text NOT NULL,
  `motherfaasid` varchar(50) NOT NULL,
  `lguid` varchar(50) default NULL,
  `signatories` text,
  PRIMARY KEY  (`objid`),
  KEY `FK_subdivision_faas` (`motherfaasid`),
  CONSTRAINT `subdivision_ibfk_1` FOREIGN KEY (`motherfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `subdivisionaffectedrpu`
--

DROP TABLE IF EXISTS `subdivisionaffectedrpu`;
CREATE TABLE `subdivisionaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(5) default NULL,
  `subdividedlandid` varchar(50) default NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `newfaasid` varchar(50) default NULL,
  `newtdno` varchar(25) default NULL,
  `newutdno` varchar(25) NOT NULL,
  `newsuffix` int(11) NOT NULL,
  `newpin` varchar(25) default NULL,
  `newrpuid` varchar(50) default NULL,
  `newrpid` varchar(50) default NULL,
  `memoranda` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_subdivisionaffectedpru_newfaas` (`newfaasid`),
  KEY `FK_subdivisionaffectedpru_newrpu` (`newrpuid`),
  KEY `FK_subdivisionaffectedpru_prevfaas` (`prevfaasid`),
  KEY `FK_subdivisionaffectedpru_subdividedland` (`subdividedlandid`),
  KEY `FK_subdivisionaffectedpru_subdivision` (`subdivisionid`),
  KEY `ix_subdivisionaffectedrpu_newtdno` (`newtdno`),
  CONSTRAINT `subdivisionaffectedrpu_ibfk_1` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `subdivisionaffectedrpu_ibfk_2` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `subdivisionaffectedrpu_ibfk_3` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `subdivisionaffectedrpu_ibfk_4` FOREIGN KEY (`subdividedlandid`) REFERENCES `subdividedland` (`objid`),
  CONSTRAINT `subdivisionaffectedrpu_ibfk_5` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_dataset`
--

DROP TABLE IF EXISTS `sys_dataset`;
CREATE TABLE `sys_dataset` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `input` longtext,
  `output` longtext,
  `statement` varchar(50) default NULL,
  `datasource` varchar(50) default NULL,
  `servicename` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `orgclass` varchar(50) default NULL,
  `parent_objid` varchar(50) default NULL,
  `parent_orgclass` varchar(50) default NULL,
  `code` varchar(50) default NULL,
  `root` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_sys_org` (`parent_orgclass`),
  KEY `FK_sys_org_orgclass` (`orgclass`),
  CONSTRAINT `sys_org_ibfk_1` FOREIGN KEY (`parent_orgclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `sys_org_ibfk_2` FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_orgclass`
--

DROP TABLE IF EXISTS `sys_orgclass`;
CREATE TABLE `sys_orgclass` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) default NULL,
  `parentclass` varchar(255) default NULL,
  `handler` varchar(50) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_quarter`
--

DROP TABLE IF EXISTS `sys_quarter`;
CREATE TABLE `sys_quarter` (
  `qtrid` int(11) NOT NULL,
  PRIMARY KEY  (`qtrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
CREATE TABLE `sys_report` (
  `objid` varchar(50) NOT NULL,
  `reportfolderid` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `filetype` varchar(25) default NULL,
  `dtcreated` datetime default NULL,
  `createdby` varchar(50) default NULL,
  `datasetid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_sys_report_dataset` (`datasetid`),
  KEY `FK_sys_report_entry_folder` (`reportfolderid`),
  CONSTRAINT `sys_report_ibfk_1` FOREIGN KEY (`datasetid`) REFERENCES `sys_dataset` (`objid`),
  CONSTRAINT `sys_report_ibfk_2` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_report_admin`
--

DROP TABLE IF EXISTS `sys_report_admin`;
CREATE TABLE `sys_report_admin` (
  `objid` varchar(50) NOT NULL,
  `userid` varchar(50) default NULL,
  `reportfolderid` varchar(50) default NULL,
  `exclude` longtext,
  PRIMARY KEY  (`objid`),
  KEY `FK_sys_report_admin_folder` (`reportfolderid`),
  KEY `FK_sys_report_admin_user` (`userid`),
  CONSTRAINT `sys_report_admin_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `sys_report_admin_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_report_folder`
--

DROP TABLE IF EXISTS `sys_report_folder`;
CREATE TABLE `sys_report_folder` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `parentid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_report_member`
--

DROP TABLE IF EXISTS `sys_report_member`;
CREATE TABLE `sys_report_member` (
  `objid` varchar(50) NOT NULL,
  `reportfolderid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  `usergroupid` varchar(50) default NULL,
  `exclude` longtext,
  PRIMARY KEY  (`objid`),
  KEY `FK_sys_report_member_folder` (`reportfolderid`),
  KEY `FK_sys_report_member_user` (`userid`),
  KEY `FK_sys_report_member_usergroup` (`usergroupid`),
  CONSTRAINT `sys_report_member_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_3` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) default NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) default NULL,
  `title` varchar(250) default NULL,
  `description` longtext,
  `salience` int(11) default NULL,
  `effectivefrom` date default NULL,
  `effectiveto` date default NULL,
  `dtfiled` datetime default NULL,
  `user_objid` varchar(50) default NULL,
  `user_name` varchar(100) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `rulegroup` (`rulegroup`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `actiondef_objid` varchar(50) default NULL,
  `actiondef_name` varchar(50) default NULL,
  `pos` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `actiondefparam_objid` varchar(50) default NULL,
  `stringvalue` varchar(255) default NULL,
  `booleanvalue` int(11) default NULL,
  `var_objid` varchar(50) default NULL,
  `var_name` varchar(50) default NULL,
  `expr` longtext,
  `exprtype` varchar(25) default NULL,
  `pos` int(11) default NULL,
  `obj_key` varchar(50) default NULL,
  `obj_value` varchar(255) default NULL,
  `listvalue` longtext,
  `lov` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) default NULL,
  `sortorder` int(11) default NULL,
  `actionname` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) default NULL,
  `title` varchar(50) default NULL,
  `datatype` varchar(50) default NULL,
  `handler` varchar(50) default NULL,
  `lookuphandler` varchar(50) default NULL,
  `lookupkey` varchar(50) default NULL,
  `lookupvalue` varchar(50) default NULL,
  `vardatatype` varchar(50) default NULL,
  `lovname` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `fact_name` varchar(50) default NULL,
  `fact_objid` varchar(50) default NULL,
  `varname` varchar(50) default NULL,
  `pos` int(11) default NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) default NULL,
  `dynamic_key` varchar(50) default NULL,
  `dynamic_value` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `fact_objid` (`fact_objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `field_objid` varchar(50) default NULL,
  `fieldname` varchar(50) default NULL,
  `varname` varchar(50) default NULL,
  `operator_caption` varchar(50) default NULL,
  `operator_symbol` varchar(50) default NULL,
  `usevar` int(11) default NULL,
  `var_objid` varchar(50) default NULL,
  `var_name` varchar(50) default NULL,
  `decimalvalue` decimal(16,2) default NULL,
  `intvalue` int(11) default NULL,
  `stringvalue` varchar(255) default NULL,
  `listvalue` longtext,
  `datevalue` date default NULL,
  `pos` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `ruleid` varchar(50) default NULL,
  `varname` varchar(50) default NULL,
  `datatype` varchar(50) default NULL,
  `pos` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) default NULL,
  `factclass` varchar(50) default NULL,
  `sortorder` int(11) default NULL,
  `handler` varchar(50) default NULL,
  `defaultvarname` varchar(25) default NULL,
  `dynamic` int(11) default NULL,
  `lookuphandler` varchar(50) default NULL,
  `lookupkey` varchar(50) default NULL,
  `lookupvalue` varchar(50) default NULL,
  `lookupdatatype` varchar(50) default NULL,
  `dynamicfieldname` varchar(50) default NULL,
  `builtinconstraints` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) default NULL,
  `datatype` varchar(50) default NULL,
  `sortorder` int(11) default NULL,
  `handler` varchar(50) default NULL,
  `lookuphandler` varchar(50) default NULL,
  `lookupkey` varchar(50) default NULL,
  `lookupvalue` varchar(50) default NULL,
  `lookupdatatype` varchar(50) default NULL,
  `multivalued` int(11) default NULL,
  `required` int(11) default NULL,
  `vardatatype` varchar(50) default NULL,
  `lovname` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) default NULL,
  `sortorder` int(11) default NULL,
  PRIMARY KEY  (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) default NULL,
  `packagename` varchar(50) default NULL,
  `domain` varchar(50) default NULL,
  `role` varchar(50) default NULL,
  `permission` varchar(50) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY  (`ruleset`,`actiondef`),
  KEY `actiondef` (`actiondef`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_1` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY  (`ruleset`,`rulefact`),
  KEY `rulefact` (`rulefact`),
  CONSTRAINT `sys_ruleset_fact_ibfk_1` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `title` longblob,
  `content` longtext,
  `category` varchar(20) default NULL,
  `dtcreated` datetime default NULL,
  `createdby` varchar(50) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_securitygroup`
--

DROP TABLE IF EXISTS `sys_securitygroup`;
CREATE TABLE `sys_securitygroup` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `usergroup_objid` varchar(50) default NULL,
  `exclude` longtext,
  PRIMARY KEY  (`objid`),
  KEY `FK_sys_securitygroup_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_securitygroup_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_session`
--

DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `clienttype` varchar(12) default NULL,
  `accesstime` datetime default NULL,
  `accessexpiry` datetime default NULL,
  `timein` datetime default NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_session_log`
--

DROP TABLE IF EXISTS `sys_session_log`;
CREATE TABLE `sys_session_log` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `clienttype` varchar(12) default NULL,
  `accesstime` datetime default NULL,
  `accessexpiry` datetime default NULL,
  `timein` datetime default NULL,
  `timeout` datetime default NULL,
  `state` varchar(10) default NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_timeout` (`timeout`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_terminal`
--

DROP TABLE IF EXISTS `sys_terminal`;
CREATE TABLE `sys_terminal` (
  `terminalid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `parentcode` varchar(50) default NULL,
  `parenttype` varchar(50) default NULL,
  `macaddress` varchar(50) default NULL,
  `dtregistered` datetime default NULL,
  `registeredby` varchar(50) default NULL,
  `info` longtext,
  `state` int(11) default NULL,
  PRIMARY KEY  (`terminalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) default NULL,
  `dtcreated` datetime default NULL,
  `createdby` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `middlename` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `jobtitle` varchar(50) default NULL,
  `pwdlogincount` int(11) default NULL,
  `pwdexpirydate` datetime default NULL,
  `usedpwds` longtext,
  `lockid` varchar(32) default NULL,
  `txncode` varchar(10) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) default NULL,
  `domain` varchar(25) default NULL,
  `userclass` varchar(25) default NULL,
  `orgclass` varchar(50) default NULL,
  `role` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_usergroup_admin`
--

DROP TABLE IF EXISTS `sys_usergroup_admin`;
CREATE TABLE `sys_usergroup_admin` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_username` varchar(50) default NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) default NULL,
  `exclude` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `usergroupid` (`usergroupid`),
  KEY `FK_sys_usergroup_admin` (`user_objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_2` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_usergroup_member`
--

DROP TABLE IF EXISTS `sys_usergroup_member`;
CREATE TABLE `sys_usergroup_member` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `usergroup_objid` varchar(50) default NULL,
  `user_objid` varchar(50) NOT NULL,
  `user_username` varchar(50) default NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `org_orgclass` varchar(50) default NULL,
  `securitygroup_objid` varchar(50) default NULL,
  `exclude` varchar(255) default NULL,
  `displayname` varchar(50) default NULL,
  `jobtitle` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `usergroup_objid` (`usergroup_objid`),
  KEY `FK_sys_usergroup_member` (`user_objid`),
  KEY `FK_sys_usergroup_member_org` (`org_objid`),
  KEY `FK_sys_usergroup_member_securitygorup` (`securitygroup_objid`),
  KEY `ix_user_firstname` (`user_firstname`),
  KEY `ix_user_lastname_firstname` (`user_lastname`,`user_firstname`),
  KEY `ix_username` (`user_username`),
  CONSTRAINT `sys_usergroup_member_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_2` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_3` FOREIGN KEY (`securitygroup_objid`) REFERENCES `sys_securitygroup` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_4` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_usergroup_permission`
--

DROP TABLE IF EXISTS `sys_usergroup_permission`;
CREATE TABLE `sys_usergroup_permission` (
  `objid` varchar(50) NOT NULL,
  `usergroup_objid` varchar(50) default NULL,
  `object` varchar(25) default NULL,
  `permission` varchar(25) default NULL,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_sys_usergroup_permission_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_2` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) default NULL,
  `datatype` varchar(15) default NULL,
  `category` varchar(50) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tbletracsaccountmapping`
--

DROP TABLE IF EXISTS `tbletracsaccountmapping`;
CREATE TABLE `tbletracsaccountmapping` (
  `taxfeeid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `item_code` varchar(50) default NULL,
  `item_title` varchar(255) default NULL,
  `fund_objid` varchar(50) default NULL,
  `fund_code` varchar(50) default NULL,
  `fund_title` varchar(50) default NULL,
  PRIMARY KEY  (`taxfeeid`,`item_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `txnlog`
--

DROP TABLE IF EXISTS `txnlog`;
CREATE TABLE `txnlog` (
  `objid` varchar(50) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `refid` text NOT NULL,
  `txndate` datetime NOT NULL,
  `action` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `remarks` text,
  `diff` longtext,
  `username` varchar(150) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txnlog_action` (`action`),
  KEY `ix_txnlog_ref` (`ref`),
  KEY `ix_txnlog_userid` (`userid`),
  KEY `ix_txnlog_useridaction` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `txnref`
--

DROP TABLE IF EXISTS `txnref`;
CREATE TABLE `txnref` (
  `oid` int(11) NOT NULL,
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`oid`),
  KEY `ix_txnref_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `txnsignatory`
--

DROP TABLE IF EXISTS `txnsignatory`;
CREATE TABLE `txnsignatory` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `personnelid` varchar(50) default NULL,
  `type` varchar(25) NOT NULL,
  `caption` varchar(25) default NULL,
  `name` varchar(200) default NULL,
  `title` varchar(50) default NULL,
  `dtsigned` datetime default NULL,
  `seqno` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_signatory_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `workflowstate`
--

DROP TABLE IF EXISTS `workflowstate`;
CREATE TABLE `workflowstate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `txndate` datetime default NULL,
  `userid` varchar(50) default NULL,
  `username` varchar(100) default NULL,
  PRIMARY KEY  (`objid`,`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-10 10:27:05
