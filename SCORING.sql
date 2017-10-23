/*
 Navicat Premium Data Transfer

 Source Server         : oracle
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : localhost:1521
 Source Schema         : SCORING

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 23/10/2017 17:59:31
*/


-- ----------------------------
-- Table structure for PERSON
-- ----------------------------
DROP TABLE "SCORING"."PERSON";
CREATE TABLE "SCORING"."PERSON" (
  "person_id" NUMBER(32) NOT NULL ,
  "name" VARCHAR2(127 BYTE) ,
  "last_name" VARCHAR2(127 BYTE) ,
  "phone_number" NUMBER(12) ,
  "birthday" DATE 
)
TABLESPACE "SYSTEM"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for QUEST
-- ----------------------------
DROP TABLE "SCORING"."QUEST";
CREATE TABLE "SCORING"."QUEST" (
  "quest_id" NUMBER(32) NOT NULL ,
  "sex" NUMBER ,
  "monthly_income" NUMBER(32) ,
  "passport_series" NUMBER(4) ,
  "passport_number" NUMBER(12) ,
  "address" VARCHAR2(255 BYTE) ,
  "house_type" NUMBER ,
  "family_status" NUMBER ,
  "children_amount" NUMBER ,
  "education" NUMBER ,
  "social_status" NUMBER ,
  "activity" NUMBER ,
  "work_post" NUMBER ,
  "experience" NUMBER ,
  "costs" NUMBER(32) ,
  "credit_term" NUMBER ,
  "immovables" NUMBER ,
  "immovables_type" NUMBER ,
  "car" NUMBER ,
  "car_mark" VARCHAR2(127 BYTE) ,
  "auto_year" NUMBER ,
  "additional_income" NUMBER ,
  "additional_income_type" NUMBER ,
  "additional_income_summ" NUMBER(32) ,
  "effective_credit" NUMBER ,
  "effective_credit_summ" NUMBER(32) ,
  "person_id" NUMBER(32) ,
  "status" NUMBER ,
  "score" NUMBER ,
  "quest_date" TIMESTAMP(6) 
)
TABLESPACE "SYSTEM"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for SETTINGS
-- ----------------------------
DROP TABLE "SCORING"."SETTINGS";
CREATE TABLE "SCORING"."SETTINGS" (
  "setting_id" NUMBER(32) NOT NULL ,
  "approve" NUMBER(4) ,
  "cheat_type" VARCHAR2(20 BYTE) ,
  "cheat_value" VARCHAR2(20 BYTE) ,
  "start_date" DATE ,
  "end_date" DATE 
)
TABLESPACE "SYSTEM"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of "SETTINGS"
-- ----------------------------
INSERT INTO "SCORING"."SETTINGS" VALUES ('1', '700', 'percent_per_hour', '50', TO_DATE('2017-10-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2018-10-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- View structure for GET_STATUS
-- ----------------------------
CREATE OR REPLACE VIEW "SCORING"."GET_STATUS" AS SELECT
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
CREATE SEQUENCE "SCORING"."SQ_PERSON" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SQ_QUEST
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_QUEST";
CREATE SEQUENCE "SCORING"."SQ_QUEST" MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SQ_SETTINGS
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_SETTINGS";
CREATE SEQUENCE "SCORING"."SQ_SETTINGS" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SQ_TEST
-- ----------------------------
DROP SEQUENCE "SCORING"."SQ_TEST";
CREATE SEQUENCE "SCORING"."SQ_TEST" MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Primary Key structure for table PERSON
-- ----------------------------
ALTER TABLE "SCORING"."PERSON" ADD CONSTRAINT "SYS_C007009" PRIMARY KEY ("person_id");

-- ----------------------------
-- Checks structure for table PERSON
-- ----------------------------
ALTER TABLE "SCORING"."PERSON" ADD CONSTRAINT "SYS_C007005" CHECK ("person_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SCORING"."PERSON" ADD CONSTRAINT "SYS_C007008" CHECK ("person_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table QUEST
-- ----------------------------
ALTER TABLE "SCORING"."QUEST" ADD CONSTRAINT "SYS_C007006" CHECK ("quest_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SCORING"."QUEST" ADD CONSTRAINT "SYS_C007010" CHECK ("quest_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SCORING"."QUEST" ADD CONSTRAINT "SYS_C007011" CHECK ("quest_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SETTINGS
-- ----------------------------
ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007014" PRIMARY KEY ("setting_id");

-- ----------------------------
-- Checks structure for table SETTINGS
-- ----------------------------
ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007007" CHECK ("setting_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007012" CHECK ("setting_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007013" CHECK ("setting_id" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
