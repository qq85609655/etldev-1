/*
Navicat MySQL Data Transfer

Source Server         : mysql129
Source Server Version : 50628
Source Host           : 192.168.159.129:3306
Source Database       : etl_metadata1

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-02-21 09:50:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `analysis_question`
-- ----------------------------
DROP TABLE IF EXISTS `analysis_question`;
CREATE TABLE `analysis_question` (
  `column_name` varchar(60) NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `question` varchar(512) DEFAULT NULL,
  `reply` varchar(512) DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `reply_prsn` varchar(60) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  PRIMARY KEY (`sys_name`,`schema_name`,`table_name`,`column_name`),
  KEY `R_36` (`schema_name`,`table_name`,`sys_name`),
  CONSTRAINT `analysis_question_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `src_table_analysis` (`schema_name`, `table_name`, `sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of analysis_question
-- ----------------------------
INSERT INTO `analysis_question` VALUES ('DATAFLAG', null, '1.DATAFLAG=1是有效数据？', '', null, null, null, null, 'JHSY', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT');

-- ----------------------------
-- Table structure for `dw_columns`
-- ----------------------------
DROP TABLE IF EXISTS `dw_columns`;
CREATE TABLE `dw_columns` (
  `column_name` varchar(64) NOT NULL,
  `data_type` varchar(64) DEFAULT NULL,
  `phy_name` varchar(64) DEFAULT NULL,
  `agg_period` varchar(20) DEFAULT NULL,
  `is_pk` tinyint(1) DEFAULT NULL,
  `chain_compare` tinyint(1) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `schema_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `sys_name` varchar(64) NOT NULL,
  `is_partition_key` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`column_name`,`schema_name`,`table_name`,`sys_name`),
  KEY `R_8` (`schema_name`,`table_name`,`sys_name`),
  CONSTRAINT `dw_columns_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `dw_table` (`schema_name`, `table_name`, `sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_columns
-- ----------------------------
INSERT INTO `dw_columns` VALUES ('上级行政区域编号', 'string', 'Parnt_Admin_Regn_ID', null, '0', '0', '', '2', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('专业代码', 'string', 'Major_Cd', null, '0', '0', '', '6', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('个人保险编号', 'string', 'Indv_Insu_ID', null, '0', '0', '', '3', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('个人参保编号', 'string', 'Indv_Insure_ID', null, '1', null, '', '1', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('个人社保编号', 'string', 'Indv_Social_Secu_ID', null, '0', null, '', '2', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('个人社保编号', 'string', 'Indv_Social_Secu_ID', null, '1', '0', '', '1', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口流动状态代码', 'string', 'Popu_Flow_Stat_Cd', null, '0', '0', '', '5', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '1', '0', '', '1', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '1', null, '', '2', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '0', '0', '', '2', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '0', '0', '', '2', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '0', '0', '', '2', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '0', '0', '', '2', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '0', '0', '', '2', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('人口编号', 'string', 'Popu_ID', null, '0', '0', '', '2', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业参保编号', 'string', 'Corp_Insure_ID', null, '0', '0', '', '1', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业名称', 'string', 'Corp_Nm', null, '0', '0', '', '4', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业名称', 'string', 'Corp_Nm', null, '0', '0', '', '2', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业异常编号', 'string', 'Corp_Unus_ID', null, '1', '0', '', '1', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业当前状态代码', 'string', 'Corp_Cur_Stat_Cd', null, '0', '0', '', '5', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业注册号', 'string', 'Corp_Rgst_Num', null, '0', '0', '', '3', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业注册号', 'string', 'Corp_Rgst_Num', null, '0', '0', '', '3', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业注册号', 'string', 'Corp_Rgst_Num', null, '0', '0', '', '2', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业注册号', 'string', 'Corp_Rgst_Num', null, '0', '0', '', '3', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业注册号', 'string', 'Corp_Rgst_Num', null, '0', '0', '', '3', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业注吊销编号', 'string', 'Corp_Revok_Num', null, '1', null, '', '1', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('企业类型代码', 'string', 'Corp_Typ_Cd', null, '0', '0', '', '4', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('低保户编号', 'string', 'Low_Secu_Family_ID', null, '1', '0', '', '1', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('低保类型代码', 'string', 'Low_Secu_Typ_Cd', null, '0', '0', '', '4', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('低保编号', 'string', 'Low_Secu_ID', null, '0', '0', '', '1', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('保障人口数', 'int', 'Low_Secu_Popu_Cnt', null, '0', '0', '', '5', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('保障人口数', 'int', 'Low_Secu_Popu_Cnt', null, '0', '0', '', '10', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('保障金额', 'decimal(18,2)', 'Low_Secu_Amt', null, '0', '0', '', '2', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('保障金额', 'string', 'Low_Secu_Amt', null, '0', '0', '', '12', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('健康状况代码', 'string', 'Hlth_Stat_Cd', null, '0', '0', '', '23', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('健康状况代码', 'string', 'Hlth_Stat_Cd', null, '0', '0', '', '15', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('入学时间', 'date', 'Start_Schl_Tm', null, '0', '0', '', '5', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('公示年度', 'string', 'Pub_Year', null, '0', '0', '', '6', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出生地', 'string', 'Birth_Addr', null, '0', '0', '', '13', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出生日期', 'date', 'Birth_Dt', null, '0', '0', '', '13', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出生编号', 'string', 'Birth_ID', null, '1', '0', '', '1', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出资方式', 'string', 'Invest_Ways', null, '0', null, '', '6', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出资期限', 'string', 'Invest_Term', null, '0', null, '', '5', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出资比例', 'decimal', 'Invest_Ratio', null, '0', null, '', '7', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('出资额', 'decimal', 'Invest_Amt', null, '0', null, '', '4', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('分娩时间', 'timestamp', 'Deliv_Tm', null, '0', '0', '', '12', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('办公电话', 'string', 'Offi_Tel', null, '0', '0', '', '17', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('区县编号', 'string', 'Coty_ID', null, '0', '0', '', '8', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('区域级别', 'string', 'Regn_Lvl', null, '0', '0', '', '5', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('医疗机构代码', 'string', 'Medi_Org_Cd', null, '0', '0', '', '16', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保人姓名', 'string', 'Insure_Holder_Nm', null, '0', '0', '', '6', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保企业编号', 'string', 'Insure_Corp_ID', null, '0', null, '', '3', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保企业编号', 'string', 'Insure_Corp_ID', null, '0', '0', '', '3', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保单位名称', 'string', 'Insure_Corp_Nm', null, '0', '0', '', '3', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保日期', 'date', 'Insure_Dt', null, '0', '0', '', '5', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保状态代码', 'string', 'Insure_Stat_Cd', null, '0', null, '', '5', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保状态代码', 'string', 'Insure_Stat_Cd', null, '0', '0', '', '11', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参保缴费状态', 'string', 'Insure_Paym_Stat_Cd', null, '0', '0', '', '6', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参加工作日期', 'date', 'Join_Work_Dt', null, '0', '0', '', '27', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('参合日期', 'date', 'Join_Coop_Medi_Dt', null, '0', '0', '', '5', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('发证日期', 'date', 'Cert_Dt', null, '0', '0', '', '6', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('发证机关', 'string', 'Cert_Org', null, '0', '0', '', '7', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('变更日期', 'date', 'Modi_Dt', null, '0', '0', '', '8', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('吊销事由', 'string', 'Revok_Reson', null, '0', null, '', '7', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('吊销日期', 'date', 'Revok_Dt', null, '0', null, '', '6', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('吊销机关', 'string', 'Revok_Org', null, '0', null, '', '8', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('吊销标志', 'string', 'Revok_Ind', null, '0', '0', '', '19', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('商标类型代码', 'string', 'Brand_Typ_Cd', null, '0', '0', '', '4', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('国家编号', 'string', 'Country_ID', null, '0', '0', '', '11', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('国籍代码', 'string', 'Nati_Cd', null, '0', '0', '', '22', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('地市编号', 'string', 'Urbn_ID', null, '0', '0', '', '9', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('城镇编号', 'string', 'Town_ID', null, '0', '0', '', '7', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('处罚时间', 'timestamp', 'Punish_Tm', null, '0', '0', '', '7', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('处罚机关', 'string', 'Punish_Org', null, '0', '0', '', '5', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('处罚种类', 'string', 'Punish_Typ', null, '0', '0', '', '3', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('处罚结果', 'string', 'Punish_Rest', null, '0', '0', '', '4', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('复婚标志', 'string', 'Re_Marrg_Ind', null, '0', '0', '', '13', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('女方人口编号', 'string', 'F_Popu_ID', null, '0', '0', '', '10', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('女方婚姻状态', 'string', 'Wom_Marrg_Stat_Cd', null, '0', '0', '', '8', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('女方证书编号', 'string', 'Wom_Marrg_Cert_ID', null, '0', '0', '', '6', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('姓名', 'string', 'Popu_Nm', null, '0', '0', '', '3', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('姓名', 'string', 'Popu_Nm', null, '0', '0', '', '6', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('婚姻状态代码', 'string', 'Marrg_Stat_Cd', null, '0', '0', '', '24', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('婚姻登记号', 'string', 'Marrg_Rgst_Num', null, '0', '0', '', '2', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('婚姻编号', 'string', 'Marrg_ID', null, '1', '0', '', '1', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('存活情况代码', 'string', 'Surv_Situ_Cd', null, '0', '0', '', '14', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学制代码', 'string', 'Schl_Sys_Cd', null, '0', '0', '', '7', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学号', 'string', 'Stud_Num', null, '0', '0', '', '3', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学校名称', 'string', 'Schl_Nm', null, '0', '0', '', '2', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学校类型代码', 'string', 'Schl_Typ_Cd', null, '0', '0', '', '3', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学校编号', 'string', 'Schl_ID', null, '1', '0', '', '1', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学校编号', 'string', 'Schl_ID', null, '0', '0', '', '8', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学段', 'string', 'Schl_Phas', null, '0', '0', '', '4', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('学籍编号', 'string', 'Stud_Stat_ID', null, '1', '0', '', '1', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('守重企业编号', 'string', 'Keep_Cret_Corp_ID', null, '0', '0', '', '1', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('宗教信仰代码', 'string', 'Relig_Cd', null, '0', '0', '', '25', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('家庭人口数', 'int', 'Family_Popu_Cnt', null, '0', '0', '', '7', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('家庭人口数', 'int', 'Family_Popu_Cnt', null, '0', '0', '', '9', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('家庭地址', 'string', 'Family_Addr', null, '0', '0', '', '3', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('家庭地址', 'string', 'Family_Addr', null, '0', '0', '', '5', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('家庭户信息代码', 'string', 'Family_Info_Cd', null, '0', '0', '', '4', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('家庭电话', 'string', 'Family_Tel', null, '0', '0', '', '19', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('就业状况代码', 'string', 'Empl_Stat_Cd', null, '0', '0', '', '9', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('就业状况代码', 'string', 'Empl_Stat_Cd', null, '0', '0', '', '8', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('就业状况代码', 'string', 'Empl_Stat_Cd', null, '0', '0', '', '10', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('居住地址', 'string', 'Resid_Addr', null, '0', null, '', '8', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('居住地址编号', 'string', 'Resid_Addr_Num', null, '0', '0', '', '16', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('币种', 'string', 'Curr_Cd', null, '0', '0', '', '21', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('市场主体编号', 'string', '市场主体编号', null, '0', '0', '', '3', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('常住人口标识', 'string', 'Perm_Resid_Ind', null, '0', '0', '', '4', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('开业地区县编号', 'string', 'Open_Busi_Coty_ID', null, '0', '0', '', '11', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('开始年月', 'string', 'Start_Year_Month', null, '0', null, '', '6', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('异常日期', 'date', 'Unus_Dt', null, '0', '0', '', '3', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('性别代码', 'string', 'Gender_Cd', null, '0', '0', '', '6', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('性别代码', 'string', 'Gender_Cd', null, '0', '0', '', '11', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('成员角色', 'string', 'Memb_Role', null, '0', null, '', '3', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('成立日期', 'date', 'Estb_Dt', null, '0', '0', '', '16', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('户口性质代码', 'string', 'Hshld_Prop_Cd', null, '0', '0', '', '21', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('户籍地址编号', 'string', 'Hshld_Addr_ID', null, '0', '0', '', '15', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('所属区县编号', 'string', 'Belg_Coty_ID', null, '0', '0', '', '12', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('所属区域编号', 'string', 'Belg_Regn_ID', null, '0', '0', '', '7', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('承办机构', 'string', 'Undt_Org', null, '0', '0', '', '14', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('护照号码', 'string', 'Pasp_Num', null, '0', '0', '', '11', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('操作人', 'string', 'Operator', null, '0', '0', '', '4', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('政治面貌代码', 'string', 'Poli_Stat_Cd', null, '0', '0', '', '26', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', null, '', '11', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '30', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '9', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '7', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', null, '', '11', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', null, '', '10', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '18', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '14', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '16', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '8', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '12', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '9', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '11', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '23', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '14', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '18', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '12', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '16', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '10', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '10', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '8', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '13', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源代码', 'string', 'Data_Src_Cd', null, '0', '0', '', '9', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', null, '', '10', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '29', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '8', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '6', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', null, '', '10', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', null, '', '9', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '17', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '13', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '15', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '7', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '11', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '8', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '10', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '22', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '13', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '17', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '11', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '15', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '9', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '9', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '7', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '12', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('数据来源表', 'string', 'Data_Src_Tbl', null, '0', '0', '', '8', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('文化程度代码', 'string', 'Edu_Degr_Cd', null, '0', '0', '', '20', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('新农合编号', 'string', 'Ncms_ID', null, '1', '0', '', '1', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('最后缴费单位', 'string', 'Lst_Paym_Corp', null, '0', '0', '', '7', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('最后缴费地址', 'string', 'Lst_Pay_Addr', null, '0', '0', '', '9', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('最后缴费年份', 'string', 'Lst_Pay_Year', null, '0', '0', '', '6', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('最后缴费金额', 'decimal', 'Lst_Pay_Amt', null, '0', '0', '', '8', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('有效标志', 'string', 'Valid_Ind', null, '0', '0', '', '10', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('有效标志', 'string', 'Valid_Ind', null, '0', '0', '', '14', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('机构名称', 'string', 'Org_Nm', null, '0', '0', '', '4', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('机构注册类型代码', 'string', 'Org_rgst_Typ_Cd', null, '0', '0', '', '5', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('村庄编号', 'string', 'vila_ID', null, '0', '0', '', '6', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('核准日期', 'date', 'Chk_Aprv_Dt', null, '0', '0', '', '17', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('案件编号', 'string', 'Case_ID', null, '1', '0', '', '1', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('死亡日期', 'date', 'Die_Dt', null, '0', '0', '', '14', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('母亲人口编号', 'string', 'Mo_Popu_ID', null, '0', '0', '', '10', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('民族代码', 'string', 'Nation_Cd', null, '0', '0', '', '7', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '1', null, '', '1', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', null, '', '2', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '1', '0', '', '1', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '4', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '4', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法人编号', 'string', 'Lpr_ID', null, '0', '0', '', '2', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法定代表人', 'string', 'Leg_pers', null, '0', '0', '', '8', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('法定代表人人口编号', 'string', 'Leg_pers_Popu_ID', null, '0', '0', '', '5', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注册商标名称', 'string', 'Rgst_brand_Nm', null, '0', '0', '', '3', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注册地址', 'string', 'Rgst_Addr', null, '0', '0', '', '7', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注册地址', 'string', 'Rgst_Addr', null, '0', '0', '', '9', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注册资本', 'string', 'Rgst_capt', null, '0', '0', '', '20', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销事由', 'string', 'Remov_Resn', null, '0', null, '', '4', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销原因描述', 'string', 'Remov_Resn_Desc', null, '0', '0', '', '6', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销日期', 'date', 'Remov_Dt', null, '0', null, '', '3', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销日期', 'date', 'Remov_Dt', null, '0', '0', '', '7', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销机关', 'string', 'Remov_Org', null, '0', null, '', '5', 'pdata', '企业注吊销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销机关', 'string', 'Remov_Org', null, '0', '0', '', '8', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('注销标志', 'string', 'Remov_Ind', null, '0', '0', '', '18', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流出地编号', 'string', 'Flow_Out_Addr_ID', null, '0', '0', '', '5', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流动人口编号', 'string', 'Flow_Popu_ID', null, '1', '0', '', '1', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流动原因代码', 'string', 'Flow_Resn_Cd', null, '0', '0', '', '3', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流动开始时间', 'date', 'Start_Flow_Tm', null, '0', '0', '', '8', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流动状态', 'string', 'Flow_Stat_Cd', null, '0', '0', '', '6', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流动状态确认', 'string', 'Flow_Stat_Cfm', null, '0', '0', '', '7', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流动结束时间', 'date', 'Stop_Flow_Tm', null, '0', '0', '', '9', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('流管备注信息', 'string', 'Flow_Manage_Memo', null, '0', '0', '', '11', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('涉外标志', 'string', 'Frgn_Ind', null, '0', '0', '', '12', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('源系统编号', 'string', 'Src_Sys_ID', null, '0', '0', '', '2', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('父亲人口编号', 'string', 'Fa_Popu_ID', null, '0', '0', '', '8', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('生效日期', 'date', 'Efft_Dt', null, '0', '0', '', '6', 'pdata', '行政处罚案件', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('生育政策代码', 'string', 'Bir_Poly_Cd', null, '0', '0', '', '5', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('生育服务证类型代码', 'string', 'Bir_Serv_Cert_Typ_Cd', null, '0', '0', '', '3', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('生育服务证编号', 'string', 'Bir_Serv_Cert_ID', null, '0', '0', '', '4', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('用工性质代码', 'string', 'Labr_Prop_Cd', null, '0', '0', '', '8', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('男方人口编号', 'string', 'M_Popu_ID', null, '0', '0', '', '9', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('男方婚姻状态', 'string', 'Man_Marrg_Stat_Cd', null, '0', '0', '', '7', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('男方证书编号', 'string', 'Man_Marrg_Cert_ID', null, '0', '0', '', '5', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('登记时间', 'timestamp', 'Rgst_Tm', null, '0', '0', '', '3', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('登记机关编号', 'string', 'Rgst_Org_ID', null, '0', '0', '', '12', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('登记状态标识', 'string', 'Rgst_Stat_Ind', null, '0', '0', '', '12', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('监督机关', 'string', 'Surv_Org', null, '0', '0', '', '5', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('省份编号', 'string', 'Prov_ID', null, '0', '0', '', '10', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('社会保险状态代码', 'string', 'Social_Secu_Stat_Cd', null, '0', '0', '', '9', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('社会保障计划编号', 'string', 'Social_Secu_Plan_ID', null, '0', '0', '', '3', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('社会保障计划编号', 'string', 'Social_Secu_Plan_ID', null, '0', '0', '', '4', 'pdata', '新农合', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('社会保障计划编号', 'string', 'Social_Secu_Plan_ID', null, '0', '0', '', '5', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('社保险种代码', 'string', 'Social_Secu_Typ_Cd', null, '0', null, '', '4', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('离退休日期', 'date', 'Retir_Dt', null, '0', '0', '', '28', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('移动电话', 'string', 'Mov_Tel', null, '0', '0', '', '18', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务批准注销号', 'string', 'Tax_Appr_Remov_Num', null, '0', '0', '', '9', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务批准注销号', 'string', 'Tax_Appr_Remov_Num', null, '0', '0', '', '8', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务登记日期', 'date', 'Tax_Rgst_Dt', null, '0', '0', '', '12', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务登记机构', 'string', 'Tax_Rgst_Org', null, '0', '0', '', '11', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务登记种类代码', 'string', 'Tax_Rgst_Typ_Cd', null, '0', '0', '', '5', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务登记类型描述', 'string', 'H02_Tax_Rgst_类型描述', null, '0', '0', '', '13', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务登记编号', 'string', 'Tax_Rgst_ID', null, '1', '0', '', '1', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务种类代码', 'string', 'Tax_Typ_Cd', null, '0', '0', '', '4', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('税务种类代码', 'string', 'Tax_Typ_Cd', null, '0', '0', '', '5', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('籍贯具体地址', 'string', 'Nati_Pla_Addr', null, '0', '0', '', '10', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('纳税人名称', 'string', 'Tax_Payer_Nm', null, '0', '0', '', '7', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('纳税人识别号', 'string', 'Tax_Payer_ID', null, '1', '0', '', '1', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('纳税人识别号', 'string', 'Tax_Payer_ID', null, '0', '0', '', '6', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('纳税人识别号', 'string', 'Tax_Payer_ID', null, '1', '0', '', '1', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('组织机构代码', 'string', 'Org_ID', null, '0', '0', '', '4', 'pdata', '企业参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('组织机构代码', 'string', 'Org_ID', null, '0', '0', '', '5', 'pdata', '税务注销', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('组织机构代码', 'string', 'Org_ID', null, '0', '0', '', '3', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('组织机构代码', 'string', 'Org_ID', null, '0', '0', '', '4', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('组织机构代码', 'string', 'Org_ID', null, '1', '0', '', '1', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('终止年月', 'string', 'Termi_Year_Month', null, '0', null, '', '7', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('经办日期', 'date', 'Hadl_Dt', null, '0', null, '', '8', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('经办机构代码', 'string', 'Hadl_Org_ID', null, '0', null, '', '9', 'pdata', '个人参保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('经营场所', 'string', 'Busi_Opr_Site', null, '0', '0', '', '10', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('经营状态代码', 'string', 'Busi_Opr_Stat_Cd', null, '0', '0', '', '9', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('经营范围', 'string', 'Busi_Scop', null, '0', '0', '', '8', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('结婚日期', 'date', 'Marrg_Dt', null, '0', '0', '', '9', 'pdata', '出生', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('结离婚标志', 'string', 'Marrg_Divor_Ind', null, '0', '0', '', '11', 'pdata', '婚姻', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系人', 'string', 'Contr', null, '0', '0', '', '5', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系人', 'string', 'Contr', null, '0', '0', '', '13', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系方式', 'string', 'Cont_Mtd', null, '0', '0', '', '10', 'pdata', '流动人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系电话', 'string', 'Cont_Tel', null, '0', null, '', '9', 'pdata', '企业成员', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系电话', 'string', 'Cont_Tel', null, '0', '0', '', '6', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系电话', 'string', 'Cont_Tel', null, '0', '0', '', '13', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系电话', 'string', 'Cont_Tel', null, '0', '0', '', '14', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系电话', 'string', 'Cont_Tel', null, '0', '0', '', '10', 'pdata', '税务登记', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('联系电话', 'string', 'Cont_Tel', null, '0', '0', '', '6', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('致贫原因代码', 'string', 'Povt_Resn_Cd', null, '0', '0', '', '10', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('致贫原因代码', 'string', 'Povt_Resn_Cd', null, '0', '0', '', '7', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('营业截至日期 ', 'date', 'Busi_Upto_Dt', null, '0', '0', '', '15', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('营业起始日期 ', 'date', 'Busi_Start_Dt', null, '0', '0', '', '14', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('著名驰名商标编号', 'string', 'Fams_Brand_ID', null, '1', '0', '', '1', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行业代码', 'string', 'Inds_Cd', null, '0', '0', '', '6', 'pdata', '法人', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行政区划种类代码', 'string', 'Admin_Regn_Typ_Cd', null, '0', '0', '', '4', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行政区域名称', 'string', 'Admin_Regn_Nm', null, '0', '0', '', '3', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行政区域编号', 'string', 'Admin_Regn_ID', null, '0', '0', '', '6', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行政区域编号', 'string', 'Admin_Regn_ID', null, '0', '0', '', '4', 'pdata', '学校', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行政区域编号', 'string', 'Admin_Regn_ID', null, '0', '0', '', '9', 'pdata', '学籍', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('行政区域编号', 'string', 'Admin_Regn_ID', null, '1', '0', '', '1', 'pdata', '行政区划', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('认定日期', 'date', 'Crtn_Dt', null, '0', '0', '', '6', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('认定项目', 'string', 'Crtn_Proj', null, '0', '0', '', '5', 'pdata', '著名驰名商标', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('证件号码', 'string', 'Cert_Num', null, '0', '0', '', '9', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('证件类型代码', 'string', 'Cert_Typ_Cd', null, '0', '0', '', '8', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('起始年月', 'string', 'Start_Year_Month', null, '0', '0', '', '4', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('起始日期', 'date', 'Start_Dt', null, '0', '0', '', '11', 'pdata', '城乡低保户', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('身份证号码', 'string', 'ID_Card_Num', null, '0', '0', '', '10', 'pdata', '人口', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('身份证号码', 'string', 'ID_Card_Num', null, '0', '0', '', '8', 'pdata', '城乡低保', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('身份证号码', 'string', 'ID_Card_Num', null, '0', '0', '', '7', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('载入事由', 'string', 'Rcrd_Resn', null, '0', '0', '', '4', 'pdata', '企业异常名录', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('连续公示年度', 'string', 'Cont_Pub_Year', null, '0', '0', '', '7', 'pdata', '守重企业', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('通讯地址', 'string', 'Comm_Addr', null, '0', '0', '', '15', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('邮政编码', 'string', 'Zip_Cd', null, '0', '0', '', '16', 'pdata', '社保卡', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('非正常户解除日期', 'date', 'Unus_Corp_Stop_Dt', null, '0', '0', '', '7', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('非正常户认定日期', 'date', 'Unus_Corp_Start_Dt', null, '0', '0', '', '6', 'pdata', '税务非正常户认定', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('颁证日期', 'date', 'Issu_Dt', null, '0', '0', '', '7', 'pdata', '组织机构代码证', 'DW', '0');
INSERT INTO `dw_columns` VALUES ('驾驶证编号', 'string', 'Driv_lice_Num', null, '0', '0', '', '12', 'pdata', '人口', 'DW', '0');

-- ----------------------------
-- Table structure for `dw_columns2`
-- ----------------------------
DROP TABLE IF EXISTS `dw_columns2`;
CREATE TABLE `dw_columns2` (
  `column_name` varchar(60) NOT NULL,
  `data_type` varchar(60) DEFAULT NULL,
  `phy_name` varchar(64) DEFAULT NULL,
  `agg_period` varchar(20) DEFAULT NULL,
  `is_pk` tinyint(1) DEFAULT NULL,
  `chain_compare` tinyint(1) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `sys_name` varchar(60) NOT NULL,
  PRIMARY KEY (`column_name`,`schema_name`,`table_name`,`sys_name`),
  KEY `R_8` (`schema_name`,`table_name`,`sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_columns2
-- ----------------------------
INSERT INTO `dw_columns2` VALUES ('上级行政区域编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('专业代码', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('个人参保编号', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('个人社保编号', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('人口流动状态代码', '', '', null, '0', null, '', '5', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('人口编号', '', '', null, '1', null, '', '1', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('人口编号', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('人口编号', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('人口编号', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('人口编号', '', '', null, '0', null, '', '2', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('企业名称', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('企业异常编号', null, null, null, null, null, null, null, 'pdata', '企业异常名录', 'DW');
INSERT INTO `dw_columns2` VALUES ('企业注册号', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('企业注册号', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');
INSERT INTO `dw_columns2` VALUES ('企业注吊销编号', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('企业类型代码', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('低保户编号', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('低保类型代码', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('低保编号', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('保障人口数', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('保障金额', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('保障金额', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('健康状况代码', '', '', null, '0', null, '', '22', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('健康状况代码', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('入学时间', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('出生地', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('出生日期', '', '', null, '0', null, '', '12', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('出生编号', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('出资方式', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('出资期限', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('出资比例', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('出资额', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('分娩时间', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('办公电话', '', '', null, '0', null, '', '16', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('区县编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('区域级别', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('医疗机构代码', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保人姓名', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保企业编号', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保企业编号', null, null, null, null, null, null, null, 'pdata', '企业参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保企业编号', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保单位名称', null, null, null, null, null, null, null, 'pdata', '企业参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保日期', null, null, null, null, null, null, null, 'pdata', '企业参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保状态代码', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保状态代码', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('参保缴费状态', null, null, null, null, null, null, null, 'pdata', '企业参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('参加工作日期', '', '', null, '0', null, '', '29', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('参合日期', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('发证日期', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('发证机关', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('变更日期', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');
INSERT INTO `dw_columns2` VALUES ('吊销事由', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('吊销日期', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('吊销机关', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('吊销标志', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('商标类型代码', null, null, null, null, null, null, null, 'pdata', '著名驰名商标', 'DW');
INSERT INTO `dw_columns2` VALUES ('国籍代码', '', '', null, '0', null, '', '21', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('地市编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('城市编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('城镇编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('处罚时间', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('处罚机关', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('处罚种类', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('处罚结果', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('女方婚姻状态', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('女方证书编号', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('姓名', '', '', null, '0', null, '', '3', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('姓名', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('婚姻状态代码', '', '', null, '0', null, '', '23', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('婚姻登记号', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('婚姻编号', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('存活情况代码', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('学制代码', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('学号', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('学校名称', null, null, null, null, null, null, null, 'pdata', '学校', 'DW');
INSERT INTO `dw_columns2` VALUES ('学校类型代码', null, null, null, null, null, null, null, 'pdata', '学校', 'DW');
INSERT INTO `dw_columns2` VALUES ('学校编号', null, null, null, null, null, null, null, 'pdata', '学校', 'DW');
INSERT INTO `dw_columns2` VALUES ('学校编号', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('学段', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('学籍编号', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('宗教信仰代码', '', '', null, '0', null, '', '24', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('家庭人口数', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('家庭人口数', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('家庭地址', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('家庭户信息代码', '', '', null, '0', null, '', '4', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('家庭电话', '', '', null, '0', null, '', '18', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('就业状况代码', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('就业状况代码', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('居住地址', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('居住地址编号', '', '', null, '0', null, '', '15', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('币种', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('常住人口标识', '', '', null, '0', null, '', '4', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('开始年月', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('异常日期', null, null, null, null, null, null, null, 'pdata', '企业异常名录', 'DW');
INSERT INTO `dw_columns2` VALUES ('异常状态代码', null, null, null, null, null, null, null, 'pdata', '企业异常名录', 'DW');
INSERT INTO `dw_columns2` VALUES ('性别代码', '', '', null, '0', null, '', '6', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('性别代码', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('成员角色', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('成立日期', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('户口性质代码', '', '', null, '0', null, '', '20', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('户籍地址编号', '', '', null, '0', null, '', '14', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('所属区县编号', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('承办机构', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('护照号码', '', '', null, '0', null, '', '11', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('操作人', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('政治面貌代码', '', '', null, '0', null, '', '25', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('数据日期', '', '', null, '0', null, '', '28', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('数据日期', '', '', null, '0', null, '', '15', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('数据来源代码', '', '', null, '0', null, '', '27', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('数据来源代码', '', '', null, '0', null, '', '14', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('数据来源表', '', '', null, '0', null, '', '26', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('数据来源表', '', '', null, '0', null, '', '13', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('文化程度代码', '', '', null, '0', null, '', '19', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('新农合编号', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('最后缴费单位', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('最后缴费地址', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('最后缴费年份', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('最后缴费金额', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('机构名称', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');
INSERT INTO `dw_columns2` VALUES ('机构注册类型代码', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');
INSERT INTO `dw_columns2` VALUES ('村庄编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('核准日期', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('案件编号', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('死亡日期', '', '', null, '0', null, '', '13', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('民族代码', '', '', null, '0', null, '', '7', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('法人编号', null, null, null, null, null, null, null, 'pdata', '企业异常名录', 'DW');
INSERT INTO `dw_columns2` VALUES ('法人编号', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('法人编号', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('法人编号', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('法人编号', null, null, null, null, null, null, null, 'pdata', '著名驰名商标', 'DW');
INSERT INTO `dw_columns2` VALUES ('法人编号', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('法定代表人', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('注册商标名称', null, null, null, null, null, null, null, 'pdata', '著名驰名商标', 'DW');
INSERT INTO `dw_columns2` VALUES ('注册地址', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('注册地址', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('注册资本', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销事由', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销原因描述', null, null, null, null, null, null, null, 'pdata', '税务注销', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销日期', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销日期', null, null, null, null, null, null, null, 'pdata', '税务注销', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销机关', null, null, null, null, null, null, null, 'pdata', '企业注吊销', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销机关', null, null, null, null, null, null, null, 'pdata', '税务注销', 'DW');
INSERT INTO `dw_columns2` VALUES ('注销标志', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('流出地编号', '', '', null, '0', null, '', '5', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流动人口编号', '', '', null, '0', null, '', '1', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流动原因代码', '', '', null, '0', null, '', '3', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流动开始时间', '', '', null, '0', null, '', '8', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流动状态', '', '', null, '0', null, '', '6', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流动状态确认', '', '', null, '0', null, '', '7', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流动结束时间', '', '', null, '0', null, '', '9', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('流管备注信息', '', '', null, '0', null, '', '11', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('涉外标志', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('源系统编号', '', '', null, '0', null, '', '2', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('生效日期', null, null, null, null, null, null, null, 'pdata', '行政处罚案件', 'DW');
INSERT INTO `dw_columns2` VALUES ('生育政策代码', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('生育服务证类型代码', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('生育服务证编号', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('用工性质代码', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('男方婚姻状态', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('男方证书编号', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('登记时间', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('登记机关编号', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('登记状态标识', '', '', null, '0', null, '', '12', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('省份编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('社会保险状态代码', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('社会保障计划编号', null, null, null, null, null, null, null, 'pdata', '新农合', 'DW');
INSERT INTO `dw_columns2` VALUES ('社保险种代码', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('离退休日期', '', '', null, '0', null, '', '30', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('移动电话', '', '', null, '0', null, '', '17', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('税务批准注销号', null, null, null, null, null, null, null, 'pdata', '税务注销', 'DW');
INSERT INTO `dw_columns2` VALUES ('税务批准注销号', null, null, null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW');
INSERT INTO `dw_columns2` VALUES ('税务登记日期', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('税务登记机构', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('税务登记编号', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('籍贯具体地址', null, null, null, null, null, null, null, 'pdata', '学籍', 'DW');
INSERT INTO `dw_columns2` VALUES ('纳税人名称', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('纳税人识别号', null, null, null, null, null, null, null, 'pdata', '税务注销', 'DW');
INSERT INTO `dw_columns2` VALUES ('纳税人识别号', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('纳税人识别号', null, null, null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW');
INSERT INTO `dw_columns2` VALUES ('组织机构代码', null, null, null, null, null, null, null, 'pdata', '企业参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('组织机构代码', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('组织机构代码', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');
INSERT INTO `dw_columns2` VALUES ('终止年月', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('经办日期', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('经办机构代码', null, null, null, null, null, null, null, 'pdata', '个人参保', 'DW');
INSERT INTO `dw_columns2` VALUES ('经营场所', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('经营状态代码', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('经营状态点吗', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('经营范围', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('结婚日期', null, null, null, null, null, null, null, 'pdata', '出生', 'DW');
INSERT INTO `dw_columns2` VALUES ('结离婚标志', null, null, null, null, null, null, null, 'pdata', '婚姻', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系人', null, null, null, null, null, null, null, 'pdata', '学校', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系人', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系方式', '', '', null, '0', null, '', '10', 'pdata', '流动人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系电话', null, null, null, null, null, null, null, 'pdata', '企业成员', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系电话', null, null, null, null, null, null, null, 'pdata', '学校', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系电话', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系电话', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系电话', null, null, null, null, null, null, null, 'pdata', '税务登记', 'DW');
INSERT INTO `dw_columns2` VALUES ('联系电话', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');
INSERT INTO `dw_columns2` VALUES ('致贫原因代码', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('致贫原因代码', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('营业截至日期 ', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('营业起始日期 ', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('著名驰名商标编号', null, null, null, null, null, null, null, 'pdata', '著名驰名商标', 'DW');
INSERT INTO `dw_columns2` VALUES ('行业代码', null, null, null, null, null, null, null, 'pdata', '法人', 'DW');
INSERT INTO `dw_columns2` VALUES ('行政区域名称', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('行政区域编号', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('行政区域编号', null, null, null, null, null, null, null, 'pdata', '学校', 'DW');
INSERT INTO `dw_columns2` VALUES ('行政区域编号', null, null, null, null, null, null, null, 'pdata', '行政区划', 'DW');
INSERT INTO `dw_columns2` VALUES ('认定日期', null, null, null, null, null, null, null, 'pdata', '著名驰名商标', 'DW');
INSERT INTO `dw_columns2` VALUES ('认定项目', null, null, null, null, null, null, null, 'pdata', '著名驰名商标', 'DW');
INSERT INTO `dw_columns2` VALUES ('证件号码', '', '', null, '0', null, '', '9', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('证件类型', '', '', null, '0', null, '', '8', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('起始年月', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('起始日期', null, null, null, null, null, null, null, 'pdata', '城乡低保户', 'DW');
INSERT INTO `dw_columns2` VALUES ('身份证号码', '', '', null, '0', null, '', '10', 'pdata', '人口', 'DW');
INSERT INTO `dw_columns2` VALUES ('身份证号码', null, null, null, null, null, null, null, 'pdata', '城乡低保', 'DW');
INSERT INTO `dw_columns2` VALUES ('身份证号码', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('载入事由', null, null, null, null, null, null, null, 'pdata', '企业异常名录', 'DW');
INSERT INTO `dw_columns2` VALUES ('通讯地址', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('邮政编码', null, null, null, null, null, null, null, 'pdata', '社保卡', 'DW');
INSERT INTO `dw_columns2` VALUES ('非正常户解除日期', null, null, null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW');
INSERT INTO `dw_columns2` VALUES ('非正常户认定日期', null, null, null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW');
INSERT INTO `dw_columns2` VALUES ('非正常用户解除日期', null, null, null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW');
INSERT INTO `dw_columns2` VALUES ('非正常用户认定日期', null, null, null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW');
INSERT INTO `dw_columns2` VALUES ('颁证日期', null, null, null, null, null, null, null, 'pdata', '组织机构代码证', 'DW');

-- ----------------------------
-- Table structure for `dw_column_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `dw_column_mapping`;
CREATE TABLE `dw_column_mapping` (
  `column_name` varchar(64) NOT NULL,
  `src_column_name` varchar(64) NOT NULL,
  `column_expr` text,
  `comments` varchar(512) DEFAULT NULL,
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `src_schema` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `src_table_name` varchar(64) NOT NULL,
  `sys_name` varchar(64) NOT NULL,
  `src_sys_name` varchar(64) NOT NULL,
  `load_group` int(11) NOT NULL,
  PRIMARY KEY (`column_name`,`schema_name`,`table_name`,`sys_name`,`load_group`,`src_sys_name`,`src_schema`,`src_table_name`,`src_column_name`,`load_batch`),
  KEY `R_45` (`src_column_name`,`src_schema`,`src_table_name`,`src_sys_name`),
  CONSTRAINT `dw_column_mapping_ibfk_1` FOREIGN KEY (`column_name`, `schema_name`, `table_name`, `sys_name`) REFERENCES `dw_columns` (`column_name`, `schema_name`, `table_name`, `sys_name`),
  CONSTRAINT `dw_column_mapping_ibfk_2` FOREIGN KEY (`src_column_name`, `src_schema`, `src_table_name`, `src_sys_name`) REFERENCES `src_column_analysis` (`column_name`, `schema_name`, `table_name`, `sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_column_mapping
-- ----------------------------
INSERT INTO `dw_column_mapping` VALUES ('上级行政区域编号', 'PARENT_ADDRESS_CODE', 'T0.PARENT_ADDRESS_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('专业代码', 'ZY_DM', 'coalesce(T0.ZY_DM,\'Z\')', '来源表代码未区分研究生专业和本科专业', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('个人保险编号', '', 'T0.P_SOCIAL_SECURITY_NO', '', '1', 'pdata', '', '新农合', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('个人参保编号', '', 'concat(T0.AAC999,\'|\',T0.AAB999,\'|\',T0.AAE140,\'|\',T0.AAE041)', '', '1', 'pdata', '', '个人参保', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('个人社保编号', 'AAC999', 'T0.AAC999', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('个人社保编号', 'AAC999', 'T0.AAC999', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', 'FLOW_TYPE', '\'\'', '未找到对应代码描述', '5', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', 'FLOW_FLAG', 'case when T0.FLOW_FLAG = \'0\' then \'01\'\n         when T0.FLOW_FLAG = \'1\' then \'02\'\n         when T0.FLOW_FLAG = \'2\' then \'03\'\n         when T0.FLOW_FLAG = \'3\' then \'04\'\n         else \'99\'\nend', '01 非流动人口\n02 省内流动\n03 跨省流入\n04 跨省流出\n00 未知', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('人口流动状态代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', '', 'concat(\'FR\',T0.SCZTBH)', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'ID', 'concat(\'CY\',T0.ID)', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'RESIDENT_UUID', 'concat(\'LD\',T0.RESIDENT_UUID)', '', '5', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'UUID', 'concat(\'FC\',T0.UUID)', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'UUID', 'concat(\'JS\',T0.UUID)', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'UUID', 'concat(\'NH\',T0.UUID)', '只取居民信息表外键为空的数据，不为空的已经入过仓了', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'ID', 'concat(\'XJ\',T0.ID)', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'ID', 'concat(\'HM\',T0.ID)', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'SOMNO', 'concat(\'DB\',T0.SOMNO)', '有重复数据，需去重', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'AAC999', 'concat(\'SB\',T0.AAC999)', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'UUID', 'concat(\'MC\',T0.UUID)', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '1');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'ID', 'concat(\'HF\',T0.ID)', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'UUID', 'concat(\'CC\',T0.UUID)', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '2');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', '', 'coalesce(T1.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '企业成员', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', '', '', '', '1', 'pdata', '', '出生', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', '', 'coalesce(T1.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', '', 'coalesce(T1.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '学籍', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'UUID', 'coalesce(T1.Unif_Popu_ID,T2.Unif_Popu_ID,\'\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', 'RESIDENT_UUID', 'coalesce(T1.Unif_Popu_ID,\'\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('人口编号', '', 'coalesce(T1.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '社保卡', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业参保编号', 'AAB999', 'T0.AAB999', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业名称', 'CORPNAME', 'CORPNAME', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业名称', 'QYMC', 'T0.QYMC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业异常编号', 'SCZTBH', 'concat(\'YC\',T0.SCZTBH)', '一个法人是否会有多次异常?目前没有发现这样的数据。', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业当前状态代码', 'DQZT', 'coalesce(T0.DQZT,\'99\')', '未找到对应码表,参见H99_Corp_Cur_Stat', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', 'ZCH', 'T0.ZCH', '注册号有重复，按成立日期取最新的', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', '', 'coalesce(T1.Corp_Rgst_Num,\'\')', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', '', 'coalesce(T1.Corp_Rgst_Num,\'\')', '', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', '', 'coalesce(T1.Corp_Rgst_Num,\'\')', '', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', '', 'coalesce(T1.Corp_Rgst_Num,\'\')', '', '1', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', '', 'coalesce(T1.Corp_Rgst_Num,\'\')', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注册号', 'QYZCH', 'T0.QYZCH', '有少量数据企业注册号为空', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业注吊销编号', 'SCZTBH', 'concat(\'DX\',T0.SCZTBH)', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('企业类型代码', 'ZTLX', 'coalesce(T3.Corp_Typ_Cd,\'Z\')', '参见H99_Corp_Typ，未找到源系统代码表', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('低保户编号', 'gFamilyInfoID', 'T0.gFamilyInfoID', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('低保类型代码', 'sLBName', 'T0.sLBName', '参见H99_Low_Secu_Typ，未找到对应代码表', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('保障人口数', '', '\'\'', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('保障金额', 'fBZJE', 'T0.fBZJE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '来源表数据都为空', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('健康状况代码', 'BIRTH_HEALTH_CODE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('入学时间', 'RXSJ', 'T0.RXSJ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('公示年度', 'CONCREYEAR', 'CONCREYEAR', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生地', 'BIRTH_ADDRESS_INFO', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '暂时放空，归并时按身份证号识别', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', 'BIRTH_DATE', 'BIRTH_DATE', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', 'CSRQ', 'to_date(T0.CSRQ,\'yyyymmdd\')', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', 'BIRTH_MAN', 'T0.BIRTH_MAN', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', 'BIRTHDATE', 'T0.BIRTHDATE', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', 'AAC006', 'T0.AAC006', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', 'BIRTH_WOMAN', 'T0.BIRTH_WOMAN', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('出生日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('出生编号', 'UUID', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('出资方式', 'CZFS', 'T0.CZFS', '未找到对应代码表，源数据多种出资方式用|分隔。参见H99_Invest_Ways', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('出资期限', 'CZQX', 'T0.CZQX', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('出资比例', 'CZBL', 'T0.CZBL', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('出资额', 'CZE', 'T0.CZE', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('分娩时间', 'DELIVERY_TIME', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('办公电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('区县编号', 'COUNTY_CODE', 'T0.COUNTY_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('区域级别', 'LEVEL_DEPTH', 'T0.LEVEL_DEPTH', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('医疗机构代码', 'MEDICAL_ORG_CODE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保企业编号', 'AAB999', 'T0.AAB999', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保企业编号', 'AAB999', 'T0.AAB999', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保单位名称', 'AAB004', 'T0.AAB004', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保日期', 'AAB036', 'T0.AAB036', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保状态代码', 'AAC031', 'coalesce(T0.AAC031,\'9\')', '参见H99_Insure_Stat', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保状态代码', 'AAC031', 'T0.AAC031', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参保缴费状态', 'AAB051', 'coalesce(T0.AAB051,\'9\')', '参见参保状态代码表，H99_Insure_Stat', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', 'AAC007', 'T0.AAC007', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('参加工作日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('参合日期', 'INSURANCE_DATE', 'T0.INSURANCE_DATE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('发证日期', 'ISSUE_DATE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('发证机关', 'ISSUE_ORGAN', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('变更日期', 'BGRQ', 'T0.BGRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('吊销事由', 'DXSY', 'coalesce(T0.DXSY,\'\')', '未找到对应代码表，参见H99_Revok_Reson', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('吊销日期', 'DXRQ', 'T0.DXRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('吊销机关', 'DXJG', 'DXJG', '未找到对应代码表', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('吊销标志', 'DXRQ', 'case when T1.DXRQ is not null then \'1\' else \'0\' end', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('商标类型代码', 'BANEDTYPE', 'T0.BANEDTYPE', 'hewin', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('国家编号', '', '\'CHN\'', '默认中国', '1', 'pdata', '', '行政区划', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', 'NATIONALITY_CODE', 'case when T0.NATIONALITY_CODE = \'156\' then \'CHN\'\n          else \'ZZZ\'\n end', '只转换了156，其它国籍数据很少，在客户归并时在做转换', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', 'NATION_MAN', 'coalesce(T3.Nati_Cd,\'ZZZ\')', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', 'NATION_WOMAN', 'coalesce(T4.Nati_Cd,\'ZZZ\')', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('国籍代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('地市编号', 'CITY_CODE', 'T0.CITY_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('城镇编号', 'TOWN_CODE', 'T0.TOWN_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('处罚时间', 'FSDECIDEDATE', 'T0.FSDECIDEDATE', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('处罚机关', 'FSUNDERTAKEORGNAME', 'T0.FSUNDERTAKEORGNAME', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('处罚种类', 'PENTYPE', 'T0.PENTYPE', '多项处罚以#分隔', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('处罚结果', 'FSJUDGMENT', 'T0.FSJUDGMENT', '作废', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('复婚标志', '', '\'\'', '婚姻状态代码未发现有复婚的代码，待确认', '1', 'pdata', '', '婚姻', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('女方人口编号', '', 'coalesce(T2.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '婚姻', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('女方婚姻状态', 'MARRY_STATUS_WOMAN', 'coalesce(T4.Marrg_Stat_Cd,\'90\')', '参见H99_Marrg_Stat', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('女方证书编号', 'PRINT_NUM_WOMAN', 'T0.PRINT_NUM_WOMAN', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'FDDBR', 'T0.FDDBR', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'XM', 'T0.XM', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'RESIDENT_NAME', 'T0.RESIDENT_NAME', '', '5', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'WIFE_RESIDENT_NAME', 'T0.WIFE_RESIDENT_NAME', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'RESIDENT_NAME', 'T0.RESIDENT_NAME', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'RESIDENT_NAME', 'T0.RESIDENT_NAME', '', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'XSXM', 'T0.XSXM', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'NAME_MAN', 'T0.NAME_MAN', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'PERNAME', 'T0.PERNAME', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'AAC003', 'T0.AAC003', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'HUSBAND_RESIDENT_NAME', 'T0.HUSBAND_RESIDENT_NAME', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '1');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'NAME_WOMAN', 'T0.NAME_WOMAN', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'CHILD_RESIDENT_NAME', 'T0.CHILD_RESIDENT_NAME', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '2');
INSERT INTO `dw_column_mapping` VALUES ('姓名', 'AAC003', 'T0.AAC003', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', 'MERRIAGE_TYPE_CODE', '\'\'', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', 'MARRY_STATUS_MAN', '\'\'', '婚姻表的该字段是领证前的婚姻状态，归并时在做具体判断', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', 'AAC017', '\'\'', '没有代码说明', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', 'MARRY_STATUS_WOMAN', '\'\'', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('婚姻状态代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('婚姻登记号', 'CERT_NO', 'T0.CERT_NO', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('婚姻编号', 'ID', 'T0.ID', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('存活情况代码', 'CHILD_SURVIVAL_CODE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('学制代码', 'XZ', 'T0.XZ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学号', 'XH', 'T0.XH', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学校名称', 'XXMC', 'T0.XXMC', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学校类型代码', 'XXLX', 'T0.XXLX', '参见H99_Schl_Typ', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学校编号', 'XXBH', 'T0.XXBH', '不等于0000000000', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学校编号', 'XXBH', 'T0.XXBH', '与实体学校的学校编号后5位匹配', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学段', 'XD', 'T0.XD', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('学籍编号', 'ID', 'T0.ID', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('守重企业编号', 'CURCOMPACTCREDITID', 'CURCOMPACTCREDITID', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('宗教信仰代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('家庭人口数', 'iJTRKS', 'T0.iJTRKS', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭地址', '', '\'\'', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭户信息代码', 'FAMILYINFO_CODE', 'case when T0.FAMILYINFO_CODE in (\'10\',\'20\',\'30\') then T0.FAMILYINFO_CODE\n        else \'90\'\nend', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('家庭电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('就业状况代码', '', '\'\'', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('就业状况代码', 'AAC016', 'T0.AAC016', '未找到对应代码表', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址', 'ZS', 'T0.ZS', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', 'RESIDENCE_REGION_CODE', 'coalesce(T4.Admin_Regn_ID,\'\')', '有小部分数据JS_ADDRESS关联不上', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('居住地址编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('币种', 'ZCBZ', 'coalesce(T0.ZCBZ,\'156\')', '为空的默认人民币', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('市场主体编号', '', '\'\'', '', '1', 'pdata', '', '守重企业', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '是否根据最后缴纳保险日期去判断是否常住人口(客户归并中去做，复杂逻辑工具不好实现)', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'1\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', 'HOUSEHOLD_REGION_CODE', 'case when substring(T0.HOUSEHOLD_REGION_CODE,1,2)=\'46\' \n         then \'1\' \n         else \'0\' \nend', '当前口径:按户籍地代码前两位是46的置为常住人口，可能不全', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('常住人口标识', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('开业地区县编号', '', '\'\'', '', '1', 'pdata', '', '法人', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('开始年月', 'AAE041', 'T0.AAE041', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('异常日期', 'YCRQ', 'T0.YCRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'\'', '暂时放空，归并时按身份证号识别', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'20\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'10\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', 'GENDER_CODE', 'case when T0.GENDER_CODE = ‘\'1\' then \'10\'\n         when T0.GENDER_CODE = \'2\' then \'20\'\nelse \'99\'\nend', '10 男性\n20 女性\nZZ 未知', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', 'XB', 'case when T0.XB = \'男\' then \'10\'\n        when T0.XB = \'女\' then \'20\'\n        else \'99\'\nend', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', 'SEX', 'case when T0.SEX = \'1\' then \'10\'\n         when T0.SEX = \'2\' then \'20\'\n         else \'99\'\nend', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', 'AAC004', 'case when T0.AAC004 = \'1\' then \'10\'\n        when T0.AAC004 = \'2\' then \'20\'\n        else \'99\'\nend', '10 男性\n20 女性\n99 未知', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'10\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', '', '\'20\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', 'CHILD_GENDER_CODE', 'case when T0.CHILD_GENDER_CODE = \'1\' then \'10\'\n         when T0.CHILD_GENDER_CODE = \'2\' then \'20\'\n         else \'99\'\nend', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '2');
INSERT INTO `dw_column_mapping` VALUES ('性别代码', 'CHILD_GENDER_CODE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('成员角色', 'RYZT', 'case when T0.RYZT = \'负责人\' then \'01\'\n        when T0.RYZT = \'管理人员\' then \'01\'\n        when T0.RYZT = \'清算组负责人\' then \'01\'\n        when T0.RYZT = \'投资者\' then \'01\'\n        else \'99\'\nend', '参见H99_Crop_Popu_Role', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('成立日期', 'QYCLRQ', 'T0.QYCLRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', 'HOUSEHOLD_NATURE_CODE', 'case when T0.HOUSEHOLD_NATURE_CODE = \'1\' then \'10\'\n         when T0.HOUSEHOLD_NATURE_CODE = \'2\' then \'20\'\n         else \'99\'\nend', '10 城镇户口\n20 农业户口\n99 未知', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', 'AAC009', '\'\'', '没有代码说明', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('户口性质代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', 'HOUSEHOLD_REGION_CODE', 'coalesce(T3.Admin_Regn_ID,\'\')', '有小部分数据JS_ADDRESS关联不上', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('户籍地址编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('所属区县编号', 'AAB034', 'T0.AAB034', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('所属区域编号', 'AAB034', 'coalesce(substring(T0.AAB034,1,6),\'ZZ\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('承办机构', 'DEPT_CODE', 'T0.DEPT_CODE', '未找到对应代码表', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', 'case when T0.FRZJMC like \'%护照%\' then T0.FRSFZH else \'\' end', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '暂不清楚护照类型代码', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('护照号码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('操作人', 'OPERATOR', 'T0.OPERATOR', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', 'ZZMM', '\'\'', '中文', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', 'AAC024', 'coalesce(T0.AAC024,\'99\')', '不够两位左补零', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('政治面貌代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'SHBZ\'', '', '1', 'pdata', '', '个人参保', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'SHBZ\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'MZJX\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'MZJX\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JYJX\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'MZJX\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'SHBZ\'', '', '1', 'pdata', '', '企业参保', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '企业异常名录', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '企业成员', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '企业注吊销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '', '', '1', 'pdata', '', '出生', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'MZJX\'', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'MZJX\'', '', '1', 'pdata', '', '婚姻', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JYJX\'', '', '1', 'pdata', '', '学校', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JYJX\'', '', '1', 'pdata', '', '学籍', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '守重企业', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '1', 'pdata', '', '新农合', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '法人', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '1', 'pdata', '', '流动人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'SHBZ\'', '', '1', 'pdata', '', '社保卡', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSJX\'', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSJX\'', '', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'DSJX\'', '', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSJX\'', '', '1', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'DSJX\'', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'ZJZZ\'', '', '1', 'pdata', '', '组织机构代码证', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '著名驰名商标', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'JHSY\'', '', '1', 'pdata', '', '行政区划', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源代码', '', '\'GSSW\'', '', '1', 'pdata', '', '行政处罚案件', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'AC02_TO_GXT\'', '', '1', 'pdata', '', '个人参保', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'AC01_TO_GXT\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'EX_ZH_GONGSHANG_12_SJZTKYDJXX\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'EX_ZH_GONGSHANG_15_QYRYXX\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_ADDRESS_RESIDENCE_RESIDENT\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_BIRTH_RESIDENT\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_RESIDENT\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_XNH\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'RC_MARRY\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'so_baseinfomain\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'T_ENROLLMENT_INFO\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_BIRTH_RESIDENT\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'RC_MARRY\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_BIRTH_RESIDENT\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'AB01_TO_GXT\'', '', '1', 'pdata', '', '企业参保', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'EX_ZH_GONGSHANG_16_SSZTYCML\'', '', '1', 'pdata', '', '企业异常名录', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'EX_ZH_GONGSHANG_15_QYRYXX\'', '', '1', 'pdata', '', '企业成员', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'EX_ZH_GONGSHANG_14_SJZTZDXDJXX\'', '', '1', 'pdata', '', '企业注吊销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '', '', '1', 'pdata', '', '出生', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'so_baseinfomain\'', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'RC_MARRY\'', '', '1', 'pdata', '', '婚姻', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'T_SCHOOL_INFO\'', '', '1', 'pdata', '', '学校', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'T_ENROLLMENT_INFO\'', '', '1', 'pdata', '', '学籍', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'CurCompactCredit\'', '', '1', 'pdata', '', '守重企业', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_XNH\'', '', '1', 'pdata', '', '新农合', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'EX_ZH_GONGSHANG_12_SJZTKYDJXX\'', '', '1', 'pdata', '', '法人', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_ADDRESS_RESIDENCE_RESIDENT\'', '', '1', 'pdata', '', '流动人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'AC01_TO_GXT\'', '', '1', 'pdata', '', '社保卡', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'BAK_DJ_ZXDJXX\'', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'BAK_DJNSRXX\'', '', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'dishui_dengji\'', '', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'BAK_FZCKXX\'', '', '1', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'dishui_feizhengchanghu\'', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'V_QYDMXX\'', '', '1', 'pdata', '', '组织机构代码证', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'ControlledName\'', '', '1', 'pdata', '', '著名驰名商标', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'JS_ADDRESS\'', '', '1', 'pdata', '', '行政区划', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('数据来源表', '', '\'AJXXB\'', '', '1', 'pdata', '', '行政处罚案件', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', 'EDUCATION_CODE', 'coalesce(T5.Edu_Degr_Cd,\'99\')', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', 'AAC011', 'coalesce(T2.Aim_Code_Value,\'999\')', '源系统的代码值不全', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('文化程度代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('新农合编号', 'UUID', 'T0.UUID', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('最后缴费单位', 'LAST_PAYMENT_UNIT', 'T0.LAST_PAYMENT_UNIT', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('最后缴费地址', 'LAST_PAYMENT_ADDRESS_CODE', 'T0.LAST_PAYMENT_ADDRESS_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('最后缴费年份', 'LAST_PAYMENT_TIME', 'T0.LAST_PAYMENT_TIME', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('最后缴费金额', 'LAST_PAYMENT_AMOUNT', 'T0.LAST_PAYMENT_AMOUNT', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('有效标志', '', '\'\'', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('有效标志', '', '\'\'', '', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('有效标志', '', '\'\'', '', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('机构名称', 'JGMC', 'T0.JGMC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('机构注册类型代码', 'JGZCLX', 'T0.JGZCLX', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('村庄编号', 'VILLAGE_CODE', 'T0.VILLAGE_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('核准日期', 'HZRQ', 'T0.HZRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('案件编号', 'FICASEID', 'T0.FICASEID', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', 'DEATH_DATE', 'DEATH_DATE', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('死亡日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('母亲人口编号', '', '', '', '1', 'pdata', '', '出生', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', 'NATION_CODE', 'coalesce(T1.Nation_Cd,\'99\')', '参见H99_Nation', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', 'MZ', '\'\'', '为汉字，待客户归并后，看是否需要转换', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', 'FOLK_MAN', 'coalesce(T1.Nation_Cd,\'99\')', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', 'NATION', '\'\'', '数据与码表不符，从人口基本信息表取', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', 'AAC005', 'coalesce(T1.Nation_Cd,\'99\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', 'FOLK_WOMAN', 'coalesce(T2.Nation_Cd,\'99\')', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('民族代码', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '需要根据组织机构代码', '1', 'pdata', '', '企业参保', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'SCZTBH', 'T0.SZCTBH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'SCZTBH', 'T0.SCZTBH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'SCZTBH', 'T0.SCZTBH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'ENTITYNO', 'ENTITYNO', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'SCZTBH', 'T0.SCZTBH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', '\'\'', 'hewin', '1', 'pdata', '', '社保卡', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '', '1', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', '', 'coalesce(T1.Lpr_ID,\'\')', '', '1', 'pdata', '', '组织机构代码证', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'FSENTITYIDCODE', 'T0.FSENTITYIDCODE', '市场主体编号', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法人编号', 'FSENTITYIDCODE', 'T0.FSENTITYIDCODE', '市场主体编号', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('法定代表人', 'FDDBR', 'T0.FDDBR', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('法定代表人', 'FDDBRMC', 'T0.FDDBRMC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('法定代表人人口编号', '', 'coalesce(T2.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '法人', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('注册商标名称', 'CONTROLLEDKEYNAME', 'T0.CONTROLLEDKEYNAME', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('注册地址', 'ZS', 'T0.ZS', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('注册地址', 'ZCDZ', 'T0.ZCDZ', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('注册地址', 'SCJYDZ', 'T0.SCJYDZ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('注册资本', 'ZCZB', 'T0.ZCZB', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销事由', 'ZXSY', 'coalesce(T0.ZXSY,\'\')', '未找到对应代码表，参见H99_Remov_Resn', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销原因描述', 'ZXYY_MC', 'T0.ZXYY_MC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销日期', 'ZXRQ', 'T0.ZXRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销日期', 'TBRQ', 'T0.TBRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销机关', 'ZXJG', 'T0.ZXJG', '未找到对应代码表', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销机关', 'SWJG_MC', 'T0.SWJG_MC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('注销标志', 'ZXRQ', 'case when T1.ZXRQ  is not null then \'1\' else \'0\' end', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('流出地编号', 'FROM_RESION_CODE', 'T0.FROM_RESION_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流动人口编号', 'UUID', 'T0.UUID', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流动原因代码', 'FLOWREASON_CODE', 'case when T0.FLOWREASON_CODE in (\'10\',\'20\',\'30\',\'40\',\'50\',\'60\',\'91\',\'92\',\'93\') then T0.FLOWREASON_CODE\n         else \'99\'\nend', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流动开始时间', 'START_TIME', 'T0.START_TIME', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流动状态', 'FLOW_TYPE', 'T0.FLOW_TYPE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流动状态确认', 'CONFIM_STATU', 'T0.CONFIM_STATU', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流动结束时间', 'END_TIME', 'T0.END_TIME', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('流管备注信息', 'REMARK', 'T0.REMARK', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('涉外标志', 'MARRY_TYPE', 'case when T0.MARRY_TYPE = \'SHEWAI\' then \'1\'\n        else \'0\'\nend', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.AAC999', '社保个人编号', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', '\'\'', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.SCZTBH', '市场主体编号', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'RESIDENT_UUID', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.UUID', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.UUID', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.ID', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.gFamilyInfoID', '低保家庭编号', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', 'UUID', 'T0.UUID', '', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', 'ID', 'T0.ID', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.UUID', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.ID', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('源系统编号', '', 'T0.UUID', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('父亲人口编号', '', '', '', '1', 'pdata', '', '出生', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('生效日期', 'EXEDATE', 'T0.EXEDATE', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('生育政策代码', 'BIRTH_POLICY_PROPERTY_CODE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('生育服务证类型代码', 'BIRTH_SERVICE_TYPE_CODE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('生育服务证编号', 'CERTITICATE_NUMBER', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('用工性质代码', 'AAC013', 'case when T0.AAC013 = \'1\' then \'1\'\n        when T0.AAC013 = \'2\' then \'2\'\n        when T0.AAC013 = \'3\' then \'3\'\n        when T0.AAC013 = \'4\' then \'4\'\n        when T0.AAC013 = \'5\' then \'5\'\n        else \'9\'\nend ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('男方人口编号', '', 'coalesce(T1.Unif_Popu_ID,\'\')', '', '1', 'pdata', '', '婚姻', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('男方婚姻状态', 'MARRY_STATUS_MAN', 'coalesce(T3.Marrg_Stat_Cd,\'90\')', '参见H99_Marrg_Stat', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('男方证书编号', 'PRINT_NUM_MAN', 'T0.PRINT_NUM_MAN', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('登记时间', 'OP_DATE', 'T0.OP_DATE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('登记机关编号', 'DJGXJG', 'T0.DJGXJG', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('登记状态标识', 'IS_REGISTER', 'T0.IS_REGISTER', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('监督机关', 'APPROVEDEPTID', 'APPROVEDEPTID', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('省份编号', 'PROVINCE_CODE', 'T0.PROVINCE_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('社会保险状态代码', 'AAC084', 'T0.AAC084', '未找到对应代码表', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('社会保障计划编号', '', '\'\'', '', '1', 'pdata', '', '城乡低保户', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('社会保障计划编号', '', '\'\'', '', '1', 'pdata', '', '新农合', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('社会保障计划编号', '', '\'\'', '', '1', 'pdata', '', '社保卡', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('社保险种代码', 'AAE140', 'substring(T0.AAE140,1,2)', '13,14,34,39未确认代码含义,参见H99_Social_Secu_Typ', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', 'AIC162', 'T0.AIC162', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('离退休日期', '', 'null', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', 'DHHM', 'T0.DHHM', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', 'LXFS', 'T0.LXFS', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', 'PHONE', 'T0.PHONE', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('移动电话', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('税务批准注销号', 'WSPZXH', 'T0.WSPZXH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务批准注销号', '', 'null', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务批准注销号', 'WSPZXH', 'T0.WSPZXH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'BAK_FZCKXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记日期', 'SWDJRQ', 'T0.SWDJRQ', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记日期', 'BHRQ', 'T0.BHRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记机构', 'SWDJJG', 'T0.SWDJJG', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记机构', 'SWJG_MC', 'T0.SWJG_MC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记种类代码', '', '\'01\'', '01 国税\n02 地税', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记种类代码', '', '\'02\'', '01 国税\n02 地税', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记类型描述', '', '\'\'', '', '1', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记类型描述', '', '\'\'', '', '2', 'pdata', '', '税务登记', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记编号', 'NSRSBH', 'T0.NSRSBH', '后9位是组织机构编码，关联V_QYDMXX取企业注册号，可能会取不到', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务登记编号', 'NSRSBH', 'T0.NSRSBH', '后9位为组织机构代码', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务种类代码', '', '\'01\'', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务种类代码', '', '\'01\'', '01 国税\n02 地税', '1', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('税务种类代码', '', '\'02\'', '01 国税\n02 地税', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('籍贯具体地址', 'JGJTZZ', 'T0.JGJTZZ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人名称', 'NSRMC', 'T0.NSRMC', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人名称', 'NSRMC', 'T0.NSRMC', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人识别号', 'NSRSBH', 'T0.NSRSBH', '有重复数据，按注销日期取最新记录', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人识别号', 'NSRSBH', 'T0.NSRSBH', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人识别号', 'NSRSBH', 'T0.NSRSBH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人识别号', 'NSRSBH', 'T0.NSRSBH', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'dishui_feizhengchanghu', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('纳税人识别号', 'NSRSBH', 'T0.NSRSBH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'BAK_FZCKXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', 'AAB003', 'regexp_replace(T0.AAB003,\'-\',\'\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', '', 'coalesce(T1.Org_ID,\'\')', '', '1', 'pdata', '', '税务注销', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', 'NSRSBH', 'coalesce(T1.Org_ID,\'\')', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', 'NSRSBH', 'coalesce(T1.Org_ID,\'\')', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', '', 'coalesce(T1.Org_ID,\'\')', '纳税人识别号后9位', '1', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', '', 'coalesce(T1.Org_ID,\'\')', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('组织机构代码', 'ZZJGDM', 'T0.ZZJGDM', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('终止年月', 'AAE042', 'T0.AAE042', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('经办日期', 'AAE036', 'T0.AAE036', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('经办机构代码', 'AAB034', 'T0.AAB034', '参见H99_Social_Secu_Org，数据与代码表不一致', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('经营场所', 'JYCS', 'T0.JYCS', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('经营状态代码', 'QYZT', 'T0.QYZT', '未找到源系统代码表', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('经营范围', 'JYFW', 'T0.JYFW', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('结婚日期', 'MERRIAGE_DATE', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('结离婚标志', 'OP_TYPE', 'T0.OP_TYPE', '未找到对应代码表，参见H99_Marrg_Divor_Ind', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系人', 'LXR', 'T0.LXR', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系人', 'AAE004', 'T0.AAE004', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系方式', '', '\'\'', '', '1', 'pdata', '', '流动人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'LXFS', 'T0.LXFS', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'LXDH', 'T0.LXDH', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'DHHM', 'T0.DHHM', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'AAE005', 'T0.AAE005', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'LXDH', 'T0.LXDH', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'DHHM', 'T0.DHHM', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('联系电话', 'LXDH', 'T0.LXDH', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('致贫原因代码', 'sZPYYName', 'case when T0.sZPYYName = \'残疾\' then \'01\'\n        when T0.sZPYYName = \'孤老人员\' then \'02\'\n        when T0.sZPYYName = \'疾病\' then \'03\'\n        when T0.sZPYYName = \'缺乏劳动力\' then \'04\'\n        when T0.sZPYYName = \'失地\' then \'05\'\n        when T0.sZPYYName = \'失业\' then \'06\'\n        when T0.sZPYYName = \'灾害\' then \'07\'\n        else \'99‘\'\nend', '参见H99_Povt_Resn', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('营业截至日期 ', 'YYJZRQ', 'T0.YYJZRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('营业起始日期 ', 'YYQSRQ', 'T0.YYQSRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('著名驰名商标编号', 'CONTROLLEDKEYID', 'T0.CONTROLLEDKEYID', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('行业代码', 'HYML', 'coalesce(T4.Inds_Typ_Cd,\'Z\')', '参见H99_Inds_Typ，未找到源系统代码表', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区划种类代码', '', '\'01\'', '', '1', 'pdata', '', '行政区划', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域名称', 'CITY_NAME', 'concat(T0.PROVINCE_NAME,T0.CITY_NAME,T0.COUNTY_NAME,T0.TOWN_NAME,T0.VILLAGE_NAME)', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域名称', 'COUNTY_NAME', 'concat(T0.PROVINCE_NAME,T0.CITY_NAME,T0.COUNTY_NAME,T0.TOWN_NAME,T0.VILLAGE_NAME)', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域名称', 'PROVINCE_NAME', 'concat(T0.PROVINCE_NAME,T0.CITY_NAME,T0.COUNTY_NAME,T0.TOWN_NAME,T0.VILLAGE_NAME)', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域名称', 'TOWN_NAME', 'concat(T0.PROVINCE_NAME,T0.CITY_NAME,T0.COUNTY_NAME,T0.TOWN_NAME,T0.VILLAGE_NAME)', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域名称', 'VILLAGE_NAME', 'concat(T0.PROVINCE_NAME,T0.CITY_NAME,T0.COUNTY_NAME,T0.TOWN_NAME,T0.VILLAGE_NAME)', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域编号', 'sVillageCode', 'T0.sVillageCode', '编码与地址信息表不一致', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域编号', 'XXDZ', 'T0.XXDZ', '参见H03_Admin_Regn，有758条地址未关联到', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域编号', '', '\'\'', '', '1', 'pdata', '', '学籍', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('行政区域编号', 'ADDRESS_CODE', 'T0.ADDRESS_CODE', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('认定日期', 'FROMDATE', 'T0.FROMDATE', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('认定项目', 'SERVICEITEM', 'T0.SERVICEITEM', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', '', 'T0.AAC147', '身份证号有很多长度不是15、18的，在这里保留一份原始数据', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'FRSFZH', 'T0.FRSFZH', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'SFZHM', 'T0.SFZHM', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'CERTIFICATE_NUMBER', 'T0.CERTIFICATE_NUMBER', '', '5', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'WIFE_CERTIFICATE_NUMBER', 'T0.WIFE_CERTIFICATE_NUMBER', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'CERTIFICATE_NUMBER', 'coalesce(T0.CERTIFICATE_NUMBER,\'\')', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'CERTIFICATE_NUMBER', 'T0.CERTIFICATE_NUMBER', '', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'GMSFZH', 'T0.GMSFZH', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'CERT_NUM_MAN', 'T0.CERT_NUM_MAN', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'IDENTITYID', 'T0.IDENTITYID', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'HUSBAND_CERTIFICATE_NUMBER', 'T0.HUSBAND_CERTIFICATE_NUMBER', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '1');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'CERT_NUM_WOMAN', 'T0.CERT_NUM_WOMAN', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('证件号码', 'CHILD_CERTIFICATE_NUMBER', 'T0.CHILD_CERTIFICATE_NUMBER', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '2');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('证件类型代码', '', '', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');
INSERT INTO `dw_column_mapping` VALUES ('起始日期', 'sSFNY', 'T0.sSFNY', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', '', 'case when T0.CERTIFICATE_TYPE_CODE = \'111\' and length(T0.CERTIFICATE_NUMBER) in (15,18) then T0.CERTIFICATE_NUMBER\n        else \'\'\nend', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', '', 'coalesce(T0.CERTIFICATE_NUMBER,\'\')', '待修改', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'FRSFZH', 'case when T0.FRZJMC = \'中华人民共和国居民身份证\'  and (length(T0.FRSFZH) = 15 or length(T0.FRSFZH)=18) then T0.FRSFZH else \'\' end', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'SFZHM', 'case when T0.ZJLX in (\'10\',\'中华人民共和国居民身份证\') and length(T0.SFZHM) in (15,18) then \'01\'\n        else \'99\'\nend', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'WIFE_CERTIFICATE_NUMBER', 'case when T0.WIFE_CERTIFICATE_TYPE_CODE = \'111\' and length(T0.WIFE_CERTIFICATE_NUMBER) in (15,18) then T0.WIFE_CERTIFICATE_NUMBER\n        else \'\'\nend', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'CERTIFICATE_NUMBER', 'case when T0.CERTIFICATE_TYPE_CODE=\'111\' then T0.CERTIFICATE_NUMBER\n         else \'\'\nend', '', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'GMSFZH', 'case when length(T0.GMSFZH) in (15,18) then T0.GMSFZH\n        else \'\' \nend', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'CERT_NUM_MAN', 'case when T0.CERT_TYPE_MAN = \'1\' and length(T0.CERT_NUM_MAN) in (15,18) then T0.CERT_NUM_MAN\n        else \'\'\nend', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'IDENTITYID', 'T0.IDENTITYID', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'AAC147', 'case when length(T0.AAC147)=15 or length(T0.AAC147)=18 then T0.AAC147\n         else \'\'\nend', '不是15、18位的置空', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'HUSBAND_CERTIFICATE_NUMBER', 'case when T0.HUSBAND_CERTIFICATE_TYPE_CODE = \'111\' and length(T0.HUSBAND_CERTIFICATE_NUMBER) in (15,18) then T0.HUSBAND_CERTIFICATE_NUMBER\n        else \'\'\nend', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '1');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'CERT_NUM_WOMAN', 'case when T0.CERT_TYPE_WOMAN = \'1\' and length(T0.CERT_NUM_WOMAN) in (15,18) then T0.CERT_NUM_WOMAN\n        else \'\'\nend', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX', '1');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'CHILD_CERTIFICATE_NUMBER', 'case when T0.CHILD_CERTIFICATE_TYPE_CODE = \'111\' and length(T0.CHILD_CERTIFICATE_NUMBER) in (15,18) then T0.CHILD_CERTIFICATE_NUMBER\n        else \'\'\nend', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY', '2');
INSERT INTO `dw_column_mapping` VALUES ('身份证号码', 'AAC147', 'T0.AAC147', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('载入事由', 'ZRSY', 'coalesce(T0.ZRSY,\'99\')', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('连续公示年度', 'CONTINUECOMCRENUM', 'CONTINUECOMCRENUM', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW', '0');
INSERT INTO `dw_column_mapping` VALUES ('通讯地址', 'AAE006', 'T0.AAE006', '地址描述信息，未入人口主表', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('邮政编码', 'AAE007', 'T0.AAE007', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('非正常户解除日期', '', 'null', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('非正常户解除日期', 'YXQ_Z', 'T0.YXQ_Z', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'BAK_FZCKXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('非正常户认定日期', '', 'null', '', '2', 'pdata', '', '税务非正常户认定', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('非正常户认定日期', 'RDRQ', 'T0.RDRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'BAK_FZCKXX', 'DW', 'GSJX', '0');
INSERT INTO `dw_column_mapping` VALUES ('颁证日期', 'BZRQ', 'T0.BZRQ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '1', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', 'case when T0.FRZJMC like \'%驾驶证%\' then T0.FRSFZH else \'\' end', '', '3', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '4', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '5', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '暂不清楚驾驶证类型代码', '7', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '8', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '10', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '11', 'pdata', '', '人口', '', 'DW', '', '0');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '9', 'pdata', '', '人口', '', 'DW', '', '1');
INSERT INTO `dw_column_mapping` VALUES ('驾驶证编号', '', '\'\'', '', '6', 'pdata', '', '人口', '', 'DW', '', '2');

-- ----------------------------
-- Table structure for `dw_column_mapping_his`
-- ----------------------------
DROP TABLE IF EXISTS `dw_column_mapping_his`;
CREATE TABLE `dw_column_mapping_his` (
  `column_name` varchar(60) NOT NULL,
  `src_column_name` varchar(60) DEFAULT NULL,
  `column_expr` text,
  `comments` varchar(512) DEFAULT NULL,
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(60) NOT NULL,
  `src_schema` varchar(60) DEFAULT NULL,
  `table_name` varchar(60) NOT NULL,
  `src_table_name` varchar(60) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  `src_sys_name` varchar(60) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`column_name`,`load_batch`,`schema_name`,`table_name`,`sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_column_mapping_his
-- ----------------------------

-- ----------------------------
-- Table structure for `dw_subject`
-- ----------------------------
DROP TABLE IF EXISTS `dw_subject`;
CREATE TABLE `dw_subject` (
  `subject_name` varchar(64) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `phy_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_subject
-- ----------------------------
INSERT INTO `dw_subject` VALUES ('事件', '事件指海南省政府感兴趣的对一定的人群会产生一定影响的事情，可以是个人的不良行为、违法犯罪、组织机构的经济案件或公共事件，如自然灾害、公共卫生事件、安全事故、消防事件、环保事件、交通事件和治安事件等。 \n事件主题描述事件基本信息(如时间、地点、参与人、事件种类、事件描述、影响）、应急预案及处理措施。事件涉及到的违规违法，将在执法主题进行相应的法律处置。', '事件', 'H12');
INSERT INTO `dw_subject` VALUES ('人口', '人口指海南省政府感兴趣的自然人，包括居住在海南省的常住人口、流动人口、访客及感兴趣的未居住在海南的外地人口；涵盖了自然人从出生到死亡的各个阶段的数据，如基本信息、出生、居住、教育、职业、专业特长、违法犯罪、社保、纳税、婚姻信息、计划生育、子女、死亡、健康等信息构成。\n', '人口', 'H01');
INSERT INTO `dw_subject` VALUES ('公共卫生', '公共卫生指我海南省政府针对当前城乡居民存在的主要健康问题，以儿童、孕产妇、老年人、慢性疾病患者为重点人群，面向全体居民免费提供的最基本的公共卫生服务。\n内容包括城乡居民健康档案管理、健康教育、预防接种、重点人群(0～6岁儿童、孕产妇、老年人、慢性病患者（高血压、糖尿病）、重性精神疾病患者、结核病患者）的健康管理、传染病及突发公共卫生事件报告和处理服务及卫生监督协管服务\n本主题描述居民从出生到死亡的整个生命周期的保健、疾控、医疗服务、疾病管理等方面的信息\n', '公共卫生', 'H09');
INSERT INTO `dw_subject` VALUES ('宏观经济', '宏观经济指海南省政府感兴趣的反映国民经济状况的各项指标，指标涵盖国民经济和社会发展各个方面；包括全国、各省市自治区、地级市、OECD及世界主要国家数据；针对海南经济统计数据可细到县或乡镇。\n函盖中国经济统计数据、世界经济统计数据以及海南经济统计数据；中国经济统计数据包括宏观月度数据、综合年度、行业月度、行业年度、城市月度与城市年度。世界经济统计数据包括OECD月/季度库、OECD年度库以及世经年度库。', '宏观经济', 'H18');
INSERT INTO `dw_subject` VALUES ('执法', '执法是指海南省各级行政机关依照法定职权和法定程序，行使行政管理职权、履行职责、贯彻和实施法律的活动；以维护市场、食品药品、卫生、环保、旅游、金融、市容市貌、文化教育、安全、交通、物价、工程质量、人力资源等领域的社会秩序,公共利益和合法权益。\n执法包括对违规行为的行政处罚及对违法犯罪行为法律；\n执法主题描执法主体、对象、执法种类、原因、时间等内容。', '执法', 'H13');
INSERT INTO `dw_subject` VALUES ('政务', '政务指行政服务，原名行政审批服务，是集信息与咨询、审批与收费、证照办理、管理与协调、投诉与监督于一体的综合性行政服务体系。\n行政服务主题描述行政服务的受理、处理流程及服务结果，对行政服务全程进行跟踪。\n', '政务', 'H10');
INSERT INTO `dw_subject` VALUES ('政府机构', '指依照国家法律设立并享有在海南省的行政权力、担负行政管理职能的各级国家机构，亦称为“国家行政机关”，包括省、市、区县、镇、村五级。\n政府机构的职能包括经济调节、市场监督、社会管理及公共服务', '政府机构', 'H04');
INSERT INTO `dw_subject` VALUES ('政策法规', '政策法规指海南省各行政区域执行的政策、制度、法律、法规、地方条例、预决算等，可以是海南省各级行政机构发布的、国家发布海南适用或海南省政府感兴趣的。政策法规是指导其它施政活动的基础与依据。', '政策法规', 'H06');
INSERT INTO `dw_subject` VALUES ('沟通', '沟通指政府机构与民众之间通过各种渠道进行信息与社情民意的传递和互动的过程。政府机构通过沟通发布信息、了解社情民意；民众通过沟通了解信息、参政议政、表达意见。\n沟通主题描述沟通的渠道与沟通的内容，渠道包括媒体（传统媒体与线上媒体）、互联式沟通活动(征求意见、听证会、提案、选举)、以及单向沟通活动（上访、游行、举报）等。', '沟通', 'H05');
INSERT INTO `dw_subject` VALUES ('法人', '法人是具有民事权利能力和民事行为能力，依法独立享有民事权利和承担民事义务的组织。\n法人主题将描述工商信息、税务信息、质检信息、经营情况以及法人间的关系。', '法人', 'H02');
INSERT INTO `dw_subject` VALUES ('目录', '目录是指海南省政府感兴趣的，在依法对海南省的政治、经济和社会公共事务进行管理时应承担的职责和所具有的事项列表，如政府行政服务、公共服务、财政收支、社会保障目录。\n目录主题描述事项列表的基本信息、特征信息以及，特征信息主要描述其价格、率、数量、描述等\n为满足管理的需要和适应不断变化的管理需求，可以根据实际情况结合目录特性将目录分组，即“目录组”，如税收收入、非税收入、债务等。目录组可以有多个分组标准，一个目录项可以属于多个目录组\n', '目录', 'H07');
INSERT INTO `dw_subject` VALUES ('社会保障', '社会保障是指国家通过立法，积极动员社会各方面资源，保证无收入、低收入以及遭受各种意外灾害的公民能够维持生存，保障劳动者在年老、失业、患病、工伤、生育时的基本生活不受影响，同时根据经济和社会发展状况，逐步增进公共福利水平，提高国民生活质量。\n社会保障包括社会保险、社会救济、社会福利、社会互助以及优抚安置。', '社会保障', 'H08');
INSERT INTO `dw_subject` VALUES ('空间地理', '是描述海南省政府希望关注或考察的各种地理区域和地址信息，如国家、省  份、城市、县、乡村等；可以是海南省的，也可以是全国或全球的；可以是行政区域，也可以是任意感兴趣的区域，如商圈；也可以是区域组合，如海南的西海岸、中国的东北、美国的东部等。空间地理将描述政府关注的站点信息，如政府办公大楼、学校、医院、旅游景点、交通枢纽等', '空间地理', 'H03');
INSERT INTO `dw_subject` VALUES ('规划', '规划指海南省或各区县政府针对城乡发展建设空间布局，保护生态和自然环境，合理利用自然资源比较全面长远的发展计划，是对未来整体性、长期性、基本性问题的思考和考量，设计未来整套行动的方案。\n 按对象和功能类别分为总体规划和土地、林地、城市、海洋、生态红线、五网（路网、光网、电网、气网、水网）等专项规划以及区域规划。', '规划', 'H15');
INSERT INTO `dw_subject` VALUES ('许可', '许可即行政许可，是指在法律一般禁止的情况下，行政主体根据行政相对方的申请，经依法审查，通过颁发许可证、执照等形式，赋予或确认行政相对方从事某种活动的法律资格或法律权利的一种具体行政行为。\n许可包括普通许可、特许、认可、核准、登记；\n许可主题描述其许可证编号、颁发机构、主体、许可种类、许可范围、期限、颁发日期、依照法规、以及撤销、注销信息', '许可', 'H14');
INSERT INTO `dw_subject` VALUES ('财政', '财政指海南省政府感兴趣的各级行政机构通过其收支活动筹集和供给经费和资金，保证实现国家（或政府）的职能，包括预决算、税收、非税收入以及财政支出。 ', '财政', 'H11');
INSERT INTO `dw_subject` VALUES ('资源', '资源指海南省政府感兴趣的自然人、法人、政府拥有的物力、财力等各种物质要素的总称。包括个人与法人的拥有的房屋、车辆、知识产权、金融资产，政府拥有的自然资源（土地、海洋、旅游、森林、草原、动物、水利、矿藏等）、公共部件、交通路网、不动产及教育资源等。 \n资源主题描述其基本属性（位置、类型、描述、所有人、管理人、登记日期等）、权属确认与分配、估值。', '资源', 'H16');
INSERT INTO `dw_subject` VALUES ('项目', '项目(Project)是以海南省财政投资的，为了实现政府职能，满足社会公共需要，实现经济和社会发展战略，而开展的一系列独立并相互关联的活动。\n项目主题描述项目的基本信息、审批、论证、状态变化、计划、进度及采购等信息。', '项目', 'H17');

-- ----------------------------
-- Table structure for `dw_table`
-- ----------------------------
DROP TABLE IF EXISTS `dw_table`;
CREATE TABLE `dw_table` (
  `phy_name` varchar(64) DEFAULT NULL,
  `load_mode` varchar(20) DEFAULT NULL,
  `clear_mode` varchar(20) DEFAULT NULL,
  `keep_load_dt` tinyint(1) DEFAULT NULL,
  `do_aggregate` tinyint(1) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `sys_name` varchar(60) NOT NULL,
  `subject_name` varchar(60) DEFAULT NULL,
  `is_fact` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`schema_name`,`table_name`,`sys_name`),
  KEY `R_37` (`subject_name`),
  CONSTRAINT `dw_table_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `etl_tables` (`schema_name`, `table_name`, `sys_name`) ON DELETE CASCADE,
  CONSTRAINT `dw_table_ibfk_2` FOREIGN KEY (`subject_name`) REFERENCES `dw_subject` (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table
-- ----------------------------
INSERT INTO `dw_table` VALUES ('H08_Indv_Insure', null, null, null, null, null, 'pdata', '个人参保', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H01_Popu', null, null, null, null, null, 'pdata', '人口', 'DW', '人口', null);
INSERT INTO `dw_table` VALUES ('H08_Corp_Insure', null, null, null, null, null, 'pdata', '企业参保', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H02_Corp_Unus_Direct', null, null, null, null, null, 'pdata', '企业异常名录', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H01_Corp_Member', null, null, null, null, null, 'pdata', '企业成员', 'DW', '人口', null);
INSERT INTO `dw_table` VALUES ('H02_Corp_Revok', null, null, null, null, null, 'pdata', '企业注吊销', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H01_Popu_Birth', null, null, null, null, null, 'pdata', '出生', 'DW', '人口', null);
INSERT INTO `dw_table` VALUES ('H08_Low_Secu', null, null, null, null, null, 'pdata', '城乡低保', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H08_Low_Secu_Family', null, null, null, null, null, 'pdata', '城乡低保户', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H01_Marrg', null, null, null, null, null, 'pdata', '婚姻', 'DW', '人口', null);
INSERT INTO `dw_table` VALUES ('H03_School', null, null, null, null, null, 'pdata', '学校', 'DW', '空间地理', null);
INSERT INTO `dw_table` VALUES ('H01_Stud_Stat', null, null, null, null, null, 'pdata', '学籍', 'DW', '人口', null);
INSERT INTO `dw_table` VALUES ('H02_Keep_Cret_Corp', null, null, null, null, null, 'pdata', '守重企业', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H08_Ncms', null, null, null, null, null, 'pdata', '新农合', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H02_Corp', null, null, null, null, null, 'pdata', '法人', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H01_Flow_Popu', null, null, null, null, null, 'pdata', '流动人口', 'DW', '人口', null);
INSERT INTO `dw_table` VALUES ('H08_Social_Secu_Crd', null, null, null, null, null, 'pdata', '社保卡', 'DW', '社会保障', null);
INSERT INTO `dw_table` VALUES ('H02_Tax_Remov', null, null, null, null, null, 'pdata', '税务注销', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H02_Tax_Rgst', null, null, null, null, null, 'pdata', '税务登记', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H02_Tax_Unus_Corp', null, null, null, null, null, 'pdata', '税务非正常户认定', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H02_Org_Code_Cert', null, null, null, null, null, 'pdata', '组织机构代码证', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H02_Fams_Brand', null, null, null, null, null, 'pdata', '著名驰名商标', 'DW', '法人', null);
INSERT INTO `dw_table` VALUES ('H03_Admin_Regn', null, null, null, null, null, 'pdata', '行政区划', 'DW', '空间地理', null);
INSERT INTO `dw_table` VALUES ('H02_Admin_Puni_Case', null, null, null, null, null, 'pdata', '行政处罚案件', 'DW', '法人', null);

-- ----------------------------
-- Table structure for `dw_table_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `dw_table_mapping`;
CREATE TABLE `dw_table_mapping` (
  `table_alias` varchar(64) DEFAULT NULL,
  `join_order` int(11) NOT NULL,
  `join_type` varchar(20) DEFAULT NULL,
  `join_condition` text,
  `filter_condition` text,
  `comments` varchar(512) DEFAULT NULL,
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(64) NOT NULL,
  `src_schema` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `src_table_name` varchar(64) NOT NULL,
  `sys_name` varchar(64) NOT NULL,
  `src_sys_name` varchar(64) NOT NULL,
  PRIMARY KEY (`load_batch`,`schema_name`,`src_schema`,`table_name`,`src_table_name`,`sys_name`,`src_sys_name`,`join_order`),
  KEY `R_33` (`schema_name`,`table_name`,`sys_name`),
  KEY `R_46` (`src_schema`,`src_table_name`,`src_sys_name`),
  CONSTRAINT `dw_table_mapping_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `dw_table` (`schema_name`, `table_name`, `sys_name`),
  CONSTRAINT `dw_table_mapping_ibfk_2` FOREIGN KEY (`src_schema`, `src_table_name`, `src_sys_name`) REFERENCES `src_table_analysis` (`schema_name`, `table_name`, `sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table_mapping
-- ----------------------------
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'\nand T0.SCZTBH is not null', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'\nand T0.SCZTBH is not null', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '守重企业', 'CurCompactCredit', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T1', '0', '0:Left Outer', 'T0.SCZTBH = T1.SCZTBH\nand T1.data_dt = \'${DATA_DT}\') ', '', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'BAK_FZCKXX', 'DW', 'GSJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '两张表的关联条件不确定，使用父母身份证号关联，如果有多个小孩，小孩跟生育服务证的关系不好确定。', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', '', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'\nand T0.XXBH <> \'0000000000\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T2', '2', 'left join', 'T0.AAC011 = T2.Original_Code_Value\nand T2.Code_Map_Type_Cd = \'102\'', '', '', '1', 'pdata', 'vpdata', '人口', 'H99_CODE_MAP', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'left join', 'T0.AAC005 = T1.Nation_Cd', '', '', '1', 'pdata', 'vpdata', '人口', 'H99_Nation', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'regexp_replace(T0.AAB003,\'-\',\'\')= T1.Org_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '企业参保', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'T0.SFZHM = T1.ID_Card_Num\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '企业成员', 'H01_Unif_Popu_Info', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'concat(\'DB\',T0.SOMNO) = T1.Popu_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '城乡低保户', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'concat(\'HM\',T0.ID) = T1.Popu_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '婚姻', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T2', '2', 'Left Outer', 'concat(\'HF\',T0.ID) = T1.Popu_ID\nand T2.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '婚姻', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T3', '3', 'Left Outer', 'T0.MARRY_STATUS_MAN = T3.Marrg_Stat_Cd', '', '', '1', 'pdata', 'vpdata', '婚姻', 'H99_Marrg_Stat', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T4', '4', 'Left Outer', 'T0.MARRY_STATUS_MAN = T4.Marrg_Stat_Cd', '', '', '1', 'pdata', 'vpdata', '婚姻', 'H99_Marrg_Stat', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'concat(\'XJ\',T0.ID) = T1.Popu_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '学籍', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'concat(\'JS\',T0.RESIDENT_UUID) = T1.Popu_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '居民表外键不为空的数据', '1', 'pdata', 'vpdata', '新农合', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T2', '2', 'Left Outer', 'concat(\'NH\',T0.UUID) = T2.Popu_ID\nand T2.data_dt = \'${DATA_DT}\'', '', '居民表外键为空的数据', '1', 'pdata', 'vpdata', '新农合', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T2', '1', 'Left Outer', 'concat(\'FR\',T0.SCZTBH) = T2.Popu_ID\nand T2.data_dt = \'${DATA_DT}\') ', '', '', '1', 'pdata', 'vpdata', '法人', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T3', '2', 'Left Outer', 'T0.ZTLX = T3.Corp_Typ_Cd', '', '', '1', 'pdata', 'vpdata', '法人', 'H99_Corp_Typ', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T4', '3', 'Left Outer', 'T0.HYML = T4.Inds_Typ_Cd', '', '', '1', 'pdata', 'vpdata', '法人', 'H99_Inds_Typ_Cd', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'concat(\'LD\',T0.RESIDENT_UUID) = T1.Popu_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '流动人口', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'concat(\'SB\',T0.AAC999) = T1.Popu_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '社保卡', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'substring(T0.NSRSBH,length(T0.NSRSBH)-9,9) = T1.Org_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '税务注销', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'substring(T0.NSRSBH,length(T0.NSRSBH)-9,9) = T1.Org_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '税务登记', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'substring(T0.NSRSBH,length(T0.NSRSBH)-9,9) = T1.Org_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '税务非正常户认定', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'T0.QYZCH = T1.Corp_Rgst_Num\nand T1.data_dt = \'${DATA_DT}\'', '', '', '1', 'pdata', 'vpdata', '组织机构代码证', 'H02_Corp', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'dishui_feizhengchanghu', 'DW', 'DSJX');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'substring(T0.NSRSBH,length(T0.NSRSBH)-9,9) = T1.Org_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '2', 'pdata', 'vpdata', '税务登记', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'Left Outer', 'substring(T0.NSRSBH,length(T0.NSRSBH)-9,9) = T1.Org_ID\nand T1.data_dt = \'${DATA_DT}\'', '', '', '2', 'pdata', 'vpdata', '税务非正常户认定', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '5', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T3', '3', 'left join', 'T0.HOUSEHOLD_REGION_CODE=T3.Admin_Regn_ID\nand T3.data_dt = \'${DATA_DT}\'', '', '', '7', 'pdata', 'vpdata', '人口', 'H03_Admin_Regn', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T4', '4', 'left join', 'T0.RESIDENCE_REGION_CODE=T4.Admin_Regn_ID\nand T4.data_dt = \'${DATA_DT}\'', '', '', '7', 'pdata', 'vpdata', '人口', 'H03_Admin_Regn', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T2', '2', 'left join', 'T0.CERTIFICATE_TYPE_CODE = T1.Cert_Typ_Cd', '', '', '7', 'pdata', 'vpdata', '人口', 'H99_Cert_Typ', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T5', '5', 'left join', 'T0.EDUCATION_CODE=T5.Edu_Degr_Cd', '', '', '7', 'pdata', 'vpdata', '人口', 'H99_Edu_Degr', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'left join', 'T0.NATION_CODE = T1.Nation_Cd', '', '', '7', 'pdata', 'vpdata', '人口', 'H99_Nation', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping` VALUES ('T3', '3', 'left join', 'T0.NATION_MAN = T3.Thr_Num_Nati_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nati', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T4', '4', 'left join', 'T0.NATION_WOMAN = T4.Thr_Num_Nati_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nati', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T1', '1', 'left join', 'T0.FOLK_MAN = T1.Nation_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nation', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T2', '2', 'left join', 'T0.FOLK_WOMAN = T1.Nation_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nation', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${DATA_DT}\'', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX');

-- ----------------------------
-- Table structure for `dw_table_mapping2`
-- ----------------------------
DROP TABLE IF EXISTS `dw_table_mapping2`;
CREATE TABLE `dw_table_mapping2` (
  `table_alias` varchar(60) DEFAULT NULL,
  `join_order` int(11) DEFAULT NULL,
  `join_type` varchar(20) DEFAULT NULL,
  `join_condition` text,
  `filter_condition` text,
  `comments` varchar(512) DEFAULT NULL,
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(60) NOT NULL,
  `src_schema` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `src_table_name` varchar(60) NOT NULL,
  `sys_name` varchar(60) NOT NULL,
  `src_sys_name` varchar(60) NOT NULL,
  PRIMARY KEY (`load_batch`,`schema_name`,`src_schema`,`table_name`,`src_table_name`,`sys_name`,`src_sys_name`),
  KEY `R_33` (`schema_name`,`table_name`,`sys_name`),
  KEY `R_46` (`src_schema`,`src_table_name`,`src_sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table_mapping2
-- ----------------------------
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') \nand T0.SCZTBH is not null', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业异常名录', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') \nand T0.SCZTBH is not null', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业成员', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '企业注吊销', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务注销', 'BAK_DJ_ZXDJXX', 'DW', 'GSJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'BAK_DJNSRXX', 'DW', 'GSJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'BAK_FZCKXX', 'DW', 'GSJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '组织机构代码证', 'V_QYDMXX', 'DW', 'ZJZZ');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '著名驰名商标', 'ControlledName', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_ENTERPRISE_BUFFER', '行政处罚案件', 'AJXXB', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '个人参保', 'AC02_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'AC01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '企业参保', 'AB01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '两张表的关联条件不确定，使用父母身份证号关联，如果有多个小孩，小孩跟生育服务证的关系不好确定。', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', '', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '出生', 'JS_BIRTH_SERVICE_CERTIFICATE', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '城乡低保户', 'so_baseinfomain', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '婚姻', 'RC_MARRY', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') \nand T0.XXBH <> \'0000000000\'', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学校', 'T_SCHOOL_INFO', 'DW', 'JYJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '学籍', 'T_ENROLLMENT_INFO', 'DW', 'JYJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '新农合', 'JS_XNH', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('', '0', '', '', '', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '法人', 'AB01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '流动人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '社保卡', 'AC01_TO_GXT', 'DW', 'SHBZ');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '行政区划', 'JS_ADDRESS', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'left join', 'T0.AAC005 = T1.Nation_Cd', '', '', '1', 'pdata', 'vpdata', '人口', 'H99_Nation', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T2', '2', 'left join', 'T0.AAC011 = T2.Original_Code_Value\nand T2.Code_Map_Type_Cd = \'102\'', '', '', '1', 'pdata', 'vpdata', '人口', 'T99_CODE_MAP', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'T0.SFZHM = T1.ID_Card_Num', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '企业成员', 'H01_Unif_Popu_Info', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'concat(\'DB\',T0.SOMNO) = T1.Popu_ID', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '城乡低保户', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'concat(\'HM\',T0.ID) = T1.Popu_ID', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '婚姻', 'H01_Popu_Mer_Rela1', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T2', '2', 'Left Outer', 'concat(\'HF\',T0.ID) = T1.Popu_ID', 'T2.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '婚姻', 'H01_Popu_Mer_Rela2', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'concat(\'XJ\',T0.ID) = T1.Popu_ID', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '学籍', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'concat(\'LD\',T0.RESIDENT_UUID) = T1.Popu_ID', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '流动人口', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'concat(\'SB\',T0.AAC999) = T1.Popu_ID', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '社保卡', 'H01_Popu_Mer_Rela', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'subtring(T0.NSRSBH,len(T0.NSRSBH)-9,9) = T1.H02_Org_Code_Cert\nand T1.data_dt = \'${data_dt}\') ', '', '', '1', 'pdata', 'vpdata', '税务注销', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'subtring(T0.NSRSBH,len(T0.NSRSBH)-9,9) = T1.H02_Org_Code_Cert\nand T1.data_dt = \'${data_dt}\') ', '', '', '1', 'pdata', 'vpdata', '税务登记', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'subtring(T0.NSRSBH,len(T0.NSRSBH)-9,9) = T1.H02_Org_Code_Cert\nand T1.data_dt = \'${data_dt}\') ', '', '', '1', 'pdata', 'vpdata', '税务非正常户认定', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'T0.QYZCH = T1.Corp_Rgst_Num', 'T1.data_dt = \'${data_dt}\') ', '', '1', 'pdata', 'vpdata', '组织机构代码证', 'H02_Corp', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('', '0', '', '', '', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'entityRegisterInfo', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务登记', 'dishui_dengji', 'DW', 'DSJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\') ', '', '2', 'pdata', 'DB_ENTERPRISE_BUFFER', '税务非正常户认定', 'dishui_feizhengchanghu', 'DW', 'DSJX');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'subtring(T0.NSRSBH,len(T0.NSRSBH)-9,9) = T1.H02_Org_Code_Cert\nand T1.data_dt = \'${data_dt}\') ', '', '', '2', 'pdata', 'vpdata', '税务登记', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'Left Outer', 'subtring(T0.NSRSBH,len(T0.NSRSBH)-9,9) = T1.H02_Org_Code_Cert\nand T1.data_dt = \'${data_dt}\') ', '', '', '2', 'pdata', 'vpdata', '税务非正常户认定', 'H02_Org_Code_Cert', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('', '0', '', '', '', '', '3', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '人口', 'EX_ZH_GONGSHANG_15_QYRYXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('', '0', '', '', '', '', '4', 'pdata', 'DB_ENTERPRISE_BUFFER', '法人', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'DW', 'GSSW');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '5', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '6', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_BIRTH_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '7', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_RESIDENT', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T3', '3', 'left join', 'T0.HOUSEHOLD_REGION_CODE=T3.Admin_Regn_ID\nand T3.Data_Dt = \'${hivevar:TXDATE}\'', '', '', '7', 'pdata', 'vpdata', '人口', 'H03_Admin_Regn1', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T4', '4', 'left join', 'T0.RESIDENCE_REGION_CODE=T4.Admin_Regn_ID\nand T4.Data_Dt = \'${hivevar:TXDATE}\'', '', '', '7', 'pdata', 'vpdata', '人口', 'H03_Admin_Regn2', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T2', '2', 'left join', 'T0.CERTIFICATE_TYPE_CODE = T1.Cert_Typ_Cd', '', '', '7', 'pdata', 'vpdata', '人口', 'H99_Cert_Typ', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T5', '5', 'left join', 'T0.EDUCATION_CODE=T5.Edu_Degr_Cd', '', '', '7', 'pdata', 'vpdata', '人口', 'H99_Edu_Degr', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'left join', 'T0.NATION_CODE = T1.Nation_Cd', '', '', '7', 'pdata', 'vpdata', '人口', 'H99_Nation', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')\nand T0.RESIDENT_UUID is null', '', '8', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'JS_XNH', 'DW', 'JHSY');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '9', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'RC_MARRY', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping2` VALUES ('T3', '3', 'left join', 'T0.NATION_MAN = T3.Thr_Num_Nati_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nati1', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T4', '4', 'left join', 'T0.NATION_WOMAN = T4.Thr_Num_Nati_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nati2', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T1', '1', 'left join', 'T0.FOLK_MAN = T1.Nation_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nation1', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T2', '2', 'left join', 'T0.FOLK_WOMAN = T1.Nation_Cd', '', '', '9', 'pdata', 'vpdata', '人口', 'H99_Nation2', 'DW', 'AAAA');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '10', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'so_baseinfomain', 'DW', 'MZJX');
INSERT INTO `dw_table_mapping2` VALUES ('T0', '0', '', '', 'T0.data_dt = \'${data_dt}\')', '', '11', 'pdata', 'DB_PEOPLE_INFO_BUFFER', '人口', 'T_ENROLLMENT_INFO', 'DW', 'JYJX');

-- ----------------------------
-- Table structure for `dw_table_mapping_his`
-- ----------------------------
DROP TABLE IF EXISTS `dw_table_mapping_his`;
CREATE TABLE `dw_table_mapping_his` (
  `table_alias` varchar(60) DEFAULT NULL,
  `join_order` int(11) DEFAULT NULL,
  `join_type` varchar(20) DEFAULT NULL,
  `join_condition` text,
  `filter_condition` text,
  `comments` varchar(512) DEFAULT NULL,
  `load_batch` int(11) NOT NULL,
  `schema_name` varchar(60) NOT NULL,
  `src_schema` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `src_table_name` varchar(60) NOT NULL,
  `sys_name` varchar(60) NOT NULL,
  `src_sys_name` varchar(60) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`load_batch`,`schema_name`,`src_schema`,`table_name`,`src_table_name`,`sys_name`,`src_sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dw_table_mapping_his
-- ----------------------------

-- ----------------------------
-- Table structure for `ent_system`
-- ----------------------------
DROP TABLE IF EXISTS `ent_system`;
CREATE TABLE `ent_system` (
  `sys_name` varchar(60) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_system
-- ----------------------------
INSERT INTO `ent_system` VALUES ('', '', '');
INSERT INTO `ent_system` VALUES ('AAAA', '', '虚拟P层');
INSERT INTO `ent_system` VALUES ('CZKJ', '', '财政会计');
INSERT INTO `ent_system` VALUES ('DSJX', '', '地税');
INSERT INTO `ent_system` VALUES ('DW', '', '数据仓库');
INSERT INTO `ent_system` VALUES ('GSJX', '', '国税');
INSERT INTO `ent_system` VALUES ('GSSW', '', '工商');
INSERT INTO `ent_system` VALUES ('JHSY', '', '计生');
INSERT INTO `ent_system` VALUES ('JYJX', '', '教育');
INSERT INTO `ent_system` VALUES ('LYWX', '', '旅游委');
INSERT INTO `ent_system` VALUES ('MZJX', '', '民政');
INSERT INTO `ent_system` VALUES ('RSJX', '', '人社');
INSERT INTO `ent_system` VALUES ('SHBZ', '', '社保');
INSERT INTO `ent_system` VALUES ('test', '', '测试1');
INSERT INTO `ent_system` VALUES ('ZJJX', '', '住建');
INSERT INTO `ent_system` VALUES ('ZJZZ', '', '质监组织机构');

-- ----------------------------
-- Table structure for `etl_developer`
-- ----------------------------
DROP TABLE IF EXISTS `etl_developer`;
CREATE TABLE `etl_developer` (
  `etl_dvlpr_name` varchar(60) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`etl_dvlpr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_developer
-- ----------------------------
INSERT INTO `etl_developer` VALUES ('default', 'default');
INSERT INTO `etl_developer` VALUES ('haiwei', '');
INSERT INTO `etl_developer` VALUES ('unknown', 'unknown');

-- ----------------------------
-- Table structure for `etl_tables`
-- ----------------------------
DROP TABLE IF EXISTS `etl_tables`;
CREATE TABLE `etl_tables` (
  `schema_name` varchar(60) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `table_name` varchar(60) NOT NULL,
  `sys_name` varchar(60) NOT NULL,
  `cn_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`schema_name`,`table_name`,`sys_name`),
  KEY `R_20` (`schema_name`,`sys_name`),
  CONSTRAINT `etl_tables_ibfk_1` FOREIGN KEY (`schema_name`, `sys_name`) REFERENCES `table_schema` (`schema_name`, `sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_tables
-- ----------------------------
INSERT INTO `etl_tables` VALUES ('', '', '', '', '');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'AJXXB', 'GSSW', '案件信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'BAK_DJNSRXX', 'GSJX', '国税纳税登记信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'BAK_DJ_ZXDJXX', 'GSJX', '国税纳税注销信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'BAK_FZCKXX', 'GSJX', '国税非正常户信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'BAK_YHZ', 'GSJX', '国税验换证信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'banedType', 'GSSW', '码表-著弛名类型');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'ChangeFieldCnfg', 'GSSW', '码表-变更事项基础信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'code_ind', 'GSSW', '码表-市场行业');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'code_ind1', 'GSSW', '码表-市场行业');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'Code_Industry', 'GSSW', '码表-市场行业');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'Coin', 'GSSW', '币种基础表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'ControlledName', 'GSSW', '著名/驰名商标信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'CurCompactCredit', 'GSSW', '守重企业信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'CZ_KJRXXK', 'CZKJ', '会计人信息库');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'DIM_ENTERPRISE_JYCS_INFO', 'GSSW', '企业经营场所字典表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'DIM_ISSUEDEPT_CODE', 'GSSW', '发布部门代码表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'DIM_PUNISH_TYPE_CODE', 'GSSW', '处罚种类（类别字典表）');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'dishui_dengji', 'DSJX', '纳税登记信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'dishui_feizhengchanghu', 'DSJX', '地税非正常户信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'dishui_yanhuanzheng', 'DSJX', '地税验换证信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'dishui_zhuxiao', 'DSJX', '地税纳税注销信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EnterpriseStatus', 'GSSW', '企业状态编码基础表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'enterprisetype', 'GSSW', '企业类型编码基础表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'entityChangeInfo', 'GSSW', '企业变更信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'entityRegisterInfo', 'GSSW', '企业注册信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'entityVipChangeInfo', 'GSSW', '企业成员变更信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EntityVIPList', 'GSSW', '成员信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_HZ_GONGSHANG_04_NJ', 'GSSW', '年报信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'GSSW', '市场主体开业登记信息表 ');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', 'GSSW', '市场主体变更登记信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'GSSW', '市场主体注(吊)销登记信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_15_QYRYXX', 'GSSW', '企业人员信息表 ');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'GSSW', '市场主体异常名录表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_17_QYJTMGSDJXX', 'GSSW', '企业集团母公司登记信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'EX_ZH_GONGSHANG_18_QYJTZGSDJXX', 'GSSW', '企业集团子公司登记信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'FoodPermit', 'GSSW', '食品流通许可证信息表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'GDaicCode', 'GSSW', '机构编码基础表');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'investorChangeInfo', 'GSSW', '投资人变更信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'investorInfo', 'GSSW', '投资人信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'JF1', 'RSJX', '社保缴纳记录信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'partnerInfo', 'GSSW', '合伙人信息(合伙制企业)');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'penType', 'GSSW', '码表-案件类型');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'seniorMember', 'GSSW', '董事会和监事会成员信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'shareholdersChangeInfo', 'GSSW', '股东变更信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'shareholdersInfo', 'GSSW', '股东登记信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'T_KJSWSXXK', 'CZKJ', '会计事务所信息库');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'T_SFDWXXK', 'CZKJ', '收费单位信息库');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'V_QYDMFZXX', 'ZJZZ', '组织机构代码废置信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'V_QYDMXX', 'ZJZZ', '组织机构代码颁证信息');
INSERT INTO `etl_tables` VALUES ('DB_ENTERPRISE_BUFFER', '', 'ZRSY', 'GSSW', '码表-异常事由类型');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'AB01_TO_GXT', 'SHBZ', '社保参保企业信息（原始）');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'AC01_TO_GXT', 'SHBZ', '社保参保人员基本信息（原始）');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'AC02_TO_GXT', 'SHBZ', '社保人员参保信息（原始）');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'hy_interface_house', 'ZJJX', '住建公租房信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'hy_interface_lease', 'ZJJX', '住建房屋租赁信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_ADDRESS', 'JHSY', '地址信息表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'JHSY', '计生流动人口表（流动轨迹表）');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_BIRTH_RESIDENT', 'JHSY', '人口出生信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_BIRTH_SERVICE_CERTIFICATE', 'JHSY', '生育服务证信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_CYDC', 'JHSY', '未知表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_DIM_MARRIAGE_TYPE', 'JHSY', '民政结婚类型');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_ONLY_CHILD_CERTIFICATE', 'JHSY', '卫计委独生子女光荣证');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_RESIDENT', 'JHSY', '卫计委人口基本信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'JS_XNH', 'JHSY', '卫计委新农合信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'MZ_BEGGAR_REGISTER_INFO', 'MZJX', '民政乞讨信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'MZ_URBAN_ALLOWANCE_INFO', 'MZJX', '民政城乡低保信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'PUBIC_DIM_ADDRESS_CODE', 'ZJJX', '公租房地址代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RC_MARRY', 'MZJX', '民政婚姻信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_CBZT_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_DWCBZT_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_HKXZ_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_HYZK_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_JYZT_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_MZ_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_RYXB_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_SBJBJG_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_SHBXZT_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_WHCD_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_XZXL_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_YGXZ_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'RS_DIM_ZZMM_CODE', 'SHBZ', '社保代码表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'sf_reqdetail', 'MZJX', '民政低保采集表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'so_baseinfomain', 'MZJX', '民政低保家庭基本信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'so_basepeopinfo', 'MZJX', '民政低保人员基本信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'T_CHILDREN_ADOPT_INFO', 'MZJX', '儿童收养信息表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'T_ENROLLMENT_INFO', 'JYJX', '学籍信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'T_IMMUNITY_PLAN_INFO', 'JHSY', '计划免疫信息表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'T_IMMUNITY_VACCINE_INFO', 'JHSY', '0-7岁流动儿童国家免疫规划疫苗接种状况表');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'T_INTERNATIONAL_TOURIST_STATISTICS', 'LYWX', '旅行社经营预测');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'T_SCHOOL_INFO', 'JYJX', '教育学校信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'ZJ_PUBLIC_HOUSE_INFO', 'ZJJX', '住建公租房信息');
INSERT INTO `etl_tables` VALUES ('DB_PEOPLE_INFO_BUFFER', '', 'ZJ_RENT_HOUSE_INFO', 'ZJJX', '住建房屋租赁信息');
INSERT INTO `etl_tables` VALUES ('pdata', null, '个人参保', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '人口', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '企业参保', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '企业异常名录', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '企业成员', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '企业注吊销', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '出生', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '城乡低保', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '城乡低保户', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '婚姻', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '学校', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '学籍', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '守重企业', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '新农合', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '法人', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '流动人口', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '社保卡', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '税务注销', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '税务登记', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '税务非正常户认定', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '组织机构代码证', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '著名驰名商标', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '行政区划', 'DW', null);
INSERT INTO `etl_tables` VALUES ('pdata', null, '行政处罚案件', 'DW', null);
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H01_Popu_Mer_Rela', 'AAAA', '人口归并关系');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H01_Unif_Popu_Info', 'AAAA', '统一人口信息');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H02_Corp', 'AAAA', '法人');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H02_Org_Code_Cert', 'AAAA', '组织机构代码证');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H03_Admin_Regn', 'AAAA', '行政区划');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Cert_Typ', 'AAAA', '证件类型代码表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_CODE_MAP', 'AAAA', '代码映射表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Corp_Typ', 'AAAA', '企业类型代码表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Edu_Degr', 'AAAA', '文化程度代码表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Inds_Typ_Cd', 'AAAA', '行业门类代码表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Marrg_Stat', 'AAAA', '婚姻状态代码表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Nati', 'AAAA', '国籍代码表');
INSERT INTO `etl_tables` VALUES ('vpdata', '', 'H99_Nation', 'AAAA', '民族代码表');

-- ----------------------------
-- Table structure for `etl_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `etl_tasks`;
CREATE TABLE `etl_tasks` (
  `task_name` varchar(100) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `schema_name` varchar(60) DEFAULT NULL,
  `etl_dvlpr_name` varchar(60) DEFAULT NULL,
  `table_name` varchar(60) DEFAULT NULL,
  `sys_name` varchar(60) DEFAULT NULL,
  `plan_start_dt` date DEFAULT NULL,
  `plan_finish_dt` date DEFAULT NULL,
  `actual_finish_dt` date DEFAULT NULL,
  `task_status` varchar(20) DEFAULT NULL,
  `actual_start_dt` date DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_name`),
  KEY `R_24` (`schema_name`,`table_name`,`sys_name`),
  KEY `R_25` (`etl_dvlpr_name`),
  CONSTRAINT `etl_tasks_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `etl_tables` (`schema_name`, `table_name`, `sys_name`),
  CONSTRAINT `etl_tasks_ibfk_2` FOREIGN KEY (`etl_dvlpr_name`) REFERENCES `etl_developer` (`etl_dvlpr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_tasks
-- ----------------------------
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H01_Popu_Mer_Rela', '', 'vpdata', 'haiwei', 'H01_Popu_Mer_Rela', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H01_Unif_Popu_Info', '', 'vpdata', 'haiwei', 'H01_Unif_Popu_Info', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H02_Corp', '', 'vpdata', 'haiwei', 'H02_Corp', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H02_Org_Code_Cert', '', 'vpdata', 'haiwei', 'H02_Org_Code_Cert', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H03_Admin_Regn', '', 'vpdata', 'haiwei', 'H03_Admin_Regn', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Cert_Typ', '', 'vpdata', 'haiwei', 'H99_Cert_Typ', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_CODE_MAP', '', 'vpdata', 'haiwei', 'H99_CODE_MAP', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Corp_Typ', '', 'vpdata', 'haiwei', 'H99_Corp_Typ', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Edu_Degr', '', 'vpdata', 'haiwei', 'H99_Edu_Degr', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Inds_Typ_Cd', '', 'vpdata', 'haiwei', 'H99_Inds_Typ_Cd', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Marrg_Stat', '', 'vpdata', 'haiwei', 'H99_Marrg_Stat', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Nati', '', 'vpdata', 'haiwei', 'H99_Nati', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('AAAA.vpdata.H99_Nation', '', 'vpdata', 'haiwei', 'H99_Nation', 'AAAA', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('CZKJ.DB_ENTERPRISE_BUFFER.CZ_KJRXXK', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'CZ_KJRXXK', 'CZKJ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('CZKJ.DB_ENTERPRISE_BUFFER.T_KJSWSXXK', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'T_KJSWSXXK', 'CZKJ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('CZKJ.DB_ENTERPRISE_BUFFER.T_SFDWXXK', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'T_SFDWXXK', 'CZKJ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('DSJX.DB_ENTERPRISE_BUFFER.dishui_dengji', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'dishui_dengji', 'DSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('DSJX.DB_ENTERPRISE_BUFFER.dishui_feizhengchanghu', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'dishui_feizhengchanghu', 'DSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('DSJX.DB_ENTERPRISE_BUFFER.dishui_yanhuanzheng', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'dishui_yanhuanzheng', 'DSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('DSJX.DB_ENTERPRISE_BUFFER.dishui_zhuxiao', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'dishui_zhuxiao', 'DSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSJX.DB_ENTERPRISE_BUFFER.BAK_DJNSRXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'BAK_DJNSRXX', 'GSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSJX.DB_ENTERPRISE_BUFFER.BAK_DJ_ZXDJXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'BAK_DJ_ZXDJXX', 'GSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSJX.DB_ENTERPRISE_BUFFER.BAK_FZCKXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'BAK_FZCKXX', 'GSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSJX.DB_ENTERPRISE_BUFFER.BAK_YHZ', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'BAK_YHZ', 'GSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.AJXXB', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'AJXXB', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.banedType', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'banedType', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.ChangeFieldCnfg', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'ChangeFieldCnfg', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.code_ind', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'code_ind', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.code_ind1', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'code_ind1', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.Code_Industry', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'Code_Industry', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.Coin', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'Coin', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.ControlledName', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'ControlledName', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.CurCompactCredit', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'CurCompactCredit', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.DIM_ENTERPRISE_JYCS_INFO', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'DIM_ENTERPRISE_JYCS_INFO', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.DIM_ISSUEDEPT_CODE', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'DIM_ISSUEDEPT_CODE', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.DIM_PUNISH_TYPE_CODE', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'DIM_PUNISH_TYPE_CODE', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EnterpriseStatus', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EnterpriseStatus', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.enterprisetype', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'enterprisetype', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.entityChangeInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'entityChangeInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.entityRegisterInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'entityRegisterInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.entityVipChangeInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'entityVipChangeInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EntityVIPList', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EntityVIPList', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_HZ_GONGSHANG_04_NJ', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_HZ_GONGSHANG_04_NJ', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_12_SJZTKYDJXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_13_SJZTBGDJXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_15_QYRYXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_15_QYRYXX', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_16_SSZTYCML', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_17_QYJTMGSDJXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_17_QYJTMGSDJXX', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.EX_ZH_GONGSHANG_18_QYJTZGSDJXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'EX_ZH_GONGSHANG_18_QYJTZGSDJXX', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.FoodPermit', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'FoodPermit', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.GDaicCode', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'GDaicCode', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.investorChangeInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'investorChangeInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.investorInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'investorInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.partnerInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'partnerInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.penType', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'penType', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.seniorMember', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'seniorMember', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.shareholdersChangeInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'shareholdersChangeInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.shareholdersInfo', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'shareholdersInfo', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('GSSW.DB_ENTERPRISE_BUFFER.ZRSY', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'ZRSY', 'GSSW', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_ADDRESS', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_ADDRESS', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_ADDRESS_RESIDENCE_RESIDENT', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_BIRTH_RESIDENT', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_BIRTH_RESIDENT', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_BIRTH_SERVICE_CERTIFICATE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_BIRTH_SERVICE_CERTIFICATE', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_CYDC', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_CYDC', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_DIM_MARRIAGE_TYPE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_DIM_MARRIAGE_TYPE', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_ONLY_CHILD_CERTIFICATE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_ONLY_CHILD_CERTIFICATE', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_RESIDENT', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_RESIDENT', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.JS_XNH', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'JS_XNH', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.T_IMMUNITY_PLAN_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'T_IMMUNITY_PLAN_INFO', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JHSY.DB_PEOPLE_INFO_BUFFER.T_IMMUNITY_VACCINE_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'T_IMMUNITY_VACCINE_INFO', 'JHSY', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JYJX.DB_PEOPLE_INFO_BUFFER.T_ENROLLMENT_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'T_ENROLLMENT_INFO', 'JYJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('JYJX.DB_PEOPLE_INFO_BUFFER.T_SCHOOL_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'T_SCHOOL_INFO', 'JYJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('LYWX.DB_PEOPLE_INFO_BUFFER.T_INTERNATIONAL_TOURIST_STATISTICS', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'T_INTERNATIONAL_TOURIST_STATISTICS', 'LYWX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.MZ_BEGGAR_REGISTER_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'MZ_BEGGAR_REGISTER_INFO', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.MZ_URBAN_ALLOWANCE_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'MZ_URBAN_ALLOWANCE_INFO', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.RC_MARRY', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RC_MARRY', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.sf_reqdetail', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'sf_reqdetail', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.so_baseinfomain', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'so_baseinfomain', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.so_basepeopinfo', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'so_basepeopinfo', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('MZJX.DB_PEOPLE_INFO_BUFFER.T_CHILDREN_ADOPT_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'T_CHILDREN_ADOPT_INFO', 'MZJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('pdata.H01_Corp_Member', '', 'pdata', 'haiwei', '企业成员', 'DW', null, null, null, '未开始', null, '5');
INSERT INTO `etl_tasks` VALUES ('pdata.H01_Flow_Popu', '', 'pdata', 'haiwei', '流动人口', 'DW', null, null, null, '未开始', null, '15');
INSERT INTO `etl_tasks` VALUES ('pdata.H01_Marrg', '', 'pdata', 'haiwei', '婚姻', 'DW', null, null, null, '未开始', null, '9');
INSERT INTO `etl_tasks` VALUES ('pdata.H01_Popu', '', 'pdata', 'haiwei', '人口', 'DW', null, null, null, '未开始', null, '2');
INSERT INTO `etl_tasks` VALUES ('pdata.H01_Popu_Birth', '', 'pdata', 'haiwei', '出生', 'DW', null, null, null, '未开始', null, '7');
INSERT INTO `etl_tasks` VALUES ('pdata.H01_Stud_Stat', '', 'pdata', 'haiwei', '学籍', 'DW', null, null, null, '未开始', null, '11');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Admin_Puni_Case', '', 'pdata', 'haiwei', '行政处罚案件', 'DW', null, null, null, '未开始', null, '23');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Corp', '', 'pdata', 'haiwei', '法人', 'DW', null, null, null, '未开始', null, '14');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Corp_Revok', '', 'pdata', 'haiwei', '企业注吊销', 'DW', null, null, null, '未开始', null, '6');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Corp_Unus_Direct', '', 'pdata', 'haiwei', '企业异常名录', 'DW', null, null, null, '未开始', null, '4');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Fams_Brand', '', 'pdata', 'haiwei', '著名驰名商标', 'DW', null, null, null, '未开始', null, '21');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Keep_Cret_Corp', '', 'pdata', 'unknown', '守重企业', 'DW', null, null, null, '未开始', null, '12');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Org_Code_Cert', '', 'pdata', 'haiwei', '组织机构代码证', 'DW', null, null, null, '未开始', null, '20');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Tax_Remov', '', 'pdata', 'haiwei', '税务注销', 'DW', null, null, null, '未开始', null, '17');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Tax_Rgst', '', 'pdata', 'haiwei', '税务登记', 'DW', null, null, null, '未开始', null, '18');
INSERT INTO `etl_tasks` VALUES ('pdata.H02_Tax_Unus_Corp', '', 'pdata', 'haiwei', '税务非正常户认定', 'DW', null, null, null, '未开始', null, '19');
INSERT INTO `etl_tasks` VALUES ('pdata.H03_Admin_Regn', '', 'pdata', 'haiwei', '行政区划', 'DW', null, null, null, '未开始', null, '22');
INSERT INTO `etl_tasks` VALUES ('pdata.H03_School', '', 'pdata', 'haiwei', '学校', 'DW', null, null, null, '未开始', null, '10');
INSERT INTO `etl_tasks` VALUES ('pdata.H08_Corp_Insure', '', 'pdata', 'haiwei', '企业参保', 'DW', null, null, null, '未开始', null, '3');
INSERT INTO `etl_tasks` VALUES ('pdata.H08_Indv_Insure', '', 'pdata', 'haiwei', '个人参保', 'DW', null, null, null, '未开始', null, '1');
INSERT INTO `etl_tasks` VALUES ('pdata.H08_Low_Secu_Family', '', 'pdata', 'haiwei', '城乡低保户', 'DW', null, null, null, '未开始', null, '8');
INSERT INTO `etl_tasks` VALUES ('pdata.H08_Ncms', '', 'pdata', 'haiwei', '新农合', 'DW', null, null, null, '未开始', null, '13');
INSERT INTO `etl_tasks` VALUES ('pdata.H08_Social_Secu_Crd', '', 'pdata', 'haiwei', '社保卡', 'DW', null, null, null, '未开始', null, '16');
INSERT INTO `etl_tasks` VALUES ('RSJX.DB_ENTERPRISE_BUFFER.JF1', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'JF1', 'RSJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.AB01_TO_GXT', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'AB01_TO_GXT', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.AC01_TO_GXT', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'AC01_TO_GXT', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.AC02_TO_GXT', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'AC02_TO_GXT', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_CBZT_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_CBZT_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_DWCBZT_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_DWCBZT_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_HKXZ_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_HKXZ_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_HYZK_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_HYZK_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_JYZT_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_JYZT_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_MZ_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_MZ_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_RYXB_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_RYXB_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_SBJBJG_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_SBJBJG_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_SHBXZT_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_SHBXZT_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_WHCD_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_WHCD_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_XZXL_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_XZXL_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_YGXZ_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_YGXZ_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('SHBZ.DB_PEOPLE_INFO_BUFFER.RS_DIM_ZZMM_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'RS_DIM_ZZMM_CODE', 'SHBZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJJX.DB_PEOPLE_INFO_BUFFER.hy_interface_house', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'hy_interface_house', 'ZJJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJJX.DB_PEOPLE_INFO_BUFFER.hy_interface_lease', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'hy_interface_lease', 'ZJJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJJX.DB_PEOPLE_INFO_BUFFER.PUBIC_DIM_ADDRESS_CODE', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'PUBIC_DIM_ADDRESS_CODE', 'ZJJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJJX.DB_PEOPLE_INFO_BUFFER.ZJ_PUBLIC_HOUSE_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'ZJ_PUBLIC_HOUSE_INFO', 'ZJJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJJX.DB_PEOPLE_INFO_BUFFER.ZJ_RENT_HOUSE_INFO', '', 'DB_PEOPLE_INFO_BUFFER', 'haiwei', 'ZJ_RENT_HOUSE_INFO', 'ZJJX', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJZZ.DB_ENTERPRISE_BUFFER.V_QYDMFZXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'V_QYDMFZXX', 'ZJZZ', null, null, null, null, null, null);
INSERT INTO `etl_tasks` VALUES ('ZJZZ.DB_ENTERPRISE_BUFFER.V_QYDMXX', '', 'DB_ENTERPRISE_BUFFER', 'haiwei', 'V_QYDMXX', 'ZJZZ', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `etl_tasks_his`
-- ----------------------------
DROP TABLE IF EXISTS `etl_tasks_his`;
CREATE TABLE `etl_tasks_his` (
  `etl_dvlpr_name` varchar(60) DEFAULT NULL,
  `src_table_name` varchar(60) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `schema_name` varchar(60) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `task_name` varchar(100) NOT NULL,
  `sys_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`version`,`task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_tasks_his
-- ----------------------------

-- ----------------------------
-- Table structure for `src_column_analysis`
-- ----------------------------
DROP TABLE IF EXISTS `src_column_analysis`;
CREATE TABLE `src_column_analysis` (
  `column_name` varchar(60) NOT NULL,
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
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `column_len` int(11) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `ref_table` varchar(60) DEFAULT NULL,
  `ref_column` varchar(60) DEFAULT NULL,
  `doc_col_len` int(11) DEFAULT NULL,
  `doc_ref_tbl` varchar(60) DEFAULT NULL,
  `doc_ref_col` varchar(60) DEFAULT NULL,
  `uv_check` tinyint(1) DEFAULT NULL,
  `null_check` tinyint(1) DEFAULT NULL,
  `value_check` tinyint(1) DEFAULT NULL,
  `ref_check` tinyint(1) DEFAULT NULL,
  `unique_values` text,
  `ref_ok` tinyint(1) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  PRIMARY KEY (`column_name`,`schema_name`,`table_name`,`sys_name`),
  KEY `R_5` (`schema_name`,`table_name`,`sys_name`),
  CONSTRAINT `src_column_analysis_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `src_table_analysis` (`schema_name`, `table_name`, `sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_column_analysis
-- ----------------------------
INSERT INTO `src_column_analysis` VALUES ('', null, null, null, null, null, null, null, null, null, null, null, '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `src_column_analysis` VALUES ('AAB003', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '20', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB003', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '20', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB004', 'varchar', '1', '0', '参保单位名称', '0', '0', '', '', '0', '0', '该表只能使用企业名称进行整合', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '200', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB004', 'varchar', '1', '0', '参保单位名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '200', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB034', 'varchar', '1', '0', '所属区号', '0', '0', '', '', '0', '0', '与js_address关联不上', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '16', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB034', 'varchar', '1', '0', '所属区号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '16', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB034', 'varchar', '1', '0', '经办机构', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '16', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB036', 'datetime2', '1', '0', '参保日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '7', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB036', 'varchar', '1', '0', '参保日期', '0', '0', '', '', '0', '0', '不确定字段含义', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '19', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB037', 'datetime2', '1', '0', '传输日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '7', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB037', 'datetime2', '1', '0', '数据传输时间', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '7', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB037', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '7', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB051', 'varchar', '1', '0', '参保状态', '0', '0', '', '', '0', '0', '2 50\n3 5434\n 13\n1 96260\n0 5\n', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '3', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB999', 'varchar', '0', '1', '单位参保编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '14', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB999', 'varchar', '1', '0', '单位编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '14', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAB999', 'varchar', '0', '1', '单位编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '14', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC003', 'varchar', '1', '0', '姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC004', 'varchar', '1', '0', '性别', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC005', 'varchar', '1', '0', '民族', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC006', 'datetime2', '1', '0', '出生日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '7', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC007', 'datetime2', '1', '0', '参加工作日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '7', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC009', 'varchar', '1', '0', '户口性质', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC010', 'varchar', '1', '0', '户口所在地', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '150', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC011', 'varchar', '1', '0', '文化程度', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC013', 'varchar', '1', '0', '用工性质', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC016', 'varchar', '1', '0', '就业状态', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC017', 'varchar', '1', '0', '婚姻状况', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC024', 'varchar', '1', '0', '政治面貌', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC031', 'varchar', '1', '0', '参保状态', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC031', 'varchar', '1', '0', '参保状态', '0', '0', '', '', '0', '0', '  2\n参保缴费 1 7705379\n暂停参保 2 6158663\n终止参保 3 968966\n', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '3', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC084', 'varchar', '1', '0', '社会保险状态', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '3', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC147', 'varchar', '1', '0', '证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '22', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC999', 'varchar', '0', '1', '个人编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '14', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAC999', 'varchar', '0', '1', '个人编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '14', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE004', 'varchar', '1', '0', '联系人', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '50', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE005', 'varchar', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '40', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE006', 'varchar', '1', '0', '通讯地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '150', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE007', 'varchar', '1', '0', '邮政编码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '14', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE036', 'varchar', '1', '0', '经办日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '19', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE041', 'varchar', '0', '1', '参保开始年月', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '6', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE042', 'varchar', '1', '0', '参保终止日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '6', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE043', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '6', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AAE140', 'varchar', '0', '1', '险种类型代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '3', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS', 'varchar', '1', '0', '地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '1000', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ADDRESSUUID', 'varchar', '0', '1', '地址编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_CODE', 'varchar', '1', '0', '地址编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_CODE', 'varchar', '1', '0', '当前区化代码', '0', '0', 'varchar(50)', '当前区化代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_CODE', 'varchar', '1', '0', '具体地址编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_INFO', 'varchar', '1', '0', '详细地址', '0', '0', 'varchar(500)', '详细地址', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '500', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_LEVEL_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '500', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_LEVEL_CODE', 'varchar', '1', '0', '区化层级代码', '0', '0', 'varchar(500)', '区化层级代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '500', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_NAME', 'varchar', '1', '0', '地址名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_NAME', 'varchar', '1', '0', '具体地址名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '255', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_NOW_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '77', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_NOW_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '78', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ADDRESS_UUID', 'varchar', '1', '0', '地址代理键', '0', '0', 'varchar(50)', '地址代理键', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ADMDIV', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Admin_Regn_ID', '', '0', '1', '行政区域编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Admin_Regn_Nm', '', '0', '0', '行政区域名称', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Admin_Regn_Typ_Cd', '', '0', '0', '行政区划种类代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('AGENCY', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('AIC162', 'datetime2', '1', '0', '离退休日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '7', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('AICID', 'varchar', '1', '0', '登记机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '100', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Aim_Code_Desc', 'String', '0', '0', '目标代码描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_CODE_MAP', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Aim_Code_Value', 'String', '0', '0', '目标代码值', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_CODE_MAP', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('applyCardNo', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyCardType', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '20', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyDate', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyDept', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '100', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyFmlyNum', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyIncome', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '100', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyReg', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '200', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('applyTel', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('APPLY_DATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '7', '69', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('APPLY_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '360', '68', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('APPROVEDATE', 'datetime2', '1', '0', '发照日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '7', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('APPROVEDEPTID', 'varchar', '1', '0', '监督机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '10', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('APP_DATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '7', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Area_c', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '6', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Area_c', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '6', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Area_in', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '6', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Area_pub', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '6', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BANEDTYPE', 'char', '1', '0', '类别', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '1', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('BEGINDATE', 'datetime2', '1', '0', '营业期限自', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '7', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('BEGINYEARMONTH', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BGHHYML', 'varchar', '1', '0', '变更后行业门类', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '4000', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('BGRQ', 'datetime', '1', '0', '变更日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('BHRQ', 'datetime', '1', '0', '登记日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('BIRTHDATE', 'date', '1', '0', '出生日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_ADDRESS_INFO', 'varchar', '1', '0', '出生地址详细信息', '0', '0', 'varchar(255)', '出生地址详细信息', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '255', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_DATE', 'datetime2', '1', '0', '出生日期', '0', '0', 'datetime', '出生日期', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Birth_Dt', 'date', '1', '0', '出生日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_HEALTH_CODE', 'varchar', '1', '0', '新生儿出生健康状况代码', '0', '0', 'varchar(10)', '新生儿出生健康状况代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_HEALTH_NAME', 'varchar', '1', '0', '新生儿出生健康状况名称', '0', '0', 'varchar(50)', '新生儿出生健康状况名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_MAN', 'datetime2', '1', '0', '男方生日', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '7', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_POLICY_PROPERTY_CODE', 'varchar', '1', '0', '出生政策属性代码', '0', '0', 'varchar(10)', '出生政策属性代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_POLICY_PROPERTY_NAME', 'varchar', '1', '0', '出生政策属性名称', '0', '0', 'varchar(50)', '出生政策属性名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_SERVICE_TYPE_CODE', 'varchar', '1', '0', '生育服务证证件类型编码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '10', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_SERVICE_TYPE_NAME', 'varchar', '1', '0', '生育服务证证件类型名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('BIRTH_WOMAN', 'datetime2', '1', '0', '女方生日', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '7', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BLYHZ_RQ', 'datetime', '1', '0', '验换证日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('BOOK_ID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '300', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BSYRGM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '255', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BSYRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '255', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BUSINESSSCOPE', 'varchar', '1', '0', '经营范围', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '4000', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('BUSINESS_ID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Busi_Opr_Site', '', '1', '0', '经营场所', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Busi_Opr_Stat_Cd', '', '1', '0', '经营状态代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Busi_Scop', '', '1', '0', '经营范围', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Busi_Start_Dt', '', '1', '0', '营业起始日期 ', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Busi_Upto_Dt', '', '1', '0', '营业截至日期 ', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('BYYX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '500', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('BZ1', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '255', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZ1', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZ1', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZ1', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '32', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZ2', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '255', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZ2', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZ2', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZ2', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '33', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZ3', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '255', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZ3', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZ3', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZ3', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '34', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZJE', 'varchar', '1', '0', '保障金额', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZRK', 'varchar', '1', '0', '保障人口数', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZRQ', 'datetime', '0', '0', '颁证日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('BZSJ', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '7', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZSJ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '0', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('BZSJ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '0', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('BZSJ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '0', '35', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('CALENDAR_MONTH', 'int', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('CALENDAR_QUARTRY', 'int', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('CALENDAR_YEAR', 'int', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('CANCEL_PROOF', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '765', '60', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CERTID', 'varchar', '1', '0', '法定代表人证件号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '100', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CERTIFICATE_NUMBER', 'varchar', '1', '0', '证件号码', '0', '0', 'varchar(50)', '证件号码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTIFICATE_NUMBER', 'varchar', '1', '0', '证件号码', '0', '0', 'varchar(50)', '证件号码', '0', '0', '证件类型为111的数据，长度：\n18 11634382\n4 175\n11 213\n19 14\n17 14603\n16 644\n14 936\n15 1863\n13 245\n6 541\n5 481\n7 333\n8 230\n9 704\n2 56\n20 1\n3 152\n12 240\n1 168\n10 3285\n', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '4', '', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTIFICATE_NUMBER', 'varchar', '1', '0', '证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTIFICATE_TYPE_CODE', 'varchar', '1', '0', '证件类型代码', '0', '0', 'varchar(10)', '证件类型代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '10', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTIFICATE_TYPE_CODE', 'varchar', '1', '0', '证件类型代码', '0', '0', 'varchar(10)', '证件类型代码', '0', '0', '未找到对应代码表\nnull  547735\n111 11659266\n114 31\n115 12\n414 12\n511 6\n512 1\n513 21\n516 6\n552 3\n553 1\n554 1\n990 12\n', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '3', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTIFICATE_TYPE_CODE', 'varchar', '1', '0', '证件类型', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '10', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTITICATE_NUMBER', 'varchar', '1', '0', '生育服务证证号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTITICATE_NUMBER', 'varchar', '1', '0', '生育服务证证号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CERTNAME', 'varchar', '1', '0', '法定代表人证照/证照类型', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '200', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CERT_NO', 'varchar', '1', '0', '婚姻登记号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '300', '51', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Cert_Num', 'string', '1', '0', '证件号码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('CERT_NUM_MAN', 'varchar', '1', '0', '男方证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '150', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CERT_NUM_WOMAN', 'varchar', '1', '0', '女方证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '150', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CERT_PROOF_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '765', '44', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CERT_PROOF_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '765', '45', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Cert_Typ', 'string', '1', '0', '证件类型', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Cert_typ', '', '0', '1', '证件类型', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Cert_Typ', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('CERT_TYPE_MAN', 'varchar', '1', '0', '男方证件类型', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CERT_TYPE_WOMAN', 'varchar', '1', '0', '女方证件类型', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Cert_Typ_Desc', '', '0', '0', '证件类型描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Cert_Typ', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('CHECK_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '55', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CHECK_DATA', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '56', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CHILD_BIRTH_DATE', 'datetime2', '1', '0', '孩子出生日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '7', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_CERTIFICATE_CODE', 'varchar', '1', '0', '孩子身份证件类型', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '10', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_CERTIFICATE_NUMBER', 'varchar', '1', '0', '新生儿证件号码', '0', '0', 'varchar(50)', '新生儿证件号码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_CERTIFICATE_NUMBER', 'varchar', '1', '0', '孩子身份证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_CERTIFICATE_TYPE_CODE', 'varchar', '1', '0', '新生儿证件类型代码', '0', '0', 'varchar(10)', '新生儿证件类型代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_GENDER_CODE', 'varchar', '1', '0', '新生儿性别代码', '0', '0', 'varchar(10)', '新生儿性别代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_GENDER_CODE', 'varchar', '1', '0', '孩子性别代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '10', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_GENDER_NAME', 'varchar', '1', '0', '新生儿性别名称', '0', '0', 'varchar(50)', '新生儿性别名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_GENDER_NAME', 'varchar', '1', '0', '孩子性别名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_HOUSEHOLD_ADDRESS', 'varchar', '1', '0', '孩子户籍地详细地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '255', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_HOUSEHOLD_ADDRESS_CODE', 'varchar', '1', '0', '孩子户籍地区划代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_NAME', 'varchar', '1', '0', '孩子姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_RESIDENT_ADDRESS', 'varchar', '1', '0', '孩子现居住地详细地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '2000', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_RESIDENT_ADDRESS_CODE', 'varchar', '1', '0', '孩子现居住地区划代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_RESIDENT_NAME', 'varchar', '1', '0', '新生儿姓名', '0', '0', 'varchar(50)', '新生儿姓名', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_RESIDENT_UUID', 'varchar', '1', '0', '新生儿居民表外键', '0', '0', 'varchar(50)', '新生儿居民表外键', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_SURVIVAL_CODE', 'varchar', '1', '0', '子女存活情况代码', '0', '0', 'varchar(10)', '子女存活情况代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CHILD_SURVIVAL_NAME', 'varchar', '1', '0', '子女存活情况名称', '0', '0', 'varchar(50)', '子女存活情况名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Chk_Aprv_Dt', '', '1', '0', '核准日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('CITY_CODE', 'varchar', '1', '0', '地市编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CITY_CODE', 'varchar', '1', '0', '城市编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('CITY_NAME', 'varchar', '1', '0', '地市名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CITY_NAME', 'varchar', '1', '0', '城市名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '255', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Code_Map_Type_Cd', 'String', '0', '0', '代码映射类型代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_CODE_MAP', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('COHABIT_DATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '7', '59', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('COMMENTS', 'varchar', '1', '0', '企业名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '100', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CONCREYEAR', 'decimal', '1', '0', '公示年度', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '38', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CONFIM_STATU', 'varchar', '1', '0', '确认状态 1：已确认  0：未确认  2：不确认', '0', '0', 'varchar(50)', '确认状态 1：已确认  0：未确认  2：不确认', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CONTACT_WAY', 'varchar', '1', '0', '联系方式', '0', '0', 'varchar(50)', '联系方式', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CONTINUECOMCRENUM', 'decimal', '1', '0', '连续公示年度', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '38', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CONTROLLEDKEYID', 'varchar', '0', '1', 'UUID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CONTROLLEDKEYNAME', 'varchar', '1', '0', '注册商标', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '100', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Cont_Tel', '', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Cont_Tel', '', '0', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('CORPADDRESS', 'varchar', '1', '0', '企业地址', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '1000', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CORPNAME', 'varchar', '1', '0', '企业名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '100', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CORPNAME', 'varchar', '1', '0', '企业名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '500', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Corp_Nm', '', '1', '0', '企业名称', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Corp_Rgst_Num', '', '1', '0', '企业注册号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Corp_Rgst_Num', '', '0', '0', '企业注册号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Corp_Typ_Cd', '', '1', '0', '企业类型代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Corp_Typ_Cd', 'string', '0', '1', '企业类型代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Corp_Typ', '4', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Corp_Typ_Cd_Desc', 'string', '0', '0', '企业类型代码描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Corp_Typ', '60', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Coty_ID', '', '0', '0', '区县编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Country_ID', '', '0', '0', '国家编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('COUNTY_CODE', 'varchar', '1', '0', '区县编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('COUNTY_CODE', 'varchar', '1', '0', '区县编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('COUNTY_NAME', 'varchar', '1', '0', '区县名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('COUNTY_NAME', 'varchar', '1', '0', '区县名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '255', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('CQCS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '1000', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CREATETIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('Createtime', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('CREATETIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('CREATETIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('CREATE_DATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CREATE_TIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('CSRQ', 'varchar', '1', '0', '出生日期', '0', '0', '', '', '0', '0', '8位年月日', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('CSRQ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CSRQ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CURCOMPACTCREDITID', 'varchar', '0', '1', 'UUID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Curr_Cd', '', '1', '0', '币种', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('CXBZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '1', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CYBH', 'varchar', '1', '0', '成员编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CYDC_BDAY', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_DAR', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_DARCODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_DIA', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUECODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUMCODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUR', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FURCODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_FUSCODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_NDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_RHG', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_RHGCODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_SDOC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_SEX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_SEXCODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_SYS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CYDC_TDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('CZBL', 'decimal', '1', '0', '出资比例', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '16', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CZE', 'decimal', '1', '0', '出资额', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '16', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CZFS', 'varchar', '1', '0', '出资方式', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '250', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CZMJ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('CZQX', 'datetime2', '1', '0', '出资期限', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '7', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('CZSJ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '0', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CZWBH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('CZYT', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('CZ_STATUS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('CZ_STATUS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '不清楚字段含义，全部为0', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '1', '29', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '数据标示', '0', '0', 'char(1)', '数据标示', '0', '0', '未确认：DATAFLAG=1是有效数据？', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '1', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '数据标示', '0', '0', 'char(1)', '数据标示', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '1', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '数据标示', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '1', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '数据标示', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '1', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '数据标示', '0', '0', 'char(1)', '数据标示', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '1', '23', '', '', '1', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATAFLAG', 'char', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '1', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATA_DATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Data_Dt', 'string', '1', '0', '数据日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Dt', '', '0', '0', '数据日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('DATA_FLAG', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '1', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DATA_SOURCE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '3', '61', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Cd', 'string', '1', '0', '数据来源代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Cd', 'string', '1', '0', '数据来源代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '29', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Cd', '', '0', '0', '数据来源代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Cd', '', '0', '0', '数据来源代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Cd', '', '0', '0', '数据来源代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Tbl', 'string', '1', '0', '数据来源表', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Tbl', 'string', '1', '0', '数据来源表', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Tbl', '', '0', '0', '数据来源表', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Tbl', '', '0', '0', '数据来源表', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Data_Src_Tbl', '', '0', '0', '数据来源表', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('dCreateDate', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '0', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('dDate', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DEATH_DATE', 'datetime2', '1', '0', '死亡日期', '0', '0', 'datetime', '死亡日期', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DEFAULTTIME', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '0', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('DEFAULT_TIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('DEGREE_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '字段含义不明确', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DEGREE_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '字段含义不明确', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DELEGATED_CERT_NO', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '150', '74', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DELEGATED_CERT_TYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '73', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DELEGATED_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '360', '72', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DELEGATE_FLAG', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '1', '70', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DELEGATE_TYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '71', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DELIVERY_TIME', 'datetime2', '1', '0', '分娩时间', '0', '0', 'datetime27', '分娩时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '7', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('DEPT', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DEPT_CODE', 'varchar', '1', '0', '办理机构代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '60', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DEPT_NAME', 'varchar', '1', '0', '办理机构', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DHHM', 'varchar', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '20', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('DHHM', 'varchar', '1', '0', '电话号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '80', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('DHHM', 'varchar', '1', '0', '经营者身份证号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '80', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Die_Dt', 'date', '1', '0', '死亡日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('DIVORCE_REASON', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '66', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DJGXJG', 'decimal', '1', '0', '登记管辖机关编号 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '22', '29', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('DJGXJG', 'decimal', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '22', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('DJRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('DJZCLX_MC', 'varchar', '1', '0', '经营类型', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('dModifyDate', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '0', '34', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DOC_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '60', '62', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DOC_NO', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '65', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DOC_PAGE_NUM', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '64', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DOC_YEAR', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '63', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DQZT', 'varchar', '1', '0', '当前状态 ', '0', '0', '', '', '0', '0', '未找到对应码表', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '10', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Driv_lice_Num', 'string', '1', '0', '驾驶证编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('dSQRQ', 'date', '1', '0', '申请日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '0', '30', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('dSQRQ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('DWCBZT_CODE', 'varchar', '0', '1', '参保状态代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_DWCBZT_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('DWCBZT_NAME', 'varchar', '0', '1', '参保状态代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_DWCBZT_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('DXJG', 'varchar', '1', '0', '吊销机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '100', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('DXRQ', 'datetime2', '1', '0', '吊销日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '7', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('DXSY', 'varchar', '1', '0', '吊销事由', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '500', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('DZMP', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('EDUCATION_CODE', 'varchar', '1', '0', '当前教育程度代码', '0', '0', 'varchar(10)', '当前教育程度代码', '0', '0', '与RS_DIM_WHCD_CODE不一致，需做对照', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '19', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('EDUCATION_NAME', 'varchar', '1', '0', '当前教育程度名称', '0', '0', 'varchar(50)', '当前教育程度名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '20', '', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Edu_Degr_Cd', 'string', '1', '0', '文化程度代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('ENDDATE', 'datetime2', '1', '0', '营业期限至', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '7', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ENDYEARMONTH', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('END_TIME', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '0', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('END_TIME', 'datetime2', '1', '0', '结束时间', '0', '0', 'datetime27', '结束时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '7', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ENTITYNO', 'varchar', '1', '0', '市场主体ID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '36', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ENTITYTYPE', 'varchar', '1', '0', '企业类型', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '100', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Estb_Dt', '', '1', '0', '成立日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('ETXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '255', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('EXEDATE', 'datetime2', '1', '0', '生效日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '7', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FACTAMT', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '16', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('FAMILYINFO_CODE', 'varchar', '1', '0', '家庭户信息代码', '0', '0', 'varchar(50)', '家庭户信息代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FAMILYINFO_DESC', 'varchar', '1', '0', '家庭户信息描述', '0', '0', 'varchar(50)', '家庭户信息描述', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Family_Tel', 'string', '1', '0', '家庭电话', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('fBZJE', 'numeric', '1', '0', '保障金额', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '16', '32', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('FDDBR', 'varchar', '1', '0', '法定代表人', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '100', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('FDDBR', 'varchar', '1', '0', '法定代表人(负责人)', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '100', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FDDBR', 'varchar', '1', '0', '章程(协议)', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '300', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FDDBR', 'varchar', '1', '0', '法定代表人', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '100', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FDDBRMC', 'varchar', '1', '0', '法人代表', '0', '0', '', '', '0', '0', '只有姓名信息，入不了人口主题', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('FDDBRXM', 'varchar', '1', '0', '法定代表人姓名', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FDSERVEDNOTICEDATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '7', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FICASEID', 'varchar', '0', '1', 'UUID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '100', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FLAG', 'numeric', '1', '0', '数据传输标志位', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '1', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('FLAG', 'numeric', '1', '0', '数据传输标志位', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '1', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('FLAG', 'int', '1', '0', '终止标志', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('FLOWREASON_CODE', 'varchar', '1', '0', '流动原因代码', '0', '0', 'varchar(50)', '流动原因代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FLOWREASON_DESC', 'varchar', '1', '0', '流动原因描述', '0', '0', 'varchar(50)', '流动原因描述', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FLOW_FLAG', 'char', '1', '0', '流动标记（0 非流动人口；1 省内流动；  2 跨省流入； 3 跨省流出）', '0', '0', 'char(1)', '流动标记（0 非流动人口；1 省内流动；  2 跨省流入； 3 跨省流出）', '0', '0', 'null 2996634\n0 7966357\n1 624425\n2 548439\n3 71248\n5 2\n6 2\n', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '1', '27', '', '', '1', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FLOW_TIME', 'datetime2', '1', '0', '流动时间', '0', '0', 'datetime27', '流动时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '7', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FLOW_TYPE', 'varchar', '1', '0', '流动状态 5：流动  6：不流动', '0', '0', 'varchar(50)', '流动状态 5：流动  6：不流动', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FOLK_MAN', 'varchar', '1', '0', '男方民族代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('FOLK_WOMAN', 'varchar', '1', '0', '女方民族代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('FOUNDINGDATE', 'datetime2', '1', '0', '成立日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '7', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FQSFZH', 'varchar', '1', '0', '父亲身份证号', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('FQXM', 'varchar', '1', '0', '父亲姓名', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('FROMDATE', 'datetime2', '1', '0', '产生日期和有效期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '7', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FROM_ADDRESS_INFO', 'varchar', '1', '0', '流出地详细地址（楼宇门牌号等）', '0', '0', 'varchar(500)', '流出地详细地址（楼宇门牌号等）', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '500', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FROM_LEVEL_CODE', 'varchar', '1', '0', '流出地层级代码', '0', '0', 'varchar(500)', '流出地层级代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '500', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FROM_RESION_CODE', 'varchar', '1', '0', '流出地代码（暂存备用）', '0', '0', 'varchar(50)', '流出地代码（暂存备用）', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('FRSFZH', 'varchar', '1', '0', '法人身份证号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '50', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FRSFZH', 'varchar', '1', '0', '法人证件名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '100', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FRZJHM', 'varchar', '1', '0', '法人证件号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FRZJMC', 'varchar', '1', '0', '法人证件名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '100', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FRZJMC', 'varchar', '1', '0', '法定代表人(负责人)', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '200', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FRZJMC', 'varchar', '1', '0', '法人证件名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '100', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FSDECIDEDATE', 'datetime2', '1', '0', '处罚时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '7', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FSENTITYIDCODE', 'varchar', '1', '0', '市场主体ID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FSENTITYIDCODE', 'varchar', '1', '0', '市场主体ID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '36', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FSJUDGMENT', 'varchar', '1', '0', '处罚结果', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '3000', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FSPUNISHDATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '7', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FSUNDERTAKEORGNAME', 'varchar', '1', '0', '处罚机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '2000', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('FWBH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('FWCQXZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('FWMJ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('FWXXDZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '1500', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('FZCHJCRQ', 'datetime', '1', '0', '非正常用户解除日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('FZCHRDRQ', 'datetime', '1', '0', '非正常用户认定日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('FZRQ', 'datetime', '1', '0', '废置日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('GATHERTIMESTAMP', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '0', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('GENDER', 'char', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '1', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('Gender_Cd', 'string', '1', '0', '性别代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('GENDER_CODE', 'varchar', '1', '0', '居民当前性别代码', '0', '0', 'varchar(10)', '居民当前性别代码', '0', '0', '1：男性\n2：女性', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '5', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('GENDER_NAME', 'varchar', '1', '0', '居民当前性别名称', '0', '0', 'varchar(50)', '居民当前性别名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '6', '', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('gFamilyInfoID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('gFamilyInfoID', 'varchar', '1', '0', '低保家庭编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('gFamilyInfoID', 'varchar', '0', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('GLRGMSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '54', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GLRLXDH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '90', '29', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GLRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GMSFZH', 'varchar', '1', '0', '公民身份证号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '54', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('GMSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('GMSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '50', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('GRANTFAMT', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '16', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('GRCQRGMSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '54', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GRCQRLXDH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GRCQRLXDZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '500', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GRCQRXB', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '150', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GRCQRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GSYYZZEWM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '64', '30', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('GSZCH', 'varchar', '1', '0', '工商注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('GXPCS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '500', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('GZDW', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '500', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('HEALTH_CODE', 'varchar', '1', '0', '健康状况代码', '0', '0', 'varchar(10)', '健康状况代码', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '21', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HEALTH_NAME', 'varchar', '1', '0', '健康状况名称', '0', '0', 'varchar(50)', '健康状况名称', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '22', '', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HJSZD', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('HKXZ_CODE', 'varchar', '0', '1', '户口性质代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HKXZ_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('HKXZ_NAME', 'varchar', '0', '1', '户口性质代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HKXZ_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('Hlth_Stat_Cd', 'string', '1', '0', '健康状况代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('houseAddr', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '200', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('houseAddr', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '200', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('HOUSEHOLD_ADDRESS_INFO', 'varchar', '1', '0', '户籍地址详细信息', '0', '0', 'varchar(500)', '户籍地址详细信息', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '500', '16', '', '', '500', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HOUSEHOLD_NATURE_CODE', 'varchar', '1', '0', '当前户口性质代码', '0', '0', 'varchar(10)', '当前户口性质代码', '0', '0', '与RS_DIM_HKXZ_CODE不一致\nnull  875346\n1 非农业户口 4167069\n2 非农业户口 26\n0 农业户口 1\n1 农业户口 40\n2 农业户口 7159358\n9 其他 5267\n', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '17', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HOUSEHOLD_NATURE_NAME', 'varchar', '1', '0', '当前户口性质名称', '0', '0', 'varchar(20)', '当前户口性质名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '20', '18', '', '', '20', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HOUSEHOLD_REGION_CODE', 'varchar', '1', '0', '当前户籍地区化层级代码', '0', '0', 'varchar(500)', '当前户籍地区化层级代码', '0', '0', '见JS_ADDRESS', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '500', '15', '', '', '500', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('houseId', 'bigint', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('houseId', 'bigint', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('houseNum', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('houseNum', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('houseType', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Hshld_Addr_ID', 'string', '1', '0', '户籍地址编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Hshld_Prop_Cd', 'string', '1', '0', '户口性质代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_CERTIFICATE_CODE', 'varchar', '1', '0', '男方证件类型代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '10', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_CERTIFICATE_CODE', 'varchar', '1', '0', '男方证件类型代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '10', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_CERTIFICATE_NUMBER', 'varchar', '1', '0', '男方证件号码', '0', '0', 'varchar(50)', '男方证件号码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_CERTIFICATE_NUMBER', 'varchar', '1', '0', '男方证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_CERTIFICATE_NUMBER', 'varchar', '1', '0', '男方证件号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_CERTIFICATE_TYPE_CODE', 'varchar', '1', '0', '男方身份证代码', '0', '0', 'varchar(10)', '男方身份证代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_NAME', 'varchar', '1', '0', '男方姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_NAME', 'varchar', '1', '0', '男方姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_RESIDENT_NAME', 'varchar', '1', '0', '男方姓名', '0', '0', 'varchar(50)', '男方姓名', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HUSBAND_RESIDENT_UUID', 'varchar', '1', '0', '男方居民表外键', '0', '0', 'varchar(50)', '男方居民表外键', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HYML', 'varchar', '1', '0', '行业门类', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '4', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('HYML', 'varchar', '1', '0', '变更前行业门类', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '4', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('HYZK_CODE', 'varchar', '0', '1', '婚姻状态代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HYZK_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('HYZK_NAME', 'varchar', '0', '1', '婚姻状态代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HYZK_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('HZRQ', 'datetime2', '1', '0', '核准日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '7', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('HZRQ', 'datetime2', '1', '0', '核准日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '7', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('HZXB', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '10', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('HZXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '255', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ID', 'numeric', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '20', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'numeric', '1', '1', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '20', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'numeric', '0', '1', 'ID', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '255', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '64', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '唯一编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'numeric', '0', '1', '编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '学籍编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '76', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '96', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('IDENTITYID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('IDENTITYID', 'varchar', '1', '0', '身份证编号', '0', '0', '', '', '0', '0', '有15位身份证号，需转换', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Iden_Info', 'string', '1', '0', '鉴别信息', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Iden_info_Typ_Cd', 'string', '1', '0', '鉴别信息种类代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('ID_Card_Num', 'string', '1', '0', '身份证号码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('ID_TYPE_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ID_TYPE_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('iJTRKS', 'varchar', '1', '0', '家庭人口数', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('IMGT_DATE', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('Inds_Cd', '', '1', '0', '行业代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Inds_Typ_Cd', 'string', '0', '1', '行业门类代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Inds_Typ_Cd', '4', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Inds_Typ_Cd_Desc', 'string', '0', '0', '行业门类代码描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Inds_Typ_Cd', '60', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('insert_date', 'datetime', '1', '0', '', '0', '0', 'datetime', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '0', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('INSURANCE_DATE', 'varchar', '1', '0', '参合日期', '0', '0', '', '', '0', '0', '原数据只有四位年份，转为每年的1月1日（与易建数据保持一致)', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('INSURANCE_STATUS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '10', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('INSURANCE_SYSTEM_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '10', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('INSURANCE_SYSTEM_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ISRECEIVE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ISRECEIVE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ISSUE_DATE', 'datetime2', '1', '0', '发证日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '7', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ISSUE_DATE', 'datetime2', '1', '0', '发证日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '7', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ISSUE_ORGAN', 'varchar', '1', '0', '发证机关', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('ISSUE_ORGAN', 'varchar', '1', '0', '发证机关', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Issu_Dt', '', '0', '0', '颁证日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('ISSYNC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ISSYNC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '35', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ISSYNC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ISSYNC_BAK', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('IS_ACTION', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '20', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('IS_MINORITY', 'char', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '1', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('IS_REGISTER', 'varchar', '1', '0', '是否登记，用于流管的暂住服务模块', '0', '0', 'varchar(10)', '是否登记，用于流管的暂住服务模块', '0', '0', '0：未登记 1：已登记', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '10', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('itemName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '200', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('itemName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '200', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('JG', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '255', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JG', 'varchar', '1', '0', '籍贯', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('JGJTZZ', 'varchar', '1', '0', '籍贯具体地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '500', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('JGMC', 'varchar', '1', '0', '机构名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', '250', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('JGMC', 'varchar', '0', '0', '机构名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '250', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('JGZCLX', 'varchar', '0', '0', '机构注册类型', '0', '0', '', '', '0', '0', '2 30487\n1 166582', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '20', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('JHRSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('JHRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '255', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JHRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('JHRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '255', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('JOB_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '字段含义不明确', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JOB_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '字段含义不明确', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Join_Work_Dt', 'date', '1', '0', '参加工作日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('JRJZZSJ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JTCYQK', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('JTDZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '500', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JTDZ', 'varchar', '1', '0', '家庭地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '500', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JTID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JTRK', 'varchar', '1', '0', '家庭人口数', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JTRKS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('JWHDM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('JWZRQ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('JYCS', 'varchar', '1', '0', '经营场所 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '300', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYCS', 'varchar', '1', '0', '经营场所 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '300', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYFW', 'varchar', '1', '0', '经营范围', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '3000', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYFW', 'varchar', '1', '0', '法人身份证号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '4000', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZK', 'varchar', '1', '0', '就业状况', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('JYZSFZH', 'varchar', '1', '0', '经营者身份证号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '50', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZSFZH', 'varchar', '1', '0', '经营者证件名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '50', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZT_CODE', 'varchar', '0', '1', '就业状态代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_JYZT_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('JYZT_NAME', 'varchar', '0', '1', '就业状态代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_JYZT_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('JYZXM', 'varchar', '1', '0', '经营者姓名', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '100', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZXM', 'varchar', '1', '0', '经营范围', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '300', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZXM', 'varchar', '1', '0', '经营者姓名', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '100', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZZJHM', 'varchar', '1', '0', '经营者证件号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZZJMC', 'varchar', '1', '0', '经营者证件名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '100', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZZJMC', 'varchar', '1', '0', '经营者姓名', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '200', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('JYZZJMC', 'varchar', '1', '0', '经营者证件名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '100', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('LAST_PAYMENT_ADDRESS_CODE', 'varchar', '1', '0', '最后缴费地址代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LAST_PAYMENT_ADDRESS_NAME', 'varchar', '1', '0', '最后缴费地址名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '255', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LAST_PAYMENT_AMOUNT', 'numeric', '1', '0', '最后缴费金额', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '20', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LAST_PAYMENT_TIME', 'varchar', '1', '0', '最后缴费时间', '0', '0', '', '', '0', '0', '4位年份', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LAST_PAYMENT_UNIT', 'varchar', '1', '0', '最后缴费单位', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '255', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LDETZDQ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '255', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Leg_pers_Popu_ID', '', '1', '0', '法定代表人人口编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('LEVEL_DEPTH', 'varchar', '1', '0', '区域级别', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '2', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LINK_KIND_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '90', '75', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('LINK_KIND_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '90', '76', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('LKJZZSJ', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '7', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('LLSJYY', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '1000', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Lpr_ID', '', '0', '1', '法人编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Lpr_ID', '', '0', '0', '法人编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('LXDH', 'varchar', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '100', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('LXDH', 'varchar', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '30', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('LXDH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '20', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('LXDH', 'varchar', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('LXDH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('LXFS', 'varchar', '1', '0', '联系方式', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '100', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('LXR', 'varchar', '1', '0', '联系人', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('Marrg_Stat_Cd', 'string', '1', '0', '婚姻状态代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Marrg_Stat_Cd', 'string', '0', '1', '婚姻状态代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Marrg_Stat', '2', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Marrg_Stat_Cd_Desc', 'string', '0', '0', '婚姻状态代码描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Marrg_Stat', '60', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('MARRIAGE_CODE', 'varchar', '0', '1', '结婚类型代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_DIM_MARRIAGE_TYPE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('MARRIAGE_NAME', 'varchar', '0', '0', '结婚类型代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_DIM_MARRIAGE_TYPE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('MARRY_STATUS_MAN', 'varchar', '1', '0', '男方婚姻状态', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('MARRY_STATUS_WOMAN', 'varchar', '1', '0', '女方婚姻状态', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('MARRY_TYPE', 'varchar', '1', '0', '婚姻类型', '0', '0', '', '', '0', '0', '只判断等于SHEWAI时的涉外标志，按国籍取不太准确，有部分台湾籍，国籍代码为空', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('MEDICAL_ORG_CODE', 'varchar', '1', '0', '医疗机构代码', '0', '0', 'varchar(50)', '医疗机构代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('MEDICAL_ORG_NAME', 'varchar', '1', '0', '医疗机构名称', '0', '0', 'varchar(255)', '医疗机构名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '255', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('MEMGER_AGE', 'int', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('MERRIAGE_DATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '7', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('MERRIAGE_TYPE_CODE', 'varchar', '1', '0', '当前的婚姻状况(已婚，未婚..)', '0', '0', 'varchar(10)', '当前的婚姻状况(已婚，未婚..)', '0', '0', 'null  3048033\n10 3813228\n20 2697814\n21 2268508\n22 90550\n23 8589\n30 150986\n40 121731\n90 7668\n', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '26', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('mgrCity', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Modi_Dt', '', '0', '0', '变更日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Mov_Tel', 'string', '1', '0', '移动电话', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('MQSFZH', 'varchar', '1', '0', '母亲身份证号', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('MQXM', 'varchar', '1', '0', '母亲姓名', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('MZ', 'varchar', '1', '0', '民族', '0', '0', '', '', '0', '0', '需转码', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('MZ_CODE', 'varchar', '0', '1', '民族代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_MZ_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('MZ_NAME', 'varchar', '0', '1', '民族代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_MZ_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('MZ_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '不清楚字段含义\n0 30\n1 205290\n4 30936\n', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NAME_MAN', 'varchar', '1', '0', '男方姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '360', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NAME_WOMAN', 'varchar', '1', '0', '女方姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '360', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NATION', 'varchar', '1', '0', '民族代码', '0', '0', '', '', '0', '0', '10 6\n11 384\n14 11\n15 5\n16 52\n18 22\n21 12\n22 40226\n23 1\n25 2\n27 1\n33 2\n35 2\n39 1\n462 194393\n5 2\n58 1\n6 245\n8 3\n9 885\n', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NATIONALITY_CODE', 'varchar', '1', '0', '国籍代码', '0', '0', 'varchar(10)', '国籍代码', '0', '0', '未找到国籍码表，有部分脏数据\n        1535472\n156  48\n586 巴基斯坦 1\n840 美国 1\n344 香港 1\n702 新加坡 1\n704 越南 1\n       中国 1012\n156 中国 10670570\n', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '10', '9', '', '', '10', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NATIONALITY_NAME', 'varchar', '1', '0', '国籍名称', '0', '0', 'varchar(50)', '国籍名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '10', '', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Nation_Cd', 'string', '1', '0', '民族代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Nation_Cd', 'char', '0', '1', '民资代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Nation', '2', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Nation_Cd_Desc', 'varchar', '0', '0', '民族代码描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_Nation', '60', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('NATION_CODE', 'varchar', '1', '0', '当前民族代码', '0', '0', 'varchar(50)', '当前民族代码', '0', '0', '见民族码表，有部分脏数据', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '7', ' ', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NATION_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '100', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('NATION_MAN', 'varchar', '1', '0', '男方国籍代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NATION_NAME', 'varchar', '1', '0', '当前民族名称', '0', '0', 'varchar(20)', '当前民族名称', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '20', '8', '', '', '20', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NATION_WOMAN', 'varchar', '1', '0', '女方国籍代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Nati_Cd', 'string', '1', '0', '国籍代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('NATON_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '200', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('NATURAL_VILLAGE_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NATURAL_VILLAGE_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NEW_ADDRESS_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NEW_ADDRESS_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NEW_ADDRESS_UUID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('NJND', 'varchar', '1', '0', '年报年度   ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '100', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('NL', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '10', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('NL', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('NSDX_DM', 'varchar', '0', '1', '纳税定向号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '30', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '1', '0', '公司名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '80', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '1', '0', '公司名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '80', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '1', '0', '公司名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '80', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '1', '0', '公司名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '80', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '1', '0', '纳税人名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '250', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '1', '0', '纳税人名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '500', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '0', '0', '纳税人名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '250', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRMC', 'varchar', '0', '0', '纳税人名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '250', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '0', '1', '纳税人识别', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '0', '0', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '1', '0', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '1', '0', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '0', '1', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '0', '0', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '300', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '0', '0', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('NSRSBH', 'varchar', '0', '0', '纳税人识别号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '20', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('Offi_Tel', 'string', '1', '0', '办公电话', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('OLD_CERT_NO', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '300', '46', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OLD_DEPT_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '60', '48', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OLD_DEPT_ID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '60', '47', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OLD_DEPT_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '49', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OLD_OP_DATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '7', '50', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Open_Busi_Coty_ID', '', '1', '0', '开业地区县编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('OPERATE_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '20', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('OPERATOR', 'varchar', '1', '0', '操作人', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '360', '53', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OPERATOR_ID', 'numeric', '1', '0', '操作人编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '54', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OP_DATE', 'datetime2', '1', '0', '登记时间', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '7', '52', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('OP_TYPE', 'varchar', '1', '0', '操作类型', '0', '0', '', '', '0', '0', 'IA 1077930  结婚\nIB 85116      离婚\nICA 96917    补结\nICB 2654     补离\nID 38           未知\n', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Org_ID', '', '0', '1', '组织机构代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Org_Nm', '', '0', '0', '机构名称', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Org_rgst_Typ_Cd', '', '0', '0', '机构注册类型代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Org_Code_Cert', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Original_Code_Desc', 'String', '0', '0', '原始代码描述', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_CODE_MAP', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Original_Code_Value', 'String', '0', '0', '原始代码值', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_CODE_MAP', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('PARENT_ADDRESS_CODE', 'varchar', '1', '0', '上级地址编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Parnt_Admin_Regn_ID', '', '0', '0', '上级行政区域编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Pasp_Num', 'string', '1', '0', '护照号码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('PCNO', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('PENTYPE', 'varchar', '1', '0', '处罚 种类', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '500', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Perm_Resid_Ind', 'string', '1', '0', '常住人口标识', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('PERNAME', 'varchar', '1', '0', '人员姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('PERSONNAME', 'varchar', '1', '0', '法定代表人', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '300', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('PHONE', 'varchar', '1', '0', '企业联系电话', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '100', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('PHONE', 'varchar', '1', '0', '联系电话', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('PIC_ID_MAN', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '42', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('PIC_ID_WOMAN', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '16', '43', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('placingId', 'bigint', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Poli_Stat_Cd', 'string', '1', '0', '政治面貌代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Popu_Flow_Stat_Cd', 'string', '1', '0', '人口流动状态代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Popu_ID', 'string', '0', '1', '人口编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Popu_Nm', 'string', '1', '0', '姓名', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('PRINT_NUM_MAN', 'varchar', '1', '0', '男方结婚证编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '40', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('PRINT_NUM_WOMAN', 'varchar', '1', '0', '女方结婚证编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '41', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('PRINT_REMARK', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '765', '81', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('projName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '200', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('projName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '200', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('PROVINCE_CODE', 'varchar', '1', '0', '省份编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('PROVINCE_CODE', 'varchar', '1', '0', '省份编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('PROVINCE_NAME', 'varchar', '1', '0', '省份名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('PROVINCE_NAME', 'varchar', '1', '0', '身份名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '150', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Prov_ID', '', '0', '0', '省份编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('publictime', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('publictime', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '0', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('P_SOCIAL_SECURITY_NO', 'varchar', '1', '0', '新农合编号', '0', '0', '', '', '0', '0', '不清楚字段含义，该字段有重复，且对应不同自然人', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('QSNY', 'varchar', '1', '0', '起始年月', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '50', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('QYCLRQ', 'datetime2', '1', '0', '企业成立日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '7', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYCLRQ', 'datetime2', '1', '0', '企业成立日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '7', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYGM_MC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '20', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QYMC', 'varchar', '1', '0', '企业名称   ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '400', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYMC', 'varchar', '1', '0', '企业名称 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '200', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYMC', 'varchar', '1', '0', '企业名称 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '200', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYMC', 'varchar', '1', '0', '企业名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '100', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYMC', 'varchar', '1', '0', '企业名称', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '200', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYZCH', 'varchar', '1', '0', '企业注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '30', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QYZCH', 'varchar', '1', '0', '企业注册号', '0', '0', '', '', '0', '0', '全部为空', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '300', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QYZCH', 'varchar', '1', '0', '企业注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '30', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QYZCH', 'varchar', '1', '0', '企业注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '30', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QYZCH', 'varchar', '1', '0', '企业注册号 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '200', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QYZCH', 'varchar', '1', '0', '企业注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '70', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('QYZT', 'varchar', '1', '0', '企业状态', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '10', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('QY_BZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QY_BZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '未知字段含义，全部为空', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '200', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QY_BZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '10', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('QY_BZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '10', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('RDRQ', 'datetime', '1', '0', '非正常户认定日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('REDO_REASON', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '67', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REDO_TYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REGCAPITAL', 'decimal', '1', '0', '注册资本', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '18', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('REGISTERNO', 'varchar', '1', '0', '注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '36', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('REGISTERNO', 'varchar', '0', '1', '企业注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('REGISTYPE_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REGISTYPE_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '30', '29', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Regn_Lvl', '', '0', '0', '区域级别', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('REG_DETAIL_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '38', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_DETAIL_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '600', '39', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_DS_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '32', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_DS_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '33', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_JX_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '36', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_JX_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '37', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_QX_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '34', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_QX_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '35', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_SJ_MAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '30', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REG_SJ_WOMAN', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '36', '31', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Relig_Cd', 'string', '1', '0', '宗教信仰代码', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('REMARK', 'varchar', '1', '0', '流管确认状态备注', '0', '0', 'varchar(255)', '流管确认状态备注', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '255', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('REMARK', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '765', '79', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REMARK', 'varchar', '1', '0', '备注', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '4000', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('REMEDY_FLAG', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '1', '58', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Remov_Ind', '', '1', '0', '注销标志', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('RENEW_FLAG', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '1', '57', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('RESIDENCE_REGION_CODE', 'varchar', '1', '0', '当前居住地区化代码', '0', '0', 'varchar(500)', '当前居住地区化代码', '0', '0', '见JS_ADDRESS', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '500', '13', '', '', '500', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RESIDENT_ADDRESS_INFO', 'varchar', '1', '0', '当前居住地详细地址', '0', '0', 'varchar(500)', '当前居住地详细地址', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '500', '14', '', '', '500', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RESIDENT_NAME', 'varchar', '1', '0', '居民当前姓名', '0', '0', 'varchar(50)', '居民当前姓名', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RESIDENT_NAME', 'varchar', '1', '0', '居民当前姓名', '0', '0', 'varchar(50)', '居民当前姓名', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '2', '', '', '50', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RESIDENT_NAME', 'varchar', '1', '0', '居民姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RESIDENT_UUID', 'varchar', '1', '0', '居民代理键', '0', '0', 'varchar(50)', '居民代理键', '0', '0', '可与人口基本信息表UUID关联（部分）', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RESIDENT_UUID', 'varchar', '1', '0', '居民信息表外键', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('Resid_Addr_Num', 'string', '1', '0', '居住地址编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('RESVISAID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '不清楚字段含义，全部为空', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('RESVISATYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '不清楚字段含义\nnull 1\n01 64401\n02 171854\n', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Retir_Dt', 'date', '1', '0', '离退休日期', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Revok_Ind', '', '1', '0', '吊销标志', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Rgst_Addr', '', '1', '0', '注册地址', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Rgst_capt', '', '1', '0', '注册资本', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Rgst_Org_ID', '', '1', '0', '登记机关编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H02_Corp', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('RQ', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('RXSJ', 'varchar', '1', '0', '入学时间', '0', '0', '', '', '0', '0', '8位年月日', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('RYLX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '50', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('RYXB_CODE', 'varchar', '0', '1', '性别代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_RYXB_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('RYXB_NAME', 'varchar', '0', '1', '性别代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_RYXB_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('RYZT', 'varchar', '1', '0', '人员状态', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('sAdrr', 'varchar', '1', '0', '地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sBankName', 'varchar', '1', '0', '银行名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '33', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SBJBJG_CODE', 'varchar', '0', '1', '经办机构代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SBJBJG_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SBJBJG_NAME', 'varchar', '0', '1', '经办机构名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SBJBJG_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SBRQ', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '7', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCJYDZ', 'varchar', '1', '0', '企业地址', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '80', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SCZTBH', 'varchar', '0', '0', '市场主体唯一编码号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '200', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCZTBH', 'varchar', '0', '1', '市场主体编号(UUID) ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCZTBH', 'varchar', '0', '1', '市场主体编号(UUID) ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCZTBH', 'varchar', '0', '1', '市场主体编号(UUID) ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCZTBH', 'varchar', '1', '0', '市场主体编号(UUID) ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCZTBH', 'varchar', '0', '1', '市场主体编号(UUID) ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '36', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SCZTZCXS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '100', '28', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SERVICEITEM', 'varchar', '1', '0', '认定商品/服务项目', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '100', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SEX', 'varchar', '1', '0', '性别代码', '0', '0', '', '', '0', '0', '1男性2女性', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sFamilyGXName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFCZF', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '90', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('SFDETAILNO', 'numeric', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '18', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sFLSB', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFPAYEDAMT', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '16', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFTIME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFTYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFYEAR', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFZ', 'varchar', '1', '0', '身份证号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '54', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SFZH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('SFZHM', 'varchar', '1', '0', '身份证号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SHBXZT_CODE', 'varchar', '0', '1', '社保状态代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SHBXZT_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SHBXZT_NAME', 'varchar', '0', '1', '社保状态代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SHBXZT_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SHZRDNDJTNZSR', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('sIDCard', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SJCSBZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '10', '30', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('SJCSBZW', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '10', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('SJCSSJ', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '7', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('SJCSSJ', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '7', '31', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('sJYZKName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sLBName', 'varchar', '1', '0', '低保名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sLXDH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOACCBANK', 'varchar', '1', '0', '低保账户开户行', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOACCOUNT', 'varchar', '1', '0', '低保账户', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOADDIVISION', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '不清楚字段含义', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOCIAL_SECURITY_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '10', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SOCIAL_SECURITY_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SOIDTYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOIDTYPE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '全部为0，不清楚含义', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOMNO', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '18', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOMNO', 'numeric', '1', '0', '编号', '0', '0', '', '', '0', '0', '不唯一，需去重', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '18', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOSACCNAME', 'varchar', '1', '0', '低保账户开户人', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOSTARTTIME', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '0', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOSTARTTIME', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '0', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOSTARTTIME', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '0', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOTIMESTAMP', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '0', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOTIMESTAMP', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '0', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SOTIMESTAMP', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '0', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sPeopID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sPeopName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '80', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SPNO', 'numeric', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '18', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SPSJ', 'datetime', '1', '0', '审批时间', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SQRQ', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '0', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('sSexName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sSFNY', 'varchar', '1', '0', '起始日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '31', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('START_TIME', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '0', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('START_TIME', 'datetime2', '1', '0', '开始时间', '0', '0', 'datetime27', '开始时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '7', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('STATUS', 'varchar', '1', '0', '经营状态', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '100', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('sVillageCode', 'varchar', '1', '0', '行政区域编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('sVillageName', 'varchar', '1', '0', '行政区域名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SWDJJG', 'varchar', '1', '0', '税务登记机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '128', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SWDJRQ', 'datetime', '1', '0', '税务登记日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SWJG_MC', 'varchar', '1', '0', '所属管理科局', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '50', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SWJG_MC', 'varchar', '1', '0', '注销机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '255', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYFQSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '54', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYFQXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYMQSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '54', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYMQXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '255', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '流程号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('SynDate', 'datetime', '1', '0', '创建日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '0', '31', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime2', '1', '0', '入库时间', '0', '0', 'datetime27', '入库时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '7', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime2', '1', '0', '入库时间', '0', '0', 'datetime27', '入库时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '7', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime2', '1', '0', '入库时间', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '7', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '入库时间', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_DIM_MARRIAGE_TYPE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime2', '1', '0', '入库时间', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '7', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime2', '1', '0', '入库时间', '0', '0', 'datetime', '入库时间', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '0', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '0', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '0', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '0', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_DWCBZT_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HKXZ_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HYZK_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_JYZT_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_MZ_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_RYXB_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SBJBJG_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SHBXZT_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_WHCD_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_XZXL_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_YGXZ_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '数据同步日期', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_ZZMM_CODE', '0', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '0', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNDATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '登记标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '非正常户标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '0', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('SynFlag', 'tinyint', '1', '0', '创建标志', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '0', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '1', '30', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '标志位', '0', '0', 'char(1)', '标志位', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '1', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '标志位', '0', '0', 'char(1)', '标志位', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '1', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '标志位', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '1', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '标志位', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '1', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '标志位', '0', '0', 'char(1)', '标志位', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '1', '24', '', '', '1', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNFLAG', 'char', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '1', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('SYNSTATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '10', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '5', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '5', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '5', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '5', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '5', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '同步状态', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '5', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '5', '26', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '5', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '5', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_STATE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '5', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '0', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '7', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '7', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '7', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '7', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime', '1', '0', '同步时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '0', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '7', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '7', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '7', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYN_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '7', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('SYRLXDH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('SYRXZZ', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '500', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('Sys_Id', 'String', '0', '0', '源系统编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H99_CODE_MAP', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('sZPYYName', 'varchar', '1', '0', '致贫原因名称', '0', '0', '', '', '0', '0', 'undefined 955\n残疾 33967\n孤老人员 1081\n疾病 47861\n其他 76010\n缺乏劳动力 60664\n失地 2079\n失业 11924\n灾害 1715\n', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '60', '29', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('TBRQ', 'datetime', '1', '0', '注销日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('TELEPHONE', 'varchar', '1', '0', '法定代表人联系电话', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '100', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('TODATE', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '7', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('TOTAL_NUM', 'int', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('TOWN_CODE', 'varchar', '1', '0', '城镇编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('TOWN_CODE', 'varchar', '1', '0', '城镇编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '50', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Town_ID', '', '0', '0', '城镇编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('TOWN_NAME', 'varchar', '1', '0', '城镇名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('TOWN_NAME', 'varchar', '1', '0', '城镇名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '150', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('UDATE_TIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '7', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('Unif_Popu_ID', 'string', '1', '0', '统一人口编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Popu_Mer_Rela', '0', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('Unif_Popu_ID', 'string', '0', '1', '统一人口编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H01_Unif_Popu_Info', '0', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('unitName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('unitName', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '50', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('UPDATE_DATE', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '0', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UPDATE_TIME', 'datetime', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '0', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '7', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '7', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '7', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '记录更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '7', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '7', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime', '1', '0', '更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '0', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '电话号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '7', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '7', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '7', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UPDTIME', 'datetime2', '1', '0', '更新时间', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '7', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('Urbn_ID', '', '0', '0', '地市编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '50', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '50', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '50', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '50', '27', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '50', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '50', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('USCC', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '代理键', '0', '0', 'varchar(50)', '代理键', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '代理键', '0', '0', 'varchar(50)', '代理键', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '代理键', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '代理键', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '代理键', '0', '12206969', 'varchar(50)', '代理键', '0', '1', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '50', '1', '', '', '50', '', '', '1', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', 'uuid', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('UUID', 'varchar', '0', '1', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '60', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'LYWX');
INSERT INTO `src_column_analysis` VALUES ('UUID_LEVEL_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '500', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('U_SOCIAL_SECURITY_NO', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('VALID_ADDRESS_CODE', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('VALID_ADDRESS_NAME', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '25', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('VALID_ADDRESS_UUID', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('VALID_FLAG', 'numeric', '1', '0', '有效标识', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '1', '80', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('vila_ID', '', '0', '0', '村庄编号', '0', '0', '', '', '0', '0', '', 'vpdata', 'H03_Admin_Regn', '0', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'AAAA');
INSERT INTO `src_column_analysis` VALUES ('VILLAGE_CODE', 'varchar', '1', '0', '村庄编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('VILLAGE_CODE', 'varchar', '1', '0', '村庄编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('VILLAGE_NAME', 'varchar', '1', '0', '村庄名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '255', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('VILLAGE_NAME', 'varchar', '1', '0', '村庄名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '255', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('WHCD_CODE', 'varchar', '0', '1', '学历代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_WHCD_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('WHCD_NAME', 'varchar', '0', '1', '学历代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_WHCD_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('WIFE_CERTIFICATE_CODE', 'varchar', '1', '0', '女方证件类型代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '10', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_CERTIFICATE_CODE', 'varchar', '1', '0', '女方证件类型代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '10', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_CERTIFICATE_NUMBER', 'varchar', '1', '0', '女方证件号码', '0', '0', 'varchar(50)', '女方证件号码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_CERTIFICATE_NUMBER', 'varchar', '1', '0', '女方证件类型号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_CERTIFICATE_NUMBER', 'varchar', '1', '0', '女方证件类型号码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_CERTIFICATE_TYPE_CODE', 'varchar', '1', '0', '女方证件代码', '0', '0', 'varchar(10)', '女方证件代码', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '10', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_NAME', 'varchar', '1', '0', '女方姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '50', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_NAME', 'varchar', '1', '0', '女方姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '50', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_RESIDENT_NAME', 'varchar', '1', '0', '女方姓名', '0', '0', 'varchar(50)', '女方姓名', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WIFE_RESIDENT_UUID', 'varchar', '1', '0', '女方居民表外键', '0', '0', 'varchar(50)', '女方居民表外键', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '50', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('WSPZXH', 'varchar', '0', '1', '税务批准注销号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '15', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('WSPZXH', 'varchar', '0', '1', '税务批准注销号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '15', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('XB', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '10', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('XB', 'varchar', '1', '0', '性别', '0', '0', '', '', '0', '0', '男女，需转码', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '10', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XB', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '20', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('XB', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '10', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('XD', 'varchar', '1', '0', '学段', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '500', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XFZRSQDRQ', 'datetime2', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '7', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('XFZRSSFQD', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '150', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('XH', 'varchar', '1', '0', '学号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XJZD', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '50', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('XM', 'varchar', '1', '0', '姓名', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '250', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('XM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('XM', 'varchar', '1', '0', '姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('XSXM', 'varchar', '1', '0', '学生姓名', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XTCZRQ', 'date', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '0', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('XXBH', 'varchar', '1', '0', '学校编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXBH', 'varchar', '1', '0', '学校编号', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXDZ', 'varchar', '1', '0', '学校地址', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '500', '20', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXDZ', 'varchar', '1', '0', '学校地址', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '500', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXDZ_QH', 'varchar', '1', '0', '学校地址区划', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXLX', 'varchar', '1', '0', '学校类型', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXMC', 'varchar', '1', '0', '学校名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '500', '19', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XXMC', 'varchar', '1', '0', '学校名称', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '255', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XZ', 'varchar', '1', '0', '学制', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '50', '24', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('XZQH', 'varchar', '1', '0', '行政区划   ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '200', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('XZQH', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('XZQHDM', 'varchar', '1', '0', '行政区划代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '200', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('XZXL_CODE', 'varchar', '0', '1', '险种代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_XZXL_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('XZXL_NAME', 'varchar', '0', '1', '险种代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_XZXL_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('YCRQ', 'datetime2', '1', '0', '异常日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '7', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('YGXZ_CODE', 'varchar', '0', '1', '用工性质代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_YGXZ_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('YGXZ_NAME', 'varchar', '0', '1', '用工性质代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_YGXZ_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('YHZDGX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '全为空', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '255', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('YHZRQ', 'datetime', '0', '0', '验换证日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('YMZL', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JHSY');
INSERT INTO `src_column_analysis` VALUES ('YXQ_Z', 'datetime', '1', '0', '非正常户解除日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '0', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('YYJZRQ', 'datetime2', '1', '0', '营业截至日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '7', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('YYJZRQ', 'datetime2', '1', '0', '营业截至日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '7', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('YYQSRQ', 'datetime2', '1', '0', '营业起始日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '7', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('YYQSRQ', 'datetime2', '1', '0', '营业起始日期 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '7', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZAZRR', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '21', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZCBZ', 'char', '1', '0', '注册币种 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '3', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCBZ', 'char', '1', '0', '注册币种 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '3', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCDZ', 'varchar', '1', '0', '注册地址', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '200', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZCH', 'varchar', '1', '0', '注册号 ', '0', '0', '', '', '0', '0', '有4000多条注册号不再企业注册信息表，有注册号相同，但市场主题不同的数据（按企业成立时间，取最后成立的）', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCH', 'varchar', '1', '0', '注册号 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCH', 'varchar', '1', '0', '注册号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '50', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCXY', 'varchar', '1', '0', '章程(协议)', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '100', '14', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCXY', 'varchar', '1', '0', '登记管辖机关编号', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '100', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCZB', 'decimal', '1', '0', '注册资本 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '16', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZCZB', 'decimal', '1', '0', '注册资本 ', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '16', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZFBZQK', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '255', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZJHM', 'varchar', '1', '0', '证件号码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '50', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZJLX', 'varchar', '1', '0', '证件类型', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '100', '5', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZJZDGZNX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '50', '13', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZLHT', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '500', '18', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZLRGMSFZHM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '54', '16', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZLRLXFS', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '17', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZLRXM', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '255', '15', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZRSY', 'varchar', '1', '0', '载入事由', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '100', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZS', 'varchar', '1', '0', '住所', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '300', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZS', 'varchar', '1', '0', '住所', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '300', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZS', 'varchar', '1', '0', '住所', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '200', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZTLX', 'char', '1', '0', '主体类型', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '6', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZTLX', 'char', '1', '0', '主体类型', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '6', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZXJG', 'varchar', '0', '0', '注销机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '128', '8', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZXJG', 'varchar', '1', '0', '注销机关', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '100', '12', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZXRQ', 'datetime', '0', '0', '注销日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '0', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZXRQ', 'datetime2', '1', '0', '注销日期', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '7', '10', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZXSY', 'varchar', '1', '0', '注销事由', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '500', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSSW');
INSERT INTO `src_column_analysis` VALUES ('ZXYY', 'varchar', '1', '0', '注销事由', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '254', '6', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZXYY_MC', 'varchar', '1', '0', '注销原因', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '50', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('ZY', 'varchar', '1', '0', '专业', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '500', '22', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('ZYZPYY', 'varchar', '1', '0', '主要致贫原因', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '1000', '7', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'MZJX');
INSERT INTO `src_column_analysis` VALUES ('ZY_DM', 'varchar', '1', '0', '专业代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '150', '23', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '9', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '9', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '9', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '9', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'GSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '30', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '300', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '30', '3', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'varchar', '1', '0', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '30', '4', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'DSJX');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'char', '0', '1', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', '9', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('ZZJGDM', 'char', '0', '1', '组织机构代码', '0', '0', '', '', '0', '0', '', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '9', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJZZ');
INSERT INTO `src_column_analysis` VALUES ('ZZLX', 'varchar', '1', '0', '', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '150', '9', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'ZJJX');
INSERT INTO `src_column_analysis` VALUES ('ZZMM', 'varchar', '1', '0', '政治面貌', '0', '0', '', '', '0', '0', '需转码', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '255', '11', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'JYJX');
INSERT INTO `src_column_analysis` VALUES ('ZZMM_CODE', 'varchar', '0', '1', '政治面貌代码', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_ZZMM_CODE', '20', '1', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');
INSERT INTO `src_column_analysis` VALUES ('ZZMM_NAME', 'varchar', '0', '1', '政治面貌代码描述', '0', '0', '', '', '0', '0', '', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_ZZMM_CODE', '100', '2', '', '', '0', '', '', '0', '0', '0', '0', '', '0', 'SHBZ');

-- ----------------------------
-- Table structure for `src_column_analysis_his`
-- ----------------------------
DROP TABLE IF EXISTS `src_column_analysis_his`;
CREATE TABLE `src_column_analysis_his` (
  `column_name` varchar(60) NOT NULL,
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
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `column_len` int(11) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `ref_table` varchar(60) DEFAULT NULL,
  `ref_column` varchar(60) DEFAULT NULL,
  `doc_col_len` int(11) DEFAULT NULL,
  `doc_ref_tbl` varchar(60) DEFAULT NULL,
  `doc_ref_col` varchar(60) DEFAULT NULL,
  `uv_check` tinyint(1) DEFAULT NULL,
  `null_check` tinyint(1) DEFAULT NULL,
  `value_check` tinyint(1) DEFAULT NULL,
  `ref_check` tinyint(1) DEFAULT NULL,
  `unique_values` text,
  `ref_ok` tinyint(1) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`column_name`,`schema_name`,`table_name`,`sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_column_analysis_his
-- ----------------------------

-- ----------------------------
-- Table structure for `src_table_analysis`
-- ----------------------------
DROP TABLE IF EXISTS `src_table_analysis`;
CREATE TABLE `src_table_analysis` (
  `comments` varchar(512) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `row_count` int(11) DEFAULT NULL,
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `need_ext` tinyint(1) DEFAULT NULL,
  `no_ext_cmt` varchar(512) DEFAULT NULL,
  `need_int` tinyint(1) DEFAULT NULL,
  `no_int_cmt` varchar(512) DEFAULT NULL,
  `ext_cycle` varchar(60) DEFAULT NULL,
  `is_inc_ext` tinyint(1) DEFAULT NULL,
  `ext_condition` text,
  `stbl_name` varchar(60) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  `load_to_fact` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`schema_name`,`table_name`,`sys_name`),
  CONSTRAINT `src_table_analysis_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `etl_tables` (`schema_name`, `table_name`, `sys_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_table_analysis
-- ----------------------------
INSERT INTO `src_table_analysis` VALUES (null, null, null, '', '', null, null, null, null, null, null, null, null, null, null, '', null);
INSERT INTO `src_table_analysis` VALUES ('工商处罚案件，案件类型存储结构以#分隔：02#03#', '案件信息表', '25367', 'DB_ENTERPRISE_BUFFER', 'AJXXB', '案件信息表', '1', '', '0', '', '', '0', '', 'sdata.GSSW_AJXXB                             ', '12', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '国税纳税登记信息', '222313', 'DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', '国税纳税登记信息', '1', '', '0', '', '', '0', '', 'sdata.GSJX_BAK_DJNSRXX                       ', '8', 'GSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '国税纳税注销信息', '81149', 'DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', '国税纳税注销信息', '1', '', '0', '', '', '0', '', 'sdata.GSJX_BAK_DJ_ZXDJXX                     ', '9', 'GSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '国税非正常户信息', '112435', 'DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', '国税非正常户信息', '1', '', '0', '', '', '0', '', 'sdata.GSJX_BAK_FZCKXX                        ', '10', 'GSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '国税验换证信息', '96225', 'DB_ENTERPRISE_BUFFER', 'BAK_YHZ', '国税验换证信息', '0', '待定，不清楚用途', '0', '', '', '0', '', 'sdata.GSJX_BAK_YHZ                           ', '11', 'GSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '码表-著弛名类型', '3', 'DB_ENTERPRISE_BUFFER', 'banedType', '码表-著弛名类型', '0', '', '0', '', '', '0', '', 'sdata.GSSW_banedType                         ', '13', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '码表-变更事项基础信息表', '0', 'DB_ENTERPRISE_BUFFER', 'ChangeFieldCnfg', '码表-变更事项基础信息表', '0', '', '0', '', '', '0', '', 'sdata.GSSW_ChangeFieldCnfg                   ', '14', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '码表-市场行业', '53', 'DB_ENTERPRISE_BUFFER', 'code_ind', '码表-市场行业', '0', '', '0', '', '', '0', '', 'sdata.GSSW_code_ind                          ', '15', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '码表-市场行业', '38', 'DB_ENTERPRISE_BUFFER', 'code_ind1', '码表-市场行业', '0', '', '0', '', '', '0', '', 'sdata.GSSW_code_ind1                         ', '16', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '码表-市场行业', '1642', 'DB_ENTERPRISE_BUFFER', 'Code_Industry', '码表-市场行业', '0', '', '0', '', '', '0', '', 'sdata.GSSW_Code_Industry                     ', '17', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '币种基础表', '182', 'DB_ENTERPRISE_BUFFER', 'Coin', '币种基础表', '0', '', '0', '', '', '0', '', 'sdata.GSSW_Coin                              ', '18', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '著名/驰名商标信息表', '5', 'DB_ENTERPRISE_BUFFER', 'ControlledName', '著名/驰名商标信息表', '1', '', '0', '', '', '0', '', 'sdata.GSSW_ControlledName                    ', '19', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '守重企业信息表', '0', 'DB_ENTERPRISE_BUFFER', 'CurCompactCredit', '守重企业信息表', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_CurCompactCredit                  ', '20', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '会计人信息库', '67812', 'DB_ENTERPRISE_BUFFER', 'CZ_KJRXXK', '会计人信息库', '0', '只有姓名可供识别', '0', '', '', '0', '', 'sdata.CZKJ_CZ_KJRXXK                         ', '1', 'CZKJ', null);
INSERT INTO `src_table_analysis` VALUES ('', '企业经营场所字典表', '0', 'DB_ENTERPRISE_BUFFER', 'DIM_ENTERPRISE_JYCS_INFO', '企业经营场所字典表', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_DIM_ENTERPRISE_JYCS_INFO          ', '21', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '发布部门代码表', '0', 'DB_ENTERPRISE_BUFFER', 'DIM_ISSUEDEPT_CODE', '发布部门代码表', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_DIM_ISSUEDEPT_CODE                ', '22', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '处罚种类（类别字典表）', '10', 'DB_ENTERPRISE_BUFFER', 'DIM_PUNISH_TYPE_CODE', '处罚种类（类别字典表）', '0', '', '0', '', '', '0', '', 'sdata.GSSW_DIM_PUNISH_TYPE_CODE              ', '23', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '纳税登记信息', '162666', 'DB_ENTERPRISE_BUFFER', 'dishui_dengji', '纳税登记信息', '1', '', '0', '', '', '0', '', 'sdata.DSJX_dishui_dengji                     ', '4', 'DSJX', null);
INSERT INTO `src_table_analysis` VALUES ('会多次认定，每日全量，取最后认定日期', '地税非正常户信息', '29420', 'DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', '地税非正常户信息', '1', '', '0', '', '', '0', '', 'sdata.DSJX_dishui_feizhengchanghu            ', '5', 'DSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '地税验换证信息', '0', 'DB_ENTERPRISE_BUFFER', 'dishui_yanhuanzheng', '地税验换证信息', '0', '没有数', '0', '', '', '0', '', 'sdata.DSJX_dishui_yanhuanzheng               ', '6', 'DSJX', null);
INSERT INTO `src_table_analysis` VALUES ('有重复数据，按纳税人编号去最新的注销日期', '地税纳税注销信息', '8286', 'DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', '地税纳税注销信息', '1', '', '0', '', '', '0', '', 'sdata.DSJX_dishui_zhuxiao                    ', '7', 'DSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '企业状态编码基础表', '26', 'DB_ENTERPRISE_BUFFER', 'EnterpriseStatus', '企业状态编码基础表', '0', '', '0', '', '', '0', '', 'sdata.GSSW_EnterpriseStatus                  ', '24', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '企业类型编码基础表', '0', 'DB_ENTERPRISE_BUFFER', 'enterprisetype', '企业类型编码基础表', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_enterprisetype                    ', '25', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '企业变更信息', '0', 'DB_ENTERPRISE_BUFFER', 'entityChangeInfo', '企业变更信息', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_entityChangeInfo                  ', '26', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('入法人库以市场主体开业登记信息表为主表', '企业注册信息', '1102659', 'DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', '企业注册信息', '1', '', '1', '', '', '0', '', 'sdata.GSSW_entityRegisterInfo                ', '27', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '企业成员变更信息', '0', 'DB_ENTERPRISE_BUFFER', 'entityVipChangeInfo', '企业成员变更信息', '0', '', '0', '', '', '0', '', 'sdata.GSSW_entityVipChangeInfo               ', '28', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '成员信息', '796791', 'DB_ENTERPRISE_BUFFER', 'EntityVIPList', '成员信息', '0', '从EX_ZH_GONGSHANG_15_QYRYXX取数', '0', '', '', '0', '', 'sdata.GSSW_EntityVIPList                     ', '29', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '年报信息', '1313781', 'DB_ENTERPRISE_BUFFER', 'EX_HZ_GONGSHANG_04_NJ', '年报信息', '0', '无可用信息，易建未使用该表', '0', '', '', '0', '', 'sdata.GSSW_EX_HZ_GONGSHANG_04_NJ             ', '30', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '市场主体开业登记信息表 ', '1001317', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', '市场主体开业登记信息表 ', '1', '', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_12_SJZTKYDJXX     ', '31', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '市场主体变更登记信息表', '273592', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_13_SJZTBGDJXX', '市场主体变更登记信息表', '0', '待定', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_13_SJZTBGDJXX     ', '32', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('有少量数据不在市场主体开业登记表', '市场主体注(吊)销登记信息表', '350115', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', '市场主体注(吊)销登记信息表', '1', '', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_14_SJZTZDXDJXX    ', '33', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '企业人员信息表 ', '2971409', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', '企业人员信息表 ', '1', '', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_15_QYRYXX         ', '34', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '市场主体异常名录表', '104216', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', '市场主体异常名录表', '1', '', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_16_SSZTYCML       ', '35', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '企业集团母公司登记信息', '166047', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_17_QYJTMGSDJXX', '企业集团母公司登记信息', '0', '待定', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_17_QYJTMGSDJXX    ', '36', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '企业集团子公司登记信息', '5123', 'DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_18_QYJTZGSDJXX', '企业集团子公司登记信息', '0', '待定', '0', '', '', '0', '', 'sdata.GSSW_EX_ZH_GONGSHANG_18_QYJTZGSDJXX    ', '37', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '食品流通许可证信息表', '0', 'DB_ENTERPRISE_BUFFER', 'FoodPermit', '食品流通许可证信息表', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_FoodPermit                        ', '38', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '机构编码基础表', '584', 'DB_ENTERPRISE_BUFFER', 'GDaicCode', '机构编码基础表', '0', '', '0', '', '', '0', '', 'sdata.GSSW_GDaicCode                         ', '39', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '投资人变更信息', '0', 'DB_ENTERPRISE_BUFFER', 'investorChangeInfo', '投资人变更信息', '0', '没有数', '0', '', '', '0', '', 'sdata.GSSW_investorChangeInfo                ', '40', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '投资人信息', '816602', 'DB_ENTERPRISE_BUFFER', 'investorInfo', '投资人信息', '0', '', '0', '', '', '0', '', 'sdata.GSSW_investorInfo                      ', '41', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '社保缴纳记录信息', '34738', 'DB_ENTERPRISE_BUFFER', 'JF1', '社保缴纳记录信息', '0', '法人识别很困难', '0', '', '', '0', '', 'sdata.RSJX_JF1                               ', '68', 'RSJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '合伙人信息(合伙制企业)', '797533', 'DB_ENTERPRISE_BUFFER', 'partnerInfo', '合伙人信息(合伙制企业)', '0', '与投资人重复', '1', '', '', '0', '', 'sdata.GSSW_partnerInfo                       ', '42', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '码表-案件类型', '10', 'DB_ENTERPRISE_BUFFER', 'penType', '码表-案件类型', '0', '', '0', '', '', '0', '', 'sdata.GSSW_penType                           ', '43', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '董事会和监事会成员信息', '649886', 'DB_ENTERPRISE_BUFFER', 'seniorMember', '董事会和监事会成员信息', '0', '', '1', '', '', '0', '', 'sdata.GSSW_seniorMember                      ', '44', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '股东变更信息', '0', 'DB_ENTERPRISE_BUFFER', 'shareholdersChangeInfo', '股东变更信息', '0', '', '0', '', '', '0', '', 'sdata.GSSW_shareholdersChangeInfo            ', '45', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '股东登记信息', '816425', 'DB_ENTERPRISE_BUFFER', 'shareholdersInfo', '股东登记信息', '0', '与投资人重复', '0', '', '', '0', '', 'sdata.GSSW_shareholdersInfo                  ', '46', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '会计事务所信息库', '51', 'DB_ENTERPRISE_BUFFER', 'T_KJSWSXXK', '会计事务所信息库', '0', '以企业注册信息为准', '0', '', '', '0', '', 'sdata.CZKJ_T_KJSWSXXK                        ', '2', 'CZKJ', null);
INSERT INTO `src_table_analysis` VALUES ('未包含在企业注册信息', '收费单位信息库', '1183', 'DB_ENTERPRISE_BUFFER', 'T_SFDWXXK', '收费单位信息库', '0', '政府部门，待定', '1', '', '', '0', '', 'sdata.CZKJ_T_SFDWXXK                         ', '3', 'CZKJ', null);
INSERT INTO `src_table_analysis` VALUES ('', '组织机构代码废置信息', '50425', 'DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', '组织机构代码废置信息', '0', '待定', '0', '', '', '0', '', 'sdata.ZJZZ_V_QYDMFZXX                        ', '90', 'ZJZZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '组织机构代码颁证信息', '197069', 'DB_ENTERPRISE_BUFFER', 'V_QYDMXX', '组织机构代码颁证信息', '1', '', '0', '', '', '0', '', 'sdata.ZJZZ_V_QYDMXX                          ', '91', 'ZJZZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '码表-异常事由类型', '4', 'DB_ENTERPRISE_BUFFER', 'ZRSY', '码表-异常事由类型', '0', '', '0', '', '', '0', '', 'sdata.GSSW_ZRSY                              ', '47', 'GSSW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '社保参保企业信息（原始）', '98864', 'DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', '社保参保企业信息（原始）', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_AB01_TO_GXT                       ', '69', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '社保参保人员基本信息（原始）', '3986485', 'DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', '社保参保人员基本信息（原始）', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_AC01_TO_GXT                       ', '70', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '社保人员参保信息（原始）', '15433074', 'DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', '社保人员参保信息（原始）', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_AC02_TO_GXT                       ', '71', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '住建公租房信息', '85191', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_house', '住建公租房信息', '0', '待定，无字段说明', '1', '', '', '0', '', 'sdata.ZJJX_hy_interface_house                ', '85', 'ZJJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '住建房屋租赁信息', '85473', 'DB_PEOPLE_INFO_BUFFER', 'hy_interface_lease', '住建房屋租赁信息', '0', '待定，无字段说明', '1', '', '', '0', '', 'sdata.ZJJX_hy_interface_lease                ', '86', 'ZJJX', null);
INSERT INTO `src_table_analysis` VALUES ('按地址编号，有少量重复数据，dataflag=1', '地址信息表', '1133374', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', '地址信息表', '1', '', '0', '', '', '0', '', 'sdata.JHSY_JS_ADDRESS                        ', '92', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '计生流动人口表（流动轨迹表）', '21073231', 'DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', '计生流动人口表（流动轨迹表）', '1', '', '1', '', '', '0', '', 'sdata.JHSY_JS_ADDRESS_RESIDENCE_RESIDENT     ', '48', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('根据男女方证件号码取生育服务证信息', '人口出生信息', '5280242', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', '人口出生信息', '1', '', '1', '', '', '0', '', 'sdata.JHSY_JS_BIRTH_RESIDENT                 ', '49', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '生育服务证信息', '407490', 'DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', '生育服务证信息', '1', '', '0', '', '', '0', '', 'sdata.JHSY_JS_BIRTH_SERVICE_CERTIFICATE      ', '50', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '未知表', '706', 'DB_PEOPLE_INFO_BUFFER', 'JS_CYDC', '未知表', '0', '未知用途表', '0', '', '', '0', '', 'sdata.JHSY_JS_CYDC                           ', '51', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '民政结婚类型', '8', 'DB_PEOPLE_INFO_BUFFER', 'JS_DIM_MARRIAGE_TYPE', '民政结婚类型', '1', '', '0', '', '', '0', '', 'sdata.JHSY_JS_DIM_MARRIAGE_TYPE              ', '52', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '卫计委独生子女光荣证', '139778', 'DB_PEOPLE_INFO_BUFFER', 'JS_ONLY_CHILD_CERTIFICATE', '卫计委独生子女光荣证', '0', '', '0', '', '', '0', '', 'sdata.JHSY_JS_ONLY_CHILD_CERTIFICATE         ', '53', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '卫计委人口基本信息', '12206969', 'DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', '卫计委人口基本信息', '1', '', '1', '', '', '0', '', 'sdata.JHSY_JS_RESIDENT                       ', '54', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('有5000多条记录不在居民信息表，需整合', '卫计委新农合信息', '5281901', 'DB_PEOPLE_INFO_BUFFER', 'JS_XNH', '卫计委新农合信息', '1', '', '1', '', '', '0', '', 'sdata.JHSY_JS_XNH                            ', '55', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '民政乞讨信息', '63237', 'DB_PEOPLE_INFO_BUFFER', 'MZ_BEGGAR_REGISTER_INFO', '民政乞讨信息', '0', '无字段说明', '0', '', '', '0', '', 'sdata.MZJX_MZ_BEGGAR_REGISTER_INFO           ', '61', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '民政城乡低保信息', '156822', 'DB_PEOPLE_INFO_BUFFER', 'MZ_URBAN_ALLOWANCE_INFO', '民政城乡低保信息', '0', '从so_baseinfomain取数', '1', '', '', '0', '', 'sdata.MZJX_MZ_URBAN_ALLOWANCE_INFO           ', '62', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '公租房地址代码表', '871223', 'DB_PEOPLE_INFO_BUFFER', 'PUBIC_DIM_ADDRESS_CODE', '公租房地址代码表', '0', '待定，无字段说明', '1', '', '', '0', '', 'sdata.ZJJX_PUBIC_DIM_ADDRESS_CODE            ', '87', 'ZJJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '民政婚姻信息', '1262655', 'DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', '民政婚姻信息', '1', '', '1', '', '', '0', '', 'sdata.MZJX_RC_MARRY                          ', '63', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('社保参保状态(不使用)', '社保代码表', '5', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_CBZT_CODE', '社保代码表', '0', '使用RS_DIM_DWCBZT_CODE表数据', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_CBZT_CODE                  ', '72', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('社保参保状态', '社保代码表', '4', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_DWCBZT_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_DWCBZT_CODE                ', '73', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('户口性质', '社保代码表', '2', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HKXZ_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_HKXZ_CODE                  ', '74', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('婚姻状态', '社保代码表', '5', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_HYZK_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_HYZK_CODE                  ', '75', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('职业状态', '社保代码表', '12', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_JYZT_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_JYZT_CODE                  ', '76', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('民族', '社保代码表', '56', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_MZ_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_MZ_CODE                    ', '77', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('性别', '社保代码表', '2', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_RYXB_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_RYXB_CODE                  ', '78', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('社保经办机构代码表', '社保代码表', '21', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SBJBJG_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_SBJBJG_CODE                ', '79', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '社保代码表', '4', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_SHBXZT_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_SHBXZT_CODE                ', '80', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('学历', '社保代码表', '14', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_WHCD_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_WHCD_CODE                  ', '81', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('社保险种', '社保代码表', '11', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_XZXL_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_XZXL_CODE                  ', '82', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('用工性质 ', '社保代码表', '4', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_YGXZ_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_YGXZ_CODE                  ', '83', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('政治面貌', '社保代码表', '13', 'DB_PEOPLE_INFO_BUFFER', 'RS_DIM_ZZMM_CODE', '社保代码表', '1', '', '0', '', '', '0', '', 'sdata.SHBZ_RS_DIM_ZZMM_CODE                  ', '84', 'SHBZ', null);
INSERT INTO `src_table_analysis` VALUES ('', '民政低保采集表', '759621', 'DB_PEOPLE_INFO_BUFFER', 'sf_reqdetail', '民政低保采集表', '0', '从so_baseinfomain取数', '0', '', '', '0', '', 'sdata.MZJX_sf_reqdetail                      ', '64', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('数据有重复', '民政低保家庭基本信息', '236256', 'DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', '民政低保家庭基本信息', '1', '从so_baseinfomain取数', '0', '', '', '0', '', 'sdata.MZJX_so_baseinfomain                   ', '65', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '民政低保人员基本信息', '548349', 'DB_PEOPLE_INFO_BUFFER', 'so_basepeopinfo', '民政低保人员基本信息', '0', '', '0', '', '', '0', '', 'sdata.MZJX_so_basepeopinfo                   ', '66', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '儿童收养信息表', '24720', 'DB_PEOPLE_INFO_BUFFER', 'T_CHILDREN_ADOPT_INFO', '儿童收养信息表', '0', '没有被收养人信息', '0', '', '', '0', '', 'sdata.MZJX_T_CHILDREN_ADOPT_INFO             ', '67', 'MZJX', null);
INSERT INTO `src_table_analysis` VALUES ('有重复数据，需去重', '学籍信息', '501813', 'DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', '学籍信息', '1', '', '0', '', '', '0', '', 'sdata.JYJX_T_ENROLLMENT_INFO                 ', '58', 'JYJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '计划免疫信息表', '5128', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_PLAN_INFO', '计划免疫信息表', '0', '无字段说明', '0', '', '', '0', '', 'sdata.JHSY_T_IMMUNITY_PLAN_INFO              ', '56', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '0-7岁流动儿童国家免疫规划疫苗接种状况表', '5127', 'DB_PEOPLE_INFO_BUFFER', 'T_IMMUNITY_VACCINE_INFO', '0-7岁流动儿童国家免疫规划疫苗接种状况表', '0', '无字段说明', '0', '', '', '0', '', 'sdata.JHSY_T_IMMUNITY_VACCINE_INFO           ', '57', 'JHSY', null);
INSERT INTO `src_table_analysis` VALUES ('', '旅行社经营预测', '285766', 'DB_PEOPLE_INFO_BUFFER', 'T_INTERNATIONAL_TOURIST_STATISTICS', '旅行社经营预测', '0', '无字段说明', '0', '', '', '0', '', 'sdata.LYWX_T_INTERNATIONAL_TOURIST_STATISTICS', '60', 'LYWX', null);
INSERT INTO `src_table_analysis` VALUES ('', '教育学校信息', '5019', 'DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', '教育学校信息', '1', '', '0', '', '', '0', '', 'sdata.JYJX_T_SCHOOL_INFO                     ', '59', 'JYJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '住建公租房信息', '420', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_PUBLIC_HOUSE_INFO', '住建公租房信息', '0', '待定，无字段说明', '1', '', '', '0', '', 'sdata.ZJJX_ZJ_PUBLIC_HOUSE_INFO              ', '88', 'ZJJX', null);
INSERT INTO `src_table_analysis` VALUES ('', '住建房屋租赁信息', '371610', 'DB_PEOPLE_INFO_BUFFER', 'ZJ_RENT_HOUSE_INFO', '住建房屋租赁信息', '0', '待定，无字段说明', '1', '', '', '0', '', 'sdata.ZJJX_ZJ_RENT_HOUSE_INFO                ', '89', 'ZJJX', null);
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '个人参保', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '人口', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '企业参保', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '企业异常名录', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '企业成员', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '企业注吊销', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '出生', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '城乡低保户', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '婚姻', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '学校', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '学籍', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '新农合', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '法人', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '流动人口', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '社保卡', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '税务注销', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '税务登记', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '税务非正常户认定', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '组织机构代码证', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '著名驰名商标', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '行政区划', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', null, '0', 'pdata', '行政处罚案件', null, null, null, null, null, null, null, null, null, '10000', 'DW', '0');
INSERT INTO `src_table_analysis` VALUES ('', '人口归并关系', '0', 'vpdata', 'H01_Popu_Mer_Rela', '人口归并关系', '0', '', '0', '', '', '0', '', 'pdata.H01_Popu_Mer_Rela', '106', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '统一人口信息', '0', 'vpdata', 'H01_Unif_Popu_Info', '统一人口信息', '0', '', '0', '', '', '0', '', 'pdata.H01_Unif_Popu_Info', '105', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '法人', '0', 'vpdata', 'H02_Corp', '法人', '0', '', '0', '', '', '0', '', 'pdata.H02_Corp', '109', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '组织机构代码证', '0', 'vpdata', 'H02_Org_Code_Cert', '组织机构代码证', '0', '', '0', '', '', '0', '', 'pdata.H02_Org_Code_Cert', '110', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '行政区划', '0', 'vpdata', 'H03_Admin_Regn', '行政区划', '0', '', '0', '', '', '0', '', 'pdata.H03_Admin_Regn', '95', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '证件类型代码表', '0', 'vpdata', 'H99_Cert_Typ', '证件类型代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Cert_Typ', '94', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '代码映射表', '0', 'vpdata', 'H99_CODE_MAP', '代码映射表', '0', '', '0', '', '', '0', '', 'pdata.H99_Code_Map', '99', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '企业类型代码表', '0', 'vpdata', 'H99_Corp_Typ', '企业类型代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Corp_Typ', '112', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '文化程度代码表', '0', 'vpdata', 'H99_Edu_Degr', '文化程度代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Edu_Degr', '98', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '行业门类代码表', '0', 'vpdata', 'H99_Inds_Typ_Cd', '行业门类代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Inds_Typ_Cd', '113', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '婚姻状态代码表', '0', 'vpdata', 'H99_Marrg_Stat', '婚姻状态代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Marrg_Stat', '111', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '国籍代码表', '0', 'vpdata', 'H99_Nati', '国籍代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Nati', '102', 'AAAA', null);
INSERT INTO `src_table_analysis` VALUES ('', '民族代码表', '0', 'vpdata', 'H99_Nation', '民族代码表', '0', '', '0', '', '', '0', '', 'pdata.H99_Nation', '93', 'AAAA', null);

-- ----------------------------
-- Table structure for `src_table_analysis_his`
-- ----------------------------
DROP TABLE IF EXISTS `src_table_analysis_his`;
CREATE TABLE `src_table_analysis_his` (
  `comments` varchar(512) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `row_count` int(11) DEFAULT NULL,
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `need_ext` tinyint(1) DEFAULT NULL,
  `no_ext_cmt` varchar(512) DEFAULT NULL,
  `need_int` tinyint(1) DEFAULT NULL,
  `no_int_cmt` varchar(512) DEFAULT NULL,
  `ext_cycle` varchar(60) DEFAULT NULL,
  `is_inc_ext` tinyint(1) DEFAULT NULL,
  `ext_condition` text,
  `stbl_name` varchar(60) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  `version` int(11) NOT NULL,
  `load_to_fact` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`schema_name`,`table_name`,`sys_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_table_analysis_his
-- ----------------------------

-- ----------------------------
-- Table structure for `src_tbl_subject`
-- ----------------------------
DROP TABLE IF EXISTS `src_tbl_subject`;
CREATE TABLE `src_tbl_subject` (
  `schema_name` varchar(60) NOT NULL,
  `table_name` varchar(60) NOT NULL,
  `sys_name` varchar(60) NOT NULL,
  `subject_name` varchar(60) NOT NULL,
  PRIMARY KEY (`schema_name`,`table_name`,`sys_name`,`subject_name`),
  KEY `R_40` (`subject_name`),
  CONSTRAINT `src_tbl_subject_ibfk_1` FOREIGN KEY (`schema_name`, `table_name`, `sys_name`) REFERENCES `src_table_analysis` (`schema_name`, `table_name`, `sys_name`),
  CONSTRAINT `src_tbl_subject_ibfk_2` FOREIGN KEY (`subject_name`) REFERENCES `dw_subject` (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of src_tbl_subject
-- ----------------------------
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', 'GSSW', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'GSSW', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_15_QYRYXX', 'GSSW', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', 'SHBZ', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS_RESIDENCE_RESIDENT', 'JHSY', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_RESIDENT', 'JHSY', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_BIRTH_SERVICE_CERTIFICATE', 'JHSY', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_RESIDENT', 'JHSY', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_XNH', 'JHSY', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'RC_MARRY', 'MZJX', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', 'MZJX', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'T_ENROLLMENT_INFO', 'JYJX', '人口');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'AJXXB', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'BAK_DJNSRXX', 'GSJX', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'BAK_DJ_ZXDJXX', 'GSJX', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'BAK_FZCKXX', 'GSJX', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'ControlledName', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'CurCompactCredit', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'dishui_dengji', 'DSJX', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'dishui_feizhengchanghu', 'DSJX', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'dishui_zhuxiao', 'DSJX', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'entityRegisterInfo', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_12_SJZTKYDJXX', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_14_SJZTZDXDJXX', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'EX_ZH_GONGSHANG_16_SSZTYCML', 'GSSW', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'V_QYDMFZXX', 'ZJZZ', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_ENTERPRISE_BUFFER', 'V_QYDMXX', 'ZJZZ', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', 'SHBZ', '法人');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'AB01_TO_GXT', 'SHBZ', '社会保障');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'AC01_TO_GXT', 'SHBZ', '社会保障');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'AC02_TO_GXT', 'SHBZ', '社会保障');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_XNH', 'JHSY', '社会保障');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'so_baseinfomain', 'MZJX', '社会保障');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'JS_ADDRESS', 'JHSY', '空间地理');
INSERT INTO `src_tbl_subject` VALUES ('DB_PEOPLE_INFO_BUFFER', 'T_SCHOOL_INFO', 'JYJX', '空间地理');

-- ----------------------------
-- Table structure for `system_properties`
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
-- Table structure for `table_schema`
-- ----------------------------
DROP TABLE IF EXISTS `table_schema`;
CREATE TABLE `table_schema` (
  `schema_name` varchar(60) NOT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `schema_type` varchar(60) DEFAULT NULL,
  `sys_name` varchar(60) NOT NULL,
  PRIMARY KEY (`schema_name`,`sys_name`),
  KEY `R_34` (`sys_name`),
  CONSTRAINT `table_schema_ibfk_1` FOREIGN KEY (`sys_name`) REFERENCES `ent_system` (`sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_schema
-- ----------------------------
INSERT INTO `table_schema` VALUES ('', '', '', '');
INSERT INTO `table_schema` VALUES ('', '', '', 'test');
INSERT INTO `table_schema` VALUES ('DB_ENTERPRISE_BUFFER', '企业法人库缓冲库', 'sql server', 'CZKJ');
INSERT INTO `table_schema` VALUES ('DB_ENTERPRISE_BUFFER', '企业法人库缓冲库', 'sql server', 'DSJX');
INSERT INTO `table_schema` VALUES ('DB_ENTERPRISE_BUFFER', '企业法人库缓冲库', 'sql server', 'GSJX');
INSERT INTO `table_schema` VALUES ('DB_ENTERPRISE_BUFFER', '企业法人库缓冲库', 'sql server', 'GSSW');
INSERT INTO `table_schema` VALUES ('DB_ENTERPRISE_BUFFER', '企业法人库缓冲库', 'sql server', 'RSJX');
INSERT INTO `table_schema` VALUES ('DB_ENTERPRISE_BUFFER', '企业法人库缓冲库', 'sql server', 'ZJZZ');
INSERT INTO `table_schema` VALUES ('DB_PEOPLE_INFO_BUFFER', '人口旅游综合缓冲库', 'sql server', 'JHSY');
INSERT INTO `table_schema` VALUES ('DB_PEOPLE_INFO_BUFFER', '人口旅游综合缓冲库', 'sql server', 'JYJX');
INSERT INTO `table_schema` VALUES ('DB_PEOPLE_INFO_BUFFER', '人口旅游综合缓冲库', 'sql server', 'LYWX');
INSERT INTO `table_schema` VALUES ('DB_PEOPLE_INFO_BUFFER', '人口旅游综合缓冲库', 'sql server', 'MZJX');
INSERT INTO `table_schema` VALUES ('DB_PEOPLE_INFO_BUFFER', '人口旅游综合缓冲库', 'sql server', 'SHBZ');
INSERT INTO `table_schema` VALUES ('DB_PEOPLE_INFO_BUFFER', '人口旅游综合缓冲库', 'sql server', 'ZJJX');
INSERT INTO `table_schema` VALUES ('pdata', '', 'DW', 'DW');
INSERT INTO `table_schema` VALUES ('test', 'test', 'hive', 'test');
INSERT INTO `table_schema` VALUES ('vpdata', '虚拟P层', 'hive', 'AAAA');

-- ----------------------------
-- Table structure for `vocabulary`
-- ----------------------------
DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE `vocabulary` (
  `cn_word` varchar(60) NOT NULL,
  `en_word` varchar(60) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`cn_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vocabulary
-- ----------------------------
INSERT INTO `vocabulary` VALUES ('三位数字国籍代码', 'Thr_Num_Nati_Cd', '');
INSERT INTO `vocabulary` VALUES ('上级行政区域编号', 'Parnt_Admin_Regn_ID', '');
INSERT INTO `vocabulary` VALUES ('专业代码', 'Major_Cd', '');
INSERT INTO `vocabulary` VALUES ('专业代码描述', 'Major_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('专业代码表', 'H99_Major', '');
INSERT INTO `vocabulary` VALUES ('个人保险编号', 'Indv_Insu_ID', '');
INSERT INTO `vocabulary` VALUES ('个人参保', 'H08_Indv_Insure', '');
INSERT INTO `vocabulary` VALUES ('个人参保编号', 'Indv_Insure_ID', '');
INSERT INTO `vocabulary` VALUES ('个人社保编号', 'Indv_Social_Secu_ID', '');
INSERT INTO `vocabulary` VALUES ('主送单位', 'Main_Deli_Dep', '');
INSERT INTO `vocabulary` VALUES ('主题词', 'Key_Wrd', '');
INSERT INTO `vocabulary` VALUES ('二位国籍代码', 'Two_Nati_Cd', '');
INSERT INTO `vocabulary` VALUES ('产妇个案唯一编号', 'Preg_Uniq_ID', '');
INSERT INTO `vocabulary` VALUES ('人口', 'H01_Popu', '');
INSERT INTO `vocabulary` VALUES ('人口归并关系', 'H01_Popu_Mer_Rela', '');
INSERT INTO `vocabulary` VALUES ('人口流动状态代码', 'Popu_Flow_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('人口编号', 'Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('企业人员角色代码', 'Crop_Popu_Role_Cd', '');
INSERT INTO `vocabulary` VALUES ('企业人员角色代码描述', 'Crop_Popu_Role_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('企业人员角色代码表', 'H99_Crop_Popu_Role', '');
INSERT INTO `vocabulary` VALUES ('企业参保', 'H08_Corp_Insure', '');
INSERT INTO `vocabulary` VALUES ('企业参保编号', 'Corp_Insure_ID', '');
INSERT INTO `vocabulary` VALUES ('企业名称', 'Corp_Nm', '');
INSERT INTO `vocabulary` VALUES ('企业异常事由代码', 'Crop_Unus_Resn_Cd', '');
INSERT INTO `vocabulary` VALUES ('企业异常事由代码描述', 'Crop_Unus_Resn_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('企业异常事由代码表', 'H99_Crop_Unus_Resn', '');
INSERT INTO `vocabulary` VALUES ('企业异常名录', 'H02_Corp_Unus_Direct', '');
INSERT INTO `vocabulary` VALUES ('企业异常编号', 'Corp_Unus_ID', '');
INSERT INTO `vocabulary` VALUES ('企业当前状态代码', 'Corp_Cur_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('企业当前状态代码描述', 'Corp_Cur_Stat_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('企业当前状态代码表', 'H99_Corp_Cur_Stat', '');
INSERT INTO `vocabulary` VALUES ('企业成员', 'H01_Corp_Member', '');
INSERT INTO `vocabulary` VALUES ('企业注册号', 'Corp_Rgst_Num', '');
INSERT INTO `vocabulary` VALUES ('企业注吊销', 'H02_Corp_Revok', '');
INSERT INTO `vocabulary` VALUES ('企业注吊销编号', 'Corp_Revok_Num', '');
INSERT INTO `vocabulary` VALUES ('企业类型代码', 'Corp_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('企业类型代码描述', 'Corp_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('企业类型代码表', 'H99_Corp_Typ', '');
INSERT INTO `vocabulary` VALUES ('低保户编号', 'Low_Secu_Family_ID', '');
INSERT INTO `vocabulary` VALUES ('低保类型代码', 'Low_Secu_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('低保编号', 'Low_Secu_ID', '');
INSERT INTO `vocabulary` VALUES ('保密期限', 'Secu_Term', '');
INSERT INTO `vocabulary` VALUES ('保障人口数', 'Low_Secu_Popu_Cnt', '');
INSERT INTO `vocabulary` VALUES ('保障金额', 'Low_Secu_Amt', '');
INSERT INTO `vocabulary` VALUES ('健康状况代码', 'Hlth_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('健康状况代码描述', 'Hlth_Stat_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('健康状况代码表', 'H99_Hlth_Stat', '');
INSERT INTO `vocabulary` VALUES ('入学时间', 'Start_Schl_Tm', '');
INSERT INTO `vocabulary` VALUES ('公文标题', 'Doc_Title', '');
INSERT INTO `vocabulary` VALUES ('公文要素编号', 'Doc_Elem_ID', '');
INSERT INTO `vocabulary` VALUES ('公示年度', 'Pub_Year', '');
INSERT INTO `vocabulary` VALUES ('出生', 'H01_Popu_Birth', '');
INSERT INTO `vocabulary` VALUES ('出生地', 'Birth_Addr', '');
INSERT INTO `vocabulary` VALUES ('出生日期', 'Birth_Dt', '');
INSERT INTO `vocabulary` VALUES ('出生编号', 'Birth_ID', '');
INSERT INTO `vocabulary` VALUES ('出资方式', 'Invest_Ways', '');
INSERT INTO `vocabulary` VALUES ('出资期限', 'Invest_Term', '');
INSERT INTO `vocabulary` VALUES ('出资比例', 'Invest_Ratio', '');
INSERT INTO `vocabulary` VALUES ('出资额', 'Invest_Amt', '');
INSERT INTO `vocabulary` VALUES ('分娩时间', 'Deliv_Tm', '');
INSERT INTO `vocabulary` VALUES ('办公电话', 'Offi_Tel', '');
INSERT INTO `vocabulary` VALUES ('区县编号', 'Coty_ID', '');
INSERT INTO `vocabulary` VALUES ('区域级别', 'Regn_Lvl', '');
INSERT INTO `vocabulary` VALUES ('医疗机构代码', 'Medi_Org_Cd', '');
INSERT INTO `vocabulary` VALUES ('印发日期', 'Deli_Date', '');
INSERT INTO `vocabulary` VALUES ('参保人姓名', 'Insure_Holder_Nm', '');
INSERT INTO `vocabulary` VALUES ('参保企业编号', 'Insure_Corp_ID', '');
INSERT INTO `vocabulary` VALUES ('参保单位名称', 'Insure_Corp_Nm', '');
INSERT INTO `vocabulary` VALUES ('参保日期', 'Insure_Dt', '');
INSERT INTO `vocabulary` VALUES ('参保状态代码', 'Insure_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('参保缴费状态', 'Insure_Paym_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('参加工作日期', 'Join_Work_Dt', '');
INSERT INTO `vocabulary` VALUES ('参合日期', 'Join_Coop_Medi_Dt', '');
INSERT INTO `vocabulary` VALUES ('发文单位', 'Disp_Doc_Dep', '');
INSERT INTO `vocabulary` VALUES ('发文字号', 'Doc_Refer_Num', '');
INSERT INTO `vocabulary` VALUES ('发证日期', 'Cert_Dt', '');
INSERT INTO `vocabulary` VALUES ('发证机关', 'Cert_Org', '');
INSERT INTO `vocabulary` VALUES ('变更日期', 'Modi_Dt', '');
INSERT INTO `vocabulary` VALUES ('吊销事由', 'Revok_Reson', '');
INSERT INTO `vocabulary` VALUES ('吊销日期', 'Revok_Dt', '');
INSERT INTO `vocabulary` VALUES ('吊销机关', 'Revok_Org', '');
INSERT INTO `vocabulary` VALUES ('吊销标志', 'Revok_Ind', '');
INSERT INTO `vocabulary` VALUES ('商标类型代码', 'Brand_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('商标类型代码描述', 'Brand_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('商标类型代码表', 'H99_Brand_Typ', '');
INSERT INTO `vocabulary` VALUES ('国家编号', 'Country_ID', '');
INSERT INTO `vocabulary` VALUES ('国籍代码', 'Nati_Cd', '');
INSERT INTO `vocabulary` VALUES ('国籍代码描述', 'Nati_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('国籍代码表', 'H99_Nati', '');
INSERT INTO `vocabulary` VALUES ('地市编号', 'Urbn_ID', '');
INSERT INTO `vocabulary` VALUES ('城乡低保', 'H08_Low_Secu', '');
INSERT INTO `vocabulary` VALUES ('城乡低保户', 'H08_Low_Secu_Family', '');
INSERT INTO `vocabulary` VALUES ('城市编号', 'Urbn_ID', '');
INSERT INTO `vocabulary` VALUES ('城镇编号', 'Town_ID', '');
INSERT INTO `vocabulary` VALUES ('处罚时间', 'Punish_Tm', '');
INSERT INTO `vocabulary` VALUES ('处罚机关', 'Punish_Org', '');
INSERT INTO `vocabulary` VALUES ('处罚种类', 'Punish_Typ', '');
INSERT INTO `vocabulary` VALUES ('处罚结果', 'Punish_Rest', '');
INSERT INTO `vocabulary` VALUES ('复婚标志', 'Re_Marrg_Ind', '');
INSERT INTO `vocabulary` VALUES ('多媒体对象位置描述', 'Media_Obj_Pos_Desc', '');
INSERT INTO `vocabulary` VALUES ('多媒体对象名称', 'Media_Obj_Nm', '');
INSERT INTO `vocabulary` VALUES ('多媒体对象种类代码', 'Media_Obj_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('多媒体对象编号', 'Media_Obj_ID', '');
INSERT INTO `vocabulary` VALUES ('女方人口编号', 'F_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('女方婚姻状态', 'Wom_Marrg_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('女方证书编号', 'Wom_Marrg_Cert_ID', '');
INSERT INTO `vocabulary` VALUES ('姓名', 'Popu_Nm', '');
INSERT INTO `vocabulary` VALUES ('婚姻', 'H01_Marrg', '');
INSERT INTO `vocabulary` VALUES ('婚姻状态代码', 'Marrg_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('婚姻状态代码描述', 'Marrg_Stat_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('婚姻状态代码表', 'H99_Marrg_Stat', '');
INSERT INTO `vocabulary` VALUES ('婚姻登记号', 'Marrg_Rgst_Num', '');
INSERT INTO `vocabulary` VALUES ('婚姻编号', 'Marrg_ID', '');
INSERT INTO `vocabulary` VALUES ('存活情况代码', 'Surv_Situ_Cd', '');
INSERT INTO `vocabulary` VALUES ('学制代码', 'Schl_Sys_Cd', '');
INSERT INTO `vocabulary` VALUES ('学号', 'Stud_Num', '');
INSERT INTO `vocabulary` VALUES ('学校', 'H03_School', '');
INSERT INTO `vocabulary` VALUES ('学校名称', 'Schl_Nm', '');
INSERT INTO `vocabulary` VALUES ('学校类型代码', 'Schl_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('学校类型代码描述', 'Schl_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('学校类型代码表', 'H99_Schl_Typ', '');
INSERT INTO `vocabulary` VALUES ('学校编号', 'Schl_ID', '');
INSERT INTO `vocabulary` VALUES ('学段', 'Schl_Phas', '');
INSERT INTO `vocabulary` VALUES ('学籍', 'H01_Stud_Stat', '');
INSERT INTO `vocabulary` VALUES ('学籍编号', 'Stud_Stat_ID', '');
INSERT INTO `vocabulary` VALUES ('守重企业', 'H02_Keep_Cret_Corp', '');
INSERT INTO `vocabulary` VALUES ('守重企业编号', 'Keep_Cret_Corp_ID', '');
INSERT INTO `vocabulary` VALUES ('宗教信仰代码', 'Relig_Cd', '');
INSERT INTO `vocabulary` VALUES ('宗教信仰代码描述', 'Relig_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('宗教信仰代码表', 'H99_Relig', '');
INSERT INTO `vocabulary` VALUES ('家庭人口数', 'Family_Popu_Cnt', '');
INSERT INTO `vocabulary` VALUES ('家庭地址', 'Family_Addr', '');
INSERT INTO `vocabulary` VALUES ('家庭户信息代码', 'Family_Info_Cd', '');
INSERT INTO `vocabulary` VALUES ('家庭电话', 'Family_Tel', '');
INSERT INTO `vocabulary` VALUES ('密级', 'Secu_Class', '');
INSERT INTO `vocabulary` VALUES ('就业状况代码', 'Empl_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('居住地址', 'Resid_Addr', '');
INSERT INTO `vocabulary` VALUES ('居住地址编号', 'Resid_Addr_Num', '');
INSERT INTO `vocabulary` VALUES ('币种', 'Curr_Cd', '');
INSERT INTO `vocabulary` VALUES ('常住人口标志', 'Perm_Resid_Ind', '');
INSERT INTO `vocabulary` VALUES ('常住人口标识', 'Perm_Resid_Ind', '');
INSERT INTO `vocabulary` VALUES ('开业地区县编号', 'Open_Busi_Coty_ID', '');
INSERT INTO `vocabulary` VALUES ('开始年月', 'Start_Year_Month', '');
INSERT INTO `vocabulary` VALUES ('异常日期', 'Unus_Dt', '');
INSERT INTO `vocabulary` VALUES ('异常状态代码', 'Unus_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('性别代码', 'Gender_Cd', '');
INSERT INTO `vocabulary` VALUES ('性别代码描述', 'Gender_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('性别代码表', 'H99_Gender', '');
INSERT INTO `vocabulary` VALUES ('成员角色', 'Memb_Role', '');
INSERT INTO `vocabulary` VALUES ('成文日期', 'Write_Date', '');
INSERT INTO `vocabulary` VALUES ('成立日期', 'Estb_Dt', '');
INSERT INTO `vocabulary` VALUES ('户口性质代码', 'Hshld_Prop_Cd', '');
INSERT INTO `vocabulary` VALUES ('户口性质代码描述', 'Hshld_Prop_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('户口性质代码表', 'H99_Hshld_Prop', '');
INSERT INTO `vocabulary` VALUES ('户籍地址编号', 'Hshld_Addr_ID', '');
INSERT INTO `vocabulary` VALUES ('所属区县编号', 'Belg_Coty_ID', '');
INSERT INTO `vocabulary` VALUES ('所属区域编号', 'Belg_Regn_ID', '');
INSERT INTO `vocabulary` VALUES ('承办机构', 'Undt_Org', '');
INSERT INTO `vocabulary` VALUES ('抄送单位', 'Copy_Deli_Dep', '');
INSERT INTO `vocabulary` VALUES ('护照号码', 'Pasp_Num', '');
INSERT INTO `vocabulary` VALUES ('操作人', 'Operator', '');
INSERT INTO `vocabulary` VALUES ('政治面貌代码', 'Poli_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('政治面貌代码描述', 'Poli_Stat_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('政治面貌代码表', 'H99_Poli_Stat', '');
INSERT INTO `vocabulary` VALUES ('数据日期', 'Data_Dt', '');
INSERT INTO `vocabulary` VALUES ('数据来源代码', 'Data_Src_Cd', '');
INSERT INTO `vocabulary` VALUES ('数据来源代码描述', 'Data_Src_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('数据来源代码表', 'H99_Data_Src', '');
INSERT INTO `vocabulary` VALUES ('数据来源表', 'Data_Src_Tbl', '');
INSERT INTO `vocabulary` VALUES ('文化程度代码', 'Edu_Degr_Cd', '');
INSERT INTO `vocabulary` VALUES ('文化程度代码描述', 'Edu_Degr_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('文化程度代码表', 'H99_Edu_Degr', '');
INSERT INTO `vocabulary` VALUES ('新农合', 'H08_Ncms', '');
INSERT INTO `vocabulary` VALUES ('新农合编号', 'Ncms_ID', '');
INSERT INTO `vocabulary` VALUES ('新生儿健康状况代码', 'New_Birth_Hlth_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('新生儿健康状况代码描述', 'New_Birth_Hlth_Stat_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('新生儿健康状况代码表', 'H99_New_Birth_Hlth_Stat', '');
INSERT INTO `vocabulary` VALUES ('最后缴费单位', 'Lst_Paym_Corp', '');
INSERT INTO `vocabulary` VALUES ('最后缴费地址', 'Lst_Pay_Addr', '');
INSERT INTO `vocabulary` VALUES ('最后缴费年份', 'Lst_Pay_Year', '');
INSERT INTO `vocabulary` VALUES ('最后缴费机构', 'Lst_Pay_Org', '');
INSERT INTO `vocabulary` VALUES ('最后缴费金额', 'Lst_Pay_Amt', '');
INSERT INTO `vocabulary` VALUES ('有效标志', 'Valid_Ind', '');
INSERT INTO `vocabulary` VALUES ('机构名称', 'Org_Nm', '');
INSERT INTO `vocabulary` VALUES ('机构注册类型代码', 'Org_rgst_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('机构注册类型代码描述', 'Org_rgst_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('机构注册类型代码表', 'H99_Org_rgst_Typ', '');
INSERT INTO `vocabulary` VALUES ('村庄编号', 'vila_ID', '');
INSERT INTO `vocabulary` VALUES ('核准日期', 'Chk_Aprv_Dt', '');
INSERT INTO `vocabulary` VALUES ('案件编号', 'Case_ID', '');
INSERT INTO `vocabulary` VALUES ('死亡日期', 'Die_Dt', '');
INSERT INTO `vocabulary` VALUES ('母亲人口编号', 'Mo_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('民族代码', 'Nation_Cd', '');
INSERT INTO `vocabulary` VALUES ('民族代码描述', 'Nation_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('民族代码表', 'H99_Nation', '');
INSERT INTO `vocabulary` VALUES ('法人', 'H02_Corp', '');
INSERT INTO `vocabulary` VALUES ('法人编号', 'Lpr_ID', '');
INSERT INTO `vocabulary` VALUES ('法定代表人', 'Leg_pers', '');
INSERT INTO `vocabulary` VALUES ('法定代表人人口编号', 'Leg_pers_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('注册商标名称', 'Rgst_brand_Nm', '');
INSERT INTO `vocabulary` VALUES ('注册地址', 'Rgst_Addr', '');
INSERT INTO `vocabulary` VALUES ('注册资本', 'Rgst_capt', '');
INSERT INTO `vocabulary` VALUES ('注销事由', 'Remov_Resn', '');
INSERT INTO `vocabulary` VALUES ('注销原因描述', 'Remov_Resn_Desc', '');
INSERT INTO `vocabulary` VALUES ('注销日期', 'Remov_Dt', '');
INSERT INTO `vocabulary` VALUES ('注销机关', 'Remov_Org', '');
INSERT INTO `vocabulary` VALUES ('注销标志', 'Remov_Ind', '');
INSERT INTO `vocabulary` VALUES ('流出地编号', 'Flow_Out_Addr_ID', '');
INSERT INTO `vocabulary` VALUES ('流动人口', 'H01_Flow_Popu', '');
INSERT INTO `vocabulary` VALUES ('流动人口编号', 'Flow_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('流动原因代码', 'Flow_Resn_Cd', '');
INSERT INTO `vocabulary` VALUES ('流动开始时间', 'Start_Flow_Tm', '');
INSERT INTO `vocabulary` VALUES ('流动状态', 'Flow_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('流动状态确认', 'Flow_Stat_Cfm', '');
INSERT INTO `vocabulary` VALUES ('流动结束时间', 'Stop_Flow_Tm', '');
INSERT INTO `vocabulary` VALUES ('流管备注信息', 'Flow_Manage_Memo', '');
INSERT INTO `vocabulary` VALUES ('涉外标志', 'Frgn_Ind', '');
INSERT INTO `vocabulary` VALUES ('源系统编号', 'Src_Sys_ID', '');
INSERT INTO `vocabulary` VALUES ('父亲人口编号', 'Fa_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('生效日期', 'Efft_Dt', '');
INSERT INTO `vocabulary` VALUES ('生育政策代码', 'Bir_Poly_Cd', '');
INSERT INTO `vocabulary` VALUES ('生育服务证类型代码', 'Bir_Serv_Cert_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('生育服务证编号', 'Bir_Serv_Cert_ID', '');
INSERT INTO `vocabulary` VALUES ('用工性质代码', 'Labr_Prop_Cd', '');
INSERT INTO `vocabulary` VALUES ('男方人口编号', 'M_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('男方婚姻状态', 'Man_Marrg_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('男方证书编号', 'Man_Marrg_Cert_ID', '');
INSERT INTO `vocabulary` VALUES ('登记时间', 'Rgst_Tm', '');
INSERT INTO `vocabulary` VALUES ('登记机关编号', 'Rgst_Org_ID', '');
INSERT INTO `vocabulary` VALUES ('登记状态标识', 'Rgst_Stat_Ind', '');
INSERT INTO `vocabulary` VALUES ('监督机关', 'Surv_Org', '');
INSERT INTO `vocabulary` VALUES ('省份编号', 'Prov_ID', '');
INSERT INTO `vocabulary` VALUES ('社会保险状态代码', 'Social_Secu_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('社会保障计划编号', 'Social_Secu_Plan_ID', '');
INSERT INTO `vocabulary` VALUES ('社保卡', 'H08_Social_Secu_Crd', '');
INSERT INTO `vocabulary` VALUES ('社保险种代码', 'Social_Secu_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('离退休日期', 'Retir_Dt', '');
INSERT INTO `vocabulary` VALUES ('移动电话', 'Mov_Tel', '');
INSERT INTO `vocabulary` VALUES ('税务批准注销号', 'Tax_Appr_Remov_Num', '');
INSERT INTO `vocabulary` VALUES ('税务注销', 'H02_Tax_Remov', '');
INSERT INTO `vocabulary` VALUES ('税务登记', 'H02_Tax_Rgst', '');
INSERT INTO `vocabulary` VALUES ('税务登记日期', 'Tax_Rgst_Dt', '');
INSERT INTO `vocabulary` VALUES ('税务登记机构', 'Tax_Rgst_Org', '');
INSERT INTO `vocabulary` VALUES ('税务登记种类代码', 'Tax_Rgst_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('税务登记种类代码描述', 'Tax_Rgst_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('税务登记种类代码表', 'H99_Tax_Rgst_Typ', '');
INSERT INTO `vocabulary` VALUES ('税务登记编号', 'Tax_Rgst_ID', '');
INSERT INTO `vocabulary` VALUES ('税务种类代码', 'Tax_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('税务非正常户认定', 'H02_Tax_Unus_Corp', '');
INSERT INTO `vocabulary` VALUES ('籍贯具体地址', 'Nati_Pla_Addr', '');
INSERT INTO `vocabulary` VALUES ('紧急程度', 'Urge_lvl', '');
INSERT INTO `vocabulary` VALUES ('纳税人名称', 'Tax_Payer_Nm', '');
INSERT INTO `vocabulary` VALUES ('纳税人识别号', 'Tax_Payer_ID', '');
INSERT INTO `vocabulary` VALUES ('组织机构代码', 'Org_ID', '');
INSERT INTO `vocabulary` VALUES ('组织机构代码证', 'H02_Org_Code_Cert', '');
INSERT INTO `vocabulary` VALUES ('终止年月', 'Termi_Year_Month', '');
INSERT INTO `vocabulary` VALUES ('经办日期', 'Hadl_Dt', '');
INSERT INTO `vocabulary` VALUES ('经办机构代码', 'Hadl_Org_ID', '');
INSERT INTO `vocabulary` VALUES ('经营场所', 'Busi_Opr_Site', '');
INSERT INTO `vocabulary` VALUES ('经营状态代码', 'Busi_Opr_Stat_Cd', '');
INSERT INTO `vocabulary` VALUES ('经营状态代码描述', 'Busi_Opr_Stat_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('经营状态代码表', 'H99_Busi_Opr_Stat', '');
INSERT INTO `vocabulary` VALUES ('经营范围', 'Busi_Scop', '');
INSERT INTO `vocabulary` VALUES ('结婚日期', 'Marrg_Dt', '');
INSERT INTO `vocabulary` VALUES ('结离婚标志', 'Marrg_Divor_Ind', '');
INSERT INTO `vocabulary` VALUES ('统一人口信息', 'Unif_Popu_Info', '');
INSERT INTO `vocabulary` VALUES ('统一人口编号', 'Unif_Popu_ID', '');
INSERT INTO `vocabulary` VALUES ('联系人', 'Contr', '');
INSERT INTO `vocabulary` VALUES ('联系方式', 'Cont_Mtd', '');
INSERT INTO `vocabulary` VALUES ('联系电话', 'Cont_Tel', '');
INSERT INTO `vocabulary` VALUES ('致贫原因代码', 'Povt_Resn_Cd', '');
INSERT INTO `vocabulary` VALUES ('营业截至日期 ', 'Busi_Upto_Dt', '');
INSERT INTO `vocabulary` VALUES ('营业起始日期 ', 'Busi_Start_Dt', '');
INSERT INTO `vocabulary` VALUES ('著名驰名商标', 'H02_Fams_Brand', '');
INSERT INTO `vocabulary` VALUES ('著名驰名商标编号', 'Fams_Brand_ID', '');
INSERT INTO `vocabulary` VALUES ('行业代码', 'Inds_Cd', '');
INSERT INTO `vocabulary` VALUES ('行业门类代码', 'Inds_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('行业门类代码描述', 'Inds_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('行业门类代码表', 'H99_Inds_Typ', '');
INSERT INTO `vocabulary` VALUES ('行政区划', 'H03_Admin_Regn', '');
INSERT INTO `vocabulary` VALUES ('行政区划种类代码', 'Admin_Regn_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('行政区划种类代码描述', 'Admin_Regn_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('行政区划种类代码表', 'H99_Admin_Regn_Typ', '');
INSERT INTO `vocabulary` VALUES ('行政区域名称', 'Admin_Regn_Nm', '');
INSERT INTO `vocabulary` VALUES ('行政区域编号', 'Admin_Regn_ID', '');
INSERT INTO `vocabulary` VALUES ('行政处罚案件', 'H02_Admin_Puni_Case', '');
INSERT INTO `vocabulary` VALUES ('认定日期', 'Crtn_Dt', '');
INSERT INTO `vocabulary` VALUES ('认定项目', 'Crtn_Proj', '');
INSERT INTO `vocabulary` VALUES ('证件号码', 'Cert_Num', '');
INSERT INTO `vocabulary` VALUES ('证件类型', 'Cert_Typ', '');
INSERT INTO `vocabulary` VALUES ('证件类型代码', 'Cert_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('证件类型代码描述', 'Cert_Typ_Cd_Desc', '');
INSERT INTO `vocabulary` VALUES ('证件类型代码表', 'H99_Cert_Typ', '');
INSERT INTO `vocabulary` VALUES ('起始年月', 'Start_Year_Month', '');
INSERT INTO `vocabulary` VALUES ('起始日期', 'Start_Dt', '');
INSERT INTO `vocabulary` VALUES ('身份证号码', 'ID_Card_Num', '');
INSERT INTO `vocabulary` VALUES ('载入事由', 'Rcrd_Resn', '');
INSERT INTO `vocabulary` VALUES ('连续公示年度', 'Cont_Pub_Year', '');
INSERT INTO `vocabulary` VALUES ('通讯地址', 'Comm_Addr', '');
INSERT INTO `vocabulary` VALUES ('邮政编码', 'Zip_Cd', '');
INSERT INTO `vocabulary` VALUES ('鉴别信息', 'Iden_Info', '');
INSERT INTO `vocabulary` VALUES ('鉴别信息种类代码', 'Iden_info_Typ_Cd', '');
INSERT INTO `vocabulary` VALUES ('非正常户解除日期', 'Unus_Corp_Stop_Dt', '');
INSERT INTO `vocabulary` VALUES ('非正常户认定日期', 'Unus_Corp_Start_Dt', '');
INSERT INTO `vocabulary` VALUES ('非正常用户解除日期', 'Unus_Corp_Stop_Dt', '');
INSERT INTO `vocabulary` VALUES ('非正常用户认定日期', 'Unus_Corp_Start_Dt', '');
INSERT INTO `vocabulary` VALUES ('颁证日期', 'Issu_Dt', '');
INSERT INTO `vocabulary` VALUES ('驾驶证编号', 'Driv_lice_Num', '');
