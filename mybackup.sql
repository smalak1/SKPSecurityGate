-- MySQL dump 10.13  Distrib 5.7.36, for Win64 (x86_64)
--
-- Host: localhost    Database: skpsecuritygate
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Current Database: `skpsecuritygate`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `skpsecuritygate` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `skpsecuritygate`;

--
-- Table structure for table `acl_user_role_rlt`
--

DROP TABLE IF EXISTS `acl_user_role_rlt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_user_role_rlt` (
  `rlt_pk` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rlt_pk`),
  KEY `acl_user_role_rlt_user_id_IDX` (`user_id`,`role_id`,`activate_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_account_details`
--

DROP TABLE IF EXISTS `bank_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_account_details` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(100) NOT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `swift_code` varchar(100) DEFAULT NULL,
  `micr_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_group`
--

DROP TABLE IF EXISTS `client_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_group` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(500) DEFAULT NULL,
  `updated_by` bigint(20) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_service_mapping`
--

DROP TABLE IF EXISTS `client_service_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_service_mapping` (
  `client_service_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL,
  `activate_flag` tinyint(40) DEFAULT NULL,
  PRIMARY KEY (`client_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_vendor_master`
--

DROP TABLE IF EXISTS `client_vendor_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_vendor_master` (
  `client_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `address` varchar(5000) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `contact_no1` varchar(50) DEFAULT NULL,
  `contact_no2` varchar(50) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `gst` varchar(50) DEFAULT NULL,
  `client_vendor` varchar(10) DEFAULT NULL,
  `contact_person` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmn_country_mst`
--

DROP TABLE IF EXISTS `cmn_country_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmn_country_mst` (
  `country_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_audit_trail`
--

DROP TABLE IF EXISTS `frm_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_audit_trail` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `url` varchar(5000) DEFAULT NULL,
  `parameters` longtext,
  `accessed_time` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `browser_name` varchar(300) DEFAULT NULL,
  `responded_time` datetime DEFAULT NULL,
  `response_string` longtext,
  PRIMARY KEY (`audit_id`),
  KEY `frm_audit_trail_user_name_IDX` (`user_name`) USING BTREE,
  KEY `frm_audit_trail_accessed_time_IDX` (`accessed_time`) USING BTREE,
  KEY `frm_audit_trail_user_name_accessed_time_IDX` (`user_name`,`accessed_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_error_log`
--

DROP TABLE IF EXISTS `frm_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_error_log` (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `error_message` mediumtext,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_query_log`
--

DROP TABLE IF EXISTS `frm_query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_query_log` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `query_string` mediumtext NOT NULL,
  `time_taken` decimal(10,0) NOT NULL,
  `accessed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`query_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday_master`
--

DROP TABLE IF EXISTS `holiday_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_master` (
  `holiday_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(100) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday_master_1`
--

DROP TABLE IF EXISTS `holiday_master_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_master_1` (
  `holiday_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(100) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_category`
--

DROP TABLE IF EXISTS `mst_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `activate_flag` tinyint(4) NOT NULL,
  `created_Date` datetime NOT NULL,
  `updated_Date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `mst_category_activate_flag_IDX` (`activate_flag`,`app_id`) USING BTREE,
  KEY `mst_category_app_id_IDX` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_client`
--

DROP TABLE IF EXISTS `mst_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_client` (
  `client_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) DEFAULT NULL,
  `address_of_the_establishment` varchar(100) DEFAULT NULL,
  `date_of_setup` date DEFAULT NULL,
  `company_pan` varchar(10) NOT NULL,
  `ownership_details` varchar(10) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  `contact_person_name` varchar(200) DEFAULT NULL,
  `contact_person_email_id` varchar(50) DEFAULT NULL,
  `contact_person_mobile_no` bigint(10) DEFAULT NULL,
  `director_name` varchar(100) DEFAULT NULL,
  `director_pan_card` varchar(10) DEFAULT NULL,
  `activate_flag` tinyint(4) NOT NULL,
  `updated_by` bigint(11) DEFAULT NULL,
  `updated_Date` datetime DEFAULT NULL,
  `director_dob` date DEFAULT NULL,
  `director_email_id` varchar(100) DEFAULT NULL,
  `director_mobile_no` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_customer`
--

DROP TABLE IF EXISTS `mst_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `mobile_number` mediumtext NOT NULL,
  `alternate_mobile_no` varchar(10) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pan_no` varchar(100) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `activate_flag` tinyint(4) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_Date` datetime DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `client_vendor_flag` varchar(1) DEFAULT NULL,
  `division` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `mst_customer_activate_flag_IDX` (`activate_flag`,`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_group`
--

DROP TABLE IF EXISTS `mst_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_unique_number` bigint(20) DEFAULT NULL,
  `group_code` varchar(100) NOT NULL,
  `activate_flag` tinyint(4) NOT NULL,
  `created_Date` datetime NOT NULL,
  `updated_Date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `mst_group_un` (`group_unique_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_services`
--

DROP TABLE IF EXISTS `mst_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_category_id` int(11) NOT NULL,
  `service_name` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `activate_flag` tinyint(4) NOT NULL,
  `due_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `occurance` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `parent_category_id` (`parent_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_attachment_mst`
--

DROP TABLE IF EXISTS `tbl_attachment_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attachment_mst` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `type` varchar(300) DEFAULT NULL,
  `attachment_asblob` longblob,
  PRIMARY KEY (`attachment_id`),
  KEY `tbl_attachment_mst_file_id_IDX` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_user_mst`
--

DROP TABLE IF EXISTS `tbl_user_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_mst` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `aadhar_card_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `tbl_user_mst_username_IDX` (`username`,`password`,`activate_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trn_checkin_register`
--

DROP TABLE IF EXISTS `trn_checkin_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trn_checkin_register` (
  `check_in_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `check_in_type` char(1) NOT NULL,
  `checked_time` datetime NOT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`check_in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor_entry`
--

DROP TABLE IF EXISTS `visitor_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_entry` (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_name` varchar(45) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `purpose_of_visit` varchar(100) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `in_time` datetime DEFAULT NULL,
  `activate_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 15:28:16
