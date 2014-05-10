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

USE `@dbname`;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_incometarget`
--

LOCK TABLES `account_incometarget` WRITE;
/*!40000 ALTER TABLE `account_incometarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_incometarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afserial`
--

LOCK TABLES `afserial` WRITE;
/*!40000 ALTER TABLE `afserial` DISABLE KEYS */;
INSERT INTO `afserial` VALUES ('0016',8),('51',7),('52',7),('53',7),('54',7),('56',7),('57',7),('58',7),('907',8);
/*!40000 ALTER TABLE `afserial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afserial_control`
--

LOCK TABLES `afserial_control` WRITE;
/*!40000 ALTER TABLE `afserial_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `afserial_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afserial_inventory`
--

LOCK TABLES `afserial_inventory` WRITE;
/*!40000 ALTER TABLE `afserial_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `afserial_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afserial_inventory_detail`
--

LOCK TABLES `afserial_inventory_detail` WRITE;
/*!40000 ALTER TABLE `afserial_inventory_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `afserial_inventory_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afserial_inventory_detail_cancelseries`
--

LOCK TABLES `afserial_inventory_detail_cancelseries` WRITE;
/*!40000 ALTER TABLE `afserial_inventory_detail_cancelseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `afserial_inventory_detail_cancelseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afserialcapture`
--

LOCK TABLES `afserialcapture` WRITE;
/*!40000 ALTER TABLE `afserialcapture` DISABLE KEYS */;
/*!40000 ALTER TABLE `afserialcapture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `afstockcontrol`
--

LOCK TABLES `afstockcontrol` WRITE;
/*!40000 ALTER TABLE `afstockcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `afstockcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ap`
--

LOCK TABLES `ap` WRITE;
/*!40000 ALTER TABLE `ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ap_detail`
--

LOCK TABLES `ap_detail` WRITE;
/*!40000 ALTER TABLE `ap_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ar`
--

LOCK TABLES `ar` WRITE;
/*!40000 ALTER TABLE `ar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ar_detail`
--

LOCK TABLES `ar_detail` WRITE;
/*!40000 ALTER TABLE `ar_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assessmentnotice`
--

LOCK TABLES `assessmentnotice` WRITE;
/*!40000 ALTER TABLE `assessmentnotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessmentnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assessmentnoticeitem`
--

LOCK TABLES `assessmentnoticeitem` WRITE;
/*!40000 ALTER TABLE `assessmentnoticeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessmentnoticeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankaccount`
--

LOCK TABLES `bankaccount` WRITE;
/*!40000 ALTER TABLE `bankaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankaccount_account`
--

LOCK TABLES `bankaccount_account` WRITE;
/*!40000 ALTER TABLE `bankaccount_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccount_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankaccount_entry`
--

LOCK TABLES `bankaccount_entry` WRITE;
/*!40000 ALTER TABLE `bankaccount_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccount_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankdeposit`
--

LOCK TABLES `bankdeposit` WRITE;
/*!40000 ALTER TABLE `bankdeposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankdeposit_entry`
--

LOCK TABLES `bankdeposit_entry` WRITE;
/*!40000 ALTER TABLE `bankdeposit_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdeposit_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankdeposit_entry_check`
--

LOCK TABLES `bankdeposit_entry_check` WRITE;
/*!40000 ALTER TABLE `bankdeposit_entry_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdeposit_entry_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bankdeposit_liquidation`
--

LOCK TABLES `bankdeposit_liquidation` WRITE;
/*!40000 ALTER TABLE `bankdeposit_liquidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdeposit_liquidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `barangay`
--

LOCK TABLES `barangay` WRITE;
/*!40000 ALTER TABLE `barangay` DISABLE KEYS */;
/*!40000 ALTER TABLE `barangay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `batchcapture_collection`
--

LOCK TABLES `batchcapture_collection` WRITE;
/*!40000 ALTER TABLE `batchcapture_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchcapture_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `batchcapture_collection_entry`
--

LOCK TABLES `batchcapture_collection_entry` WRITE;
/*!40000 ALTER TABLE `batchcapture_collection_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchcapture_collection_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `batchcapture_collection_entry_item`
--

LOCK TABLES `batchcapture_collection_entry_item` WRITE;
/*!40000 ALTER TABLE `batchcapture_collection_entry_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchcapture_collection_entry_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `batchgrerror`
--

LOCK TABLES `batchgrerror` WRITE;
/*!40000 ALTER TABLE `batchgrerror` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchgrerror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgadditionalitem`
--

LOCK TABLES `bldgadditionalitem` WRITE;
/*!40000 ALTER TABLE `bldgadditionalitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgadditionalitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgassesslevel`
--

LOCK TABLES `bldgassesslevel` WRITE;
/*!40000 ALTER TABLE `bldgassesslevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgassesslevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgassesslevelrange`
--

LOCK TABLES `bldgassesslevelrange` WRITE;
/*!40000 ALTER TABLE `bldgassesslevelrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgassesslevelrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgfloor`
--

LOCK TABLES `bldgfloor` WRITE;
/*!40000 ALTER TABLE `bldgfloor` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgfloor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgflooradditional`
--

LOCK TABLES `bldgflooradditional` WRITE;
/*!40000 ALTER TABLE `bldgflooradditional` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgflooradditional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgflooradditionalparam`
--

LOCK TABLES `bldgflooradditionalparam` WRITE;
/*!40000 ALTER TABLE `bldgflooradditionalparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgflooradditionalparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgkind`
--

LOCK TABLES `bldgkind` WRITE;
/*!40000 ALTER TABLE `bldgkind` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgkind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgkindbucc`
--

LOCK TABLES `bldgkindbucc` WRITE;
/*!40000 ALTER TABLE `bldgkindbucc` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgkindbucc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgrpu`
--

LOCK TABLES `bldgrpu` WRITE;
/*!40000 ALTER TABLE `bldgrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgrysetting`
--

LOCK TABLES `bldgrysetting` WRITE;
/*!40000 ALTER TABLE `bldgrysetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgrysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgstructure`
--

LOCK TABLES `bldgstructure` WRITE;
/*!40000 ALTER TABLE `bldgstructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgstructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgtype`
--

LOCK TABLES `bldgtype` WRITE;
/*!40000 ALTER TABLE `bldgtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgtype_depreciation`
--

LOCK TABLES `bldgtype_depreciation` WRITE;
/*!40000 ALTER TABLE `bldgtype_depreciation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgtype_depreciation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldgtype_storeyadjustment`
--

LOCK TABLES `bldgtype_storeyadjustment` WRITE;
/*!40000 ALTER TABLE `bldgtype_storeyadjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldgtype_storeyadjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bldguse`
--

LOCK TABLES `bldguse` WRITE;
/*!40000 ALTER TABLE `bldguse` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldguse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bpapplication`
--

LOCK TABLES `bpapplication` WRITE;
/*!40000 ALTER TABLE `bpapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bpapplication_requirement`
--

LOCK TABLES `bpapplication_requirement` WRITE;
/*!40000 ALTER TABLE `bpapplication_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpapplication_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bpapplication_task`
--

LOCK TABLES `bpapplication_task` WRITE;
/*!40000 ALTER TABLE `bpapplication_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpapplication_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bpexpirydate`
--

LOCK TABLES `bpexpirydate` WRITE;
/*!40000 ALTER TABLE `bpexpirydate` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpexpirydate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bppayment`
--

LOCK TABLES `bppayment` WRITE;
/*!40000 ALTER TABLE `bppayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bppayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bppayment_item`
--

LOCK TABLES `bppayment_item` WRITE;
/*!40000 ALTER TABLE `bppayment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `bppayment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bpreceivable`
--

LOCK TABLES `bpreceivable` WRITE;
/*!40000 ALTER TABLE `bpreceivable` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpreceivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brgy_taxaccount_mapping`
--

LOCK TABLES `brgy_taxaccount_mapping` WRITE;
/*!40000 ALTER TABLE `brgy_taxaccount_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgy_taxaccount_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brgyshare`
--

LOCK TABLES `brgyshare` WRITE;
/*!40000 ALTER TABLE `brgyshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgyshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brgyshare_account_mapping`
--

LOCK TABLES `brgyshare_account_mapping` WRITE;
/*!40000 ALTER TABLE `brgyshare_account_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgyshare_account_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brgyshareitem`
--

LOCK TABLES `brgyshareitem` WRITE;
/*!40000 ALTER TABLE `brgyshareitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgyshareitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_assessment_info`
--

LOCK TABLES `business_assessment_info` WRITE;
/*!40000 ALTER TABLE `business_assessment_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_assessment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_changeinfo`
--

LOCK TABLES `business_changeinfo` WRITE;
/*!40000 ALTER TABLE `business_changeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_changeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_cityengineer`
--

LOCK TABLES `business_cityengineer` WRITE;
/*!40000 ALTER TABLE `business_cityengineer` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_cityengineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_cityengineer_fee`
--

LOCK TABLES `business_cityengineer_fee` WRITE;
/*!40000 ALTER TABLE `business_cityengineer_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_cityengineer_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_info`
--

LOCK TABLES `business_info` WRITE;
/*!40000 ALTER TABLE `business_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_lob`
--

LOCK TABLES `business_lob` WRITE;
/*!40000 ALTER TABLE `business_lob` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_lob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_redflag`
--

LOCK TABLES `business_redflag` WRITE;
/*!40000 ALTER TABLE `business_redflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_redflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_sms`
--

LOCK TABLES `business_sms` WRITE;
/*!40000 ALTER TABLE `business_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_taxcredit`
--

LOCK TABLES `business_taxcredit` WRITE;
/*!40000 ALTER TABLE `business_taxcredit` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_taxcredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `business_taxcredit_detail`
--

LOCK TABLES `business_taxcredit_detail` WRITE;
/*!40000 ALTER TABLE `business_taxcredit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_taxcredit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `businesspermit`
--

LOCK TABLES `businesspermit` WRITE;
/*!40000 ALTER TABLE `businesspermit` DISABLE KEYS */;
/*!40000 ALTER TABLE `businesspermit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `businessrequirement`
--

LOCK TABLES `businessrequirement` WRITE;
/*!40000 ALTER TABLE `businessrequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `businessrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `businessvariable`
--

LOCK TABLES `businessvariable` WRITE;
/*!40000 ALTER TABLE `businessvariable` DISABLE KEYS */;
INSERT INTO `businessvariable` VALUES ('AREA_SQM','DRAFT','AREA_SQM','decimal','BUSINESS AREA IN SQ METERS',NULL,'[]',1,0,'BUSINESS AREA',NULL),('CAPITAL','DRAFT','CAPITAL','decimal','CAPITAL',NULL,'[]',1,0,NULL,NULL),('GROSS','DRAFT','GROSS','decimal','GROSS',NULL,'[]',1,0,NULL,NULL),('HAS_TAX_INCENTIVE','DRAFT','HAS_TAX_INCENTIVE','boolean','HAS TAX INCENTIVE?',NULL,'[]',1,0,'GENERAL',NULL),('NUM_EMPLOYEE','DRAFT','NUM_EMPLOYEE','integer','NO. OF EMPLOYEES',NULL,'[]',1,0,'EMPLOYEE INFO',NULL),('NUM_EMPLOYEE_FEMALE','DRAFT','NUM_EMPLOYEE_FEMALE','integer','NO. OF FEMALE EMPLOYEES',NULL,'[]',1,0,'EMPLOYEE INFO',NULL),('NUM_EMPLOYEE_MALE','DRAFT','NUM_EMPLOYEE_MALE','integer','NO. OF MALE EMPLOYEES',NULL,'[]',1,0,'EMPLOYEE INFO',NULL),('NUM_EMPLOYEE_RESIDENT','DRAFT','NUM_EMPLOYEE_RESIDENT','integer','NO. OF RESIDENT EMPLOYEES',NULL,'[]',1,0,'EMPLOYEE RESIDING IN LGU',NULL),('OFFICE_TYPE','DRAFT','OFFICE_TYPE','string_array','OFFICE TYPE',NULL,'[\"MAIN\",\"BRANCH\"]',1,0,'GENERAL',NULL);
/*!40000 ALTER TABLE `businessvariable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cancelannotation`
--

LOCK TABLES `cancelannotation` WRITE;
/*!40000 ALTER TABLE `cancelannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancelannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cancelledfaas`
--

LOCK TABLES `cancelledfaas` WRITE;
/*!40000 ALTER TABLE `cancelledfaas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancelledfaas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `canceltdreason`
--

LOCK TABLES `canceltdreason` WRITE;
/*!40000 ALTER TABLE `canceltdreason` DISABLE KEYS */;
/*!40000 ALTER TABLE `canceltdreason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashbook`
--

LOCK TABLES `cashbook` WRITE;
/*!40000 ALTER TABLE `cashbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashbook_entry`
--

LOCK TABLES `cashbook_entry` WRITE;
/*!40000 ALTER TABLE `cashbook_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbook_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt`
--

LOCK TABLES `cashreceipt` WRITE;
/*!40000 ALTER TABLE `cashreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_burial`
--

LOCK TABLES `cashreceipt_burial` WRITE;
/*!40000 ALTER TABLE `cashreceipt_burial` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_burial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_business`
--

LOCK TABLES `cashreceipt_business` WRITE;
/*!40000 ALTER TABLE `cashreceipt_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_business_item`
--

LOCK TABLES `cashreceipt_business_item` WRITE;
/*!40000 ALTER TABLE `cashreceipt_business_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_business_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_cancelseries`
--

LOCK TABLES `cashreceipt_cancelseries` WRITE;
/*!40000 ALTER TABLE `cashreceipt_cancelseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_cancelseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_cashticket`
--

LOCK TABLES `cashreceipt_cashticket` WRITE;
/*!40000 ALTER TABLE `cashreceipt_cashticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_cashticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_ctc_corporate`
--

LOCK TABLES `cashreceipt_ctc_corporate` WRITE;
/*!40000 ALTER TABLE `cashreceipt_ctc_corporate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_ctc_corporate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_ctc_individual`
--

LOCK TABLES `cashreceipt_ctc_individual` WRITE;
/*!40000 ALTER TABLE `cashreceipt_ctc_individual` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_ctc_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_largecattleownership`
--

LOCK TABLES `cashreceipt_largecattleownership` WRITE;
/*!40000 ALTER TABLE `cashreceipt_largecattleownership` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_largecattleownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_marriage`
--

LOCK TABLES `cashreceipt_marriage` WRITE;
/*!40000 ALTER TABLE `cashreceipt_marriage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_marriage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_rpt`
--

LOCK TABLES `cashreceipt_rpt` WRITE;
/*!40000 ALTER TABLE `cashreceipt_rpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_rpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_slaughter`
--

LOCK TABLES `cashreceipt_slaughter` WRITE;
/*!40000 ALTER TABLE `cashreceipt_slaughter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_slaughter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipt_void`
--

LOCK TABLES `cashreceipt_void` WRITE;
/*!40000 ALTER TABLE `cashreceipt_void` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_void` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptitem`
--

LOCK TABLES `cashreceiptitem` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptitem_discount`
--

LOCK TABLES `cashreceiptitem_discount` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptitem_rpt`
--

LOCK TABLES `cashreceiptitem_rpt` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_rpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_rpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptitem_rpt_account`
--

LOCK TABLES `cashreceiptitem_rpt_account` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptitem_rpt_noledger`
--

LOCK TABLES `cashreceiptitem_rpt_noledger` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_noledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_noledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptitem_rpt_online`
--

LOCK TABLES `cashreceiptitem_rpt_online` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceiptpayment_check`
--

LOCK TABLES `cashreceiptpayment_check` WRITE;
/*!40000 ALTER TABLE `cashreceiptpayment_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptpayment_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashreceipts`
--

LOCK TABLES `cashreceipts` WRITE;
/*!40000 ALTER TABLE `cashreceipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashticket`
--

LOCK TABLES `cashticket` WRITE;
/*!40000 ALTER TABLE `cashticket` DISABLE KEYS */;
INSERT INTO `cashticket` VALUES ('CT1','1.00'),('CT10','10.00'),('CT2','2.00'),('CT5','5.00');
/*!40000 ALTER TABLE `cashticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashticket_control`
--

LOCK TABLES `cashticket_control` WRITE;
/*!40000 ALTER TABLE `cashticket_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashticket_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashticket_inventory`
--

LOCK TABLES `cashticket_inventory` WRITE;
/*!40000 ALTER TABLE `cashticket_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashticket_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cashticket_inventory_detail`
--

LOCK TABLES `cashticket_inventory_detail` WRITE;
/*!40000 ALTER TABLE `cashticket_inventory_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashticket_inventory_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `certification`
--

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collectionform`
--

LOCK TABLES `collectionform` WRITE;
/*!40000 ALTER TABLE `collectionform` DISABLE KEYS */;
INSERT INTO `collectionform` VALUES ('0016','COMMUNITY TAX CERTIFICATE (INDIVIDUAL)','serial'),('51','ACCOUNTABLE FORM #51','serial'),('52','LARGE CATTLE TRANSFER','serial'),('53','LARGE CATTLE OWNERSHIP','serial'),('54','MARRIAGE LICENSE FEE','serial'),('56','REAL PROPERTY TAX RECEIPT','serial'),('57','SLAUGHTER PERMIT','serial'),('58','BURIAL PERMIT FEE','serial'),('907','COMMUNITY TAX(CORPORATE)','serial'),('CT1','CASH TICKETS P1.00','cashticket'),('CT10','CASH TICKET P10.00','cashticket'),('CT2','CASH TICKETS P2.00','cashticket'),('CT5','CASH TICKETS P 5.00','cashticket');
/*!40000 ALTER TABLE `collectionform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collectiongroup`
--

LOCK TABLES `collectiongroup` WRITE;
/*!40000 ALTER TABLE `collectiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collectiongroup_revenueitem`
--

LOCK TABLES `collectiongroup_revenueitem` WRITE;
/*!40000 ALTER TABLE `collectiongroup_revenueitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiongroup_revenueitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collectiontype`
--

LOCK TABLES `collectiontype` WRITE;
/*!40000 ALTER TABLE `collectiontype` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consolidatedland`
--

LOCK TABLES `consolidatedland` WRITE;
/*!40000 ALTER TABLE `consolidatedland` DISABLE KEYS */;
/*!40000 ALTER TABLE `consolidatedland` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consolidation`
--

LOCK TABLES `consolidation` WRITE;
/*!40000 ALTER TABLE `consolidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `consolidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consolidationaffectedrpu`
--

LOCK TABLES `consolidationaffectedrpu` WRITE;
/*!40000 ALTER TABLE `consolidationaffectedrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `consolidationaffectedrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `directcash_collection`
--

LOCK TABLES `directcash_collection` WRITE;
/*!40000 ALTER TABLE `directcash_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `directcash_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `directcash_collection_item`
--

LOCK TABLES `directcash_collection_item` WRITE;
/*!40000 ALTER TABLE `directcash_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `directcash_collection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `discounttype`
--

LOCK TABLES `discounttype` WRITE;
/*!40000 ALTER TABLE `discounttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entity_address`
--

LOCK TABLES `entity_address` WRITE;
/*!40000 ALTER TABLE `entity_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entityid`
--

LOCK TABLES `entityid` WRITE;
/*!40000 ALTER TABLE `entityid` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entityindividual`
--

LOCK TABLES `entityindividual` WRITE;
/*!40000 ALTER TABLE `entityindividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityindividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entityjuridical`
--

LOCK TABLES `entityjuridical` WRITE;
/*!40000 ALTER TABLE `entityjuridical` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityjuridical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entitymember`
--

LOCK TABLES `entitymember` WRITE;
/*!40000 ALTER TABLE `entitymember` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitymember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entitymultiple`
--

LOCK TABLES `entitymultiple` WRITE;
/*!40000 ALTER TABLE `entitymultiple` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitymultiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `examiner_finding`
--

LOCK TABLES `examiner_finding` WRITE;
/*!40000 ALTER TABLE `examiner_finding` DISABLE KEYS */;
/*!40000 ALTER TABLE `examiner_finding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exemptiontype`
--

LOCK TABLES `exemptiontype` WRITE;
/*!40000 ALTER TABLE `exemptiontype` DISABLE KEYS */;
INSERT INTO `exemptiontype` VALUES ('CH','APPROVED','CH','CHARITABLE',3),('ED','APPROVED','ED','EDUCATIONAL',4),('GO','APPROVED','GO','GOVERNMENT',1),('OT','APPROVED','OT','OTHERS',100),('RE','APPROVED','RE','RELIGIOUS',2);
/*!40000 ALTER TABLE `exemptiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faas`
--

LOCK TABLES `faas` WRITE;
/*!40000 ALTER TABLE `faas` DISABLE KEYS */;
/*!40000 ALTER TABLE `faas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faas_txntype`
--

LOCK TABLES `faas_txntype` WRITE;
/*!40000 ALTER TABLE `faas_txntype` DISABLE KEYS */;
INSERT INTO `faas_txntype` VALUES ('CC','Change Classification',0,1,0,NULL),('CD','Change Depreciation',0,1,0,NULL),('CE','Correction of Entry',0,1,1,NULL),('CS','Consolidation',1,1,1,NULL),('CT','Change Taxability',0,1,0,NULL),('CTD','Cancellation',0,0,0,NULL),('DC','Data Capture',1,1,1,NULL),('GR','General Revision',0,1,1,NULL),('MC','Multiple Claim',1,1,1,NULL),('MCS','Multiple Claim Settlement',0,1,1,NULL),('ND','New Discovery',1,1,1,NULL),('RE','Reassessment',0,1,0,NULL),('RS','Resection',0,1,1,NULL),('RV','Revision',0,1,1,NULL),('SD','Subdivision',1,1,1,NULL),('TR','Transfer of Ownership',0,0,0,NULL),('TRC','Transfer with Correction',0,1,1,NULL),('TRE','Transfer with Reassessment',0,1,0,NULL);
/*!40000 ALTER TABLE `faas_txntype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faasannotation`
--

LOCK TABLES `faasannotation` WRITE;
/*!40000 ALTER TABLE `faasannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `faasannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faasannotationtype`
--

LOCK TABLES `faasannotationtype` WRITE;
/*!40000 ALTER TABLE `faasannotationtype` DISABLE KEYS */;
INSERT INTO `faasannotationtype` VALUES ('CCJ','CIVIL CASE JUDGEMENT'),('MOA','MEMORANDUM OF AGREEMENT'),('MT','MORTGAGE'),('NAC','NOTICE OF ADVERSE CLAIM'),('NB','NOTICE OF BOND'),('NOA','NOTICE OF ATTACHMENT'),('NOAL','NOTICE OF ATTACHMENT/LEVY UPON REALTY'),('NOL','NOTICE OF LEVY'),('NOLES','NOTICE OF LIS PENDENS'),('NOS','NOTICE OF SHERIFF\'S'),('OFC','ORDER FROM THE COURT'),('SLVY','SHERIFF\'S NOTICE OF LEVY UPON REAL PROPERTY'),('SR','SHERIFF\'S CERTIFICATE OF SALE'),('UL','UNDER LITIGATION'),('WL','WARRANT OF LEVY');
/*!40000 ALTER TABLE `faasannotationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faasbacktax`
--

LOCK TABLES `faasbacktax` WRITE;
/*!40000 ALTER TABLE `faasbacktax` DISABLE KEYS */;
/*!40000 ALTER TABLE `faasbacktax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faasupdate`
--

LOCK TABLES `faasupdate` WRITE;
/*!40000 ALTER TABLE `faasupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `faasupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
INSERT INTO `fund` VALUES ('GENERAL','','APPROVED','01','GENERAL','',1,1),('SEF','','APPROVED','02','SEF','',1,1),('TRUST','','APPROVED','03','TRUST','',1,1);
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landadjustment`
--

LOCK TABLES `landadjustment` WRITE;
/*!40000 ALTER TABLE `landadjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `landadjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landadjustmentparameter`
--

LOCK TABLES `landadjustmentparameter` WRITE;
/*!40000 ALTER TABLE `landadjustmentparameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `landadjustmentparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landadjustmenttype`
--

LOCK TABLES `landadjustmenttype` WRITE;
/*!40000 ALTER TABLE `landadjustmenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `landadjustmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landadjustmenttype_classification`
--

LOCK TABLES `landadjustmenttype_classification` WRITE;
/*!40000 ALTER TABLE `landadjustmenttype_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `landadjustmenttype_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landassesslevel`
--

LOCK TABLES `landassesslevel` WRITE;
/*!40000 ALTER TABLE `landassesslevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `landassesslevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landassesslevelrange`
--

LOCK TABLES `landassesslevelrange` WRITE;
/*!40000 ALTER TABLE `landassesslevelrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `landassesslevelrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landdetail`
--

LOCK TABLES `landdetail` WRITE;
/*!40000 ALTER TABLE `landdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `landdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landrpu`
--

LOCK TABLES `landrpu` WRITE;
/*!40000 ALTER TABLE `landrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `landrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `landrysetting`
--

LOCK TABLES `landrysetting` WRITE;
/*!40000 ALTER TABLE `landrysetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `landrysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lcuvspecificclass`
--

LOCK TABLES `lcuvspecificclass` WRITE;
/*!40000 ALTER TABLE `lcuvspecificclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcuvspecificclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lcuvstripping`
--

LOCK TABLES `lcuvstripping` WRITE;
/*!40000 ALTER TABLE `lcuvstripping` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcuvstripping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lcuvsubclass`
--

LOCK TABLES `lcuvsubclass` WRITE;
/*!40000 ALTER TABLE `lcuvsubclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcuvsubclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lessor_building`
--

LOCK TABLES `lessor_building` WRITE;
/*!40000 ALTER TABLE `lessor_building` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessor_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liquidation`
--

LOCK TABLES `liquidation` WRITE;
/*!40000 ALTER TABLE `liquidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liquidation_cashier_fund`
--

LOCK TABLES `liquidation_cashier_fund` WRITE;
/*!40000 ALTER TABLE `liquidation_cashier_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidation_cashier_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liquidation_checkpayment`
--

LOCK TABLES `liquidation_checkpayment` WRITE;
/*!40000 ALTER TABLE `liquidation_checkpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidation_checkpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liquidation_remittance`
--

LOCK TABLES `liquidation_remittance` WRITE;
/*!40000 ALTER TABLE `liquidation_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidation_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lob`
--

LOCK TABLES `lob` WRITE;
/*!40000 ALTER TABLE `lob` DISABLE KEYS */;
/*!40000 ALTER TABLE `lob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lob_lobattribute`
--

LOCK TABLES `lob_lobattribute` WRITE;
/*!40000 ALTER TABLE `lob_lobattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `lob_lobattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lobattribute`
--

LOCK TABLES `lobattribute` WRITE;
/*!40000 ALTER TABLE `lobattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `lobattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lobclassification`
--

LOCK TABLES `lobclassification` WRITE;
/*!40000 ALTER TABLE `lobclassification` DISABLE KEYS */;
INSERT INTO `lobclassification` VALUES ('RETAILER','DRAFT','RETAILER',NULL),('AMUSEMENT','DRAFT','AMUSEMENT',NULL),('CONTRACTOR','DRAFT','CONTRACTOR',NULL),('FINANCIAL','DRAFT','FINANCIAL',NULL),('FRANCHISE','DRAFT','FRANCHISE',NULL),('MANUFACTURER','DRAFT','MANUFACTURER',NULL),('MINING','DRAFT','MINING',NULL),('OTHER','DRAFT','OTHER',NULL),('RESTAURANT','DRAFT','RESTAURANT',NULL),('WHOLESALER','DRAFT','WHOLESALER',NULL);
/*!40000 ALTER TABLE `lobclassification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machassesslevel`
--

LOCK TABLES `machassesslevel` WRITE;
/*!40000 ALTER TABLE `machassesslevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `machassesslevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machassesslevelrange`
--

LOCK TABLES `machassesslevelrange` WRITE;
/*!40000 ALTER TABLE `machassesslevelrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `machassesslevelrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machdetail`
--

LOCK TABLES `machdetail` WRITE;
/*!40000 ALTER TABLE `machdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `machdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machforex`
--

LOCK TABLES `machforex` WRITE;
/*!40000 ALTER TABLE `machforex` DISABLE KEYS */;
/*!40000 ALTER TABLE `machforex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machrpu`
--

LOCK TABLES `machrpu` WRITE;
/*!40000 ALTER TABLE `machrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `machrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machrysetting`
--

LOCK TABLES `machrysetting` WRITE;
/*!40000 ALTER TABLE `machrysetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `machrysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `machuse`
--

LOCK TABLES `machuse` WRITE;
/*!40000 ALTER TABLE `machuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `machuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mcsettlement`
--

LOCK TABLES `mcsettlement` WRITE;
/*!40000 ALTER TABLE `mcsettlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcsettlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mcsettlement_affectedrpu`
--

LOCK TABLES `mcsettlement_affectedrpu` WRITE;
/*!40000 ALTER TABLE `mcsettlement_affectedrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcsettlement_affectedrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mcsettlement_otherclaim`
--

LOCK TABLES `mcsettlement_otherclaim` WRITE;
/*!40000 ALTER TABLE `mcsettlement_otherclaim` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcsettlement_otherclaim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscassesslevel`
--

LOCK TABLES `miscassesslevel` WRITE;
/*!40000 ALTER TABLE `miscassesslevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscassesslevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscassesslevelrange`
--

LOCK TABLES `miscassesslevelrange` WRITE;
/*!40000 ALTER TABLE `miscassesslevelrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscassesslevelrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscitem`
--

LOCK TABLES `miscitem` WRITE;
/*!40000 ALTER TABLE `miscitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscitemvalue`
--

LOCK TABLES `miscitemvalue` WRITE;
/*!40000 ALTER TABLE `miscitemvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscitemvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscrpu`
--

LOCK TABLES `miscrpu` WRITE;
/*!40000 ALTER TABLE `miscrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscrpuitem`
--

LOCK TABLES `miscrpuitem` WRITE;
/*!40000 ALTER TABLE `miscrpuitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscrpuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscrpuitem_rptparameter`
--

LOCK TABLES `miscrpuitem_rptparameter` WRITE;
/*!40000 ALTER TABLE `miscrpuitem_rptparameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscrpuitem_rptparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `miscrysetting`
--

LOCK TABLES `miscrysetting` WRITE;
/*!40000 ALTER TABLE `miscrysetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `miscrysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `municipality`
--

LOCK TABLES `municipality` WRITE;
/*!40000 ALTER TABLE `municipality` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ngas_revenue`
--

LOCK TABLES `ngas_revenue` WRITE;
/*!40000 ALTER TABLE `ngas_revenue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngas_revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ngas_revenue_deposit`
--

LOCK TABLES `ngas_revenue_deposit` WRITE;
/*!40000 ALTER TABLE `ngas_revenue_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngas_revenue_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ngas_revenue_remittance`
--

LOCK TABLES `ngas_revenue_remittance` WRITE;
/*!40000 ALTER TABLE `ngas_revenue_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngas_revenue_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ngas_revenueitem`
--

LOCK TABLES `ngas_revenueitem` WRITE;
/*!40000 ALTER TABLE `ngas_revenueitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngas_revenueitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paymentorder`
--

LOCK TABLES `paymentorder` WRITE;
/*!40000 ALTER TABLE `paymentorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planttree`
--

LOCK TABLES `planttree` WRITE;
/*!40000 ALTER TABLE `planttree` DISABLE KEYS */;
/*!40000 ALTER TABLE `planttree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planttreeassesslevel`
--

LOCK TABLES `planttreeassesslevel` WRITE;
/*!40000 ALTER TABLE `planttreeassesslevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `planttreeassesslevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planttreedetail`
--

LOCK TABLES `planttreedetail` WRITE;
/*!40000 ALTER TABLE `planttreedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `planttreedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planttreerpu`
--

LOCK TABLES `planttreerpu` WRITE;
/*!40000 ALTER TABLE `planttreerpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `planttreerpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planttreerysetting`
--

LOCK TABLES `planttreerysetting` WRITE;
/*!40000 ALTER TABLE `planttreerysetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `planttreerysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `planttreeunitvalue`
--

LOCK TABLES `planttreeunitvalue` WRITE;
/*!40000 ALTER TABLE `planttreeunitvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `planttreeunitvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `previousfaas`
--

LOCK TABLES `previousfaas` WRITE;
/*!40000 ALTER TABLE `previousfaas` DISABLE KEYS */;
/*!40000 ALTER TABLE `previousfaas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `propertyclassification`
--

LOCK TABLES `propertyclassification` WRITE;
/*!40000 ALTER TABLE `propertyclassification` DISABLE KEYS */;
INSERT INTO `propertyclassification` VALUES ('AGRICULTURAL','APPROVED','AGR','AGRICULTURAL',0,2),('CEMETERY','APPROVED','CEM','CEMETERY',1,23),('COMMERCIAL','APPROVED','COM','COMMERCIAL',0,3),('CULTURAL','APPROVED','CUL','CULTURAL',1,22),('EDUCATIONAL','APPROVED','EDU','EDUCATIONAL',1,26),('GOCC','APPROVED','GOC','GOCC',1,27),('HOSPITAL','APPROVED','HOS','HOSPITAL',1,20),('INDUSTRIAL','APPROVED','IND','INDUSTRIAL',0,4),('MINERAL','APPROVED','MIN','MINERAL',0,5),('MINERAL LAND','APPROVED','MIL','MINERAL LAND',0,6),('OTHERS','APPROVED','OTH','SPECIAL-OTHERS',1,100),('RECREATIONAL ','APPROVED','REC','RECREATIONAL ',1,24),('RELIGIOUS ','APPROVED','REL','RELIGIOUS ',1,25),('RESIDENTIAL','APPROVED','RES','RESIDENTIAL',0,1),('SCIENTIFIC','APPROVED','SCI','SCIENTIFIC',1,21),('SPECIAL CLASS','APPROVED','SPE','SPECIAL CLASS',0,8),('TIMBER','APPROVED','TIM','TIMBER',0,7);
/*!40000 ALTER TABLE `propertyclassification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `realproperty`
--

LOCK TABLES `realproperty` WRITE;
/*!40000 ALTER TABLE `realproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `realproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remittance`
--

LOCK TABLES `remittance` WRITE;
/*!40000 ALTER TABLE `remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remittance_afserial`
--

LOCK TABLES `remittance_afserial` WRITE;
/*!40000 ALTER TABLE `remittance_afserial` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_afserial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remittance_cashreceipt`
--

LOCK TABLES `remittance_cashreceipt` WRITE;
/*!40000 ALTER TABLE `remittance_cashreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_cashreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remittance_cashticket`
--

LOCK TABLES `remittance_cashticket` WRITE;
/*!40000 ALTER TABLE `remittance_cashticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_cashticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remittance_checkpayment`
--

LOCK TABLES `remittance_checkpayment` WRITE;
/*!40000 ALTER TABLE `remittance_checkpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_checkpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remittance_fund`
--

LOCK TABLES `remittance_fund` WRITE;
/*!40000 ALTER TABLE `remittance_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remoteserverdata`
--

LOCK TABLES `remoteserverdata` WRITE;
/*!40000 ALTER TABLE `remoteserverdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `remoteserverdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `report_rptdelinquency`
--

LOCK TABLES `report_rptdelinquency` WRITE;
/*!40000 ALTER TABLE `report_rptdelinquency` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_rptdelinquency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `resection`
--

LOCK TABLES `resection` WRITE;
/*!40000 ALTER TABLE `resection` DISABLE KEYS */;
/*!40000 ALTER TABLE `resection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `resectionaffectedrpu`
--

LOCK TABLES `resectionaffectedrpu` WRITE;
/*!40000 ALTER TABLE `resectionaffectedrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `resectionaffectedrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `resectionitem`
--

LOCK TABLES `resectionitem` WRITE;
/*!40000 ALTER TABLE `resectionitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `resectionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `revenueitem`
--

LOCK TABLES `revenueitem` WRITE;
/*!40000 ALTER TABLE `revenueitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenueitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `revenueitem_attribute`
--

LOCK TABLES `revenueitem_attribute` WRITE;
/*!40000 ALTER TABLE `revenueitem_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenueitem_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `revenueitem_attribute_type`
--

LOCK TABLES `revenueitem_attribute_type` WRITE;
/*!40000 ALTER TABLE `revenueitem_attribute_type` DISABLE KEYS */;
INSERT INTO `revenueitem_attribute_type` VALUES ('ngasstandard','NGAS Standard','accountdetail:lookup'),('srestandard','SRE Standard','sreaccount:lookup');
/*!40000 ALTER TABLE `revenueitem_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `revenueitem_collectiongroup`
--

LOCK TABLES `revenueitem_collectiongroup` WRITE;
/*!40000 ALTER TABLE `revenueitem_collectiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenueitem_collectiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpt_requirement`
--

LOCK TABLES `rpt_requirement` WRITE;
/*!40000 ALTER TABLE `rpt_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpt_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpt_requirement_type`
--

LOCK TABLES `rpt_requirement_type` WRITE;
/*!40000 ALTER TABLE `rpt_requirement_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpt_requirement_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpt_sales_data`
--

LOCK TABLES `rpt_sales_data` WRITE;
/*!40000 ALTER TABLE `rpt_sales_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpt_sales_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpt_sms`
--

LOCK TABLES `rpt_sms` WRITE;
/*!40000 ALTER TABLE `rpt_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpt_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpt_sms_registration`
--

LOCK TABLES `rpt_sms_registration` WRITE;
/*!40000 ALTER TABLE `rpt_sms_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpt_sms_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptbill`
--

LOCK TABLES `rptbill` WRITE;
/*!40000 ALTER TABLE `rptbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptbill_ledger`
--

LOCK TABLES `rptbill_ledger` WRITE;
/*!40000 ALTER TABLE `rptbill_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptbill_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptbill_ledger_account`
--

LOCK TABLES `rptbill_ledger_account` WRITE;
/*!40000 ALTER TABLE `rptbill_ledger_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptbill_ledger_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptbill_ledger_item`
--

LOCK TABLES `rptbill_ledger_item` WRITE;
/*!40000 ALTER TABLE `rptbill_ledger_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptbill_ledger_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptcertification`
--

LOCK TABLES `rptcertification` WRITE;
/*!40000 ALTER TABLE `rptcertification` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptcertification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptcertificationitem`
--

LOCK TABLES `rptcertificationitem` WRITE;
/*!40000 ALTER TABLE `rptcertificationitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptcertificationitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptexpiry`
--

LOCK TABLES `rptexpiry` WRITE;
/*!40000 ALTER TABLE `rptexpiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptexpiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptledger`
--

LOCK TABLES `rptledger` WRITE;
/*!40000 ALTER TABLE `rptledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptledgerbill`
--

LOCK TABLES `rptledgerbill` WRITE;
/*!40000 ALTER TABLE `rptledgerbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptledgerbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptledgerbillitem`
--

LOCK TABLES `rptledgerbillitem` WRITE;
/*!40000 ALTER TABLE `rptledgerbillitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptledgerbillitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptledgerfaas`
--

LOCK TABLES `rptledgerfaas` WRITE;
/*!40000 ALTER TABLE `rptledgerfaas` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptledgerfaas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptledgeritem`
--

LOCK TABLES `rptledgeritem` WRITE;
/*!40000 ALTER TABLE `rptledgeritem` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptledgeritem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptledgeritem_qtrly`
--

LOCK TABLES `rptledgeritem_qtrly` WRITE;
/*!40000 ALTER TABLE `rptledgeritem_qtrly` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptledgeritem_qtrly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptparameter`
--

LOCK TABLES `rptparameter` WRITE;
/*!40000 ALTER TABLE `rptparameter` DISABLE KEYS */;
INSERT INTO `rptparameter` VALUES ('AREA_SQM','APPROVED','AREA_SQM','AREA IN SQM','AREA IN SQUARE METER','decimal','0.00','0.00'),('NO_OF_SETS','APPROVED','NO_OF_SETS','NO. OF SETS',NULL,'integer','0.00','0.00');
/*!40000 ALTER TABLE `rptparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptreceipt_capture`
--

LOCK TABLES `rptreceipt_capture` WRITE;
/*!40000 ALTER TABLE `rptreceipt_capture` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptreceipt_capture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpttask`
--

LOCK TABLES `rpttask` WRITE;
/*!40000 ALTER TABLE `rpttask` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpttask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpttaxclearance`
--

LOCK TABLES `rpttaxclearance` WRITE;
/*!40000 ALTER TABLE `rpttaxclearance` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpttaxclearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpttaxincentive`
--

LOCK TABLES `rpttaxincentive` WRITE;
/*!40000 ALTER TABLE `rpttaxincentive` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpttaxincentive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpttaxincentive_item`
--

LOCK TABLES `rpttaxincentive_item` WRITE;
/*!40000 ALTER TABLE `rpttaxincentive_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpttaxincentive_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpttracking`
--

LOCK TABLES `rpttracking` WRITE;
/*!40000 ALTER TABLE `rpttracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpttracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptvariable`
--

LOCK TABLES `rptvariable` WRITE;
/*!40000 ALTER TABLE `rptvariable` DISABLE KEYS */;
/*!40000 ALTER TABLE `rptvariable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptworkflow`
--

LOCK TABLES `rptworkflow` WRITE;
/*!40000 ALTER TABLE `rptworkflow` DISABLE KEYS */;
INSERT INTO `rptworkflow` VALUES ('ALL','FAAS WORKFLOW','TR,TRE,TRC,CE,CC,CT,CD,RE,GR,ND,MC,RV'),('CS','CS WORKFLOW','CS'),('SD','SD WORKFLOW','SD');
/*!40000 ALTER TABLE `rptworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rptworkflow_state`
--

LOCK TABLES `rptworkflow_state` WRITE;
/*!40000 ALTER TABLE `rptworkflow_state` DISABLE KEYS */;
INSERT INTO `rptworkflow_state` VALUES ('ALL-W01','ALL',NULL,'receive','start',1,'receiver','#{docname} documents are received and verified.'),('ALL-W02','ALL','receive','assign-examiner','process',1,'examiner','#{docname} is already forwarded for examination.'),('ALL-W03','ALL','assign-examiner','forexamination','process',1,'examiner','#{docname} is currently examined by the group of #{name}.'),('ALL-W04','ALL','forexamination','assign-taxmapper','process',1,'taxmapper','#{docname} is already submitted for taxmapping.'),('ALL-W05','ALL','assign-taxmapper','fortaxmapping','process',1,'taxmapper','#{docname} is currently taxmapped by #{name}.'),('ALL-W06','ALL','fortaxmapping','assign-taxmapping-approval','process',1,'taxmapping_chief','#{docname} is submitted for taxmapping approval.'),('ALL-W07','ALL','assign-taxmapping-approval','fortaxmapping-approval','process',1,'taxmapping_chief','#{docname} taxmapping is currently verified by #{name}.'),('ALL-W08','ALL','fortaxmapping-approval','assign-appraiser','process',1,'appraiser','#{docname} is already submitted for appraisal.'),('ALL-W09','ALL','assign-appraiser','forappraisal','process',1,'appraiser','#{docname} is currenty appraised by #{name}.'),('ALL-W10','ALL','forappraisal','assign-appraisal-chief','process',1,'appraisal_chief','#{docname} appraisal is already submitted for approval.'),('ALL-W11','ALL','assign-appraisal-chief','forappraisal-approval','process',1,'appraisal_chief','#{docname} appraisal is currently verified by #{name}.'),('ALL-W12','ALL','forappraisal-approval','assign-assistant-approval','process',1,'assistant_assessor','#{docname} is already submitted to assistant assessor for approval.'),('ALL-W13','ALL','assign-assistant-approval','forassistant-approval','process',1,'assistant_assessor','#{docname} is currently reviewed by assistant assessor #{name}.'),('ALL-W14','ALL','forassistant-approval','assign-approver','process',1,'approver','#{docname} is already submitted to assistant assessor for approval.'),('ALL-W15','ALL','assign-approver','forapproval','process',1,'approver','#{docname} is currently approved by #{name}.'),('ALL-W16','ALL','forapproval','approved','end',1,'approver','#{docname} is already approved and current.'),('CS-W01','CS',NULL,'receive','start',1,'receiver','#{docname} documents are received and undergoing verification.'),('CS-W02','CS','receive','assign-examiner','process',1,'examiner','#{docname} is already forwarded for examination.'),('CS-W03','CS','assign-examiner','forexamination','process',1,'examiner','#{docname} is currently examined by the group of #{name}.'),('CS-W04','CS','forexamination','assign-taxmapper','process',1,'taxmapper','#{docname} is already submitted for taxmapping.'),('CS-W05','CS','assign-taxmapper','fortaxmapping','process',1,'taxmapper','#{docname} is currently taxmapped by #{name}.'),('CS-W06','CS','fortaxmapping','assign-taxmapping-approval','process',1,'taxmapping_chief','#{docname} is submitted for taxmapping approval.'),('CS-W07','CS','assign-taxmapping-approval','fortaxmapping-approval','process',1,'taxmapping_chief','#{docname} taxmapping approval is currently verified by #{name}.'),('CS-W08','CS','fortaxmapping-approval','assign-appraiser','process',1,'appraiser','#{docname} is already submitted for appraisal.'),('CS-W09','CS','assign-appraiser','forappraisal','process',1,'appraiser','#{docname} is currenty appraised by #{name}.'),('CS-W10','CS','forappraisal','assign-appraisal-chief','process',1,'appraisal_chief','#{docname} appraisal is already submitted for approval.'),('CS-W11','CS','assign-appraisal-chief','forappraisal-approval','process',1,'appraisal_chief','#{docname} appraisal is currently verified by #{name}.'),('CS-W12','CS','forappraisal-approval','assign-assistant-approval','process',1,'assistant_assessor','#{docname} is already submitted to assistant assessor for approval.'),('CS-W13','CS','assign-assistant-approval','forassistant-approval','process',1,'assistant_assessor','#{docname} is currently reviewed by assistant assessor #{name}.'),('CS-W14','CS','forassistant-approval','assign-approver','process',1,'approver','#{docname} is already submitted to assistant assessor for approval.'),('CS-W15','CS','assign-approver','forapproval','process',1,'approver','#{docname} is currently approved by #{name}.'),('CS-W16','CS','forapproval','approved','end',1,'approver','#{docname} is already approved and current.'),('SD-W01','SD',NULL,'receive','start',1,'receiver','#{docname} documents are received and undergoing verification.'),('SD-W02','SD','receive','assign-examiner','process',1,'examiner','#{docname} is already forwarded for examination.'),('SD-W03','SD','assign-examiner','forexamination','process',1,'examiner','#{docname} is currently examined by the group of #{name}.'),('SD-W04','SD','forexamination','assign-taxmapper','process',1,'taxmapper','#{docname} is already submitted for taxmapping.'),('SD-W05','SD','assign-taxmapper','fortaxmapping','process',1,'taxmapper','#{docname} is currently taxmapped by #{name}.'),('SD-W06','SD','fortaxmapping','assign-taxmapping-approval','process',1,'taxmapping_chief','#{docname} is submitted for taxmapping approval.'),('SD-W07','SD','assign-taxmapping-approval','fortaxmapping-approval','process',1,'taxmapping_chief','#{docname} taxmapping approval is currently verified by #{name}.'),('SD-W08','SD','fortaxmapping-approval','assign-appraiser','process',1,'appraiser','#{docname} is already submitted for appraisal.'),('SD-W09','SD','assign-appraiser','forappraisal','process',1,'appraiser','#{docname} is currenty appraised by #{name}.'),('SD-W10','SD','forappraisal','assign-appraisal-chief','process',1,'appraisal_chief','#{docname} appraisal is already submitted for approval.'),('SD-W11','SD','assign-appraisal-chief','forappraisal-approval','process',1,'appraisal_chief','#{docname} appraisal is currently verified by #{name}.'),('SD-W12','SD','forappraisal-approval','assign-assistant-approval','process',1,'assistant_assessor','#{docname} is already submitted to assistant assessor for approval.'),('SD-W13','SD','assign-assistant-approval','forassistant-approval','process',1,'assistant_assessor','#{docname} is currently reviewed by assistant assessor #{name}.'),('SD-W14','SD','forassistant-approval','assign-approver','process',1,'approver','#{docname} is already submitted to assistant assessor for approval.'),('SD-W15','SD','assign-approver','forapproval','process',1,'approver','#{docname} is currently approved by #{name}.'),('SD-W16','SD','forapproval','approved','end',1,'approver','#{docname} is already approved and current.');
/*!40000 ALTER TABLE `rptworkflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpu`
--

LOCK TABLES `rpu` WRITE;
/*!40000 ALTER TABLE `rpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rpumaster`
--

LOCK TABLES `rpumaster` WRITE;
/*!40000 ALTER TABLE `rpumaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpumaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rysetting_lgu`
--

LOCK TABLES `rysetting_lgu` WRITE;
/*!40000 ALTER TABLE `rysetting_lgu` DISABLE KEYS */;
/*!40000 ALTER TABLE `rysetting_lgu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rysettinginfo`
--

LOCK TABLES `rysettinginfo` WRITE;
/*!40000 ALTER TABLE `rysettinginfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rysettinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `signatory`
--

LOCK TABLES `signatory` WRITE;
/*!40000 ALTER TABLE `signatory` DISABLE KEYS */;
/*!40000 ALTER TABLE `signatory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sms_rpt_registration`
--

LOCK TABLES `sms_rpt_registration` WRITE;
/*!40000 ALTER TABLE `sms_rpt_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_rpt_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `specialaccountsetting`
--

LOCK TABLES `specialaccountsetting` WRITE;
/*!40000 ALTER TABLE `specialaccountsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialaccountsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sreaccount`
--

LOCK TABLES `sreaccount` WRITE;
/*!40000 ALTER TABLE `sreaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `sreaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sreaccount_incometarget`
--

LOCK TABLES `sreaccount_incometarget` WRITE;
/*!40000 ALTER TABLE `sreaccount_incometarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `sreaccount_incometarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockissue`
--

LOCK TABLES `stockissue` WRITE;
/*!40000 ALTER TABLE `stockissue` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockissue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockissueitem`
--

LOCK TABLES `stockissueitem` WRITE;
/*!40000 ALTER TABLE `stockissueitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockissueitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockitem`
--

LOCK TABLES `stockitem` WRITE;
/*!40000 ALTER TABLE `stockitem` DISABLE KEYS */;
INSERT INTO `stockitem` VALUES ('0016','APPROVED','0016','AFSERIAL','AF','COMMUNITY TAX CERTIFICATE (INDIVIDUAL)','COMMUNITY TAX CERTIFICATE (INDIVIDUAL)','EA','STUB'),('51','APPROVED','51','AFSERIAL','AF','ACCOUNTABLE FORM #51','ACCOUNTABLE FORM #51','EA','STUB'),('52','APPROVED','52','AFSERIAL','AF','LARGE CATTLE TRANSFER','LARGE CATTLE TRANSFER','EA','STUB'),('53','APPROVED','53','AFSERIAL','AF','LARGE CATTLE OWNERSHIP','LARGE CATTLE OWNERSHIP','EA','STUB'),('54','APPROVED','54','AFSERIAL','AF','MARRIAGE LICENSE FEE','MARRIAGE LICENSE FEE','EA','STUB'),('56','APPROVED','56','AFSERIAL','AF','REAL PROPERTY TAX RECEIPT','REAL PROPERTY TAX RECEIPT','EA','STUB'),('57','APPROVED','57','AFSERIAL','AF','SLAUGHTER PERMIT','SLAUGHTER PERMIT','EA','STUB'),('58','APPROVED','58','AFSERIAL','AF','BURIAL PERMIT FEE','BURIAL PERMIT FEE','EA','STUB'),('907','APPROVED','907','AFSERIAL','AF','COMMUNITY TAX(CORPORATE)','COMMUNITY TAX(CORPORATE)','EA','STUB'),('CT1','APPROVED','CT1','CASHTICKET','AF','CASH TICKETS P1.00','CASH TICKETS P1.00','EA','PAD'),('CT10','APPROVED','CT10','CASHTICKET','AF','CASH TICKET P10.00','CASH TICKET P10.00','EA','PAD'),('CT2','APPROVED','CT2','CASHTICKET','AF','CASH TICKETS P2.00','CASH TICKETS P2.00','EA','PAD'),('CT5','APPROVED','CT5','CASHTICKET','AF','CASH TICKETS P 5.00','CASH TICKETS P 5.00','EA','PAD');
/*!40000 ALTER TABLE `stockitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockitem_unit`
--

LOCK TABLES `stockitem_unit` WRITE;
/*!40000 ALTER TABLE `stockitem_unit` DISABLE KEYS */;
INSERT INTO `stockitem_unit` VALUES ('0016','STUB',50),('51','STUB',50),('52','STUB',50),('53','STUB',50),('54','STUB',50),('56','STUB',50),('57','STUB',50),('58','STUB',50),('907','STUB',50),('CT1','PAD',2000),('CT10','PAD',2000),('CT2','PAD',2000),('CT5','PAD',2000);
/*!40000 ALTER TABLE `stockitem_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockreceipt`
--

LOCK TABLES `stockreceipt` WRITE;
/*!40000 ALTER TABLE `stockreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockreceiptitem`
--

LOCK TABLES `stockreceiptitem` WRITE;
/*!40000 ALTER TABLE `stockreceiptitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockreceiptitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockrequest`
--

LOCK TABLES `stockrequest` WRITE;
/*!40000 ALTER TABLE `stockrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stockrequestitem`
--

LOCK TABLES `stockrequestitem` WRITE;
/*!40000 ALTER TABLE `stockrequestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockrequestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stocksale`
--

LOCK TABLES `stocksale` WRITE;
/*!40000 ALTER TABLE `stocksale` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocksale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stocksaleitem`
--

LOCK TABLES `stocksaleitem` WRITE;
/*!40000 ALTER TABLE `stocksaleitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocksaleitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `structure`
--

LOCK TABLES `structure` WRITE;
/*!40000 ALTER TABLE `structure` DISABLE KEYS */;
/*!40000 ALTER TABLE `structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `structurematerial`
--

LOCK TABLES `structurematerial` WRITE;
/*!40000 ALTER TABLE `structurematerial` DISABLE KEYS */;
/*!40000 ALTER TABLE `structurematerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subcollector_remittance`
--

LOCK TABLES `subcollector_remittance` WRITE;
/*!40000 ALTER TABLE `subcollector_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollector_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subcollector_remittance_cashreceipt`
--

LOCK TABLES `subcollector_remittance_cashreceipt` WRITE;
/*!40000 ALTER TABLE `subcollector_remittance_cashreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollector_remittance_cashreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subdividedland`
--

LOCK TABLES `subdividedland` WRITE;
/*!40000 ALTER TABLE `subdividedland` DISABLE KEYS */;
/*!40000 ALTER TABLE `subdividedland` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subdivision`
--

LOCK TABLES `subdivision` WRITE;
/*!40000 ALTER TABLE `subdivision` DISABLE KEYS */;
/*!40000 ALTER TABLE `subdivision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subdivisionaffectedrpu`
--

LOCK TABLES `subdivisionaffectedrpu` WRITE;
/*!40000 ALTER TABLE `subdivisionaffectedrpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `subdivisionaffectedrpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_dataset`
--

LOCK TABLES `sys_dataset` WRITE;
/*!40000 ALTER TABLE `sys_dataset` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_orgclass`
--

LOCK TABLES `sys_orgclass` WRITE;
/*!40000 ALTER TABLE `sys_orgclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_orgclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_quarter`
--

LOCK TABLES `sys_quarter` WRITE;
/*!40000 ALTER TABLE `sys_quarter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_quarter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_report`
--

LOCK TABLES `sys_report` WRITE;
/*!40000 ALTER TABLE `sys_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_report_admin`
--

LOCK TABLES `sys_report_admin` WRITE;
/*!40000 ALTER TABLE `sys_report_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_report_folder`
--

LOCK TABLES `sys_report_folder` WRITE;
/*!40000 ALTER TABLE `sys_report_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_report_member`
--

LOCK TABLES `sys_report_member` WRITE;
/*!40000 ALTER TABLE `sys_report_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_action_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef` VALUES ('RULADEF-2889615e:142fa67fc85:-7b7c','split_by_qtr','Schedule By Qtr',0,'split_by_qtr'),('RULADEF-2ead5abf:1419bd607e6:-7fd9','compute_business_tax','Compute Business Tax',2,'compute_businesstax'),('RULADEF-4a532d76:141ff563063:-7ef4','add_requirement','Add Requirement',0,'add_requirement'),('RULADEF-627533eb:141ed7a179f:-7d7d','compute_regfee','Compute Regulatory Fee',3,'compute_regfee'),('RULADEF-62a762db:14201d65080:-7576','print_test','Print Test. For debugging (developers) only.',100,'print_test'),('RULADEF-66879e9a:1422b236b58:-7d0f','calc_discount','Calculate Discount',2,'calc_discount'),('RULADEF-66879e9a:1422b236b58:-7d24','calc_interest','Calculate Interest',1,'calc_interest'),('RULADEF-67ecfd73:141f2b84ce7:-743c','bpassessment_sysvar','Add System Variable',8,'add_sysvar'),('RULADEF-67ecfd73:141f2b84ce7:-7b54','assert_business_info','Add Derived Business Info',1,'assert_business_info'),('RULADEF-738e3cc6:14459101d11:-6b0b','change_business_account','Change Business Account',10,'change_business_account'),('RULADEF17d6e7ce:141df4b60c2:-7e9e','calc-basic','Calculate Basic Tax',1,'calc-basic'),('RULADEF208348b4:141e2d2bd58:-7b83','calc-firecode','Calculate Fire Code',16,'calc-firecode'),('RULADEF208348b4:141e2d2bd58:-7bdb','calc-sefint-amnesty','Calculate SEF Interest Amnesty',15,'calc-sefint-amnesty'),('RULADEF208348b4:141e2d2bd58:-7c7b','calc-sef-amnesty','Calculate SEF Amnesty',14,'calc-sef-amnesty'),('RULADEF208348b4:141e2d2bd58:-7cba','calc-sefdisc','Calculate SEF Discount',12,'calc-sefdisc'),('RULADEF208348b4:141e2d2bd58:-7d1e','calc-sefint','Calculate SEF Interest',13,'calc-sefint'),('RULADEF208348b4:141e2d2bd58:-7d5f','calc-sef','Calculate SEF Tax',11,'calc-sef'),('RULADEF208348b4:141e2d2bd58:-7d97','calc-basicint-amnesty','Calculate Basic Interest Amnesty',5,'calc-basicint-amnesty'),('RULADEF208348b4:141e2d2bd58:-7dc2','calc-basic-amnesty','Calculate Basic Amnesty',4,'calc-basic-amnesty'),('RULADEF208348b4:141e2d2bd58:-7de8','calc-basicdisc','Calculate Basic Discount',2,'calc-basicdisc'),('RULADEF208348b4:141e2d2bd58:-7e60','calc-basicint','Calculate Basic Interest',3,'calc-basicint'),('RULADEF33e8cb24:1423c4b40b2:-6aeb','select_taxfee','Select Tax Fee Account',5,'select_taxfee'),('RULADEF33e8cb24:1423c4b40b2:-7f34','remove_taxfee','Remove Tax Fee',5,'remove_taxfee'),('RULADEF367174cc:141a62bd0d8:-4486','ask_business_info','Ask Business Info',1,'ask_business_info'),('RULADEF441bb08f:1436c079bff:-76b4','calc-brgyint-share','Calculate Barangay Interest Share',22,'calc-brgyint-share'),('RULADEF441bb08f:1436c079bff:-771e','calc-brgyshare','Calculate Barangay Share',21,'calc-brgyshare'),('RULADEF441bb08f:1436c079bff:-77e1','calc-lguint-share','Calculate LGU Interest Share',32,'calc-lguint-share'),('RULADEF441bb08f:1436c079bff:-7831','calc-lgushare','Calculate LGU Share',31,'calc-lgushare'),('RULADEF441bb08f:1436c079bff:-7891','calc-provint-share','Calculate Province Interest Share',26,'calc-provint-share'),('RULADEF441bb08f:1436c079bff:-78ee','calc-provshare','Calculate Province Share',25,'calc-provshare'),('RULADEF6d66cc31:1446cc9522e:-7d56','add-requirement','Add Requirement',1,'add-requirement'),('RULADEF72bb01b1:141b1fdca80:-7e34','update_taxfee','Update Tax Fee Amount',5,'update_taxfee'),('RULADEF73d37911:141edb9db9a:-7f30','compute_other_charge','Compute Other Charge',4,'compute_othercharge'),('RULADEF7ee0ab5e:141b6a15885:-7f52','calc_surcharge','Calculate Surcharge',0,'calc_surcharge');
/*!40000 ALTER TABLE `sys_rule_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM-2889615e:142fa67fc85:-7b71','RULADEF-2889615e:142fa67fc85:-7b7c','billitem',1,'Bill Item Account',NULL,'var',NULL,NULL,NULL,'bpls.facts.BillItem',NULL),('ACTPARAM-38b4c365:141f3574da5:-7f8f','RULADEF-67ecfd73:141f2b84ce7:-743c','aggregate',2,'Aggregate Type',NULL,'lov',NULL,NULL,NULL,NULL,'RULE_AGGREGATE_FUNCTIONS'),('ACTPARAM-3f19ce39:141ff0de421:-7e8a','RULADEF72bb01b1:141b1fdca80:-7e34','taxfee',1,'Tax Fee',NULL,'var',NULL,NULL,NULL,'bpls.facts.TaxFeeAccount',NULL),('ACTPARAM-42dc4039:141afcf5119:-7e59','RULADEF367174cc:141a62bd0d8:-4486','lob',1,'Line of Business',NULL,'var',NULL,NULL,NULL,'bpls.facts.LOB',NULL),('ACTPARAM-42dc4039:141afcf5119:-7fc4','RULADEF-2ead5abf:1419bd607e6:-7fd9','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM-4a532d76:141ff563063:-7edf','RULADEF-4a532d76:141ff563063:-7ef4','step',2,'Required Before',NULL,'lov',NULL,NULL,NULL,NULL,'BP_APPLICATION_STEPS'),('ACTPARAM-4a532d76:141ff563063:-7eec','RULADEF-4a532d76:141ff563063:-7ef4','type',1,'Requirement Type',NULL,'lookup','businessrequirement:lookup','objid','title',NULL,NULL),('ACTPARAM-627533eb:141ed7a179f:-7d61','RULADEF-627533eb:141ed7a179f:-7d7d','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-627533eb:141ed7a179f:-7d6e','RULADEF-627533eb:141ed7a179f:-7d7d','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM-627533eb:141ed7a179f:-7d75','RULADEF-627533eb:141ed7a179f:-7d7d','lob',1,'Line of Business',NULL,'var',NULL,NULL,NULL,'bpls.facts.LOB',NULL),('ACTPARAM-62a762db:14201d65080:-756e','RULADEF-62a762db:14201d65080:-7576','message',1,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-66879e9a:1422b236b58:-7b1c','RULADEF-66879e9a:1422b236b58:-7d0f','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-66879e9a:1422b236b58:-7b23','RULADEF-66879e9a:1422b236b58:-7d0f','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'bpls.facts.BillItem',NULL),('ACTPARAM-66879e9a:1422b236b58:-7b40','RULADEF-66879e9a:1422b236b58:-7d24','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-66879e9a:1422b236b58:-7b47','RULADEF-66879e9a:1422b236b58:-7d24','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'bpls.facts.BillItem',NULL),('ACTPARAM-66879e9a:1422b236b58:-7ca9','RULADEF7ee0ab5e:141b6a15885:-7f52','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'bpls.facts.BillItem',NULL),('ACTPARAM-67ecfd73:141f2b84ce7:-724b','RULADEF-67ecfd73:141f2b84ce7:-743c','datatype',3,'Value Data Type',NULL,'lov',NULL,NULL,NULL,NULL,'RULE_VAR_DATATYPE'),('ACTPARAM-67ecfd73:141f2b84ce7:-739d','RULADEF-67ecfd73:141f2b84ce7:-743c','value',4,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-67ecfd73:141f2b84ce7:-73a4','RULADEF-67ecfd73:141f2b84ce7:-743c','name',1,'Variable Name','string','string',NULL,NULL,NULL,'string',NULL),('ACTPARAM-67ecfd73:141f2b84ce7:-79b7','RULADEF-67ecfd73:141f2b84ce7:-7b54','value',3,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-67ecfd73:141f2b84ce7:-7a33','RULADEF-67ecfd73:141f2b84ce7:-7b54','attribute',2,'Attribute',NULL,'lookup','businessvariable:lookup','objid','name',NULL,NULL),('ACTPARAM-67ecfd73:141f2b84ce7:-7b4c','RULADEF-67ecfd73:141f2b84ce7:-7b54','lob',1,'Line of Business',NULL,'var',NULL,NULL,NULL,'bpls.facts.LOB',NULL),('ACTPARAM-70cdc17d:141ab4f4c27:-7ebb','RULADEF-2ead5abf:1419bd607e6:-7fd9','lob',1,'LOB',NULL,'var',NULL,NULL,NULL,'bpls.facts.LOB',NULL),('ACTPARAM-738e3cc6:14459101d11:-6afb','RULADEF-738e3cc6:14459101d11:-6b0b','account',2,'Business Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM-738e3cc6:14459101d11:-6b02','RULADEF-738e3cc6:14459101d11:-6b0b','taxfee',1,'Tax Fee Account',NULL,'var',NULL,NULL,NULL,'bpls.facts.TaxFeeAccount',NULL),('ACTPARAM-738e3cc6:14459101d11:-7f43','RULADEF-66879e9a:1422b236b58:-7d24','account',3,'Interest Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM-738e3cc6:14459101d11:-7f63','RULADEF7ee0ab5e:141b6a15885:-7f52','account',3,'Surcharge Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM14a6f1c4:1419beaa022:-7fcf','RULADEF-2ead5abf:1419bd607e6:-7fd9','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM17d6e7ce:141df4b60c2:-7b72','RULADEF17d6e7ce:141df4b60c2:-7e9e','revtype',1,'Revenue Period',NULL,'lookup','rptrevtype:lookup','value','value',NULL,NULL),('ACTPARAM17d6e7ce:141df4b60c2:-7b7f','RULADEF17d6e7ce:141df4b60c2:-7e9e','basicacct',2,'Basic Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM17d6e7ce:141df4b60c2:-7b86','RULADEF17d6e7ce:141df4b60c2:-7e9e','expr',3,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM17d6e7ce:141df4b60c2:-7b8d','RULADEF17d6e7ce:141df4b60c2:-7e9e','rptledger',4,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7b6f','RULADEF208348b4:141e2d2bd58:-7b83','firecodeacct',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7b76','RULADEF208348b4:141e2d2bd58:-7b83','expr',2,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7b7d','RULADEF208348b4:141e2d2bd58:-7b83','rptledger',3,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7bce','RULADEF208348b4:141e2d2bd58:-7bdb','expr',1,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7bd5','RULADEF208348b4:141e2d2bd58:-7bdb','rptledger',2,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7c6e','RULADEF208348b4:141e2d2bd58:-7c7b','expr',1,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7c75','RULADEF208348b4:141e2d2bd58:-7c7b','rptledger',2,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7cad','RULADEF208348b4:141e2d2bd58:-7cba','expr',1,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7cb4','RULADEF208348b4:141e2d2bd58:-7cba','rptledger',2,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7cfe','RULADEF208348b4:141e2d2bd58:-7d1e','sefintacct',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7d05','RULADEF208348b4:141e2d2bd58:-7d1e','expr',2,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7d18','RULADEF208348b4:141e2d2bd58:-7d1e','rptledger',3,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7d4b','RULADEF208348b4:141e2d2bd58:-7d5f','sefacct',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7d52','RULADEF208348b4:141e2d2bd58:-7d5f','expr',2,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7d59','RULADEF208348b4:141e2d2bd58:-7d5f','rptledger',3,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7d8a','RULADEF208348b4:141e2d2bd58:-7d97','expr',1,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7d91','RULADEF208348b4:141e2d2bd58:-7d97','rptledger',2,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7db5','RULADEF208348b4:141e2d2bd58:-7dc2','expr',1,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7dbc','RULADEF208348b4:141e2d2bd58:-7dc2','rptledger',2,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7ddb','RULADEF208348b4:141e2d2bd58:-7de8','expr',1,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7de2','RULADEF208348b4:141e2d2bd58:-7de8','rptledger',2,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM208348b4:141e2d2bd58:-7e4c','RULADEF208348b4:141e2d2bd58:-7e60','basicintacct',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7e53','RULADEF208348b4:141e2d2bd58:-7e60','expr',2,'Computation Formula',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM208348b4:141e2d2bd58:-7e5a','RULADEF208348b4:141e2d2bd58:-7e60','rptledger',3,'Ledger',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM33e8cb24:1423c4b40b2:-6adc','RULADEF33e8cb24:1423c4b40b2:-6aeb','taxfeeaccount',1,'Tax Fee Account',NULL,'var',NULL,NULL,NULL,'bpls.facts.TaxFeeAccount',NULL),('ACTPARAM33e8cb24:1423c4b40b2:-7e2a','RULADEF33e8cb24:1423c4b40b2:-7f34','taxfee',1,'Tax Fee Account',NULL,'var',NULL,NULL,NULL,'bpls.facts.TaxFeeAccount',NULL),('ACTPARAM367174cc:141a62bd0d8:18c4','RULADEF367174cc:141a62bd0d8:-4486','attribute',2,'Attribute',NULL,'lookup','businessvariable:lookup','objid','name','string',NULL),('ACTPARAM441bb08f:1436c079bff:-7697','RULADEF441bb08f:1436c079bff:-76b4','expr',3,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-76a4','RULADEF441bb08f:1436c079bff:-76b4','brgyintshareacct',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-76ab','RULADEF441bb08f:1436c079bff:-76b4','rptledger',1,'Ledger Reference',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM441bb08f:1436c079bff:-76ff','RULADEF441bb08f:1436c079bff:-771e','expr',3,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-770c','RULADEF441bb08f:1436c079bff:-771e','brgyshareacct',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-7713','RULADEF441bb08f:1436c079bff:-771e','rptledger',1,'Ledger Reference',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM441bb08f:1436c079bff:-77cf','RULADEF441bb08f:1436c079bff:-77e1','expr',2,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-77d6','RULADEF441bb08f:1436c079bff:-77e1','rptledger',1,'Ledger Reference',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM441bb08f:1436c079bff:-781f','RULADEF441bb08f:1436c079bff:-7831','expr',2,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-7826','RULADEF441bb08f:1436c079bff:-7831','rptledger',1,'Ledger Reference',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM441bb08f:1436c079bff:-7872','RULADEF441bb08f:1436c079bff:-7891','expr',3,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-787f','RULADEF441bb08f:1436c079bff:-7891','provintshareacct',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-7886','RULADEF441bb08f:1436c079bff:-7891','rptledger',1,'Ledger Reference',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM441bb08f:1436c079bff:-78cf','RULADEF441bb08f:1436c079bff:-78ee','expr',3,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-78dc','RULADEF441bb08f:1436c079bff:-78ee','provshareacct',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM441bb08f:1436c079bff:-78e3','RULADEF441bb08f:1436c079bff:-78ee','rptledger',1,'Ledger Reference',NULL,'var',NULL,NULL,NULL,'RPTLedgerFact',NULL),('ACTPARAM61c9e5c1:1423cdbf146:-7dcd','RULADEF33e8cb24:1423c4b40b2:-6aeb','selectoption',2,'Select Option',NULL,'lov',NULL,NULL,NULL,NULL,'TAXFEE_SELECT_OPTION'),('ACTPARAM6d66cc31:1446cc9522e:-7d3c','RULADEF6d66cc31:1446cc9522e:-7d56','requirementtype',1,'Requirement Type',NULL,'lookup','rptrequirementtype:lookup','objid','name',NULL,NULL),('ACTPARAM72bb01b1:141b1fdca80:-7d98','RULADEF72bb01b1:141b1fdca80:-7e34','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM73d37911:141edb9db9a:-7f14','RULADEF73d37911:141edb9db9a:-7f30','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM73d37911:141edb9db9a:-7f21','RULADEF73d37911:141edb9db9a:-7f30','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM73d37911:141edb9db9a:-7f28','RULADEF73d37911:141edb9db9a:-7f30','lob',1,'Line of Business',NULL,'var',NULL,NULL,NULL,'bpls.facts.LOB',NULL),('ACTPARAM7c61bd6d:1423fce917f:-7e73','RULADEF367174cc:141a62bd0d8:-4486','defaultvalue',3,'Default Value','string','string',NULL,NULL,NULL,'string',NULL),('ACTPARAM7ee0ab5e:141b6a15885:-7f4c','RULADEF7ee0ab5e:141b6a15885:-7f52','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_rule_actiondef_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_deployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
INSERT INTO `sys_rule_fact` VALUES ('RULFACT-1f3e2b64:14230dd8f62:-7dd8','othercharge','Other Charge Bill Item','bpls.facts.BillItem',8,NULL,'OC',NULL,NULL,NULL,NULL,NULL,NULL,'type == \"OTHERCHARGE\"'),('RULFACT-1f3e2b64:14230dd8f62:-7e29','regfee','Regulatory Fee Bill Item','bpls.facts.BillItem',7,NULL,'RF',NULL,NULL,NULL,NULL,NULL,NULL,'type == \"REGFEE\"'),('RULFACT-1f3e2b64:14230dd8f62:-7eb6','businesstax','Business Tax Bill Item','bpls.facts.BillItem',6,NULL,'BT',NULL,NULL,NULL,NULL,NULL,NULL,'type == \"TAX\"'),('RULFACT-26aa09fd:1419696e71f:-7feb','bpapplication','BPApplication','bpls.facts.BPApplication',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT-46f22f55:14231734d86:-7eca','BillDate','Bill Date','bpls.facts.BillDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT-76732870:14196dc4027:-7f87','lob','Line of Business','bpls.facts.LOB',3,NULL,'LOB',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT-7ea493a4:14237a0191b:-7fb7','payment','Payment','bpls.facts.Payment',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT-bad19b4:141f3c18435:-7fa9','businessinfo','Business Info','bpls.facts.BusinessInfo',4,NULL,NULL,1,'businessvariable:lookup','objid','name','datatype','name',NULL),('RULFACT-fd57605:142324ab5d2:-7f33','qtrdate','Qtr Date','bpls.facts.QtrDeadline',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT17d6e7ce:141df4b60c2:-7c21','assessedvalue','Assessed Value Data','AssessedValueFact',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT17d6e7ce:141df4b60c2:-7fd3','rptledger','Realty Tax Ledger','RPTLedgerFact',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT20ce1acc:141e456ed68:-7f43','CurrentDate','Current Date','CurrentDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT2e8bac67:1422b41d3b3:-7f64','CurrentDate','Current Date','CurrentDate',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT3a2b180:142b73535d5:-7fb1','LateRenewal','Late Renewal','bpls.facts.LateRenewal',20,NULL,'LateRenewal',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT49ae4bad:141e3b6758c:-7ba3','currentdate','Current Date','CurrentDate',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT4a03cdfb:141f9a6dc3c:-784a','sysvariable','Sys Variable','bpls.facts.SysVariable',10,NULL,NULL,1,'bpassessment_sysvar:lookup','name','name','datatype','name',NULL),('RULFACT4ca00100:141fe894560:-7d8e','othercharge','Other Charge Account','bpls.facts.TaxFeeAccount',7,NULL,'OC',NULL,NULL,NULL,NULL,NULL,NULL,'type==\"OTHERCHARGE\"'),('RULFACT4ca00100:141fe894560:-7e3f','regfee','Regulatory Fee Account','bpls.facts.TaxFeeAccount',6,NULL,'RF',NULL,NULL,NULL,NULL,NULL,NULL,'type == \"REGFEE\"'),('RULFACT64302071:14232ed987c:-7f4e','payoption','Pay Option','bpls.facts.PayOption',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT682fd2e6:145de99014c:-7f3e','BusinessLocation','Business Location','bpls.facts.BusinessLocation',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT6d66cc31:1446cc9522e:-7ee1','RPTTxnInfoFact','RPTTxnInfoFact','RPTTxnInfoFact',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULFACT72bb01b1:141b1fdca80:-7f86','businesstax','Business Tax Account','bpls.facts.TaxFeeAccount',5,NULL,'BT',NULL,NULL,NULL,NULL,NULL,NULL,'type == \"TAX\"'),('RULFACT7ee0ab5e:141b6a15885:-7ff1','Ledger','Business Ledger','BPLedger',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_rule_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
INSERT INTO `sys_rule_fact_field` VALUES ('FACTFLD-10f80dab:141dfb3f0a6:-7e8c','RULFACT17d6e7ce:141df4b60c2:-7fd3','backtax','Is Back Tax?',NULL,12,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FACTFLD-10f80dab:141dfb3f0a6:-7e93','RULFACT17d6e7ce:141df4b60c2:-7fd3','qtrlypaymentpaidontime','Is Quarterly Installment Paid On-Time?',NULL,16,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FACTFLD-10f80dab:141dfb3f0a6:-7e9a','RULFACT17d6e7ce:141df4b60c2:-7fd3','qtrlypaymentavailed','Is Quarterly Payment Availed?',NULL,15,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FACTFLD-10f80dab:141dfb3f0a6:-7ea1','RULFACT17d6e7ce:141df4b60c2:-7fd3','firstqtrpaidontime','1st Qtr Paid On-Time?',NULL,17,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7da5','RULFACT-1f3e2b64:14230dd8f62:-7dd8','expired','Expired','boolean',3,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7db6','RULFACT-1f3e2b64:14230dd8f62:-7dd8','amtdue','Amount Due','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7dc7','RULFACT-1f3e2b64:14230dd8f62:-7dd8','acctid','Account','string',1,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7dfe','RULFACT-1f3e2b64:14230dd8f62:-7e29','expired','Expired','boolean',3,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7e07','RULFACT-1f3e2b64:14230dd8f62:-7e29','amtdue','Amount Due','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7e18','RULFACT-1f3e2b64:14230dd8f62:-7e29','acctid','Account','string',1,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7e8b','RULFACT-1f3e2b64:14230dd8f62:-7eb6','expired','Expired','boolean',3,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7e94','RULFACT-1f3e2b64:14230dd8f62:-7eb6','amtdue','Amount Due','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD-1f3e2b64:14230dd8f62:-7ea5','RULFACT-1f3e2b64:14230dd8f62:-7eb6','acctid','Account','string',1,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('FACTFLD-234b5263:142c77537de:-7af4','RULFACT-1f3e2b64:14230dd8f62:-7dd8','lob','Line of Business','string',6,'var',NULL,NULL,NULL,NULL,NULL,NULL,'bpls.facts.LOB',NULL),('FACTFLD-234b5263:142c77537de:-7b3b','RULFACT-1f3e2b64:14230dd8f62:-7e29','lob','Line of Business','string',6,'var',NULL,NULL,NULL,NULL,NULL,NULL,'bpls.facts.LOB',NULL),('FACTFLD-234b5263:142c77537de:-7c17','RULFACT-1f3e2b64:14230dd8f62:-7eb6','lob','Line of Business','string',7,'var',NULL,NULL,NULL,NULL,NULL,NULL,'bpls.facts.LOB',NULL),('FACTFLD-26aa09fd:1419696e71f:-7fe4','RULFACT-26aa09fd:1419696e71f:-7feb','apptype','App Type','BUSINESS_APP_TYPES',1,'lov',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BUSINESS_APP_TYPES'),('FACTFLD-42025b26:14237a79c92:-7f53','RULFACT-46f22f55:14231734d86:-7eca','date','Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD-435133e2:142c7ca3c49:-7a9f','RULFACT-fd57605:142324ab5d2:-7f33','deadline','Deadline date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD-435133e2:142c7ca3c49:-7abe','RULFACT-fd57605:142324ab5d2:-7f33','beginQtrDate','Begin date of Qtr','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD-45a06f70:141e85fbfd5:-7f6f','RULFACT-76732870:14196dc4027:-7f87','assessmenttype','Assessment Type',NULL,4,'lov',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LOB_ASSESSMENT_TYPES'),('FACTFLD-46f22f55:14231734d86:-7ea7','RULFACT-46f22f55:14231734d86:-7eca','day','Day','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-46f22f55:14231734d86:-7eb0','RULFACT-46f22f55:14231734d86:-7eca','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-46f22f55:14231734d86:-7eb9','RULFACT-46f22f55:14231734d86:-7eca','month','Month','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-5c8064e4:143fb646ea9:-7ec0','RULFACT-1f3e2b64:14230dd8f62:-7e29','surcharge','Surcharge','decimal',7,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD-62a762db:14201d65080:-7250','RULFACT-26aa09fd:1419696e71f:-7feb','appqtr','App Qtr','integer',8,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-62a762db:14201d65080:-72d8','RULFACT-26aa09fd:1419696e71f:-7feb','appdate','App date','integer',7,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-62a762db:14201d65080:-72e9','RULFACT-26aa09fd:1419696e71f:-7feb','appmonth','App. Month','integer',6,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-62a762db:14201d65080:-72f2','RULFACT-26aa09fd:1419696e71f:-7feb','appyear','Application Year','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-62a762db:14201d65080:-7303','RULFACT-26aa09fd:1419696e71f:-7feb','yearstarted','Year Applied','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-73089baf:141f3d279b0:-7f78','RULFACT-bad19b4:141f3c18435:-7fa9','lob','Line of Business',NULL,1,'var',NULL,NULL,NULL,NULL,NULL,1,'bpls.facts.LOB',NULL),('FACTFLD-76732870:14196dc4027:-7f25','RULFACT-76732870:14196dc4027:-7f87','classification','Classification','string',1,'lookup','lobclassification:lookup','objid','name',NULL,NULL,NULL,NULL,NULL),('FACTFLD-76732870:14196dc4027:-7f80','RULFACT-76732870:14196dc4027:-7f87','lobid','Name','string',2,'lookup','lob:lookup','objid','name',NULL,NULL,NULL,NULL,NULL),('FACTFLD-7c5c4c8f:141e84ee23e:-7f45','RULFACT-26aa09fd:1419696e71f:-7feb','orgtype','Org. Type',NULL,2,'lov',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ORG_TYPES'),('FACTFLD-7dcd2cc0:1419c36c939:-7f7f','RULFACT-76732870:14196dc4027:-7f87','attributes','Attributes',NULL,3,'lookup','lobattribute:lookup','name','name',NULL,1,NULL,NULL,NULL),('FACTFLD-7ea493a4:14237a0191b:-7f9d','RULFACT-7ea493a4:14237a0191b:-7fb7','amtpaid','Amount Paid','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD-7ea493a4:14237a0191b:-7fa6','RULFACT-7ea493a4:14237a0191b:-7fb7','pmtdate','Payment Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD-fd57605:142324ab5d2:-78ff','RULFACT-1f3e2b64:14230dd8f62:-7eb6','surcharge','Surcharge','decimal',5,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD-fd57605:142324ab5d2:-7e3f','RULFACT-1f3e2b64:14230dd8f62:-7dd8','qtr','Qtr','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-fd57605:142324ab5d2:-7e7b','RULFACT-1f3e2b64:14230dd8f62:-7e29','qtr','Qtr','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-fd57605:142324ab5d2:-7eaf','RULFACT-1f3e2b64:14230dd8f62:-7eb6','qtr','Qtr','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-fd57605:142324ab5d2:-7f08','RULFACT-fd57605:142324ab5d2:-7f33','qtr','Qtr','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-fd57605:142324ab5d2:-7f19','RULFACT-fd57605:142324ab5d2:-7f33','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD-fd57605:142324ab5d2:-7f22','RULFACT-fd57605:142324ab5d2:-7f33','month','Month','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c0c','RULFACT17d6e7ce:141df4b60c2:-7c21','assessedvalue','Assessed Value','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c13','RULFACT17d6e7ce:141df4b60c2:-7c21','year','Year','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c4a','RULFACT17d6e7ce:141df4b60c2:-7fd3','originalav','Original Assessed Value','decimal',29,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c51','RULFACT17d6e7ce:141df4b60c2:-7fd3','firecode','Fire Code','decimal',28,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c58','RULFACT17d6e7ce:141df4b60c2:-7fd3','sefintamnesty','SEF Interest Amnesty','decimal',27,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c5f','RULFACT17d6e7ce:141df4b60c2:-7fd3','sefamnesty','SEF Amnesty','decimal',26,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c71','RULFACT17d6e7ce:141df4b60c2:-7fd3','sefdisc','SEF Discount','decimal',24,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c78','RULFACT17d6e7ce:141df4b60c2:-7fd3','sefint','SEF Interest','decimal',25,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c7f','RULFACT17d6e7ce:141df4b60c2:-7fd3','sef','SEF','decimal',23,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c86','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicintamnesty','Basic Interest Amnesty','decimal',22,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c8d','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicamnesty','Basic Amnesty','decimal',21,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c94','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicdisc','Basic Discount','decimal',19,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7c9b','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicint','Basic Interest','decimal',20,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7ca2','RULFACT17d6e7ce:141df4b60c2:-7fd3','basic','Basic','decimal',18,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7ca9','RULFACT17d6e7ce:141df4b60c2:-7fd3','numberofmonthsfromjan','No. of Months from January','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7cb0','RULFACT17d6e7ce:141df4b60c2:-7fd3','numberofmonthsfromqtr','No. of Months from Quarter','integer',6,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7cbf','RULFACT17d6e7ce:141df4b60c2:-7fd3','actualuse','Actual Use','string',9,'string','propertyclassification:lookup','objid','name',NULL,NULL,NULL,NULL,NULL),('FACTFLD17d6e7ce:141df4b60c2:-7ce0','RULFACT17d6e7ce:141df4b60c2:-7fd3','classification','Classification',NULL,8,'lookup','propertyclassification:lookup','objid','name',NULL,0,NULL,NULL,NULL),('FACTFLD17d6e7ce:141df4b60c2:-7ce7','RULFACT17d6e7ce:141df4b60c2:-7fd3','rputype','Property Type',NULL,10,'lov','rputype:lookup','objid','objid',NULL,NULL,NULL,NULL,'RPT_RPUTYPES'),('FACTFLD17d6e7ce:141df4b60c2:-7cee','RULFACT17d6e7ce:141df4b60c2:-7fd3','txntype','Txn Type','string',11,'string','txntype:lookup','objid','objid',NULL,NULL,NULL,NULL,NULL),('FACTFLD17d6e7ce:141df4b60c2:-7cf5','RULFACT17d6e7ce:141df4b60c2:-7fd3','av','Assessed Value','decimal',4,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7cfc','RULFACT17d6e7ce:141df4b60c2:-7fd3','qtr','Qtr','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD17d6e7ce:141df4b60c2:-7d03','RULFACT17d6e7ce:141df4b60c2:-7fd3','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD184d0b9f:142789765e5:-7da5','RULFACT-1f3e2b64:14230dd8f62:-7dd8','deadline','Deadline Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD184d0b9f:142789765e5:-7de2','RULFACT-1f3e2b64:14230dd8f62:-7e29','deadline','Deadline Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD184d0b9f:142789765e5:-7e5f','RULFACT-1f3e2b64:14230dd8f62:-7eb6','deadline','Deadline Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('FACTFLD20ce1acc:141e456ed68:-7f35','RULFACT20ce1acc:141e456ed68:-7f43','month','Month','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD20ce1acc:141e456ed68:-7f3c','RULFACT20ce1acc:141e456ed68:-7f43','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD2701c487:141e346f838:-7f17','RULFACT17d6e7ce:141df4b60c2:-7fd3','rptledgerid','LedgerID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('FACTFLD2701c487:141e346f838:-7f2e','RULFACT17d6e7ce:141df4b60c2:-7c21','rptledgerid','LedgerID','string',3,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('FACTFLD2701c487:141e346f838:-7f8e','RULFACT17d6e7ce:141df4b60c2:-7fd3','advancepayment','Is Advance Payment?',NULL,14,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FACTFLD2701c487:141e346f838:-7f95','RULFACT17d6e7ce:141df4b60c2:-7fd3','fullpayment','Is Full Payment?',NULL,13,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FACTFLD270217d9:143576614a1:-7f94','RULFACT17d6e7ce:141df4b60c2:-7fd3','reclassed','Reclassed?','boolean',30,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD2713811e:141f3ed1502:-7ed5','RULFACT-bad19b4:141f3c18435:-7fa9','stringvalue','Value','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('FACTFLD2713811e:141f3ed1502:-7ede','RULFACT-bad19b4:141f3c18435:-7fa9','booleanvalue','Value','boolean',4,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD2713811e:141f3ed1502:-7ee7','RULFACT-bad19b4:141f3c18435:-7fa9','intvalue','Value','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD2713811e:141f3ed1502:-7ef0','RULFACT-bad19b4:141f3c18435:-7fa9','decimalvalue','Value','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD2e8bac67:1422b41d3b3:-7f30','RULFACT2e8bac67:1422b41d3b3:-7f64','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD2e8bac67:1422b41d3b3:-7f4a','RULFACT2e8bac67:1422b41d3b3:-7f64','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD2e8bac67:1422b41d3b3:-7f53','RULFACT2e8bac67:1422b41d3b3:-7f64','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD3a2b180:142b73535d5:-7f95','RULFACT3a2b180:142b73535d5:-7fb1','year','Year','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD441bb08f:1436c079bff:-7f49','RULFACT17d6e7ce:141df4b60c2:-7fd3','barangayid','Barangay','string',7,'lookup','barangay:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('FACTFLD441bb08f:1436c079bff:-7f52','RULFACT17d6e7ce:141df4b60c2:-7fd3','provintshare','Province Interest Share','decimal',36,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD441bb08f:1436c079bff:-7f5b','RULFACT17d6e7ce:141df4b60c2:-7fd3','provshare','Province Share','decimal',35,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD441bb08f:1436c079bff:-7f64','RULFACT17d6e7ce:141df4b60c2:-7fd3','brgyintshare','Barangay Interest Share','decimal',34,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD441bb08f:1436c079bff:-7f6d','RULFACT17d6e7ce:141df4b60c2:-7fd3','brgyshare','Barangay Share','decimal',33,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD441bb08f:1436c079bff:-7f76','RULFACT17d6e7ce:141df4b60c2:-7fd3','lguintshare','LGU Interest Share','decimal',32,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD441bb08f:1436c079bff:-7f7f','RULFACT17d6e7ce:141df4b60c2:-7fd3','lgushare','LGU Share','decimal',31,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD441bb08f:1436c079bff:-7fc1','RULFACT17d6e7ce:141df4b60c2:-7c21','qtrlyav','Quarterly Assessed Value','decimal',4,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD49ae4bad:141e3b6758c:-7b87','RULFACT49ae4bad:141e3b6758c:-7ba3','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD49ae4bad:141e3b6758c:-7b8e','RULFACT49ae4bad:141e3b6758c:-7ba3','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD49ae4bad:141e3b6758c:-7b95','RULFACT49ae4bad:141e3b6758c:-7ba3','qtr','Quarter','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD49ae4bad:141e3b6758c:-7b9c','RULFACT49ae4bad:141e3b6758c:-7ba3','year','Year','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-7816','RULFACT4a03cdfb:141f9a6dc3c:-784a','stringvalue','Value','string',5,'string',NULL,NULL,NULL,NULL,NULL,0,'string',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-781f','RULFACT4a03cdfb:141f9a6dc3c:-784a','intvalue','Value','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,0,'integer',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-7828','RULFACT4a03cdfb:141f9a6dc3c:-784a','decimalvalue','Value','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,0,'decimal',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-7831','RULFACT4a03cdfb:141f9a6dc3c:-784a','booleanvalue','Value','boolean',2,'boolean',NULL,NULL,NULL,NULL,NULL,0,'boolean',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-783a','RULFACT4a03cdfb:141f9a6dc3c:-784a','lob','Line of Business','string',1,'var',NULL,NULL,NULL,NULL,NULL,0,'bpls.facts.LOB',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-7b91','RULFACT72bb01b1:141b1fdca80:-7f86','lowest','Is Lowest Amount','boolean',5,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD4a03cdfb:141f9a6dc3c:-7b9a','RULFACT72bb01b1:141b1fdca80:-7f86','highest','Is Highest Amount','boolean',4,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD4b5f47bd:142219e4784:-7f46','RULFACT-26aa09fd:1419696e71f:-7feb','txnmode','Txn Mode','string',3,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','BP_TXNMODES'),('FACTFLD4ca00100:141fe894560:-7d51','RULFACT4ca00100:141fe894560:-7d8e','lowest','Is Lowest Amount','boolean',5,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD4ca00100:141fe894560:-7d5a','RULFACT4ca00100:141fe894560:-7d8e','highest','Is Highest Amount','boolean',4,'boolean',NULL,NULL,NULL,NULL,NULL,0,'boolean',NULL),('FACTFLD4ca00100:141fe894560:-7d63','RULFACT4ca00100:141fe894560:-7d8e','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD4ca00100:141fe894560:-7d74','RULFACT4ca00100:141fe894560:-7d8e','acctid','Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,NULL,NULL),('FACTFLD4ca00100:141fe894560:-7d7d','RULFACT4ca00100:141fe894560:-7d8e','lob','Line of Business','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'bpls.facts.LOB',NULL),('FACTFLD4ca00100:141fe894560:-7e02','RULFACT4ca00100:141fe894560:-7e3f','lowest','Is Lowest Amount','boolean',5,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD4ca00100:141fe894560:-7e0b','RULFACT4ca00100:141fe894560:-7e3f','highest','Is Highest Amount','boolean',4,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD4ca00100:141fe894560:-7e14','RULFACT4ca00100:141fe894560:-7e3f','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD4ca00100:141fe894560:-7e25','RULFACT4ca00100:141fe894560:-7e3f','acctid','Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('FACTFLD4ca00100:141fe894560:-7e2e','RULFACT4ca00100:141fe894560:-7e3f','lob','Line of Business','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'bpls.facts.LOB',NULL),('FACTFLD5efee916:144597ae7de:-7f0e','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicdisctaken','Basic Discount Taken','decimal',39,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD5efee916:144597ae7de:-7f4b','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicintpaid','Basic Interest Paid','decimal',38,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD5efee916:144597ae7de:-7f72','RULFACT17d6e7ce:141df4b60c2:-7fd3','basicpaid','Basic Paid','decimal',37,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD64302071:14232ed987c:-7f3d','RULFACT64302071:14232ed987c:-7f4e','type','Type','string',1,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','BP_PAYOPTIONS'),('FACTFLD682fd2e6:145de99014c:-7e46','RULFACT682fd2e6:145de99014c:-7f3e','barangayid','Barangay','string',4,'lookup','barangay:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('FACTFLD682fd2e6:145de99014c:-7e4f','RULFACT682fd2e6:145de99014c:-7f3e','local','Local','boolean',3,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD682fd2e6:145de99014c:-7ee8','RULFACT682fd2e6:145de99014c:-7f3e','rented','Rented','boolean',2,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD682fd2e6:145de99014c:-7f07','RULFACT682fd2e6:145de99014c:-7f3e','governmentproperty','Government Property','boolean',1,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD6d66cc31:1446cc9522e:-7e84','RULFACT6d66cc31:1446cc9522e:-7ee1','planRequired','Approved Plan Required','boolean',3,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('FACTFLD6d66cc31:1446cc9522e:-7ea0','RULFACT6d66cc31:1446cc9522e:-7ee1','txntypemode','Txn Type Mode','string',2,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','RPT_TXN_TYPE_MODES'),('FACTFLD6d66cc31:1446cc9522e:-7ebd','RULFACT6d66cc31:1446cc9522e:-7ee1','txntype','Txn Type','string',1,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','RPT_TXN_TYPES'),('FACTFLD72bb01b1:141b1fdca80:-7f45','RULFACT72bb01b1:141b1fdca80:-7f86','lob','Line of Business',NULL,1,'var',NULL,NULL,NULL,NULL,NULL,0,'bpls.facts.LOB',NULL),('FACTFLD72bb01b1:141b1fdca80:-7f70','RULFACT72bb01b1:141b1fdca80:-7f86','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD72bb01b1:141b1fdca80:-7f7f','RULFACT72bb01b1:141b1fdca80:-7f86','acctid','Account',NULL,2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,0,NULL,NULL),('FACTFLD7ee0ab5e:141b6a15885:-7fd5','RULFACT7ee0ab5e:141b6a15885:-7ff1','amtdue','Amount Due','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('FACTFLD7ee0ab5e:141b6a15885:-7fdc','RULFACT7ee0ab5e:141b6a15885:-7ff1','qtr','Qtr','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD7ee0ab5e:141b6a15885:-7fe3','RULFACT7ee0ab5e:141b6a15885:-7ff1','year','Year','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('FACTFLD7ee0ab5e:141b6a15885:-7fea','RULFACT7ee0ab5e:141b6a15885:-7ff1','apptype','Application Type',NULL,4,'lov',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BUSINESS_APP_TYPES');
/*!40000 ALTER TABLE `sys_rule_fact_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
INSERT INTO `sys_rulegroup` VALUES ('AFTER_DISCOUNT','rptbilling','After Discount Computation',6),('AFTER_PENALTY','rptbilling','After Penalty Computation',4),('AFTER_REQUIREMENT','rptrequirement','After Requirement',2),('AFTER_TAX','rptbilling','After Tax Computation',2),('appinfo','bpassessment','Application Info',1),('BRGY_SHARE','rptbilling','Barangay Share Computation',15),('businesstax','bpassessment','Business Tax Computation',4),('default','bpinfo','Application Info',0),('discount','bpbilling','Discount',1),('DISCOUNT','rptbilling','Discount Computation',5),('initial','bpbilling','Initialization',0),('interest','bpbilling','Interest',3),('LGU_SHARE','rptbilling','LGU Share Computation',16),('othercharge','bpassessment','Other Charge Computation',8),('PENALTY','rptbilling','Penalty Computation',3),('postappinfo','bpassessment','Post Application Info',2),('postbusinesstax','bpassessment','Post Business Tax Computation',5),('postinfo','bpinfo','Post App Info',1),('postothercharge','bpassessment','Post Other Charge Computation',9),('postregfee','bpassessment','Post Regulatory Fee Computation',7),('postsummary','bpassessment','Postsummary',11),('preappinfo','bpassessment','Pre-Application Info',0),('PROV_SHARE','rptbilling','Province Share Computation',17),('regfee','bpassessment','Regulatory Fee Computation',6),('requirement','bpassessment','Requirements',3),('REQUIREMENT','rptrequirement','Requirement',1),('SUMMARY','bpassessment','Summary',10),('surcharge','bpbilling','Surcharge',2),('TAX','rptbilling','Tax Computation',1);
/*!40000 ALTER TABLE `sys_rulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
INSERT INTO `sys_ruleset` VALUES ('bpassessment','BP Assessment Rules',NULL,'BPLS','DATAMGMT',NULL),('bpbilling','BPLS Billing Rules',NULL,'BPLS','DATAMGMT',NULL),('bpinfo','BP Info',NULL,'BPLS','DATAMGMT',NULL),('rptbilling','RPT Billing Rules','rptbilling',NULL,NULL,NULL),('rptrequirement','RPT Requirement Rules','rptrequirement',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
INSERT INTO `sys_ruleset_actiondef` VALUES ('bpbilling','RULADEF-2889615e:142fa67fc85:-7b7c'),('bpassessment','RULADEF-2ead5abf:1419bd607e6:-7fd9'),('bpinfo','RULADEF-4a532d76:141ff563063:-7ef4'),('bpassessment','RULADEF-627533eb:141ed7a179f:-7d7d'),('bpassessment','RULADEF-62a762db:14201d65080:-7576'),('bpinfo','RULADEF-62a762db:14201d65080:-7576'),('bpbilling','RULADEF-66879e9a:1422b236b58:-7d0f'),('bpbilling','RULADEF-66879e9a:1422b236b58:-7d24'),('bpassessment','RULADEF-67ecfd73:141f2b84ce7:-743c'),('bpassessment','RULADEF-67ecfd73:141f2b84ce7:-7b54'),('bpinfo','RULADEF-67ecfd73:141f2b84ce7:-7b54'),('bpassessment','RULADEF-738e3cc6:14459101d11:-6b0b'),('rptbilling','RULADEF17d6e7ce:141df4b60c2:-7e9e'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7b83'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7bdb'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7c7b'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7cba'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7d1e'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7d5f'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7d97'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7dc2'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7de8'),('rptbilling','RULADEF208348b4:141e2d2bd58:-7e60'),('bpassessment','RULADEF33e8cb24:1423c4b40b2:-6aeb'),('bpassessment','RULADEF33e8cb24:1423c4b40b2:-7f34'),('bpassessment','RULADEF367174cc:141a62bd0d8:-4486'),('bpinfo','RULADEF367174cc:141a62bd0d8:-4486'),('rptbilling','RULADEF441bb08f:1436c079bff:-76b4'),('rptbilling','RULADEF441bb08f:1436c079bff:-771e'),('rptbilling','RULADEF441bb08f:1436c079bff:-77e1'),('rptbilling','RULADEF441bb08f:1436c079bff:-7831'),('rptbilling','RULADEF441bb08f:1436c079bff:-7891'),('rptbilling','RULADEF441bb08f:1436c079bff:-78ee'),('rptrequirement','RULADEF6d66cc31:1446cc9522e:-7d56'),('bpassessment','RULADEF72bb01b1:141b1fdca80:-7e34'),('bpassessment','RULADEF73d37911:141edb9db9a:-7f30'),('bpbilling','RULADEF7ee0ab5e:141b6a15885:-7f52');
/*!40000 ALTER TABLE `sys_ruleset_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
INSERT INTO `sys_ruleset_fact` VALUES ('bpbilling','RULFACT-1f3e2b64:14230dd8f62:-7dd8'),('bpbilling','RULFACT-1f3e2b64:14230dd8f62:-7e29'),('bpbilling','RULFACT-1f3e2b64:14230dd8f62:-7eb6'),('bpassessment','RULFACT-26aa09fd:1419696e71f:-7feb'),('bpbilling','RULFACT-26aa09fd:1419696e71f:-7feb'),('bpinfo','RULFACT-26aa09fd:1419696e71f:-7feb'),('bpbilling','RULFACT-46f22f55:14231734d86:-7eca'),('bpassessment','RULFACT-76732870:14196dc4027:-7f87'),('bpbilling','RULFACT-76732870:14196dc4027:-7f87'),('bpbilling','RULFACT-7ea493a4:14237a0191b:-7fb7'),('bpassessment','RULFACT-bad19b4:141f3c18435:-7fa9'),('bpinfo','RULFACT-bad19b4:141f3c18435:-7fa9'),('bpbilling','RULFACT-fd57605:142324ab5d2:-7f33'),('rptbilling','RULFACT17d6e7ce:141df4b60c2:-7c21'),('rptbilling','RULFACT17d6e7ce:141df4b60c2:-7fd3'),('bpassessment','RULFACT20ce1acc:141e456ed68:-7f43'),('bpbilling','RULFACT20ce1acc:141e456ed68:-7f43'),('bpinfo','RULFACT20ce1acc:141e456ed68:-7f43'),('bpbilling','RULFACT2e8bac67:1422b41d3b3:-7f64'),('bpassessment','RULFACT3a2b180:142b73535d5:-7fb1'),('rptbilling','RULFACT49ae4bad:141e3b6758c:-7ba3'),('bpassessment','RULFACT4a03cdfb:141f9a6dc3c:-784a'),('bpassessment','RULFACT4ca00100:141fe894560:-7d8e'),('bpassessment','RULFACT4ca00100:141fe894560:-7e3f'),('bpbilling','RULFACT64302071:14232ed987c:-7f4e'),('bpassessment','RULFACT682fd2e6:145de99014c:-7f3e'),('bpinfo','RULFACT682fd2e6:145de99014c:-7f3e'),('rptrequirement','RULFACT6d66cc31:1446cc9522e:-7ee1'),('bpassessment','RULFACT72bb01b1:141b1fdca80:-7f86'),('bpbilling','RULFACT7ee0ab5e:141b6a15885:-7ff1');
/*!40000 ALTER TABLE `sys_ruleset_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_script`
--

LOCK TABLES `sys_script` WRITE;
/*!40000 ALTER TABLE `sys_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_securitygroup`
--

LOCK TABLES `sys_securitygroup` WRITE;
/*!40000 ALTER TABLE `sys_securitygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_securitygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_session`
--

LOCK TABLES `sys_session` WRITE;
/*!40000 ALTER TABLE `sys_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_session_log`
--

LOCK TABLES `sys_session_log` WRITE;
/*!40000 ALTER TABLE `sys_session_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_terminal`
--

LOCK TABLES `sys_terminal` WRITE;
/*!40000 ALTER TABLE `sys_terminal` DISABLE KEYS */;
INSERT INTO `sys_terminal` VALUES ('T001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('T002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_usergroup`
--

LOCK TABLES `sys_usergroup` WRITE;
/*!40000 ALTER TABLE `sys_usergroup` DISABLE KEYS */;
INSERT INTO `sys_usergroup` VALUES ('ACCOUNTS.ACCOUNT_DATAMGMT','ACCOUNT DATA MANAGEMENT','ACCOUNTS','usergroup',NULL,'ACCOUNT_DATAMGMT'),('ADMIN.SYSADMIN','SYSTEM ADMINISTRATOR','ADMIN','usergroup',NULL,'SYSADMIN'),('BPLS.ADMIN','BPLS ADMINISTRATOR','BPLS','usergroup',NULL,'ADMIN'),('BPLS.APPROVER','BUSINESS APPROVER','BPLS','usergroup',NULL,'APPROVER'),('BPLS.ASSESSOR','BPLS ASSESSOR','BPLS','usergroup',NULL,'ASSESSOR'),('BPLS.BUSINESSINFO','BUSINESS INFORMATION','BPLS','usergroup',NULL,'BUSINESSINFO'),('BPLS.CAPTURE_ENCODER','BPLS CAPTURE ENCODER','BPLS','usergroup',NULL,'CAPTURE_ENCODER'),('BPLS.LICENSING','BPLS LICENSING','BPLS','usergroup',NULL,'LICENSING'),('BPLS.MASTER','BPLS MASTER','BPLS','usergroup',NULL,'MASTER'),('BPLS.RULE_AUTHOR','BPLS RULE AUTHOR','BPLS','usergroup',NULL,'RULE_AUTHOR'),('BPLS.SHARED','BPLS SHARED','BPLS','usergroup',NULL,'SHARED'),('ENTITY.MASTER','ENTITY MASTER','ENTITY','usergroup',NULL,'MASTER'),('ETRACSADMIN.TOOLS','ETRACS ADMIN','ETRACSADMIN','usergroup',NULL,'ETRACS_ADMIN'),('RPT.APPRAISAL_CHIEF','APPRAISAL DIVISION CHIEF','RPT','usergroup',NULL,'APPRAISAL_CHIEF'),('RPT.APPRAISER','APPRAISER','RPT','usergroup',NULL,'APPRAISER'),('RPT.APPROVER','APPROVER','RPT','usergroup',NULL,'APPROVER'),('RPT.ASSESSOR','ASSESSOR','RPT','usergroup',NULL,'ASSESSOR'),('RPT.ASSESSOR_REPORT','ASSESSOR REPORT','RPT','usergroup',NULL,'ASSESSOR_REPORT'),('RPT.ASSESSOR_SHARED','ASSESSOR SHARED','RPT','usergroup',NULL,'ASSESSOR_SHARED'),('RPT.ASSISTANT_ASSESSOR','ASSISTANT ASSESSOR','RPT','usergroup',NULL,'ASSISTANT_ASSESSOR'),('RPT.CERTIFICATION_ISSUER','CERTIFICATION_ISSUER','RPT','usergroup',NULL,'CERTIFICATION_ISSUER'),('RPT.EXAMINER','EXAMINER','RPT','usergroup',NULL,'EXAMINER'),('RPT.LANDTAX','LANDTAX','RPT','usergroup',NULL,'LANDTAX'),('RPT.LANDTAX_DATAMGMT','LANDTAX DATA MANAGEMENT','RPT','usergroup',NULL,'LANDTAX_DATAMGMT'),('RPT.LANDTAX_REPORT','LANDTAX REPORT','RPT','usergroup',NULL,'LANDTAX_REPORT'),('RPT.LANDTAX_SHARED','LANDTAX SHARED','RPT','usergroup',NULL,'LANDTAX_SHARED'),('RPT.MASTER','MASTER','RPT','usergroup',NULL,'MASTER'),('RPT.RECOMMENDER','RECOMMENDER','RPT','usergroup',NULL,'RECOMMENDER'),('RPT.RECORD','RECORD','RPT','usergroup',NULL,'RECORD'),('RPT.RULE_AUTHOR','RULE AUTHOR','RPT','usergroup',NULL,'RULE_AUTHOR'),('RPT.TAXMAPPER','TAXMAPPER','RPT','usergroup',NULL,'TAXMAPPER'),('RPT.TAXMAPPER_CHIEF','TAXMAPPER DIVISION CHIEF','RPT','usergroup',NULL,'TAXMAPPER_CHIEF'),('TREASURY.AFO','ACCOUNTABLE FORM OFFICER','TREASURY','usergroup',NULL,'AFO'),('TREASURY.CASHIER','CASHIER','TREASURY','usergroup',NULL,'CASHIER'),('TREASURY.COLLECTOR','COLLECTOR','TREASURY','usergroup',NULL,'COLLECTOR'),('TREASURY.DATA_CONTROLLER','TREASURY DATA CONTROLLER','TREASURY','usergroup',NULL,'DATA_CONTROLLER'),('TREASURY.LIQUIDATING_OFFICER','LIQUIDATING OFFICER','TREASURY','usergroup',NULL,'LIQUIDATING_OFFICER'),('TREASURY.MASTER','TREASURY MASTER','TREASURY','usergroup',NULL,'MASTER'),('TREASURY.REPORT','TREASURY REPORT','TREASURY','usergroup',NULL,'REPORT'),('TREASURY.RULE_AUTHOR','CTC RULE AUTHOR','TREASURY','userclass',NULL,'RULE_AUTHOR'),('TREASURY.SHARED','TREASURY SHARED','TREASURY','usergroup',NULL,'SHARED'),('TREASURY.SUBCOLLECTOR','SUBCOLLECTOR','TREASURY','usergroup',NULL,'SUBCOLLECTOR');
/*!40000 ALTER TABLE `sys_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_usergroup_admin`
--

LOCK TABLES `sys_usergroup_admin` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_usergroup_member`
--

LOCK TABLES `sys_usergroup_member` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_usergroup_permission`
--

LOCK TABLES `sys_usergroup_permission` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_permission` DISABLE KEYS */;
INSERT INTO `sys_usergroup_permission` VALUES ('BPLS-BUSINESSINFO-captureBusiness','BPLS.BUSINESSINFO','business','capture','Capture'),('ENTITY-MASTER-createIndividual','ENTITY.MASTER','individualentity','create','Create'),('ENTITY-MASTER-createJuridical','ENTITY.MASTER','juridicalentity','create','Create'),('ENTITY-MASTER-createMultiple','ENTITY.MASTER','multipleentity','create','Create'),('ENTITY-MASTER-deleteIndividual','ENTITY.MASTER','individualentity','delete','Delete'),('ENTITY-MASTER-deleteJuridical','ENTITY.MASTER','juridicalentity','delete','Delete'),('ENTITY-MASTER-deleteMultiple','ENTITY.MASTER','multipleentity','delete','Delete'),('ENTITY-MASTER-editIndividual','ENTITY.MASTER','individualentity','edit','Edit'),('ENTITY-MASTER-editJuridical','ENTITY.MASTER','juridicalentity','edit','Edit'),('ENTITY-MASTER-editMultiple','ENTITY.MASTER','multipleentity','edit','Edit'),('ENTITY-MASTER-openIndividual','ENTITY.MASTER','individualentity','open','Open'),('ENTITY-MASTER-openJuridical','ENTITY.MASTER','juridicalentity','open','Open'),('ENTITY-MASTER-openMultiple','ENTITY.MASTER','multipleentity','open','Open'),('RPT-ANNOTATION-C','RPT.APPRAISER','annotation','create','create'),('RPT-ANNOTATION-R','RPT.APPRAISER','annotation','read','read'),('RPT-BILLING-C','RPT.LANDTAX','rptbilling','create','create'),('RPT-CANCELANNOTATION-C','RPT.APPRAISER','cancelannotation','create','create'),('RPT-CANCELFAAS-C','RPT.APPRAISER','cancelfaas','create','create'),('RPT-CERTICICATION-LE','RPT.CERTIFICATION_ISSUER','certification','latestandexisting','latestandexisting'),('RPT-CERTIFICATION-LH','RPT.CERTIFICATION_ISSUER','certification','landholding','landholding'),('RPT-CERTIFICATION-MP','RPT.CERTIFICATION_ISSUER','certification','multipleproperty','multipleproperty'),('RPT-CERTIFICATION-NE','RPT.CERTIFICATION_ISSUER','certification','noencumbrance','noencumbrance'),('RPT-CERTIFICATION-NP','RPT.CERTIFICATION_ISSUER','certification','noproperty','noproperty'),('RPT-CERTIFICATION-OWN','RPT.CERTIFICATION_ISSUER','certification','ownership','ownership'),('RPT-CERTIFICATION-TDT','RPT.CERTIFICATION_ISSUER','certification','tdtruecopy','tdtruecopy'),('RPT-CS-C','RPT.APPRAISER','consolidation','create','create'),('RPT-CS-D','RPT.APPRAISER','consolidation','delete','delete'),('RPT-CS-R','RPT.APPRAISER','consolidation','read','read'),('RPT-CS-U','RPT.APPRAISER','consolidation','edit','edit'),('RPT-FA-C','RPT.APPRAISER','annotation','create','create'),('RPT-FA-D','RPT.APPRAISER','annotation','delete','delete'),('RPT-FA-R','RPT.APPRAISER','annotation','read','read'),('RPT-FA-U','RPT.APPRAISER','annotation','edit','edit'),('RPT-FAAS-APPROVER-A','RPT.APPROVER','faas','approve','approve'),('RPT-FAAS-APPROVER-D','RPT.APPROVER','faas','disapprove','disapprove'),('RPT-FAAS-C-CC','RPT.APPRAISER','faas','createChangeClassificatio','createChangeClassificatio'),('RPT-FAAS-C-CD','RPT.APPRAISER','faas','createChangeDepreciation','createChangeDepreciation'),('RPT-FAAS-C-CE','RPT.APPRAISER','faas','createCorrection','createCorrection'),('RPT-FAAS-C-CT','RPT.APPRAISER','faas','createChangeTaxability','createChangeTaxability'),('RPT-FAAS-C-DC','RPT.APPRAISER','faas','createDataCapture','createDataCapture'),('RPT-FAAS-C-GR','RPT.APPRAISER','faas','createGeneralRevision','createGeneralRevision'),('RPT-FAAS-C-MC','RPT.APPRAISER','faas','createMultipleClaim','createMultipleClaim'),('RPT-FAAS-C-ND','RPT.APPRAISER','faas','createNewDiscovery','createNewDiscovery'),('RPT-FAAS-C-RE','RPT.APPRAISER','faas','createReassessment','createReassessment'),('RPT-FAAS-C-TR','RPT.APPRAISER','faas','createTransfer','createTransfer'),('RPT-FAAS-D','RPT.APPRAISER','faas','delete','delete'),('RPT-FAAS-E','RPT.APPRAISER','faas','edit','edit'),('RPT-FAAS-R','RPT.APPRAISER','faas','read','read'),('RPT-FAAS-REC-A','RPT.RECOMMENDER','faas','approve','approve'),('RPT-FAAS-REC-D','RPT.RECOMMENDER','faas','disapprove','disapprove'),('RPT-FAAS-REC-S','RPT.RECOMMENDER','faas','submitToProvince','submitToProvince'),('RPT-FAAS-S','RPT.APPRAISER','faas','submit','submit'),('RPT-FAASUPDATE-C','RPT.APPRAISER','faasupdate','create','create'),('RPT-GR-BATCH','RPT.ASSESSOR','batchgr','create','create'),('RPT-LEDGER-A','RPT.LANDTAX','rptledger','approve','approve'),('RPT-LEDGER-C','RPT.LANDTAX','rptledger','capturepayment','capturepayment'),('RPT-LEDGER-CHANGESTATE','RPT.LANDTAX','rptledger','changestate','changestate'),('RPT-LEDGER-E','RPT.LANDTAX','rptledger','edit','edit'),('RPT-LEDGER-FL','RPT.LANDTAX','rptledger','fixledger','fixledger'),('RPT-NA-C','RPT.APPRAISER','noticeofassessment','create','create'),('RPT-NA-R','RPT.APPRAISER','noticeofassessment','read','read'),('RPT-RESECTION-C','RPT.APPRAISER','resection','create','create'),('RPT-RESECTION-D','RPT.APPRAISER','resection','delete','delete'),('RPT-RESECTION-E','RPT.APPRAISER','resection','edit','edit'),('RPT-RESECTION-S','RPT.APPRAISER','resection','submit','submit'),('RPT-SD-C','RPT.APPRAISER','subdivision','create','create'),('RPT-SD-D','RPT.APPRAISER','subdivision','delete','delete'),('RPT-SD-R','RPT.APPRAISER','subdivision','read','read'),('RPT-SD-S','RPT.APPRAISER','subdivision','submit','submit'),('RPT-SD-U','RPT.APPRAISER','subdivision','edit','edit'),('RPT-TAXCLEARANCE-C','RPT.LANDTAX','taxclearance','create','create'),('RPT-UTIL-MODIFYPIN','RPT.APPRAISER','util','modifypin','modifypin'),('SUBCOLLECTOR-DISAPPROVED','TREASURY.SUBCOLLECTOR','batchcapture','disapprove','disapprove'),('SUBCOLLECTOR-POST','TREASURY.SUBCOLLECTOR','batchcapture','post','post'),('TREASURY-AFO-afserial-forward','TREASURY.AFO','afserial','forward','Forward'),('TREASURY-AFO-cashticket-forward','TREASURY.AFO','cashticket','forward','Forward'),('TREASURY-COLLECTOR','TREASURY.COLLECTOR','receipt','online','online'),('TREASURY-DATA_CONTROLLER-batchcapture-manage','TREASURY.DATA_CONTROLLER','batchcapture','manage','Manage Batch Capture'),('TREASURY-LIQUIDATING_OFFICER','TREASURY.LIQUIDATING_OFFICER','cashbook','list','list'),('TREASURY-MASTER-createbank','TREASURY.MASTER','bank','create','Create'),('TREASURY-MASTER-createcashbook','TREASURY.MASTER','cashbook','create','Create'),('TREASURY-MASTER-createcollectiongroup','TREASURY.MASTER','collectiongroup','create','Create'),('TREASURY-MASTER-createcollectiontype','TREASURY.MASTER','collectiontype','create','Create'),('TREASURY-MASTER-createFund','TREASURY.MASTER','fund','create','Create'),('TREASURY-MASTER-createRevenueItem','TREASURY.MASTER','revenueitem','create','Create'),('TREASURY-MASTER-createsreaccount','TREASURY.MASTER','sreaccount','create','Create'),('TREASURY-MASTER-deletebank','TREASURY.MASTER','bank','delete','Delete'),('TREASURY-MASTER-deletecashbook','TREASURY.MASTER','cashbook','delete','Delete'),('TREASURY-MASTER-deletecollectiongroup','TREASURY.MASTER','collectiongroup','delete','Delete'),('TREASURY-MASTER-deletecollectiontype','TREASURY.MASTER','collectiontype','delete','Delete'),('TREASURY-MASTER-deleteFund','TREASURY.MASTER','fund','delete','Delete'),('TREASURY-MASTER-deleteRevenueItem','TREASURY.MASTER','revenueitem','delete','Delete'),('TREASURY-MASTER-deletesreaccount','TREASURY.MASTER','sreaccount','delete','Delete'),('TREASURY-MASTER-editbank','TREASURY.MASTER','bank','edit','Edit'),('TREASURY-MASTER-editcashbook','TREASURY.MASTER','cashbook','edit','Edit'),('TREASURY-MASTER-editcollectiongroup','TREASURY.MASTER','collectiongroup','edit','Edit'),('TREASURY-MASTER-editcollectiontype','TREASURY.MASTER','collectiontype','edit','Edit'),('TREASURY-MASTER-editFund','TREASURY.MASTER','fund','edit','Edit'),('TREASURY-MASTER-editRevenueItem','TREASURY.MASTER','revenueitem','edit','Edit'),('TREASURY-MASTER-editsreaccount','TREASURY.MASTER','sreaccount','edit','Edit'),('TREASURY-MASTER-openbank','TREASURY.MASTER','bank','open','Open'),('TREASURY-MASTER-opencashbook','TREASURY.MASTER','cashbook','open','Open'),('TREASURY-MASTER-opencollectiongroup','TREASURY.MASTER','collectiongroup','open','Open'),('TREASURY-MASTER-opencollectiontype','TREASURY.MASTER','collectiontype','open','Open'),('TREASURY-MASTER-openFund','TREASURY.MASTER','fund','open','Open'),('TREASURY-MASTER-openRevenueItem','TREASURY.MASTER','revenueitem','open','Open'),('TREASURY-MASTER-opensreaccount','TREASURY.MASTER','sreaccount','open','Open'),('TREASURY-MASTER-viewbank','TREASURY.MASTER','bank','view','View'),('TREASURY-MASTER-viewcashbook','TREASURY.MASTER','cashbook','view','View'),('TREASURY-MASTER-viewcollectiongroup','TREASURY.MASTER','collectiongroup','view','View'),('TREASURY-MASTER-viewcollectiontype','TREASURY.MASTER','collectiontype','view','View'),('TREASURY-MASTER-viewFund','TREASURY.MASTER','fund','view','View'),('TREASURY-MASTER-viewRevenueItem','TREASURY.MASTER','revenueitem','view','View'),('TREASURY-MASTER-viewsreaccount','TREASURY.MASTER','sreaccount','view','View'),('TREASURY-REPORT-collectionbyfund-viewreport','TREASURY.REPORT','collectionbyfund','viewreport','View Report'),('TREASURY-REPORT-directtocash-viewreport','TREASURY.REPORT','directtocash','viewreport','View Report'),('TREASURY-REPORT-srs-viewreport','TREASURY.REPORT','srs','viewreport','View Report'),('TREASURY-REPORT-statementofrevenue-viewreport','TREASURY.REPORT','statementofrevenue','viewreport','View Report'),('TREASURY-SHARED-bankdeposit-view','TREASURY.SHARED','bankdeposit','view','View List'),('TREASURY-SHARED-liquidation-view','TREASURY.SHARED','liquidation','view','View List'),('TREASURY-SHARED-remittance-view','TREASURY.SHARED','remittance','view','View List');
/*!40000 ALTER TABLE `sys_usergroup_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
INSERT INTO `sys_var` VALUES ('allow_consolidation_with_balance','false',NULL,'checkbox','ASSESSOR'),('allow_faas_transaction_with_balance','false',NULL,'checkbox','ASSESSOR'),('allow_general_collection_discount','0',NULL,'boolean','TC'),('allow_subdivision_with_balance','false',NULL,'checkbox','ASSESSOR'),('ctc_brgyshare','0.50','CTC Barangay Share',NULL,'CTC'),('current_ry','2010',NULL,'integer','ASSESSOR'),('deposit_collection_by_bank_account','1','Deposit collection by bank account instead of by fund','checkbox','TC'),('deposit_print_date','0',NULL,NULL,'TC'),('faas_datacapture_allow_edit_av','1',NULL,'checkbox','ASSESSOR'),('gr_ordinance_date','2013-04-04',NULL,'date','ASSESSOR'),('gr_ordinance_no','13-5985',NULL,'text','ASSESSOR'),('gr_renumber_pin','0',NULL,'checkbox','ASSESSOR'),('gr_td_autonumber','true',NULL,'checkbox','ASSESSOR'),('invalid_login_access_date_interval','1m','number of hours/days access date is moved when failed_login_max_retries is reached( d=days, h=hours)',NULL,NULL),('invalid_login_action','1','0 - suspend 1-move access to a later date',NULL,NULL),('invalid_login_max_retries','5','No. of times a user can retry login before disabling account',NULL,NULL),('landtax_certifiedby','-',NULL,'text','LANDTAX'),('landtax_certifiedby_title','ASST. CITY TREASURER - OPERATION',NULL,'text','LANDTAX'),('lgu_name','ILIGAN CITY',NULL,'text','ASSESSOR'),('lgu_objid','169',NULL,'text','ASSESSOR'),('lgu_region','REGION X',NULL,NULL,NULL),('lgu_type','city','Type of LGU. Valid values are city, municipality and province','text','ASSESSOR'),('pin_autonumber','0',NULL,'checkbox','ASSESSOR'),('pin_type','new','PIN Formatting Type valid values: old or new','text','ASSESSOR'),('pwd_change_cycle','1','No. of times the user cannot use a repeating password',NULL,'SYSTEM'),('pwd_change_date_interval','365M','No. of days/months before a user is required to change their password (d=days, M=months)',NULL,'SYSTEM'),('pwd_change_login_count','0','No. of times a user has successfully logged in before changing their password. (0=no limit) ',NULL,'SYSTEM'),('receipt_item_printout_count','10',NULL,NULL,'SYSTEM'),('rptbilling_assessed_value_fact_years','2002,2013',NULL,NULL,'LANDTAX'),('rpt_round_to_ten_item_assessed_value','0',NULL,'checkbox','ASSESSOR'),('sangguinan_name','SANGGUNIANG PANLUNGSOD','sangguinian name','text','ASSESSOR'),('sa_pwd','ba4d084b31b41fbe55302c0429d93c81',NULL,NULL,NULL),('secretary_name',NULL,NULL,NULL,NULL),('secretary_title',NULL,NULL,NULL,NULL),('server_timezone','Asia/Shanghai','this must be matched with default timezone of server',NULL,NULL),('session_timeout_interval','1d ','expiry dates of inactive session (d=days, h=hours)',NULL,'SYSTEM'),('subdivision_allow_equal_area_only','1','Allow Subdivision with equal area only ','checkbox','ASSESSOR'),('system_pwd','!1234#','system password',NULL,'SYSTEM'),('td_autonumber','true',NULL,'checkbox','ASSESSOR'),('td_autonumber_sequence_count','5',NULL,'integer','ASSESSOR'),('td_format','Y-B','Tax Declaration No. format. Options: Y- revision year, M-municipality index, C - city index, D-district index, B=-barangay index','text','ASSESSOR'),('td_report_display_appraisedby','0',NULL,'checkbox','ASSESSOR'),('td_report_display_recommendedby','0','Display Recommended by ',NULL,'ASSESSOR'),('td_report_item_format','BLGF','Valid Values: BLGF or MODIFIED','text','ASSESSOR'),('td_show_landinfo_on_improvements','1','Show the land information such as boundary etc in the improvement tax declaration. Options: 1 - show; 0 - hide','checkbox','ASSESSOR'),('url_logo_assessor','http://localhost/downloads/images/assessor.png','ASSESSOR URL LOG',NULL,'ASSESSOR'),('url_logo_lgu','http://localhost/downloads/images/lgu.png','logo path',NULL,'LGU'),('url_logo_treasury','http://localhost/downloads/images/treasury.png','TREASURY LOGO',NULL,'TREASURY');
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbletracsaccountmapping`
--

LOCK TABLES `tbletracsaccountmapping` WRITE;
/*!40000 ALTER TABLE `tbletracsaccountmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbletracsaccountmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `txnlog`
--

LOCK TABLES `txnlog` WRITE;
/*!40000 ALTER TABLE `txnlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `txnlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `txnref`
--

LOCK TABLES `txnref` WRITE;
/*!40000 ALTER TABLE `txnref` DISABLE KEYS */;
/*!40000 ALTER TABLE `txnref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `txnsignatory`
--

LOCK TABLES `txnsignatory` WRITE;
/*!40000 ALTER TABLE `txnsignatory` DISABLE KEYS */;
/*!40000 ALTER TABLE `txnsignatory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `workflowstate`
--

LOCK TABLES `workflowstate` WRITE;
/*!40000 ALTER TABLE `workflowstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowstate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-09 13:18:07
