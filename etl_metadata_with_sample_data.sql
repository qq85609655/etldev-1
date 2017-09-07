/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : etl_metadata_cmb

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-07 17:47:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for analysis_question
-- ----------------------------
DROP TABLE IF EXISTS `analysis_question`;
CREATE TABLE `analysis_question` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `question` varchar(512) DEFAULT NULL,
  `reply` varchar(512) DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `reply_prsn` varchar(64) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of analysis_question
-- ----------------------------

-- ----------------------------
-- Table structure for column_stats
-- ----------------------------
DROP TABLE IF EXISTS `column_stats`;
CREATE TABLE `column_stats` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `collect_time` date NOT NULL,
  `max_value` varchar(128) DEFAULT NULL,
  `min_value` varchar(128) DEFAULT NULL,
  `value_count` int(11) DEFAULT NULL,
  `null_count` int(11) DEFAULT NULL,
  `value_histogram_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`column_name`,`collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of column_stats
-- ----------------------------

-- ----------------------------
-- Table structure for col_value_histogram
-- ----------------------------
DROP TABLE IF EXISTS `col_value_histogram`;
CREATE TABLE `col_value_histogram` (
  `value_histogram_id` varchar(20) NOT NULL,
  `mode_value` varchar(128) NOT NULL,
  `mode_value_freq` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_histogram_id`,`mode_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of col_value_histogram
-- ----------------------------

-- ----------------------------
-- Table structure for dw_columns
-- ----------------------------
DROP TABLE IF EXISTS `dw_columns`;
CREATE TABLE `dw_columns` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `column_id` int(11) DEFAULT NULL,
  `data_type` varchar(64) DEFAULT NULL,
  `phy_name` varchar(64) DEFAULT NULL,
  `agg_period` varchar(20) DEFAULT NULL,
  `is_pk` tinyint(1) DEFAULT NULL,
  `chain_compare` tinyint(1) DEFAULT NULL,
  `is_partition_key` tinyint(1) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_columns
-- ----------------------------
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '交易', '交易流水号', '1', 'string', 'trans_id', null, '1', '0', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '交易', '交易类型', '5', 'string', 'trans_type', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '交易', '发生额', '3', 'string', 'trans_amt', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '交易', '客户号', '4', 'string', 'customer_id', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '交易', '渠道代码', '2', 'string', 'channel_id', null, '0', '1', '0', '');
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '客户号', '1', 'string', 'customer_id', null, '1', '0', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '客户姓名', '2', 'string', 'cust_name', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '性别', '6', 'string', 'gender', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '源系统代码', '7', 'string', 'sys_code', null, '0', '0', '1', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '电话号码', '5', 'string', 'tel_number', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '证件号码', '4', 'string', 'cert_id', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '客户', '证件类型', '3', 'integer', 'cert_type', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '余额', '6', 'string', 'balance', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '客户号', '4', 'string', 'customer_id', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '开户日期', '3', 'string', 'open_dt', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '开户机构', '5', 'string', 'org_id', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '账户号', '1', 'string', 'account_id', null, '1', '0', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '账户状态', '7', 'string', 'status', null, '0', '1', '0', null);
INSERT INTO `dw_columns` VALUES ('DW', 'pdata', '账户', '账户类型', '2', 'string', 'account_type', null, '0', '1', '0', null);

-- ----------------------------
-- Table structure for dw_column_mapping
-- ----------------------------
DROP TABLE IF EXISTS `dw_column_mapping`;
CREATE TABLE `dw_column_mapping` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `src_sys_name` varchar(64) NOT NULL,
  `src_schema` varchar(64) NOT NULL,
  `src_table_name` varchar(64) NOT NULL,
  `src_column_name` varchar(64) NOT NULL,
  `load_batch` int(11) NOT NULL,
  `load_group` int(11) NOT NULL,
  `column_expr` text,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`column_name`,`src_sys_name`,`src_schema`,`src_table_name`,`src_column_name`,`load_batch`,`load_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_column_mapping
-- ----------------------------
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '客户号', 'sys1', 'db1', 'customer1', 'customer_id', '1', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '客户号', 'sys1', 'db1', 'customer1', 'customer_id', '1', '1', 'concat(customer_id, \'001\')', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '客户号', 'sys2', 'db1', 'customer2', 'customer_id', '2', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '客户号', 'sys2', 'db1', 'customer2', 'customer_id', '2', '1', 'concat(customer_id, \'001\')', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '客户姓名', 'sys1', 'db1', 'customer1', 'cust_name', '1', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '客户姓名', 'sys2', 'db1', 'customer2', 'cust_name', '2', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '性别', 'sys1', 'db1', 'customer1', 'gender', '1', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '性别', 'sys2', 'db1', 'customer2', 'gender', '2', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '源系统代码', '', '', '', '', '1', '0', '\'1\'', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '源系统代码', '', '', '', '', '2', '0', '\'2\'', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '电话号码', 'sys1', 'db1', 'customer1', 'tel_number', '1', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '电话号码', 'sys2', 'db1', 'customer2', 'tel_number', '2', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '证件号码', 'sys1', 'db1', 'customer1', 'cert_id', '1', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '证件号码', 'sys2', 'db1', 'customer2', 'cert_id', '2', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '证件类型', 'code', 'db1', 'code1', 'cert_type', '1', '0', '', '');
INSERT INTO `dw_column_mapping` VALUES ('DW', 'pdata', '客户', '证件类型', 'code', 'db1', 'code1', 'cert_type', '2', '0', '', '');

-- ----------------------------
-- Table structure for dw_column_mapping_his
-- ----------------------------
DROP TABLE IF EXISTS `dw_column_mapping_his`;
CREATE TABLE `dw_column_mapping_his` (
  `column_name` varchar(18) NOT NULL,
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(18) NOT NULL,
  `table_name` varchar(18) NOT NULL,
  `sys_name` varchar(18) NOT NULL,
  `version` int(11) NOT NULL,
  `src_column_name` varchar(18) DEFAULT NULL,
  `src_table_name` varchar(18) DEFAULT NULL,
  `src_schema` varchar(18) DEFAULT NULL,
  `src_sys_name` varchar(18) DEFAULT NULL,
  `column_expr` text,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`column_name`,`load_batch`,`schema_name`,`table_name`,`sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_column_mapping_his
-- ----------------------------

-- ----------------------------
-- Table structure for dw_subject
-- ----------------------------
DROP TABLE IF EXISTS `dw_subject`;
CREATE TABLE `dw_subject` (
  `subject_name` varchar(64) NOT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `phy_name` varchar(64) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_subject
-- ----------------------------
INSERT INTO `dw_subject` VALUES ('default_subject', '默认主题', null, null);

-- ----------------------------
-- Table structure for dw_table
-- ----------------------------
DROP TABLE IF EXISTS `dw_table`;
CREATE TABLE `dw_table` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `phy_name` varchar(64) DEFAULT NULL,
  `load_mode` varchar(20) DEFAULT NULL,
  `clear_mode` varchar(20) DEFAULT NULL,
  `keep_load_dt` tinyint(1) DEFAULT NULL,
  `do_aggregate` tinyint(1) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `is_fact` tinyint(1) DEFAULT NULL,
  `is_single_source` tinyint(1) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table
-- ----------------------------
INSERT INTO `dw_table` VALUES ('DW', 'pdata', '交易', 'transaction', '追加', null, null, null, 'default_subject', null, null, null);
INSERT INTO `dw_table` VALUES ('DW', 'pdata', '客户', 'customer', '追加', '', '0', '0', 'default_subject', null, '1', null);
INSERT INTO `dw_table` VALUES ('DW', 'pdata', '机构', 'organization', '更新', null, null, null, 'default_subject', null, null, null);
INSERT INTO `dw_table` VALUES ('DW', 'pdata', '活动', 'activity', '追加', null, null, null, 'default_subject', null, null, null);
INSERT INTO `dw_table` VALUES ('DW', 'pdata', '渠道', 'channel', '更新', null, null, null, 'default_subject', null, null, null);
INSERT INTO `dw_table` VALUES ('DW', 'pdata', '账户', 'account', '更新', null, null, null, 'default_subject', null, null, null);

-- ----------------------------
-- Table structure for dw_table_mapping
-- ----------------------------
DROP TABLE IF EXISTS `dw_table_mapping`;
CREATE TABLE `dw_table_mapping` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `src_sys_name` varchar(64) NOT NULL,
  `src_schema` varchar(64) NOT NULL,
  `src_table_name` varchar(64) NOT NULL,
  `load_batch` int(11) NOT NULL,
  `join_order` int(11) NOT NULL,
  `table_alias` varchar(64) DEFAULT NULL,
  `join_type` varchar(20) DEFAULT NULL,
  `join_condition` text,
  `filter_condition` text,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`src_sys_name`,`src_schema`,`src_table_name`,`load_batch`,`join_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table_mapping
-- ----------------------------
INSERT INTO `dw_table_mapping` VALUES ('DW', 'pdata', '客户', 'code', 'db1', 'code1', '0', '1', 'c1', 'inner join', 'c1.cert_type = t0.cert_type', '', '');
INSERT INTO `dw_table_mapping` VALUES ('DW', 'pdata', '客户', 'sys1', 'db1', 'customer1', '1', '0', 't0', '', '', '', '');
INSERT INTO `dw_table_mapping` VALUES ('DW', 'pdata', '客户', 'sys2', 'db1', 'customer2', '2', '0', 't0', '', '', '', '');

-- ----------------------------
-- Table structure for dw_table_mapping_his
-- ----------------------------
DROP TABLE IF EXISTS `dw_table_mapping_his`;
CREATE TABLE `dw_table_mapping_his` (
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(18) NOT NULL,
  `src_schema` varchar(18) NOT NULL,
  `table_name` varchar(18) NOT NULL,
  `src_table_name` varchar(18) NOT NULL,
  `sys_name` varchar(18) NOT NULL,
  `src_sys_name` varchar(18) NOT NULL,
  `version` int(11) NOT NULL,
  `table_alias` varchar(64) DEFAULT NULL,
  `join_order` int(11) DEFAULT NULL,
  `join_type` varchar(20) DEFAULT NULL,
  `join_condition` text,
  `filter_condition` text,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`load_batch`,`schema_name`,`src_schema`,`table_name`,`src_table_name`,`sys_name`,`src_sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table_mapping_his
-- ----------------------------

-- ----------------------------
-- Table structure for ent_system
-- ----------------------------
DROP TABLE IF EXISTS `ent_system`;
CREATE TABLE `ent_system` (
  `sys_name` varchar(64) NOT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_system
-- ----------------------------

-- ----------------------------
-- Table structure for etl_developer
-- ----------------------------
DROP TABLE IF EXISTS `etl_developer`;
CREATE TABLE `etl_developer` (
  `etl_dvlpr_name` varchar(64) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`etl_dvlpr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_developer
-- ----------------------------

-- ----------------------------
-- Table structure for etl_tables
-- ----------------------------
DROP TABLE IF EXISTS `etl_tables`;
CREATE TABLE `etl_tables` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_tables
-- ----------------------------

-- ----------------------------
-- Table structure for etl_tasks
-- ----------------------------
DROP TABLE IF EXISTS `etl_tasks`;
CREATE TABLE `etl_tasks` (
  `task_name` varchar(128) NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `sys_name` varchar(64) DEFAULT NULL,
  `schema_name` varchar(64) DEFAULT NULL,
  `table_name` varchar(64) DEFAULT NULL,
  `etl_dvlpr_name` varchar(64) DEFAULT NULL,
  `plan_start_dt` date DEFAULT NULL,
  `actual_start_dt` date DEFAULT NULL,
  `plan_finish_dt` date DEFAULT NULL,
  `actual_finish_dt` date DEFAULT NULL,
  `task_status` varchar(20) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_tasks
-- ----------------------------
INSERT INTO `etl_tasks` VALUES ('pdata.account', '3', 'DW', 'pdata', '账户', 'user1', null, null, null, null, '', '测试2');
INSERT INTO `etl_tasks` VALUES ('pdata.activity', '5', 'DW', 'pdata', '活动', 'user3', null, '2017-10-15', null, null, '', '');
INSERT INTO `etl_tasks` VALUES ('pdata.channel', '4', 'DW', 'pdata', '渠道', 'user2', null, '2017-10-15', null, null, '', '');
INSERT INTO `etl_tasks` VALUES ('pdata.customer', '1', 'DW', 'pdata', '客户', 'user3', '2017-09-02', null, null, null, '', '测试');
INSERT INTO `etl_tasks` VALUES ('pdata.organization', '6', 'DW', 'pdata', '机构', 'user2', null, null, null, null, '', '');
INSERT INTO `etl_tasks` VALUES ('pdata.transaction', '2', 'DW', 'pdata', '交易', 'user2', '2017-09-02', null, null, null, '', '测试1');

-- ----------------------------
-- Table structure for etl_tasks_his
-- ----------------------------
DROP TABLE IF EXISTS `etl_tasks_his`;
CREATE TABLE `etl_tasks_his` (
  `version` int(11) NOT NULL,
  `task_name` varchar(128) NOT NULL,
  `schema_name` varchar(18) DEFAULT NULL,
  `src_table_name` varchar(20) DEFAULT NULL,
  `etl_dvlpr_name` varchar(18) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `sys_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`version`,`task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_tasks_his
-- ----------------------------

-- ----------------------------
-- Table structure for src_column_analysis
-- ----------------------------
DROP TABLE IF EXISTS `src_column_analysis`;
CREATE TABLE `src_column_analysis` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `data_type` varchar(20) DEFAULT NULL,
  `allow_null` tinyint(1) DEFAULT NULL,
  `is_pk` tinyint(1) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `null_count` int(11) DEFAULT NULL,
  `uv_count` int(11) DEFAULT NULL,
  `doc_data_type` varchar(20) DEFAULT NULL,
  `doc_cn_name` varchar(64) DEFAULT NULL,
  `doc_allow_null` tinyint(1) DEFAULT NULL,
  `doc_is_pk` tinyint(1) DEFAULT NULL,
  `column_len` int(11) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `ref_table` varchar(64) DEFAULT NULL,
  `ref_column` varchar(64) DEFAULT NULL,
  `doc_col_len` int(11) DEFAULT NULL,
  `doc_ref_tbl` varchar(64) DEFAULT NULL,
  `doc_ref_col` varchar(64) DEFAULT NULL,
  `uv_check` tinyint(1) DEFAULT NULL,
  `null_check` tinyint(1) DEFAULT NULL,
  `value_check` tinyint(1) DEFAULT NULL,
  `ref_check` tinyint(1) DEFAULT NULL,
  `ref_ok` tinyint(1) DEFAULT NULL,
  `unique_values` text,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_column_analysis
-- ----------------------------
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'account1', 'account_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'account1', 'account_type', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'account1', 'balance', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'account1', 'customer_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'account1', 'open_dt', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'account1', 'org_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'customer1', 'cert_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'customer1', 'cert_type', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'customer1', 'customer_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'customer1', 'cust_name', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'customer1', 'gender', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'customer1', 'tel_number', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'transaction1', 'channel_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'transaction1', 'customer_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'transaction1', 'trans_amt', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'transaction1', 'trans_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys1', 'db1', 'transaction1', 'trans_type', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db1', 'customer2', 'cert_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db1', 'customer2', 'cert_type', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db1', 'customer2', 'customer_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db1', 'customer2', 'cust_name', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db1', 'customer2', 'gender', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db1', 'customer2', 'tel_number', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db2', 'transaction2', 'channel_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db2', 'transaction2', 'customer_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db2', 'transaction2', 'trans_amt', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db2', 'transaction2', 'trans_id', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `src_column_analysis` VALUES ('sys2', 'db2', 'transaction2', 'trans_type', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for src_column_analysis_his
-- ----------------------------
DROP TABLE IF EXISTS `src_column_analysis_his`;
CREATE TABLE `src_column_analysis_his` (
  `column_name` varchar(64) NOT NULL,
  `schema_name` varchar(18) NOT NULL,
  `table_name` varchar(18) NOT NULL,
  `sys_name` varchar(18) NOT NULL,
  `version` int(11) NOT NULL,
  `data_type` varchar(20) DEFAULT NULL,
  `allow_null` tinyint(1) DEFAULT NULL,
  `is_pk` tinyint(1) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `null_count` int(11) DEFAULT NULL,
  `uv_count` int(11) DEFAULT NULL,
  `doc_data_type` varchar(20) DEFAULT NULL,
  `doc_cn_name` varchar(64) DEFAULT NULL,
  `doc_allow_null` tinyint(1) DEFAULT NULL,
  `doc_is_pk` tinyint(1) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `column_len` int(11) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `ref_table` varchar(64) DEFAULT NULL,
  `ref_column` varchar(64) DEFAULT NULL,
  `doc_col_len` int(11) DEFAULT NULL,
  `doc_ref_tbl` varchar(64) DEFAULT NULL,
  `doc_ref_col` varchar(64) DEFAULT NULL,
  `uv_check` tinyint(1) DEFAULT NULL,
  `null_check` tinyint(1) DEFAULT NULL,
  `value_check` tinyint(1) DEFAULT NULL,
  `ref_check` tinyint(1) DEFAULT NULL,
  `unique_values` text,
  `ref_ok` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`column_name`,`schema_name`,`table_name`,`sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_column_analysis_his
-- ----------------------------

-- ----------------------------
-- Table structure for src_table_analysis
-- ----------------------------
DROP TABLE IF EXISTS `src_table_analysis`;
CREATE TABLE `src_table_analysis` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `row_count` int(11) DEFAULT NULL,
  `need_ext` tinyint(1) DEFAULT NULL,
  `need_int` tinyint(1) DEFAULT NULL,
  `no_int_cmt` varchar(512) DEFAULT NULL,
  `ext_cycle` varchar(64) DEFAULT NULL,
  `is_inc_ext` tinyint(1) DEFAULT NULL,
  `stbl_name` varchar(64) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `load_to_fact` tinyint(1) DEFAULT NULL,
  `ext_condition` text,
  `description` varchar(512) DEFAULT NULL,
  `no_ext_cmt` varchar(512) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_table_analysis
-- ----------------------------
INSERT INTO `src_table_analysis` VALUES ('code', 'db1', 'code1', '码表1', null, null, null, null, null, '0', 'pdata.code1', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('code', 'db1', 'code2', '码表2', null, null, null, null, null, '0', 'pdata.code2', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('code', 'db1', 'code3', '码表3', null, null, null, null, null, '0', 'pdata.code3', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys1', 'db1', 'account1', '账户表1', null, null, null, null, null, '1', 'sdata.account1', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys1', 'db1', 'customer1', '客户表1', null, null, null, null, null, '1', 'sdata.customer1', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys1', 'db1', 'transaction1', '交易表1', null, null, null, null, null, '0', 'sdata.transaction1', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys1', 'db2', 'channel1', '渠道表1', null, null, null, null, null, '1', 'sdata.channel1', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys2', 'db1', 'customer2', '客户表2', null, null, null, null, null, '1', 'sdata.customer2', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys2', 'db2', 'activity2', '活动表2', null, null, null, null, null, '0', 'sdata.activity2', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys2', 'db2', 'organization2', '机构表2', null, null, null, null, null, '1', 'sdata.organization2', null, null, null, null, null, null);
INSERT INTO `src_table_analysis` VALUES ('sys2', 'db2', 'transaction2', '交易表2', null, null, null, null, null, '0', 'sdata.transaction2', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for src_table_analysis_his
-- ----------------------------
DROP TABLE IF EXISTS `src_table_analysis_his`;
CREATE TABLE `src_table_analysis_his` (
  `schema_name` varchar(18) NOT NULL,
  `table_name` varchar(18) NOT NULL,
  `sys_name` varchar(18) NOT NULL,
  `version` int(11) NOT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `row_count` int(11) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `need_ext` tinyint(1) DEFAULT NULL,
  `no_ext_cmt` varchar(512) DEFAULT NULL,
  `need_int` tinyint(1) DEFAULT NULL,
  `no_int_cmt` varchar(512) DEFAULT NULL,
  `ext_cycle` varchar(64) DEFAULT NULL,
  `is_inc_ext` tinyint(1) DEFAULT NULL,
  `ext_condition` text,
  `stbl_name` varchar(64) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `load_to_fact` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`schema_name`,`table_name`,`sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_table_analysis_his
-- ----------------------------

-- ----------------------------
-- Table structure for src_tbl_subject
-- ----------------------------
DROP TABLE IF EXISTS `src_tbl_subject`;
CREATE TABLE `src_tbl_subject` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `subject_name` varchar(64) NOT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_tbl_subject
-- ----------------------------

-- ----------------------------
-- Table structure for system_properties
-- ----------------------------
DROP TABLE IF EXISTS `system_properties`;
CREATE TABLE `system_properties` (
  `property_name` varchar(36) NOT NULL,
  `peroperty_value` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_properties
-- ----------------------------

-- ----------------------------
-- Table structure for table_schema
-- ----------------------------
DROP TABLE IF EXISTS `table_schema`;
CREATE TABLE `table_schema` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `schema_type` varchar(64) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_schema
-- ----------------------------

-- ----------------------------
-- Table structure for table_stats
-- ----------------------------
DROP TABLE IF EXISTS `table_stats`;
CREATE TABLE `table_stats` (
  `sys_name` varchar(64) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `collect_time` date NOT NULL,
  `row_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_stats
-- ----------------------------

-- ----------------------------
-- Table structure for value_histogram
-- ----------------------------
DROP TABLE IF EXISTS `value_histogram`;
CREATE TABLE `value_histogram` (
  `value_histogram_id` varchar(20) NOT NULL,
  PRIMARY KEY (`value_histogram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of value_histogram
-- ----------------------------

-- ----------------------------
-- Table structure for vocabulary
-- ----------------------------
DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE `vocabulary` (
  `cn_word` varchar(64) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `en_word` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cn_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vocabulary
-- ----------------------------
