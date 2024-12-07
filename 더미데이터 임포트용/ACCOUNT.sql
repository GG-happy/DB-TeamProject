--------------------------------------------------------
--  파일이 생성됨 - 일요일-12월-08-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACCOUNT
--------------------------------------------------------

  CREATE TABLE "DBP"."ACCOUNT" 
   (	"ACCOUNT_ID" VARCHAR2(20 BYTE), 
	"ACCOUNT_NO" VARCHAR2(30 BYTE), 
	"ACCOUNT_NAME" VARCHAR2(60 BYTE), 
	"CLASSIFICA" VARCHAR2(30 BYTE), 
	"BRANCH" VARCHAR2(30 BYTE), 
	"OPEN_DATE" DATE, 
	"BALANCE" NUMBER, 
	"COMPANY_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into DBP.ACCOUNT
SET DEFINE OFF;
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000013','059-12-134131-9','테스트용','대출','부산본점',to_date('24/12/07','RR/MM/DD'),-100000,'COM-000037');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000014','059-13-000000-0','테스트2','예금','LA지사',to_date('24/12/07','RR/MM/DD'),200000,'COM-000037');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000084','0056240473494','김민준','예금','우리은행',to_date('23/12/23','RR/MM/DD'),538983,'COM-000003');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000085','0057317411060','이지혜','예금','우리은행',to_date('23/03/27','RR/MM/DD'),513273,'COM-000004');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000086','178774836645','박찬호','예금','NH농협은행',to_date('21/08/29','RR/MM/DD'),581421,'COM-000005');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000087','178457919300','최유진','예금','NH농협은행',to_date('23/04/26','RR/MM/DD'),111123,'COM-000006');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000088','176567405261','정수현','출금','NH농협은행',to_date('21/12/05','RR/MM/DD'),254877,'COM-000007');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000089','0058502339609','강민서','예금','우리은행',to_date('20/01/08','RR/MM/DD'),854946,'COM-000008');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000090','042962378369','조현우','출금','IBK기업은행',to_date('23/05/09','RR/MM/DD'),372909,'COM-000009');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000091','041173780089','윤서준','출금','IBK기업은행',to_date('21/06/05','RR/MM/DD'),916721,'COM-000010');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000092','224900561465','고은지','출금','하나은행',to_date('21/09/10','RR/MM/DD'),620571,'COM-000011');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000093','042015604205','장하준','출금','IBK기업은행',to_date('21/08/05','RR/MM/DD'),585327,'COM-000012');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000094','0227386933539','임나연','출금','KDB산업은행',to_date('21/06/05','RR/MM/DD'),570702,'COM-000013');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000095','227503013902','한지민','출금','하나은행',to_date('23/10/12','RR/MM/DD'),580198,'COM-000014');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000096','255589816340','오세준','출금','KB국민은행',to_date('20/05/16','RR/MM/DD'),591401,'COM-000015');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000097','040385210946','서민지','출금','IBK기업은행',to_date('22/06/23','RR/MM/DD'),390379,'COM-000016');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000098','043732856974','구자현','예금','IBK기업은행',to_date('21/05/13','RR/MM/DD'),86115,'COM-000017');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000099','057237130122','문현우','예금','신한은행',to_date('20/08/20','RR/MM/DD'),48507,'COM-000018');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000100','051456010336','신지수','예금','신한은행',to_date('20/12/02','RR/MM/DD'),685288,'COM-000019');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000101','204110781288','안태준','예금','SC제일은행',to_date('22/06/28','RR/MM/DD'),893103,'COM-000020');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000102','056810089802','홍예린','예금','신한은행',to_date('20/08/25','RR/MM/DD'),216090,'COM-000021');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000103','172125922395','주시현','예금','NH농협은행',to_date('21/04/11','RR/MM/DD'),263947,'COM-000022');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000104','250657130462','최정우','예금','KB국민은행',to_date('21/06/28','RR/MM/DD'),593066,'COM-000023');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000105','047056137471','송재석','출금','IBK기업은행',to_date('21/05/10','RR/MM/DD'),460640,'COM-000024');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000106','258514226351','송동하','예금','KB국민은행',to_date('22/11/18','RR/MM/DD'),68724,'COM-000025');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000107','225074375294','송성우','출금','하나은행',to_date('22/07/26','RR/MM/DD'),961151,'COM-000026');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000108','204471796221','홍정환','출금','SC제일은행',to_date('22/07/01','RR/MM/DD'),479744,'COM-000027');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000109','047354109496','권예훈','예금','IBK기업은행',to_date('22/08/14','RR/MM/DD'),879512,'COM-000028');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000110','054237019104','송재숙','출금','신한은행',to_date('23/01/26','RR/MM/DD'),688643,'COM-000029');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000111','054622119744','김승환','예금','신한은행',to_date('20/10/09','RR/MM/DD'),639384,'COM-000030');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000112','173351153891','안승환','예금','NH농협은행',to_date('20/09/14','RR/MM/DD'),518103,'COM-000031');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000113','048410652316','노민준','출금','IBK기업은행',to_date('21/11/22','RR/MM/DD'),325486,'COM-000032');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000114','200277082142','백도준','출금','SC제일은행',to_date('22/05/02','RR/MM/DD'),769901,'COM-000033');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000115','256804342369','하희주','출금','KB국민은행',to_date('20/03/01','RR/MM/DD'),870264,'COM-000034');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000116','048031129071','백은재','예금','IBK기업은행',to_date('23/06/15','RR/MM/DD'),621197,'COM-000035');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000117','170834674718','서용진','예금','NH농협은행',to_date('22/07/07','RR/MM/DD'),755780,'COM-000036');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000118','050880431132','최신우','예금','신한은행',to_date('20/09/08','RR/MM/DD'),548987,'COM-000037');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000119','046370458397','김길현','예금','IBK기업은행',to_date('22/07/07','RR/MM/DD'),577827,'COM-000038');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000120','204022130995','문형철','예금','SC제일은행',to_date('20/01/13','RR/MM/DD'),521992,'COM-000039');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000121','0220459005295','조민주','출금','KDB산업은행',to_date('22/04/28','RR/MM/DD'),276659,'COM-000040');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000122','172699295195','윤서하','예금','NH농협은행',to_date('21/01/25','RR/MM/DD'),648912,'COM-000041');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000123','0056114931337','추주현','예금','우리은행',to_date('22/10/17','RR/MM/DD'),263221,'COM-000042');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000124','259403819984','김용빈','출금','KB국민은행',to_date('22/10/22','RR/MM/DD'),460997,'COM-000043');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000125','0056333935350','김슬아','출금','우리은행',to_date('20/05/08','RR/MM/DD'),743438,'COM-000044');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000126','043363810128','김연준','예금','IBK기업은행',to_date('22/07/06','RR/MM/DD'),764495,'COM-000045');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000127','170165947722','남종현','출금','NH농협은행',to_date('20/07/25','RR/MM/DD'),873304,'COM-000046');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000128','251420189120','노소영','출금','KB국민은행',to_date('21/11/06','RR/MM/DD'),682395,'COM-000047');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000129','050395732305','류정원','출금','신한은행',to_date('22/10/24','RR/MM/DD'),783515,'COM-000048');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000130','048461294899','문영표','예금','IBK기업은행',to_date('22/09/19','RR/MM/DD'),696073,'COM-000049');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000131','252943319282','문용식','예금','KB국민은행',to_date('23/09/04','RR/MM/DD'),39130,'COM-000050');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000132','049880285401','박건배','예금','IBK기업은행',to_date('21/12/07','RR/MM/DD'),821075,'COM-000051');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000133','253541998430','박관우','출금','KB국민은행',to_date('23/03/10','RR/MM/DD'),58369,'COM-000052');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000134','203042676228','박병규','출금','SC제일은행',to_date('22/08/26','RR/MM/DD'),301332,'COM-000053');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000135','043304353095','박상진','예금','IBK기업은행',to_date('23/03/21','RR/MM/DD'),578140,'COM-000054');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000136','051028763673','박성수','예금','신한은행',to_date('22/10/22','RR/MM/DD'),342661,'COM-000055');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000137','0227783539837','박세창','예금','KDB산업은행',to_date('21/07/22','RR/MM/DD'),638619,'COM-000056');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000138','0228584071131','박용오','예금','KDB산업은행',to_date('22/11/01','RR/MM/DD'),399419,'COM-000057');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000139','0056406999824','박정원','출금','우리은행',to_date('21/02/22','RR/MM/DD'),132694,'COM-000058');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000140','200289156354','박태준','출금','SC제일은행',to_date('23/12/24','RR/MM/DD'),350086,'COM-000059');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000141','254956803765','박희영','예금','KB국민은행',to_date('22/03/09','RR/MM/DD'),991418,'COM-000060');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000142','045239640640','방시혁','예금','IBK기업은행',to_date('22/03/09','RR/MM/DD'),996394,'COM-000061');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000143','221006754838','백종원','예금','하나은행',to_date('21/04/04','RR/MM/DD'),335005,'COM-000062');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000144','222258616650','서수길','출금','하나은행',to_date('22/01/10','RR/MM/DD'),398564,'COM-000063');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000145','203581307588','서정진','예금','SC제일은행',to_date('20/07/17','RR/MM/DD'),914957,'COM-000064');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000146','041482807325','성신제','예금','IBK기업은행',to_date('23/08/21','RR/MM/DD'),179043,'COM-000065');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000147','200226135884','손경식','예금','SC제일은행',to_date('21/05/23','RR/MM/DD'),445681,'COM-000066');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000148','207312573880','손길승','출금','SC제일은행',to_date('22/11/19','RR/MM/DD'),993098,'COM-000067');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000149','229665887319','송병준','출금','하나은행',to_date('23/04/05','RR/MM/DD'),377932,'COM-000068');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000150','224494625242','송삼석','출금','하나은행',to_date('21/01/12','RR/MM/DD'),551108,'COM-000069');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000151','0228574275298','송재경','출금','KDB산업은행',to_date('20/10/09','RR/MM/DD'),181502,'COM-000070');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000152','0222601928822','신격호','출금','KDB산업은행',to_date('22/07/21','RR/MM/DD'),487936,'COM-000071');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000153','221741823128','신동환','예금','하나은행',to_date('20/08/29','RR/MM/DD'),9317,'COM-000072');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000154','056908460639','신재호','예금','신한은행',to_date('23/05/29','RR/MM/DD'),691179,'COM-000073');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000155','206042558900','신창섭','출금','SC제일은행',to_date('23/12/03','RR/MM/DD'),733268,'COM-000074');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000156','055312624945','안철수','출금','신한은행',to_date('23/03/30','RR/MM/DD'),260284,'COM-000075');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000157','254110030096','양정모','예금','KB국민은행',to_date('21/05/03','RR/MM/DD'),962733,'COM-000076');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000158','171098754379','양진호','출금','NH농협은행',to_date('20/04/21','RR/MM/DD'),336915,'COM-000077');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000159','172802666632','양필승','예금','NH농협은행',to_date('23/03/21','RR/MM/DD'),674647,'COM-000078');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000160','173614172636','오광현','예금','NH농협은행',to_date('20/12/21','RR/MM/DD'),487855,'COM-000079');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000161','250789023365','오영국','예금','KB국민은행',to_date('22/10/17','RR/MM/DD'),817059,'COM-000080');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000162','179673635095','유명한','출금','NH농협은행',to_date('20/01/31','RR/MM/DD'),737230,'COM-000081');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000163','0220039698603','유일한','예금','KDB산업은행',to_date('22/11/11','RR/MM/DD'),399449,'COM-000082');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000164','257828637852','유재청','출금','KB국민은행',to_date('22/04/04','RR/MM/DD'),443596,'COM-000083');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000165','0051358210472','윤세영','예금','우리은행',to_date('20/03/09','RR/MM/DD'),802221,'COM-000084');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000166','209430718547','윤여을','출금','SC제일은행',to_date('20/07/13','RR/MM/DD'),379549,'COM-000085');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000167','057550334357','윤장섭','출금','신한은행',to_date('20/12/28','RR/MM/DD'),904401,'COM-000086');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000168','257316830090','이건희','출금','KB국민은행',to_date('23/01/02','RR/MM/DD'),408571,'COM-000087');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000169','173183687681','이관래','예금','NH농협은행',to_date('23/05/08','RR/MM/DD'),74457,'COM-000088');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000170','058886846527','이기태','예금','신한은행',to_date('23/08/06','RR/MM/DD'),442945,'COM-000089');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000171','201613545652','이국철','출금','SC제일은행',to_date('22/08/24','RR/MM/DD'),163262,'COM-000090');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000172','057081082654','이규홍','출금','신한은행',to_date('21/03/11','RR/MM/DD'),258358,'COM-000091');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000173','0226609049627','이동찬','출금','KDB산업은행',to_date('21/10/21','RR/MM/DD'),85657,'COM-000092');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000174','170029005428','이상국','출금','NH농협은행',to_date('21/03/18','RR/MM/DD'),847557,'COM-000093');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000175','229732507163','이상은','출금','하나은행',to_date('23/05/03','RR/MM/DD'),936763,'COM-000094');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000176','041570460614','이석희','출금','IBK기업은행',to_date('20/07/13','RR/MM/DD'),733124,'COM-000095');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000177','0228674737270','이수빈','예금','KDB산업은행',to_date('21/03/19','RR/MM/DD'),606519,'COM-000096');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000178','209308795944','이준용','출금','SC제일은행',to_date('22/11/28','RR/MM/DD'),399618,'COM-000097');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000179','0228088267128','이창원','출금','KDB산업은행',to_date('20/07/18','RR/MM/DD'),722921,'COM-000098');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000180','257641474416','임대홍','출금','KB국민은행',to_date('22/10/03','RR/MM/DD'),531090,'COM-000099');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000181','259899499878','임창욱','예금','KB국민은행',to_date('23/07/02','RR/MM/DD'),525257,'COM-000100');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000182','176008685591','장경호','출금','NH농협은행',to_date('21/05/07','RR/MM/DD'),270383,'COM-000101');
Insert into DBP.ACCOUNT (ACCOUNT_ID,ACCOUNT_NO,ACCOUNT_NAME,CLASSIFICA,BRANCH,OPEN_DATE,BALANCE,COMPANY_ID) values ('ACC-000183','171540661283','정몽규','예금','NH농협은행',to_date('23/01/12','RR/MM/DD'),616241,'COM-000102');
--------------------------------------------------------
--  DDL for Index SYS_C008432
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBP"."SYS_C008432" ON "DBP"."ACCOUNT" ("ACCOUNT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger ACC_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "DBP"."ACC_TRG" 
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    :NEW.account_id := 'ACC-' || LPAD(ACC_SEQ.NEXTVAL, 6, '0');
END;

/
ALTER TRIGGER "DBP"."ACC_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "DBP"."ACCOUNT" MODIFY ("ACCOUNT_NO" NOT NULL ENABLE);
  ALTER TABLE "DBP"."ACCOUNT" MODIFY ("CLASSIFICA" NOT NULL ENABLE);
  ALTER TABLE "DBP"."ACCOUNT" MODIFY ("OPEN_DATE" NOT NULL ENABLE);
  ALTER TABLE "DBP"."ACCOUNT" MODIFY ("BALANCE" NOT NULL ENABLE);
  ALTER TABLE "DBP"."ACCOUNT" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "DBP"."ACCOUNT" ADD PRIMARY KEY ("ACCOUNT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "DBP"."ACCOUNT" ADD CONSTRAINT "FK_AC_COM" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "DBP"."COMPANY" ("COMPANY_ID") DISABLE;
