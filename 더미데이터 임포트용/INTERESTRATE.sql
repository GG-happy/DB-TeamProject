--------------------------------------------------------
--  颇老捞 积己凳 - 老夸老-12岿-08-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table INTERESTRATE
--------------------------------------------------------

  CREATE TABLE "DBP"."INTERESTRATE" 
   (	"INTEREST_ID" VARCHAR2(20 BYTE), 
	"BASE_RATE" NUMBER, 
	"EFFECTIVE_YEAR" DATE, 
	"APPLIED_RATE" NUMBER, 
	"COMPANY_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into DBP.INTERESTRATE
SET DEFINE OFF;
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000004',3,to_date('23/01/13','RR/MM/DD'),4,'COM-000226');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000107',3,to_date('31/03/20','RR/MM/DD'),4,'COM-000003');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000108',3,to_date('30/08/22','RR/MM/DD'),4,'COM-000004');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000109',3,to_date('11/05/22','RR/MM/DD'),4,'COM-000005');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000110',3,to_date('16/02/22','RR/MM/DD'),4,'COM-000006');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000111',3,to_date('23/01/22','RR/MM/DD'),4,'COM-000007');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000112',3,to_date('05/07/23','RR/MM/DD'),4,'COM-000008');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000113',3,to_date('03/09/21','RR/MM/DD'),4,'COM-000009');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000114',3,to_date('17/06/23','RR/MM/DD'),4,'COM-000010');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000115',3,to_date('02/06/22','RR/MM/DD'),4,'COM-000011');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000116',3,to_date('06/02/21','RR/MM/DD'),4,'COM-000012');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000117',3,to_date('27/05/23','RR/MM/DD'),4,'COM-000013');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000118',3,to_date('15/03/23','RR/MM/DD'),4,'COM-000014');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000119',3,to_date('16/07/20','RR/MM/DD'),4,'COM-000015');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000120',3,to_date('30/10/21','RR/MM/DD'),4,'COM-000016');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000121',3,to_date('07/08/20','RR/MM/DD'),4,'COM-000017');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000122',3,to_date('30/10/21','RR/MM/DD'),4,'COM-000018');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000123',3,to_date('23/01/22','RR/MM/DD'),4,'COM-000019');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000124',3,to_date('13/03/20','RR/MM/DD'),4,'COM-000020');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000125',3,to_date('25/01/21','RR/MM/DD'),4,'COM-000021');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000126',3,to_date('05/06/23','RR/MM/DD'),4,'COM-000022');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000127',3,to_date('08/04/22','RR/MM/DD'),4,'COM-000023');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000128',3,to_date('03/11/20','RR/MM/DD'),4,'COM-000024');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000129',3,to_date('24/06/22','RR/MM/DD'),4,'COM-000025');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000130',3,to_date('28/02/23','RR/MM/DD'),4,'COM-000026');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000131',3,to_date('29/11/20','RR/MM/DD'),4,'COM-000027');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000132',3,to_date('21/06/23','RR/MM/DD'),4,'COM-000028');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000133',3,to_date('30/01/21','RR/MM/DD'),4,'COM-000029');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000134',3,to_date('09/05/21','RR/MM/DD'),4,'COM-000030');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000135',3,to_date('31/10/23','RR/MM/DD'),4,'COM-000031');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000136',3,to_date('28/07/22','RR/MM/DD'),4,'COM-000032');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000137',3,to_date('01/09/23','RR/MM/DD'),4,'COM-000033');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000138',3,to_date('22/08/21','RR/MM/DD'),4,'COM-000034');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000139',3,to_date('02/12/23','RR/MM/DD'),4,'COM-000035');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000140',3,to_date('01/07/20','RR/MM/DD'),4,'COM-000036');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000141',3,to_date('01/03/23','RR/MM/DD'),4,'COM-000037');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000142',3,to_date('28/01/21','RR/MM/DD'),4,'COM-000038');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000143',3,to_date('03/10/22','RR/MM/DD'),4,'COM-000039');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000144',3,to_date('09/08/23','RR/MM/DD'),4,'COM-000040');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000145',3,to_date('09/09/23','RR/MM/DD'),4,'COM-000041');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000146',3,to_date('27/01/23','RR/MM/DD'),4,'COM-000042');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000147',3,to_date('20/01/20','RR/MM/DD'),4,'COM-000043');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000148',3,to_date('12/04/20','RR/MM/DD'),4,'COM-000044');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000149',3,to_date('06/01/22','RR/MM/DD'),4,'COM-000045');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000150',3,to_date('03/09/21','RR/MM/DD'),4,'COM-000046');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000151',3,to_date('06/11/23','RR/MM/DD'),4,'COM-000047');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000152',3,to_date('21/06/23','RR/MM/DD'),4,'COM-000048');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000153',3,to_date('19/10/22','RR/MM/DD'),4,'COM-000049');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000154',3,to_date('28/12/22','RR/MM/DD'),4,'COM-000050');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000155',3,to_date('06/09/22','RR/MM/DD'),4,'COM-000051');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000156',3,to_date('21/11/22','RR/MM/DD'),4,'COM-000052');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000157',3,to_date('23/06/20','RR/MM/DD'),4,'COM-000053');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000158',3,to_date('29/05/23','RR/MM/DD'),4,'COM-000054');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000159',3,to_date('29/01/23','RR/MM/DD'),4,'COM-000055');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000160',3,to_date('20/02/20','RR/MM/DD'),4,'COM-000056');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000161',3,to_date('21/02/23','RR/MM/DD'),4,'COM-000057');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000162',3,to_date('03/10/21','RR/MM/DD'),4,'COM-000058');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000163',3,to_date('11/05/21','RR/MM/DD'),4,'COM-000059');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000164',3,to_date('22/08/22','RR/MM/DD'),4,'COM-000060');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000165',3,to_date('09/03/22','RR/MM/DD'),4,'COM-000061');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000166',3,to_date('10/04/21','RR/MM/DD'),4,'COM-000062');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000167',3,to_date('24/03/23','RR/MM/DD'),4,'COM-000063');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000168',3,to_date('20/07/20','RR/MM/DD'),4,'COM-000064');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000169',3,to_date('13/06/23','RR/MM/DD'),4,'COM-000065');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000170',3,to_date('18/05/22','RR/MM/DD'),4,'COM-000066');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000171',3,to_date('22/08/20','RR/MM/DD'),4,'COM-000067');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000172',3,to_date('14/06/20','RR/MM/DD'),4,'COM-000068');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000173',3,to_date('10/01/23','RR/MM/DD'),4,'COM-000069');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000174',3,to_date('04/06/22','RR/MM/DD'),4,'COM-000070');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000175',3,to_date('05/08/23','RR/MM/DD'),4,'COM-000071');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000176',3,to_date('29/10/23','RR/MM/DD'),4,'COM-000072');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000177',3,to_date('22/01/20','RR/MM/DD'),4,'COM-000073');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000178',3,to_date('25/04/23','RR/MM/DD'),4,'COM-000074');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000179',3,to_date('09/06/22','RR/MM/DD'),4,'COM-000075');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000180',3,to_date('13/09/23','RR/MM/DD'),4,'COM-000076');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000181',3,to_date('19/04/22','RR/MM/DD'),4,'COM-000077');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000182',3,to_date('19/03/23','RR/MM/DD'),4,'COM-000078');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000183',3,to_date('07/11/22','RR/MM/DD'),4,'COM-000079');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000184',3,to_date('22/03/21','RR/MM/DD'),4,'COM-000080');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000185',3,to_date('30/09/22','RR/MM/DD'),4,'COM-000081');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000186',3,to_date('21/11/23','RR/MM/DD'),4,'COM-000082');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000187',3,to_date('08/05/23','RR/MM/DD'),4,'COM-000083');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000188',3,to_date('06/11/21','RR/MM/DD'),4,'COM-000084');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000189',3,to_date('04/06/21','RR/MM/DD'),4,'COM-000085');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000190',3,to_date('28/06/22','RR/MM/DD'),4,'COM-000086');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000191',3,to_date('15/12/22','RR/MM/DD'),4,'COM-000087');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000192',3,to_date('01/02/21','RR/MM/DD'),4,'COM-000088');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000193',3,to_date('17/05/22','RR/MM/DD'),4,'COM-000089');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000194',3,to_date('28/02/23','RR/MM/DD'),4,'COM-000090');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000195',3,to_date('14/09/22','RR/MM/DD'),4,'COM-000091');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000196',3,to_date('11/02/22','RR/MM/DD'),4,'COM-000092');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000197',3,to_date('24/02/21','RR/MM/DD'),4,'COM-000093');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000198',3,to_date('16/04/23','RR/MM/DD'),4,'COM-000094');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000199',3,to_date('14/06/21','RR/MM/DD'),4,'COM-000095');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000200',3,to_date('17/09/20','RR/MM/DD'),4,'COM-000096');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000201',3,to_date('28/09/22','RR/MM/DD'),4,'COM-000097');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000202',3,to_date('26/10/21','RR/MM/DD'),4,'COM-000098');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000203',3,to_date('25/08/22','RR/MM/DD'),4,'COM-000099');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000204',3,to_date('04/07/23','RR/MM/DD'),4,'COM-000100');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000205',3,to_date('02/10/22','RR/MM/DD'),4,'COM-000101');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000002',10,to_date('24/12/07','RR/MM/DD'),22.04,'COM-000037');
--------------------------------------------------------
--  DDL for Index SYS_C008438
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBP"."SYS_C008438" ON "DBP"."INTERESTRATE" ("INTEREST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger IR_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "DBP"."IR_TRG" 
BEFORE INSERT ON InterestRate
FOR EACH ROW
BEGIN
    :NEW.interest_id := 'IR-' || LPAD(IR_SEQ.NEXTVAL, 6, '0');
END;

/
ALTER TRIGGER "DBP"."IR_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table INTERESTRATE
--------------------------------------------------------

  ALTER TABLE "DBP"."INTERESTRATE" MODIFY ("BASE_RATE" NOT NULL ENABLE);
  ALTER TABLE "DBP"."INTERESTRATE" MODIFY ("EFFECTIVE_YEAR" NOT NULL ENABLE);
  ALTER TABLE "DBP"."INTERESTRATE" MODIFY ("APPLIED_RATE" NOT NULL ENABLE);
  ALTER TABLE "DBP"."INTERESTRATE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "DBP"."INTERESTRATE" ADD PRIMARY KEY ("INTEREST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INTERESTRATE
--------------------------------------------------------

  ALTER TABLE "DBP"."INTERESTRATE" ADD CONSTRAINT "FK_IR_COM" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "DBP"."COMPANY" ("COMPANY_ID") DISABLE;
