--------------------------------------------------------
--  파일이 생성됨 - 월요일-12월-09-2024   
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
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000002',0.99,to_date('21/05/26','RR/MM/DD'),2.23,'COM-000002');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000003',2.95,to_date('20/08/17','RR/MM/DD'),2.28,'COM-000003');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000004',1,to_date('23/12/21','RR/MM/DD'),2.83,'COM-000004');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000005',4.64,to_date('23/07/01','RR/MM/DD'),1.37,'COM-000005');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000006',3.56,to_date('22/12/21','RR/MM/DD'),3.88,'COM-000006');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000007',3.57,to_date('21/04/19','RR/MM/DD'),2.17,'COM-000007');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000008',4.93,to_date('23/01/07','RR/MM/DD'),2.18,'COM-000008');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000009',3.14,to_date('22/03/21','RR/MM/DD'),4.46,'COM-000009');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000010',0.78,to_date('20/01/31','RR/MM/DD'),1.83,'COM-000010');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000011',0.75,to_date('23/07/14','RR/MM/DD'),2.42,'COM-000011');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000012',2.69,to_date('20/09/26','RR/MM/DD'),1.91,'COM-000012');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000013',1.4,to_date('23/09/29','RR/MM/DD'),4.56,'COM-000013');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000014',4.91,to_date('22/01/25','RR/MM/DD'),1.75,'COM-000014');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000015',1.57,to_date('23/12/09','RR/MM/DD'),1.93,'COM-000015');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000016',2.57,to_date('21/06/10','RR/MM/DD'),2.43,'COM-000016');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000017',2.55,to_date('22/05/12','RR/MM/DD'),4.59,'COM-000017');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000018',2.89,to_date('21/02/22','RR/MM/DD'),1.67,'COM-000018');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000019',1.81,to_date('21/04/28','RR/MM/DD'),0.73,'COM-000019');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000020',2.25,to_date('21/12/31','RR/MM/DD'),4.37,'COM-000020');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000021',1.29,to_date('21/06/14','RR/MM/DD'),0.51,'COM-000021');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000022',1.09,to_date('23/09/07','RR/MM/DD'),2.51,'COM-000022');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000023',3.88,to_date('20/10/03','RR/MM/DD'),0.45,'COM-000023');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000024',4.18,to_date('23/12/06','RR/MM/DD'),2.19,'COM-000024');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000025',1,to_date('23/03/24','RR/MM/DD'),0.17,'COM-000025');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000026',4.66,to_date('22/08/27','RR/MM/DD'),3.66,'COM-000026');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000027',1.39,to_date('21/06/20','RR/MM/DD'),3.5,'COM-000027');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000028',5,to_date('22/11/06','RR/MM/DD'),2.62,'COM-000028');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000029',4.68,to_date('22/08/31','RR/MM/DD'),2.75,'COM-000029');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000030',3.97,to_date('22/02/06','RR/MM/DD'),0.02,'COM-000030');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000031',3.27,to_date('23/05/25','RR/MM/DD'),2.43,'COM-000031');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000032',1.59,to_date('22/04/15','RR/MM/DD'),4.51,'COM-000032');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000033',3.23,to_date('21/09/04','RR/MM/DD'),0.97,'COM-000033');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000034',2.69,to_date('21/12/21','RR/MM/DD'),4.05,'COM-000034');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000035',3.45,to_date('22/03/19','RR/MM/DD'),4.66,'COM-000035');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000036',0.99,to_date('21/07/19','RR/MM/DD'),0.08,'COM-000036');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000037',4.12,to_date('23/01/14','RR/MM/DD'),4.48,'COM-000037');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000038',3.29,to_date('21/07/22','RR/MM/DD'),1,'COM-000038');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000039',3.37,to_date('21/01/27','RR/MM/DD'),4.94,'COM-000039');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000040',1.1,to_date('20/09/01','RR/MM/DD'),4.59,'COM-000040');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000041',3.14,to_date('22/11/04','RR/MM/DD'),3.27,'COM-000041');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000042',2.83,to_date('23/10/18','RR/MM/DD'),3.01,'COM-000042');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000043',3.93,to_date('23/12/04','RR/MM/DD'),3.9,'COM-000043');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000044',2.22,to_date('22/04/06','RR/MM/DD'),4.17,'COM-000044');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000045',3.57,to_date('23/02/14','RR/MM/DD'),3.26,'COM-000045');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000046',0.29,to_date('22/02/09','RR/MM/DD'),4.76,'COM-000046');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000047',1.55,to_date('21/10/08','RR/MM/DD'),4.21,'COM-000047');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000048',2.15,to_date('21/10/11','RR/MM/DD'),3.29,'COM-000048');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000049',2.67,to_date('21/11/09','RR/MM/DD'),4.42,'COM-000049');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000050',0.22,to_date('23/12/12','RR/MM/DD'),1.01,'COM-000050');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000051',0.26,to_date('20/02/12','RR/MM/DD'),0.39,'COM-000051');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000052',4.09,to_date('21/05/24','RR/MM/DD'),2.65,'COM-000052');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000053',4.47,to_date('20/11/30','RR/MM/DD'),1.89,'COM-000053');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000054',2.44,to_date('23/03/09','RR/MM/DD'),3.5,'COM-000054');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000055',4.91,to_date('22/02/15','RR/MM/DD'),2.11,'COM-000055');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000056',2.35,to_date('22/01/25','RR/MM/DD'),4.01,'COM-000056');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000057',1.91,to_date('23/05/27','RR/MM/DD'),1.2,'COM-000057');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000058',0.66,to_date('20/10/05','RR/MM/DD'),0.08,'COM-000058');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000059',1.29,to_date('23/08/07','RR/MM/DD'),0.28,'COM-000059');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000060',4.05,to_date('23/11/01','RR/MM/DD'),1.09,'COM-000060');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000061',2.86,to_date('23/12/29','RR/MM/DD'),0.22,'COM-000061');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000062',4.87,to_date('22/12/11','RR/MM/DD'),1.03,'COM-000062');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000063',4.89,to_date('21/11/07','RR/MM/DD'),1.85,'COM-000063');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000064',4.3,to_date('21/02/20','RR/MM/DD'),2.14,'COM-000064');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000065',3.37,to_date('23/02/16','RR/MM/DD'),3.13,'COM-000065');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000066',1.39,to_date('21/01/28','RR/MM/DD'),3.06,'COM-000066');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000067',3.55,to_date('21/09/30','RR/MM/DD'),4.69,'COM-000067');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000068',2.05,to_date('20/09/20','RR/MM/DD'),0.31,'COM-000068');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000069',1.46,to_date('23/11/15','RR/MM/DD'),0.27,'COM-000069');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000070',2.83,to_date('20/07/29','RR/MM/DD'),0.69,'COM-000070');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000071',0.66,to_date('20/03/13','RR/MM/DD'),0.91,'COM-000071');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000072',0.35,to_date('20/08/19','RR/MM/DD'),0.84,'COM-000072');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000073',4.8,to_date('21/11/19','RR/MM/DD'),4.94,'COM-000073');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000074',3.44,to_date('22/12/06','RR/MM/DD'),4.45,'COM-000074');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000075',0.44,to_date('20/06/29','RR/MM/DD'),2.14,'COM-000075');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000076',0.61,to_date('22/01/01','RR/MM/DD'),4.78,'COM-000076');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000077',0.33,to_date('22/11/03','RR/MM/DD'),3.61,'COM-000077');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000078',0.05,to_date('21/03/08','RR/MM/DD'),1.3,'COM-000078');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000079',3.95,to_date('20/06/17','RR/MM/DD'),4.2,'COM-000079');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000080',4.81,to_date('23/08/16','RR/MM/DD'),3.47,'COM-000080');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000081',4.99,to_date('22/08/06','RR/MM/DD'),4.17,'COM-000081');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000082',1.54,to_date('20/05/04','RR/MM/DD'),3.88,'COM-000082');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000083',1.22,to_date('23/02/27','RR/MM/DD'),0.07,'COM-000083');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000084',1.68,to_date('23/06/01','RR/MM/DD'),0.26,'COM-000084');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000085',1.21,to_date('23/01/09','RR/MM/DD'),3.06,'COM-000085');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000086',2.3,to_date('20/08/26','RR/MM/DD'),3.36,'COM-000086');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000087',2.94,to_date('21/07/26','RR/MM/DD'),3.15,'COM-000087');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000088',4.49,to_date('21/11/04','RR/MM/DD'),1.48,'COM-000088');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000089',0.71,to_date('22/07/10','RR/MM/DD'),4,'COM-000089');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000090',3.82,to_date('21/11/12','RR/MM/DD'),3.47,'COM-000090');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000091',4.96,to_date('23/01/30','RR/MM/DD'),3.14,'COM-000091');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000092',4,to_date('21/05/03','RR/MM/DD'),4.01,'COM-000092');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000093',4.03,to_date('20/05/26','RR/MM/DD'),2.07,'COM-000093');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000094',4.64,to_date('23/04/13','RR/MM/DD'),2.25,'COM-000094');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000095',4.73,to_date('23/09/10','RR/MM/DD'),0.69,'COM-000095');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000096',1.36,to_date('20/11/29','RR/MM/DD'),2.98,'COM-000096');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000097',2.53,to_date('21/08/13','RR/MM/DD'),2.84,'COM-000097');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000098',4.4,to_date('20/10/28','RR/MM/DD'),3.85,'COM-000098');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000099',1.22,to_date('21/04/10','RR/MM/DD'),0.89,'COM-000099');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000100',3.04,to_date('23/11/26','RR/MM/DD'),0.12,'COM-000100');
Insert into DBP.INTERESTRATE (INTEREST_ID,BASE_RATE,EFFECTIVE_YEAR,APPLIED_RATE,COMPANY_ID) values ('IR-000001',1.85,to_date('23/09/14','RR/MM/DD'),2.29,'COM-000001');
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
