/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : xe_scoring
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : SCORING

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2017-10-21 21:11:05
*/


-- ----------------------------
-- Table structure for PERSON
-- ----------------------------
DROP TABLE "SCORING"."PERSON";
CREATE TABLE "SCORING"."PERSON" (
"person_id" NUMBER(32) NOT NULL ,
"name" VARCHAR2(127 BYTE) NULL ,
"last_name" VARCHAR2(127 BYTE) NULL ,
"phone_number" NUMBER(12) NULL ,
"birthday" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Table structure for QUEST
-- ----------------------------
DROP TABLE "SCORING"."QUEST";
CREATE TABLE "SCORING"."QUEST" (
"quest_id" NUMBER(32) NOT NULL ,
"sex" NUMBER NULL ,
"monthly_income" NUMBER(32) NULL ,
"passport_series" NUMBER(4) NULL ,
"passport_number" NUMBER(12) NULL ,
"address" VARCHAR2(255 BYTE) NULL ,
"house_type" NUMBER NULL ,
"family_status" NUMBER NULL ,
"children_amount" NUMBER NULL ,
"education" NUMBER NULL ,
"social_status" NUMBER NULL ,
"activity" NUMBER NULL ,
"work_post" NUMBER NULL ,
"experience" NUMBER NULL ,
"costs" NUMBER(32) NULL ,
"credit_term" NUMBER NULL ,
"immovables" NUMBER NULL ,
"immovables_type" NUMBER NULL ,
"car" NUMBER NULL ,
"car_mark" VARCHAR2(127 BYTE) NULL ,
"auto_year" NUMBER NULL ,
"additional_income" NUMBER NULL ,
"additional_income_type" NUMBER NULL ,
"additional_income_summ" NUMBER(32) NULL ,
"effective_credit" NUMBER NULL ,
"effective_credit_summ" NUMBER(32) NULL ,
"person_id" NUMBER(32) NULL ,
"status" NUMBER NULL ,
"score" NUMBER NULL ,
"quest_date" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Table structure for SETTINGS
-- ----------------------------
DROP TABLE "SCORING"."SETTINGS";
CREATE TABLE "SCORING"."SETTINGS" (
"setting_id" NUMBER(32) NOT NULL ,
"approve" NUMBER(4) NULL ,
"cheat_type" VARCHAR2(20 BYTE) NULL ,
"cheat_value" VARCHAR2(20 BYTE) NULL ,
"start_date" DATE NULL ,
"end_date" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- View structure for GET_STATUS
-- ----------------------------
CREATE OR REPLACE FORCE VIEW "SCORING"."GET_STATUS" AS 
SELECT
SCORING.PERSON."name",
SCORING.PERSON."last_name",
SCORING.PERSON."phone_number",
SCORING.QUEST."status",
SCORING.QUEST."quest_date"
FROM
SCORING.PERSON
INNER JOIN SCORING.QUEST ON SCORING.QUEST."person_id" = SCORING.PERSON."person_id";

-- ----------------------------
-- Sequence structure for SQ_PERSON
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_PERSON";
CREATE SEQUENCE "SCORING"."SQ_PERSON"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Sequence structure for SQ_QUEST
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_QUEST";
CREATE SEQUENCE "SCORING"."SQ_QUEST"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Sequence structure for SQ_SETTINGS
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_SETTINGS";
CREATE SEQUENCE "SCORING"."SQ_SETTINGS"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Sequence structure for SQ_TEST
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_TEST";
CREATE SEQUENCE "SCORING"."SQ_TEST"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999
 START WITH 4
 CACHE 20;

-- ----------------------------
-- Indexes structure for table PERSON
-- ----------------------------

-- ----------------------------
-- Checks structure for table PERSON
-- ----------------------------
ALTER TABLE "SCORING"."PERSON" ADD CHECK ("person_id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PERSON
-- ----------------------------
ALTER TABLE "SCORING"."PERSON" ADD PRIMARY KEY ("person_id");

-- ----------------------------
-- Checks structure for table QUEST
-- ----------------------------
ALTER TABLE "SCORING"."QUEST" ADD CHECK ("quest_id" IS NOT NULL);
ALTER TABLE "SCORING"."QUEST" ADD CHECK ("quest_id" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table SETTINGS
-- ----------------------------

-- ----------------------------
-- Checks structure for table SETTINGS
-- ----------------------------
ALTER TABLE "SCORING"."SETTINGS" ADD CHECK ("setting_id" IS NOT NULL);
ALTER TABLE "SCORING"."SETTINGS" ADD CHECK ("setting_id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SETTINGS
-- ----------------------------
ALTER TABLE "SCORING"."SETTINGS" ADD PRIMARY KEY ("setting_id");
