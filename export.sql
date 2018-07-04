--------------------------------------------------------
--  File created - среда-июля-04-2018   
--------------------------------------------------------
DROP SEQUENCE "SCORING"."SQ_PERSON";
DROP SEQUENCE "SCORING"."SQ_QUEST";
DROP SEQUENCE "SCORING"."SQ_SETTINGS";
DROP SEQUENCE "SCORING"."SQ_TEST";
DROP TABLE "SCORING"."PERSON";
DROP TABLE "SCORING"."QUEST";
DROP TABLE "SCORING"."SETTINGS";
DROP VIEW "SCORING"."GET_STATUS";
--------------------------------------------------------
--  DDL for Sequence SQ_PERSON
--------------------------------------------------------

   CREATE SEQUENCE  "SCORING"."SQ_PERSON"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_QUEST
--------------------------------------------------------

   CREATE SEQUENCE  "SCORING"."SQ_QUEST"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SETTINGS
--------------------------------------------------------

   CREATE SEQUENCE  "SCORING"."SQ_SETTINGS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_TEST
--------------------------------------------------------

   CREATE SEQUENCE  "SCORING"."SQ_TEST"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table PERSON
--------------------------------------------------------

  CREATE TABLE "SCORING"."PERSON" 
   (	"person_id" NUMBER(32,0), 
	"name" VARCHAR2(127 BYTE), 
	"last_name" VARCHAR2(127 BYTE), 
	"phone_number" NUMBER(12,0), 
	"birthday" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table QUEST
--------------------------------------------------------

  CREATE TABLE "SCORING"."QUEST" 
   (	"quest_id" NUMBER(32,0), 
	"sex" NUMBER, 
	"monthly_income" NUMBER(32,0), 
	"passport_series" NUMBER(4,0), 
	"passport_number" NUMBER(12,0), 
	"address" VARCHAR2(255 BYTE), 
	"house_type" NUMBER, 
	"family_status" NUMBER, 
	"children_amount" NUMBER, 
	"education" NUMBER, 
	"social_status" NUMBER, 
	"activity" NUMBER, 
	"work_post" NUMBER, 
	"experience" NUMBER, 
	"costs" NUMBER(32,0), 
	"credit_term" NUMBER, 
	"immovables" NUMBER, 
	"immovables_type" NUMBER, 
	"car" NUMBER, 
	"car_mark" VARCHAR2(127 BYTE), 
	"auto_year" NUMBER, 
	"additional_income" NUMBER, 
	"additional_income_type" NUMBER, 
	"additional_income_summ" NUMBER(32,0), 
	"effective_credit" NUMBER, 
	"effective_credit_summ" NUMBER(32,0), 
	"person_id" NUMBER(32,0), 
	"status" NUMBER, 
	"score" NUMBER, 
	"quest_date" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SETTINGS
--------------------------------------------------------

  CREATE TABLE "SCORING"."SETTINGS" 
   (	"setting_id" NUMBER(32,0), 
	"approve" NUMBER(4,0), 
	"cheat_type" VARCHAR2(20 BYTE), 
	"cheat_value" VARCHAR2(20 BYTE), 
	"start_date" DATE, 
	"end_date" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for View GET_STATUS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SCORING"."GET_STATUS" ("name", "last_name", "phone_number", "status", "quest_date") AS 
  SELECT
SCORING.PERSON."name",
SCORING.PERSON."last_name",
SCORING.PERSON."phone_number",
SCORING.QUEST."status",
SCORING.QUEST."quest_date"
FROM
SCORING.PERSON
INNER JOIN SCORING.QUEST ON SCORING.QUEST."person_id" = SCORING.PERSON."person_id"
;
REM INSERTING into SCORING.PERSON
SET DEFINE OFF;
REM INSERTING into SCORING.QUEST
SET DEFINE OFF;
REM INSERTING into SCORING.SETTINGS
SET DEFINE OFF;
Insert into SCORING.SETTINGS ("setting_id","approve","cheat_type","cheat_value","start_date","end_date") values ('1','700','percent_per_hour','50',to_date('22.10.17','DD.MM.RR'),to_date('22.10.18','DD.MM.RR'));
--------------------------------------------------------
--  DDL for Index SYS_C007014
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCORING"."SYS_C007014" ON "SCORING"."SETTINGS" ("setting_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007009
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCORING"."SYS_C007009" ON "SCORING"."PERSON" ("person_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table PERSON
--------------------------------------------------------

  ALTER TABLE "SCORING"."PERSON" ADD CONSTRAINT "SYS_C007008" CHECK ("person_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."PERSON" ADD CONSTRAINT "SYS_C007005" CHECK ("person_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."PERSON" ADD CONSTRAINT "SYS_C007009" PRIMARY KEY ("person_id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCORING"."PERSON" MODIFY ("person_id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SETTINGS
--------------------------------------------------------

  ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007013" CHECK ("setting_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007012" CHECK ("setting_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007007" CHECK ("setting_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."SETTINGS" ADD CONSTRAINT "SYS_C007014" PRIMARY KEY ("setting_id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCORING"."SETTINGS" MODIFY ("setting_id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QUEST
--------------------------------------------------------

  ALTER TABLE "SCORING"."QUEST" ADD CONSTRAINT "SYS_C007011" CHECK ("quest_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."QUEST" ADD CONSTRAINT "SYS_C007010" CHECK ("quest_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."QUEST" ADD CONSTRAINT "SYS_C007006" CHECK ("quest_id" IS NOT NULL) ENABLE;
  ALTER TABLE "SCORING"."QUEST" MODIFY ("quest_id" NOT NULL ENABLE);
