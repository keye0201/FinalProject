DROP SCHEMA IF EXISTS CAMPONG;
CREATE SCHEMA CAMPONG;
USE CAMPONG;

CREATE TABLE `MEMBER` (
	`USER_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`ID`	VARCHAR(30) UNIQUE,
	`PASSWORD`	VARCHAR(100) NOT NULL,
	`ROLE`	VARCHAR(10) DEFAULT 'ROLE_USER' NOT NULL,
	`BIRTHYEAR`	INT NOT NULL,
	`NICKNAME`	VARCHAR(15) NOT NULL,
	`PHONE`	VARCHAR(13),
	`EMAIL1`	VARCHAR(100),
	`EMAIL2`	VARCHAR(100),
	`ADDRESS`	VARCHAR(100),
	`KAKAOTOKEN`	VARCHAR(1000),
	`STATUS`	VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')) NOT NULL,
	`ENROLL_DATE`	DATETIME DEFAULT CURRENT_TIMESTAMP,
	`MODIFY_DATE`	DATETIME DEFAULT CURRENT_TIMESTAMP,
    `PROFILE_IMAGE` VARCHAR(1000) default 0,
    `RENAMED_PROFILEIMAGE` VARCHAR(1000) DEFAULT 0
);
CREATE TABLE `MEETING` (
	`MEET_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`NICKNAME`	VARCHAR(15) NOT NULL,
	`CONTENTID`	INT NOT NULL,
	`TITLE`	VARCHAR(100) NOT NULL,
	`NOWAPES`	INT,
	`APES`	INT NOT NULL,
	`INTRODUCTION`	VARCHAR(1000),
	`STATUS`	VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	`STARTDATE`	VARCHAR(100) NOT NULL,
	`ENDDATE`	VARCHAR(100) NOT NULL,
	`AGERANGE`	VARCHAR(100) NOT NULL,
	`EXPENSE`	VARCHAR(100) NOT NULL,
	`PHONE`	VARCHAR(100) NOT NULL,
    `GENDER` VARCHAR(20) NOT NULL
);

CREATE TABLE `BOARD` (
	`BOARD_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`USER_NO`	INT	NOT NULL,
	`TITLE`	VARCHAR(100) NOT NULL,
	`CONTENT`	VARCHAR(2000) NOT NULL,
	`ORIGINAL_FILENAME`	VARCHAR(1000),
	`RENAME_FILENAME`	VARCHAR(1000),
	`STATUS`	VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	`CREATE_DATE`	DATETIME  DEFAULT CURRENT_TIMESTAMP,
	`READCOUNT`	INT DEFAULT 0,
    `TYPE` VARCHAR(10) NOT NULL
);
-- 타입에 들어갈 값 = NOTICE, FREE, QUESTION 

CREATE TABLE `BOARD_REPLY` (
	`REPLY_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`BOARD_NO`	INT	NOT NULL,
	`USER_NO`	INT	NOT NULL,
	`CONTENT`	VARCHAR(500) NOT NULL,
	`STATUS`	VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
	`CREATE_DATE`	DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `CAMPING_CONTENTS_REPLY` (
	`REPLY_NO`	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`CONTENTID`	INT NOT NULL,
	`USER_NO`	INT NOT NULL,
	`CONTENT`	VARCHAR(2000) NOT NULL,
    `STATUS` VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
	`ORIGINAL_FILENAME`	VARCHAR(1000),
	`RENAME_FILENAME`	VARCHAR(1000),
	`CREATE_DATE`	DATETIME  DEFAULT CURRENT_TIMESTAMP,
	`NICKNAME`	VARCHAR(15),
    `PROFILE_IMAGE` VARCHAR(1000) default 0 references MEMBER(PROFILE_IMAGE),
    `RENAMED_PROFILEIMAGE` VARCHAR(1000) DEFAULT 0 references MEMBER(RENAMED_PROFILEIMAGE)
);
select * from camping_contents_reply;
SELECT DISTINCT M.USER_NO, M.*, (SELECT COUNT(*) from CAMPING_CONTENTS_REPLY CR where CR.USER_NO = M.USER_NO) AS COUNT
FROM MEMBER M
LEFT OUTER JOIN CAMPING_CONTENTS_REPLY CR ON CR.USER_NO = M.USER_NO;

		SELECT * FROM CAMPING_CONTENTS_REPLY ORDER BY REPLY_NO ASC;

		SELECT *  FROM
		CAMPING_CONTENTS_REPLY WHERE USER_NO=2 AND REPLY_NO =(SELECT MAX(REPLY_NO) FROM CAMPING_CONTENTS_REPLY);

CREATE TABLE `CAMPING_CONTENTS` (
	`CONTENTID`	INT PRIMARY KEY NOT NULL,
	`FACLTNM`	VARCHAR(100) NOT NULL,
	`LINEINTRO`	VARCHAR(1000),
	`INTRO`	VARCHAR(3000),
	`MANAGESTTUS`	VARCHAR(100),
	`FEATURENM`	VARCHAR(1000),
	`INDUTY`	VARCHAR(1000),
	`LCTCL`	VARCHAR(100),
	`DONM`	VARCHAR(100),
	`SIGUNGUNM`	VARCHAR(100),
	`ZIPCODE`	VARCHAR(100),
	`ADDR1`	VARCHAR(100),
	`ADDR2`	VARCHAR(100),
	`MAPX`	DOUBLE,
	`MAPY`	DOUBLE,
	`DIRECTION`	VARCHAR(1000),
	`TEL`	VARCHAR(100),
	`HOMEPAGE`	VARCHAR(1000),
	`RESVECL`	VARCHAR(1000),
	`GNRLSITECO`	VARCHAR(100),
	`AUTOSITECO`	VARCHAR(100),
	`GLAMPSITECO`	VARCHAR(100),
	`CARAVSITECO`	VARCHAR(100),
	`INDVDLCARAVSITECO`	VARCHAR(100),
	`TOOLTIP`	VARCHAR(1000),
	`GLAMPINNERFCLTY`	VARCHAR(1000),
	`CARAVINNERFCLTY`	VARCHAR(1000),
	`OPERDECL`	VARCHAR(100),
	`TOILETCO`	VARCHAR(100),
	`SWRMCO`	VARCHAR(100),
	`WTRPLCO`	VARCHAR(100),
	`BRAZIERCL`	VARCHAR(1000),
	`SBRSCL`	VARCHAR(100),
	`POSBLFCLTYCL`	VARCHAR(100),
	`THEMAENVRNCL`	VARCHAR(100),
	`EQPMNLENDCL`	VARCHAR(100),
	`ANIMALCMGCL`	VARCHAR(100),
	`FIRSTIMAGEURL`	VARCHAR(1000),
    `READCOUNT` INT DEFAULT 0,
    `REVIEWCOUNT` INT DEFAULT 0,
    `BOOKMARKCOUNT` INT DEFAULT 0
);

CREATE TABLE `FESTIVAL_CONTENTS` (
	`CONTENTID`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`CONTENTTYPEID`	VARCHAR(10) NOT NULL,
	`TITLE`	VARCHAR(100),
	`EVENTSTARTDATE`	VARCHAR(100),
	`EVENTENDDATE`	VARCHAR(100),
	`AREACODE`	VARCHAR(100),
    `MAPX`	VARCHAR(100),
	`MAPY`	VARCHAR(100),
	`FIRSTIMAGE`	VARCHAR(1000) NOT NULL,
	`FIRSTIMAGE2`	VARCHAR(1000),
	`ADDR1`	VARCHAR(1000) NOT NULL
);

CREATE TABLE `BOOKMARK` (
	USER_NO	INT NOT NULL,
	CONTENTID	INT NOT NULL,
    PRIMARY KEY (USER_NO, CONTENTID),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO),
	FOREIGN KEY (CONTENTID) REFERENCES CAMPING_CONTENTS(CONTENTID)
);

CREATE TABLE `SHOP` (
	`PNO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`TITLE`	VARCHAR(1000),
	`LINK`	VARCHAR(1000),
	`IMAGE`	VARCHAR(1000),
	`LPRICE`	INT,
	`HPRICE`	INT,
	`MALLNAME`	VARCHAR(1000),
	`PRODUCTID`	VARCHAR(1000),
	`PRODUCTTYPE`	VARCHAR(1000),
	`MAKER`	VARCHAR(1000),
	`BRAND`	VARCHAR(1000),
	`CATEGORY1`	VARCHAR(1000),
	`CATEGORY2`	VARCHAR(1000),
	`CATEGORY3`	VARCHAR(1000),
	`CATEGORY4`	VARCHAR(1000)
);

CREATE TABLE `RENT` (
	`RENT_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`ENTRPSNM`	VARCHAR(100) NOT NULL,
	`RDNMADR`	VARCHAR(100) NOT NULL,
	`LATITUDE`	VARCHAR(100),
	`LONGITUDE`	VARCHAR(100),
	`PHONENUMBER`	VARCHAR(100),
	`HOMEPAGEURL`	VARCHAR(1000)
);


CREATE TABLE `RECIPE` (
	`RECIPE_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`CATEGORY1`	VARCHAR(100) NOT NULL,
	`CATEGORY2`	VARCHAR(100),
	`TITLE`	VARCHAR(100),
	`CONTENT`	VARCHAR(2000),
    `URL` VARCHAR(1000),
    `IMAGEURL` VARCHAR(1000)
);

CREATE TABLE `MEETINGMEMBER` (
	`MEET_NO`	INT,
	`USER_NO`	INT,
    PRIMARY KEY (MEET_NO, USER_NO),
    FOREIGN KEY (MEET_NO) REFERENCES MEETING(MEET_NO),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

CREATE TABLE `FISHING` (
	`FISHING_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`FISHING_NM`	VARCHAR(1000) NOT NULL,
	`ADDR`	VARCHAR(1000) NOT NULL,
	`LATITUDE`	VARCHAR(1000),
	`LONGITUDE`	VARCHAR(1000),
	`USECHARGE`	VARCHAR(1000),
	`PHONE`	VARCHAR(1000),
	`SPECIES`	VARCHAR(1000)
);

CREATE TABLE `MOUNTAINISLAND` (
	`CONTENTID`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`TITLE`	VARCHAR(100) NOT NULL,
	`CAT3`	VARCHAR(100) NOT NULL,
	`FIRSTIMAGE`	VARCHAR(1000),
	`MAPX`	DOUBLE,
	`MAPY`	DOUBLE,
	`ADDR1`	VARCHAR(1000),
	`ADDR2`	VARCHAR(1000),
	`READCOUNT`	INT DEFAULT 0
);

CREATE TABLE `BUS_TICKET` (
	`TICKET_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`USER_NO`	INT NOT NULL,
	`ARRPLACENM`	VARCHAR(100), -- 출발위치
	`ARRPLANDTIME`	VARCHAR(100), -- 출발시간
	`CHARGE`	VARCHAR(100), -- 요금
    `DEPPLACENM`	VARCHAR(100), -- 도착위치
	`DEPPLANDTIME`	VARCHAR(100), -- 도착시간
	`GRADENM`	VARCHAR(100), -- 등급
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

CREATE TABLE `TRAIN_TICKET` (
	`TICKET_NO`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`USER_NO`	INT NOT NULL,
	`ARRPLACENM`	VARCHAR(100), -- 출발위치
	`ARRPLANDTIME`	VARCHAR(100), -- 출발시간
	`CHARGE`	VARCHAR(100), -- 요금
    `DEPPLACENM`	VARCHAR(100), -- 도착위치
	`DEPPLANDTIME`	VARCHAR(100), -- 도착시간
	`GRADENM`	VARCHAR(100), -- 등급
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

CREATE TABLE `FISHING_REPLY` (
	`REPLY_NO`	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`FISHING_NO`	INT NOT NULL,
	`USER_NO`	INT NOT NULL,
	`CONTENT`	VARCHAR(2000) NOT NULL,
    `STATUS` VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
	`CREATE_DATE`	DATETIME  DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `MOUNTAINISLAND_REPLY` (
	`REPLY_NO`	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`CONTENTID`	INT NOT NULL,
	`USER_NO`	INT NOT NULL,
	`CONTENT`	VARCHAR(2000) NOT NULL,
    `STATUS` VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
	`CREATE_DATE`	DATETIME  DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `BASKET` (
	`USER_NO` INT NOT NULL,
    `PNO` INT NOT NULL,
	PRIMARY KEY (`USER_NO`,`PNO`),
    FOREIGN KEY (PNO) REFERENCES SHOP(PNO),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);


ALTER TABLE `CAMPING_CONTENTS_REPLY` ADD CONSTRAINT `FK_CAMPING_CONTENTS_TO_CAMPING_CONTENTS_REPLY_1` FOREIGN KEY (
	`CONTENTID`
)
REFERENCES `CAMPING_CONTENTS` (
	`CONTENTID`
);


ALTER TABLE `MEETINGMEMBER` ADD CONSTRAINT `FK_MEETING_TO_MEETINGMEMBER_1` FOREIGN KEY (
	`MEET_NO`
)
REFERENCES `MEETING` (
	`MEET_NO`
);

ALTER TABLE `MEETINGMEMBER` ADD CONSTRAINT `FK_MEMBER_TO_MEETINGMEMBER_1` FOREIGN KEY (
	`USER_NO`
)
REFERENCES `MEMBER` (
	`USER_NO`
);



insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'착한붕어 낚시카페','서울특별시 종로구 대학로8가길 52, 지하1층 (동숭동)','37.582964','127.002648','1시간(성인:10천원, 초,중,고 학생:9천원)','02-741-1733','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'붕어의 신','서울특별시 양천구 신월로 321','37.5217038','126.8565155','1시간(남 10천, 여9천, 커플18천, 청소년 7천, 아동 5천)  1시간 추가시 요금 발생','02-2603-2266','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가자실내낚시터','서울특별시 양천구 지양로 34','37.519435','126.8363231','1시간(남 10천, 여10천, 아동 8천)','02-2691-2733','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'입큰붕어낚시카페','서울특별시 은평구 은평로 101, 지하1층 (응암동)','','','10,000원/시간','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'잉어킹낚시카페','서울특별시 은평구 연서로26길 8, 지하1층 (대조동)','','','10,000원/시간','','민물고기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'제일낚시터','부산광역시 강서구 낙동북로73번가길 200-5 (강동동)','35.22365536','128.940412','10,000원','051-972-6782','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'천성낚시터','부산광역시 강서구 거가대로 2571 (천성동)','35.02301425','128.8095884','미정','051-972-3727','해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동선낚시터','부산광역시 강서구 동선길 107 (동선동)','35.05283693','128.8324001','미정','051-973-0688','해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동삼어촌계 유어장 낚시터','부산광역시 영도구 하리해안길 17-5','35.06978643','129.0812768','성인 2만원, 어린이 1만원','051-405-0207','도다리, 볼락류 등 기타해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대원관광농원','부산광역시 기장군 기장읍 내리길 57, 대원관광농원','35.211047','129.2039','10,000원','051-721-5862','잉어,붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'이오피쉬','부산광역시 기장군 기장읍 대변로 153, 이오피쉬','35.2257','129.2288','70,000원','','우럭, 참돔 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용소사계절','부산광역시 기장군 장안읍 기장대로 1665-73, 용소사계절','35.34273','129.24519','10,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'부산실내바다낚시터','부산광역시 북구 효열로 275, 지하1층 (금곡동)','35.26720059','129.0183491','30,000원','051-362-3338','바다랍스터,능성어,돌돔,참돔 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'약산낚시터','대구광역시 달성군 논공읍 약산덧재길 159','35.74332817','128.4354565','15000','053-615-7450','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문양낚시터','대구광역시 달성군 다사읍 장귀미길 123','35.74332817','128.4354565','15000','053-581-0331','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'옥포낚시터','대구광역시 달성군 옥포읍 김흥리 408','35.747717','128.4924402','15000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가곡낚시터','대구광역시 달성군 하빈면 무등리 274','35.92279194','128.4667287','15000','053-582-5483','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도채낚시터','대구광역시 달성군 하빈면 묘동3길 122-60','35.91802965','128.4215712','15000','053-583-0501','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대평낚시터','대구광역시 달성군 하빈면 하빈로 832','35.93002896','128.4692446','15000','053-581-2220','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동화낚시터','대구광역시 북구 동변로 24길 106(동변동)','35.92974','128.603563','10,000원','053-955-8527','잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'무태낚시터','대구광역시 북구 연경동 570-14, 570-35','35.935017','128.608374','10,000원','053-951-1177','잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아빠어디가바다낚시','대구광역시 북구 칠곡중앙대로 447(관음동)','35.5609','128.3255','25,000원','','참돔+우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'눈큰실내낚시터','대구광역시 북구 태전로 57 (태전동)','35.9254','128.54324','10,000원','','붕어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'㈜정성레저','인천광역시 중구 백운로186번길 140-1 (중산동)','37.51420751','126.5436932','70,000원(성인남성기준)','032-751-1515','돔, 점성어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'포인트실내낚시카페낚시터','인천광역시 중구 우현로 63, 몽벨,대한애경미용학원,이용화이비인후과 (내동)','37.4728317','126.6289879','10,000(시간당/성인남성기준)','032-762-3494','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'(주)영종레저','인천광역시 중구 영종순환로 279-20, 만정낚시터 (중산동)','37.5154665','126.5499277','60,000원(성인남성기준)','032-747-1133','돔+점성어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'짱실내바다낚시터','인천광역시 중구 서해대로417번길 2, 재향군인회관 (신흥동2가)','37.46419602','126.6330236','60,000원(성인남성기준)','070-7543-3213','돔+조피볼락+농어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대동실내낚시터','인천광역시 서구 심곡로 133, 대동아파트 지하1층 (심곡동)','','','','032-5600-8904','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'두밀촌 낚시터','인천광역시 서구 두밀로 91 (대곡동)','','','1일 25,000원','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'인천 락 실내바다낚시터','인천광역시 서구 한서로 36-10 (백석동)','','','2시간 33,000원 4시간 44,000원 10시간 77,000원','032-563-7949','활바다가재');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'놀이터 실내낚시터','인천광역시 서구 가정로 208, 지하 1층 (석남동)','','','1시간 남 11,000원          여 10,000원  10분 초과시 요금 부과','','메기, 향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가현산낚시터','인천광역시 서구 가현산로23번길 87 (마전동)','','','1일 25,000원','032-563-4637','잉어 메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낭만물고기','인천광역시 서구 검단로 492, 지하 1층 (마전동)','','','대인1시간 10,000원 여성 1시간 9,000원','050-7140-5125','메기, 잉어, 향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'내동저수지낚시터','인천광역시 옹진군 영흥면 내동로 100-15','','','24시간 30,000원','032-884-8282','붕어, 잉어, 메기, 가물치 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용담낚시터','인천광역시 옹진군 영흥면 영흥남로9번길 309, 용담어촌계축양장','','','12시간 60,000원','032-886-8969','돔류, 병어,  다금바리, 민어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'선재낚시터','인천광역시 옹진군 영흥면 선재로265번길 103, 선재고물상','','','12시간 77,000원 2시간 45,000원 방가로 이용 40,000원','','돔류, 농어, 우럭, 홍민어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'영흥바다낚시터','인천광역시 옹진군 영흥면 영흥로176번길 21, 낚시터','','','20시간 남성 77,000원 20시간 여성 55,000원 20시간 초등학생 55,000원','032-882-7780','농어, 능성어, 우럭, 돔류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'선재 낚시공원 낚시터','인천광역시 옹진군 영흥면 선재로226번길 164','','','12시간 남성 100,000원 12시간 여성 80,000원 12시간 초중생 70,000원','032-710-4340','돔류, 바리류, 민어, 병어, 농어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어부바낚시까페','인천광역시 계양구 경명대로 1057, 지층 (계산동)','37.54391304197','126.7245687570','10,000원','','잉어, 붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'DMZ실내낚시터','인천광역시 계양구 경명대로 1056, 지층 1호 (계산동)','37.5432864094','126.724138055','10,000원','070-4118-0702','잉어, 붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'놀러와실내낚시터','인천광역시 남동구 백범로 203, 지층 102호(만수동)','37.45945344','126.7261954','10000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'슈퍼붕 낚시카페','인천광역시 남동구 백범로 417, 지하1층(간석동)','37.4672684','126.7025735','10000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'킹콩 실내낚시터','인천광역시 남동구 구월로 291, 지하1층(만수동)','37.4558425','126.7207845','10000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'얼빵실내 낚시터','인천광역시 남동구 인주대로 580, 지하 2층(구월동)','37.4497578','126.6991131','10000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'또와또 실내낚시터','인천광역시 남동구 남동대로 881 지하층(간석동)','37.4656135','126.707077','10000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남촌낚시터','인천광역시 남동구 남촌로 67번길 60-3(남촌동)','37.4266899','126.7128884','10000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'소래바다낚시터','인천광역시 남동구 소래로 154번길 25-40(논현동)','37.40682335','126.7405419','10000','','랍스터');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도시어부낚시카페','인천광역시 미추홀구 주안로104번길 24, 지하2층제2호(주안동)','37.46282174','126.6809926','10,000/시간당','032-442-8678','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'파도실내바다낚시터','인천광역시 미추홀구 인주대로 438, 지하층(주안동)','37.45074476','126.6853843','11,000/시간당','032-889-2020','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'주주실내낚시클럽','인천광역시 미추홀구 주안로 113, 덕진빌딩 지하2층 (주안동)','37.46425733','126.6822339','10,000/시간당','032-437-1837','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황산초지사계절바다낚시터','인천광역시 강화군 길상면','37.62125051','126.5347876','60000','','우럭+광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어류정낚시터','인천광역시 강화군 삼산면','37.66107251','126.336902','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'강화선두바다낚시터','인천광역시 강화군 길상면','37.60086755','126.4935967','60000','','우럭+광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'강화바다낚시터','인천광역시 강화군 길상면','37.60690383','126.5168784','60000','','우럭+광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'난정낚시터','인천광역시 강화군 교동면','37.78689753','126.2320705','15000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'흥왕낚시터','인천광역시 강화군 화도면','37.59560307','126.4203356','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'길상낚시터','인천광역시 강화군 길상면','37.62515984','126.5012775','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'선두포낚시터','인천광역시 강화군 길상면','37.634462','126.464612','10000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하리낚시터','인천광역시 강화군 삼산면','37.7404128','126.2899256','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서검낚시터','인천광역시 강화군 삼산면','37.724996','126.226164','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동검낚시터','인천광역시 강화군 길상면','37.58768059','126.5222735','60000','','우럭+광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양오낚시터','인천광역시 강화군 송해면','37.80023879','126.4474212','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고구낚시터','인천광역시 강화군 교동면','37.79635','126.292765','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'항포낚시터','인천광역시 강화군 삼산면','37.70636707','126.2840291','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양사낚시터','인천광역시 강화군 양사면','37.80536372','126.423815','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신선지낚시터','인천광역시 강화군 내가면','37.72045498','126.4152577','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'길정낚시터','인천광역시 강화군 양도면','37.66259233','126.467195','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오류내낚시터','인천광역시 강화군 송해면','37.75926215','126.4520722','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'국화낚시터','인천광역시 강화군 강화읍','37.74460253','126.4619292','75000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'내가낚시터','인천광역시 강화군 내가면','37.72518794','126.3936217','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황청낚시터','인천광역시 강화군 내가면','37.71508509','126.3638447','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'인산낚시터','인천광역시 강화군 양도면 중앙로787번길 8-2','37.69854279','126.4312672','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'피싱카페낚시터','광주광역시 동구 서석로85번길 8-13, 지하1층(대의동)','35.1503293324','126.9205758578','10,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'붕어의 신 실내낚시터','광주광역시 동구 중앙로 157(호남동)','35.1482834401','126.9129881220','10,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상무낚시터','광주광역시 서구 유덕로141번길 31-1','35.16357724','126.8386542','1일 10,000원','062-373-0558','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'더뻐끔(실내카페)','광주광역시 광산구 하남대로 116 (하남동)','35.179','126.806','입장료 10,000원','','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신가리낚시터','광주광역시 광산구 풍영철길로 190-23 (신가동)','35.172','126.828','어른 18,000원(2기간 기준)어린이 13,000원(2기간 기준)','062-956-7752','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'물만난고기','대전 중구 대종로 488번길 39, 지하(은행동)','36.329039','127.42833','10,000원','','붕어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우명실내낚시터','대전광역시 서구 우명길 148(우명동)','36.2287571','127.2935111','15,000원','042-841-9545','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'Love낚시카페','대전광역시 서구 관저로 160, 지하1층','36.29872121','127.3395894','10,000원','042-544-4222','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송정유료낚시터','울산광역시 서생면 해맞이로 1331','35.36690','129.35324','가두리낚시 : 66,000원 생활 낚시 : 33,000원 체험낚시 : 10,000원 *초등학생 50%할인','052-239-5900','우럭, 노래미, 농어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원실내낚시터','울산광역시 울주군 온산읍 신온8길 20-6','35.4292604','129.3109347','25,000원(1시간), 30,000(2시간), 35,000원(3시간), 60,000원(6시간)','052-239-2211','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'당사해양낚시공원','울산광역시 북구 용바위1길 58 (당사동)','35.581079','129.455723','1. 낚   시 : (성인)10,000원, (청소년) 5,000원 2. 입장료 : (성인) 1,000원, (청소년) 500원','052-282-1116','볼락, 우럭, 쏨뱅이, 전갱이 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해적바다실내낚시터','울산광역시 동구 화잠로 105, 지하 1층 (방어동)','35.47849091','129.413984','1시간 25,000원 2시간 35,000원 3시간 40,000원 6시간 65,000원','052-975-1136','참돔, 점성어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조치원낚시터','세종시 전동면 전동로 245','36.672891','127.269954','0','044-868-6662','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'잡아잡아낚시카페','세종시 조치원읍 새내16길 28','36.604395','127.298527','0','044-864-9463','기타');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용천농장낚시터','세종시 금남면 황토고개길 80-10','36.453638','127.233773','0','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금곡낚시터','경기도 파주시 법원읍 술이홀로1372번길 347','37.8926782','126.8926516','30000','031-958-2503','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'썸피싱카페낚시터','경기도 파주시 금정18길 20','37.76093302','126.7749398','20000','031-942-1385','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자유로레저낚시터','경기도 파주시 탄현면 엘지로717번길 2-114','37.83698018','126.729909','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'뚜루실내낚시터','경기도 파주시 번영로 20','37.75803169','126.7710767','20000','070-7763-2222','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'임진낚시캠핑','경기도 파주시 문산읍 임진나루길 178-68','37.88809783','126.7928559','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'광탄낚시터','경기도 파주시 광탄면 부흥로 194-24','37.80224735','126.8674385','20000','031-941-8513','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'발랑낚시터','경기도 파주시 광탄면 부흥로 596','37.80606286','126.9080434','20000','031-941-8675','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'눈삔물고기낚시터','경기도 파주시 문산읍 당동2로 5','37.86792723','126.7847069','20000','031-954-2172','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'작은연못낚시터','경기도 파주시 광탄면 방축안길 39-5','37.81228194','126.8594211','20000','031-941-0042','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'감악산낚시터','경기도 파주시 적성면 감골길 48','37.91216702','126.9521886','20000','031-958-6116','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'직천낚시터','경기도 파주시 법원읍 만월로 537-29','37.89621228','126.9233527','20000','031-958-1954','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백경수낚시터','경기도 파주시 광탄면 부흥로 422','37.80380225','126.8939795','30000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사랑낚는어부가든낚시터','경기도 파주시 법원읍 보광로 1663','37.82400119','126.86844','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산골낚시터','경기도 파주시 법원읍 만월로613번길 237','37.89033167','126.9140276','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하마낚시터','경기도 파주시 적성면 국사로 297','37.96113004','126.8696614','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문화레저낚시터','경기도 파주시 광탄면 혜음로 1300-45','37.79683114','126.8497223','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매일낚시터','경기도 파주시 광탄면 보광로 898-17','37.77641838','126.8843431','20000','','메기,붕어,잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'말봉바다낚시터','경기도 안산시 단원구 부흥로 387-9, 말봉바다낚시터 (대부남동)','37.21178314744','126.6119165824','성인남성(12시간):77,000 성인여성(남성동반시에만적용):55,000 초,중생(남성동반시에만적용):55,000','032-886-1677','우럭+참돔+농어+점성어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어심바다낚시터','경기도 안산시 단원구 잘푸리길 109, 어심바다낚시터 (대부남동)','37.23606522264','126.5658309419','1일 77000원','032-886-7313','참돔+감성돔+우럭+도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서울바다낚시터','경기도 안산시 단원구 구봉타운길 34, 서울바다낚시터 (대부북동)','37.28096932837','126.5529940947','1일 70,000원','032-884-4488','우럭+참돔+농어+점성어등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해솔바다낚시터','경기도 안산시 단원구 구봉길 152, 해솔바다낚시터 (대부북동)','37.27837617475','126.5542115215','1일 70,000원','032-880-9865','우럭+참돔+점성어+농어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우리실내낚시터','경기도 안산시 단원구 화랑로 28, 우리실내바다낚시터 지하1층 (원곡동)','37.33211660123','126.7960887311','1일 30,000원','031-494-9577','잉어+향어+붕어+메기 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'k3바다낚시터','경기도 안산시 단원구 작은상재미길 86, k3바다낚시터 (대부동동)','37.25218005302','126.6139694374','1일 77,000원','032-886-5225','우럭+참돔+농어+점성어등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'등대바다낚시터','경기도 안산시 단원구 금당구지길 91, 등대바다낚시터 (대부남동)','37.23054271235','126.5905620978','1일 77,000원','032-881-1342','우럭+점성어+농어+참동 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'k1한국바다낚시터','경기도 안산시 단원구 작은상재미길 100, k1한국바다낚시터 (대부동동)','37.23095285216','126.6070118975','고등학생 이상 성인남성77,000 성인여성66,000 커플132,000 초,중학생55,000 (12시간 연장66,000)','032-887-1555','우럭+참돔+농어+점성어등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'북동낚시터','경기도 안산시 단원구 뻐꾹산길 98, 북동낚시터 (대부북동)','37.25690318005','126.5810408128','1일 30000','032-882-9033','붕어+잉어등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조부장바다낚시터','경기도 안산시 단원구 구봉길 55, 조부장바다낚시터 (대부북동)','37.27139676480','126.5618898925','1일 70,000원+4시간 30,000','032-880-9778','우럭+돔종류+광어+랍스터 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대부도바다낚시터','경기도 안산시 단원구 구봉타운길 22, 대부도바다낚시터 (대부북동)','37.27772840717','126.5516876135','1일 70,000원','032-886-4130','우럭+참돔+농어+점성어등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수암낚시터','경기도 안산시 상록구 지장골길 51-18, 수암낚시터 (수암동)','37.37232030674','126.8808463725','1일 30,000','031-480-6886','향어+잉어+메기 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'독도바다낚시터','경기도 안산시 단원구 새방죽길 165, 독도바다낚시터 (대부북동)','37.23985943104','126.5660485595','1일 75,000원','032-884-1111','우럭+참돔+점성어+농어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하늘바다낚시터','경기도 안산시 단원구 작은상재미길 99, 하늘바다낚시터 (대부동동)','37.23338146276','126.6077971206','1일 70,000원','032-888-6662','우럭+참돔+점성어+농어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'샘터낚시터','경기도 광명시 장절로 96-33','37.4313547','126.8571543','25,000원','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아방리낚시터','경기도 광명시 범안로 740-12','37.4425983','126.856398','30,000원','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'연곡낚시터','경기도 양주시 백석읍 연곡로182번길 100','37.81700422','126.9595731','60,000','031-879-5311','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'못말낚시터','경기도 양주시 남면 현석로 781-14','37.85149836','126.9821002','25,000','031-855-6633','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용암낚시터','경기도 양주시 은현면 용암리 346-2','37.85284499','127.0500455','15,000','031-858-4797','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'살구골낚시터','경기도 양주시 은현면 도하리 396','37.84001046','127.0042246','25,000','031-868-2683','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신암낚시터','경기도 양주시 남면 감악산로 514번길 365','37.91971034','126.9640752','25,000','031-863-5882','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남방낚시터','경기도 양주시 양주산성로 280-7','37.77576379','127.0180123','25,000','031-845-4855','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'효촌낚시터','경기도 양주시 광적면 효촌리 337-1','37.87937325','126.9561064','15,000','031-871-1323','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉암낚시터','경기도 양주시 남면 양연로173번길 82-28','37.9234617','126.994659','25,000','031-863-7679','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원당','경기도 양주시 남면 황방리 377-1','37.92235363','126.9869436','25,000','031-865-5206','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'칠봉산','경기도 양주시 천보산로 201','37.85687137','127.0985831','30,000','031-866-1577','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'광사','경기도 양주시 부흥로 1864-40','37.7885519','127.0709504','25,000','031-847-0520','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동산','경기도 양주시 남면 감악산로514번길 54-20','37.90829399','126.9653998','10,000','031-863-0002','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장자원','경기도 양주시 장흥면 일영로502번길 2-105','37.68574374','126.9285218','15,000','031-855-7244','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은현피싱타운','경기도 양주시 은현면 그루고개로490번길 49-27','37.85146262','127.0157938','25,000','031-863-8935','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼하','경기도 양주시 장흥면 삼하리 198-1,3,4','37.67330775','126.9088062','20,000','031-871-0047','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송추','경기도 양주시 장흥면 호국로 586-24','37.7177652','126.9792169','10,000','031-826-0529','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'일영','경기도 양주시 장흥면 일영리 572-4','37.70596996','126.9315963','30,000','031-855-5520','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원동낚시터','경기도 오산시 원동 6-1','37.144601','127.091246','1일 30,000원','031-373-5982','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼미낚시터','경기도 오산시 외삼미로 30(외삼미동)','37.19051','127.054368','1일 20,000원','031-372-1314','붕어,잉어,향어,메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수원 락 실내바다 낚시터','경기도 오산시 삼미로47번길 24(내삼미동)','37.1771766','127.066976','2시간 33,000원','031-372-4132','돔+매가리+민어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고골낚시터','경기도 하남시 춘궁동 451-11 외 11필지 (춘궁저수지)','37.52019','127.18666','15,000원','031-794-8584','붕어,잉어,향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼합낚시터','경기도 여주시 점동로650','37.199815','127.726804','1일 20000원','031-886-6767','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어우실낚시터','경기도 여주시 어우실길 65','37.151903','127.6579298','1일 20000원','031-882-6500','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신근낚시터','경기도 여주시 흥천면 신율로 36','37.308914','127.557689','1일 10000원','031-883-0641','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가남낚시터','경기도 여주시 가남읍 건은로 82-67','37.194979','127.544009','1일 30000원','031-882-1673','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오산낚시터','경기도 여주시 가남읍 양화로 154-23','37.2355128','127.559427','1일 10000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'관광농원낚시터','경기도 여주시 북내면 중암2길 19-22','37.356465','127.710493','1일 30000원','031-883-9499','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자일낚시터','경기도 의정부시 호국로1860번길 79','37.771560','127.105302','20,000','','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가자실내낚시터','경기도 의정부시 시민로 117(의정부동)','37.738678','127.048320','10,000(1시간기준)','','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'또또와 실내낚시카페','경기도 의정부시 추동로19번길 7','37.743652','127.057607','10,000(1시간기준)','','잉어류+메기류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월곡낚시터','경기도 평택시 관동길 20','37.021253','127.130075','1일 10000원 (평일, 휴일)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고잔낚시터','경기도 평택시 청북읍 고잔리 1-1','37.067541','126.909627','1일 20,000원 (평일) 1일 25,000원 (휴일)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'울성낚시터','경기도 평택시 울성길 237-20','37.016293','127.05912','1일 15000원 (평일, 휴일)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동막낚시터','경기도 평택시 동막길 127','37.074396','127.096081','1일 10000원 (평일, 휴일)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고현낚시터','경기도 평택시 고현길 38-48','37.130793','127.096181','1일 15,000원 (08:00~18:00) 1일 10,000원 (19:00~23:00)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조씨낚시터','경기도 평택시 덕목5길 117-1','36.9542','126.969356','1일 20000원 (평일, 휴일)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'함박골낚시터','경기도 평택시 서탄로 492-30','37.123234','127.0214','1일 30,000원 (주말, 공휴일) 1일 20,000원 (평일)','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낚시 훈련소','경기도 평택시 문화촌로 9','36.996613','127.113874','1시간 10,000원 (성인) 1시간 10,000원 (중고생) 1시간  8,000원 (초등생)','','잉어, 향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'안중락실내바다낚시터','경기도 평택시 안중읍 서동대로 1758','36.0000','126.0000','3시간 44,000원 6시간 66,000원 8시간 77,000원','','우럭, 강도다리, 감성돔 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'피쉬실내바다낚시터','경기도 평택시 포승읍 고렴1길 35','37.0000','126.0000','[주간] 3시간 : 44,000원 6시간 : 66,000원 [야간] 4시간 : 44,000원 7시간 : 66,000원','','우럭, 광어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도장골낚시터','가평군 조종면 대보간선로399번길 63-9','37.8062372554','127.3727358663','30000','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상천낚시터','경기 가평군 청평면 상지로 225','37.7683218323','127.4746920746','30000','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'두밀리낚시터','가평읍 태봉두밀로 305','37.8155118759','127.4659182551','20000','','붕어+잉어+향어+송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산유낚시터','가평읍 분자골로 22','37.7575190504','127.5095292322','30000','','향어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'폭포낚시터','조종면 명지산로 51-183','37.8836399538','127.3599821843','30000','','향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'설악낚시터','경기 가평군 설악면 자잠로23번길 67-55','37.6818601967','127.4829748957','30000','','향어+메기+븡아+송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가평낚시터','가평읍 가화로 440-95','37.8555319098','127.5095515809','30000','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산수낚시터','경기 가평군 북면 논남기길 19-3','37.9677603','127.4586995','30000','','송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'부림낚시터(부림저수지)','경기도 양평군 개군면 불곡덕고갯길 134-66','37.43924011','127.5477091','30000','031-771-7409','잉어+ 상어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수곡낚시터(어은저수지)','경기도 양평군 지평면 어은길 71','37.44059045','127.5999993','30000','031-771-1233','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월산낚시터(월산저수지)','경기도 양평군 지평면 월산리 525','37.47269801','127.6511908','25000','031-774-4797','상어+ 잉어+ 붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백동낚시터(백동저수지)','경기도 양평군 단월면 덕수리 20','37.56063061','127.6867879','30000','031-772-7750','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린낚시터(전수저수지)','경기도 양평군 강하면 수대길 110','37.48031275','127.4263199','25000','031-774-2650','붕어+ 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신애낚시터','경기도 양평군 양평읍 새만이길 86','37.51020947','127.4959266','20000','031-775-5211','향어+ 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오빈낚시터(오빈저수지)','경기도 양평군 양평읍 덕평리 414-8','37.50612798','127.4898977','30000','031-772-1612','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대석낚시터(대석저수지)','경기도 양평군 강상면 강남로 1811','37.4269477','127.4777729','30000','031-771-0510','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'향리낚시터(향리저수지)','경기도 양평군 개군면 아랫상골길 45','37.43479102','127.5667369','30000','031-772-8681','붕어+ 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'세월낚시터','경기도 양평군 강상면 세월리 586-2','37.44519278','127.4805659','30000','031-774-5661','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대명낚시터','경기도 양평군 단월면 소부록길 35','37.56866935','127.6741137','30000','','상어+ 메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'피쉬랜드낚시터','경기도 양평군 강하면 강하2로 367','37.46486201','127.4205487','30000','','메기+ 철갑상어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고재낚시터','경기도 양평군 지평면 고재길 108','37.42743942','127.606234','30000','031-773-1199','붕어+ 메기+ 송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유일실내낚시터','경기도 양평군 용문면 용문로 537','37.49816528','127.6041257','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'이화','김포시 고촌읍 태리 584-3','37.5947475379','126.7371851197','35,000원','031-986-3223','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린','경기도 김포시 고촌읍 인향로210번길 52','37.5861328371','126.7550608557','35,000원','031-986-3469','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대원','김포시 통진읍 옹정리 168','37.6919829289','126.5633697093','20,000원','031-987-2181','붕어+잉어+기타잡어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'구래','경기도 김포시 양촌읍 김포한강8로 100-59','37.6299166031','126.6393914580','노지 : 10,000원, 하우스 : 15,000원','031-989-6227','향어+잉어+붕어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'태리','김포시 고촌읍 태리 195-1, 196','37.5967797632','126.7476293921','35,000원','031-985-1277','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조강','김포시 월곶면 조강리 230-10번지 외 20필지','37.7452518301','126.5719274151','15,000원','','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'김포실내바다낚시터','경기도 김포시 대곶면 대곶서로 283-25','37.6451473608','126.5806472144','60,000원','','우럭+참돔+농어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'김포','김포시 하성면 양택리 91, 125, 125-1, -3, -4, -5','37.7340104879','126.6223949611','30,000원','031-988-9587','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고정','경기도 김포시 통진읍 고척로 104','37.7174578072','126.5874015885','35,000원','031-987-7906','붕어,잉어,기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고막낚시터','경기도 김포시 월곶면 애기봉로 85-12','37.7218427868','126.5581979494','35,000원','','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아리수','김포시 하성면 후평리 42, 45','37.7491731842','126.6513077797','15000원','031-982-3332','붕어+잉어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'김포 피싱존','경기도 김포시 양촌읍 석모로44번길 93','37.6563715710','126.6470106368','35,000원','','우럭+참돔+농어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'드림바다실내낚시터','경기도 김포시 풍무로9번길 26','37.5975972857','126.7201016738','30,000원','','우럭+참돔+농어+기타어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해적왕실내낚시카페','경기도 수원시 팔달구 효원로307번길 47, 지하1층(인계동, 문화빌딩)','37.26302406','127.0359218','10,000원','031-223-1123','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수원실내낚시터','경기도 수원시 권선구 권선로 652, 지하1층(권선동)','37.26012603','127.0224305','10,000원','031-233-2733','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도심어부','경기도 수원시 영통구 영통로 232, 지하1층(영통동, 제2상가동)','37.24841817','127.0584843','10,000원','031-205-7872','가재류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'잉어킹낚시카페','경기도 수원시 팔달구 경수대로446번길 56, 지하1층','37.26502616','127.0294519','10,000원','031-223-8452','잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청춘물고기','경기도 수원시 팔달구 향교로1번길 22-15, 지하1층','37.2691271','127.0008509','10,000원','031-244-2733','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신기','경기도 용인시 처인구 남동 542','37.219948','127.191192','30,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한터','경기도 용인시 처인구 양지면 대대리 639-1','37.259609','127.276352','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상 덕','경기도 용인시 처인구 이동읍 서리 874-1','37.21477','127.163433','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼인','경기도 용인시 처인구 남사면 북리 369','37.158124','127.142069','30,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'두 창','경기도 용인시 처인구 원삼면 두창리 1393','37.148668','127.334743','20,000','','붕어 잉어 향어등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아 곡','경기도 용인시 처인구 백암면 고안리 산153','37.130985','127.416537','30,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동 막','경기도 용인시 처인구 남사면 통삼리 646-16','37.144458','127.132562','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'창 리','경기도 용인시 처인구 남사면 창리 377-8','37.14002','127.184611','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'요덕골','경기도 용인시 처인구 이동면 송전리 41','37.136955','127.219843','25,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신 원','경기도 용인시 처인구 이동면 묵리 346','37.165163','127.252272','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사계절','경기도 용인시 처인구 이동면 송전리 984','37.134223','127.194159','15,000','','향어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용 담','경기도 용인시 처인구 원삼면 사암리 330','37.196613','127.306187','20,000','','붕어 잉어 쏘가리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산 장','경기도 용인시 처인구 양지면 평창리 537-1','37.225718','127.322084','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'묵 리','경기도 용인시 처인구 이동면 묵리 591','37.175823','127.232085','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'이 동(송전)','경기도 용인시 처인구 이동면 어비리 574-3','37.125903','127.204053','10,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고초골','경기도 용인시 처인구 원삼면 학일리 104','37.157735','127.284507','30,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'통삼낚시터','경기도 용인시 처인구 남사면 통삼리 33','37.121429','127.135143','20,000','','붕어 잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'추곡낚시터','경기도 광주시 추곡길 91','37.28089721','127.2858675','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양벌낚시터','경기도 광주시 양촌길 218','37.36961939','127.258023','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유정낚시터','경기도 광주시 도척로 897','37.28796687','127.322037','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'진우낚시터','경기도 광주시 도척면 저수지길 182','37.31169522','127.3508832','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한일낚시터','경기도 광주시 도척면 옛진말길 63-1','37.32698386','127.3295844','30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'피쉬헌터','경기도 안양시 동안구 평촌대로 223번길 11, 지하1층 (성우프라자)','37.3910048','126.9549956','10,000원','031-387-3550','확인불가');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'안양바다낚시터','경기도 안양시 만안구 양화로 126, 지층','37.4038887','126.9098854','10,000원','','확인불가');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원낚시포차','경기도 안양시 만안구 안양로 305번길 지하1층','37.3984542','126.9375105','10,000원','031-448-0524','확인불가');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'추곡낚시터','도척면 추곡길 91','37.280897','127.285867','30000','031-762-1269','붕어+향어+잉어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양벌낚시터','오포읍 양촌길 218','37.369619','127.258023','30000','031-766-2539','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유정낚시터','도척면 도척로 951','37.2848107','127.306073','30000','031-762-5185','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'진우낚시터','도척면 저수지길 182','37.311647','127.351043','30000','031-762-7913','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한일낚시터','도척면 옛진말길 63-1','37.326982','127.329585','30000','031-762-7887','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'방산 낚시터','경기도 시흥시 구수미1길127-14','37.42303','126.77788','30,000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한샘청수낚시터','경기도 시흥시 수인로2107번길35','37.37045','126.87239','(평일) 20,000원 (휴일)30,000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'과림 낚시터','경기도 시흥시 과림저수지길 79','37.45313','126.82729','1일 30000원','02-2616-3858','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금이 낚시터','경기도 시흥시 금이진말길 159','37.39915','126.8295','1일 30000원','031-315-9459','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'뒷방울 낚시터','경기도 시흥시 뒷방울길 147','37.37137','126.74866','1일 30000원+(겨울)20000원','031-498-0737','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청용 낚시터','경기도 시흥시 청룡저수지길 216','37.42252','126.76005','1일 30000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'달월 낚시터','경기도 시흥시 군자로 125-39','37.37245','126.77062','1일 (손맛터)20000원+(잡이터)30000원','031-498-9300','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'칠리제 낚시터','경기도 시흥시 수인로 2564-8','37.40337','126.84862','1일 30000원','031-314-8366','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'샘골 낚시터','경기도 시흥시 신흥마을5길 32-21','37.43943','126.77225','1일 15000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한탄강 낚시터','경기도 시흥시 수인로 2495-1','37.3995','126.85366','1일 20000원','031-402-8182','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'약수 낚시터','경기도 시흥시 동서로 989-32','37.38157','126.85253','(평일)10000원+(휴일)20000원','031-405-6252','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'계수 낚시터','경기도 시흥시 구미1길 33','37.4516','126.80476','1일 10000원','031-311-9508','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'임진낚시캠핑','경기도 파주시 문산읍 임진나루길 178-68','37.88809785','126.7928557','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자유로레저낚시터','경기도 파주시 탄현면 엘지로717번길 2-114','37.83697823','126.7299072','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'썸피싱카페낚시터','경기도 파주시 금정18길 20','37.76092367','126.7749272','20000','031-942-1385','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금곡낚시터','경기도 파주시 법원읍 술이홀로1372번길 347','37.89267479','126.8926452','30000','031-958-2503','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'지오낚시터','경기도 연천군 군남면 청정로 2060','38.0431958641','127.0296003969','30000원','','송어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼화리낚시터','경기도 연천군 미산면 삼화2길 96','38.0127037651','126.9767416008','30000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양원리낚시터','경기도 연천군 전곡읍 양원로 108-37','37.987430587','127.0210489886','30000원','','메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'전곡낚시터','경기도 연천군 군남면 오리골길 124','38.0370457766','127.0340200388','30000원','','송어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한탄강낚시터','경기도 연천군 전곡읍 평화로495번길 16-31','38.0151795909','127.0675996512','30000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백학낚시터','경기도 연천군 백학면 저수지길 21','38.032232','126.9250483036','25000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매일낚시터','경기도 파주시 광탄면 보광로 898-17','37.77641772','126.884343','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문화레저낚시터','경기도 파주시 광탄면 혜음로 1300-45','37.79682665','126.8497236','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'놀러와실내낚시카페','경기도 안산시 상록구 샘골로 159, 창원빌딩 지하1층 2~3호 (본오동)','37.29806560072','126.8629480419','1시간 10,000원','031-409-3674','잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낚시존낚시카페','경기도 안산시 단원구 고잔로 76, 영풍빌딩 지하1층 37~41호 (고잔동)','37.31889090340','126.8348385401','1시간 5,000원','031-401-4462','잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'꾼낚시카페','경기도 안산시 단원구 고잔2길 38, 중앙상가 지하층 1,2,3호 (고잔동)','37.31756622397','126.8353288839','1시간 10,000원','031-401-4462','민물고기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'미췬물고기','부천시 신흥로56번길 50, 지층 (심곡동)','37.4882787','126.77991','남:1만, 여:7천 ,청소년:7천, 초등학생이하:7천','032-612-0620','붕어, 비단잉어, 잉어, 철갑상어, 향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아마존실내낚시터','부천시 부흥로 404, 지하1층','37.4896579','126.78513','남:1만, 여:9천, 청소년이하:7천','070-7759-1253','복돼지, 붕어, 비단잉어, 송어, 역돔, 잉어, 철갑상어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'놀러와실내낚시카페','부천시 부일로459번길 33, 지하1층','37.4875699','126.781518','남:1만, 여:9천, 커플:각 9천, 청소년:8천, 초등학생이하:7천','050-7987-0709','대물잉어, 대물향어, 붕어, 잉어, 철갑상어, 향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'리얼바다낚시터','부천시 상일로 72-1, 신라쇼핑타운 지하 51호','37.4901476','126.75029','1시간:2만, 2시간:3만, 3시간:4만, 5시간:6만','032-322-6675','농어, 도다리, 우럭, 줄돔, 참돔');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'쉼터 낚시터','경기도 시흥시 하중로 281','37.38821','126.80687','(평일)10000원+(휴일)15000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능곡 낚시터','경기도 시흥시 시흥대로268번길 50-28','37.36146','126.81064','(평일)10000원+(휴일)20000원','031-318-3638','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'군자 낚시터','경기도 시흥시 시흥대로216-18','37.35995','123.80808','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산정 낚시터','경기도 시흥시 피울길 173','37.36794','126.82918','1일 10000원','031-485-7280','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'까치 낚시터','경기도 시흥시 수인로2107번길 146','37.36734','126.86603','1일 10000원','031-480-7760','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청춘바다낚시','경기도 시흥시 오동마을로6번길 21','37.35224','126.74325','1시간(성인)10000원+(학생)7000원+(아동)5000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'달월사계절 낚시터','경기도 시흥시 군자로 125-5','37.37326','126.76863','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새미 낚시터','경기도 시흥시 조남동 299','37.37363','126.86493','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'시흥드림바다 낚시터','경기도 시흥시 황고개로293번길 7','37.35766','126.78533','2시간 33,000원+ 4시간 55,000원','','광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신천자연 낚시터','경기도 시흥시 두문로71번길 18-5','37.43211','126.78494','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'왕골 낚시터','경기도 시흥시 조남동 492-1, 492-2','37.36567','126.85757','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하마낚시터','경기도 파주시 적성면 국사로 297','37.96115977','126.8696215','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산골낚시터','경기도 파주시 법원읍 만월로613번길 237','37.89033168','126.9140339','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'넘버원애드낚시터','경기도 파주시 법원읍 보광로 1663','37.82400373','126.8684493','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아름낚시터','경기도 파주시 광탄면 부흥로 422','37.80380438','126.8939758','30000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'직천낚시터','경기도 파주시 법원읍 만월로 537-29','37.89620911','126.9233593','20000','031-958-1954','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'감악산낚시터','경기도 파주시 적성면 감골길 48','37.91216452','126.9521871','20000','031-958-6116','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'본죽낚시터','경기도 이천시 율면 주래본죽로 508-1','37.08','127.52','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'학암낚시터','경기도 이천시 신둔면 이장로311번길 490','37.28','127.37','40000','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고담낚시터','경기도 이천시 진상미로2192번길 217','37.23','127.46','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'각평낚시터','경기도 이천시 마장면 덕이로154번길 273','37.23','127.38','30000','','붕어+잉어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용면파크낚시터','경기도 이천시 신둔면 용면리 533','37.29','127.36','40000','','붕어+향어+잉어+메기+빙어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용풍낚시터','경기도 이천시 장호원읍 송산리 298','37.12','127.59','30000','','붕어+가물치');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성호낚시터','경기도 이천시 설성면 장천리 238','37.13','127.53','25000','','붕어+잉어+동자개');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'작은연못낚시터','경기도 파주시 광탄면 방축안길 39-5','37.81228319','126.8594378','20000','031-941-0042','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'발랑낚시터','경기도 파주시 광탄면 부흥로 596','37.80606609','126.9080435','20000','031-941-8675','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'광탄낚시터','경기도 파주시 광탄면 부흥로 194-24','37.80224978','126.8674305','20000','031-941-8513','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'당골낚시터','경기도 화성시 장안면 장안리 35 외 6필지','37.05532018','126.8664096','25000','031-351-2881','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화성대어낚시터','경기도 화성시 비봉면 비봉로528번길 40','37.26042685','126.8529977','20000','031-355-7350','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매일낚시터','경기도 파주시 광탄면 보광로 898-17','37.77641772','126.884343','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문화레저낚시터','경기도 파주시 광탄면 혜음로 1300-45','37.79682665','126.8497236','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하마낚시터','경기도 파주시 적성면 국사로 297','37.96115977','126.8696215','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산골낚시터','경기도 파주시 법원읍 만월로613번길 237','37.89033168','126.9140339','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'넘버원애드낚시터','경기도 파주시 법원읍 보광로 1663','37.82400373','126.8684493','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아름낚시터','경기도 파주시 광탄면 부흥로 422','37.80380438','126.8939758','30000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'직천낚시터','경기도 파주시 법원읍 만월로 537-29','37.89620911','126.9233593','20000','031-958-1954','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'감악산낚시터','경기도 파주시 적성면 감골길 48','37.91216452','126.9521871','20000','031-958-6116','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'작은연못낚시터','경기도 파주시 광탄면 방축안길 39-5','37.81228319','126.8594378','20000','031-941-0042','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'발랑낚시터','경기도 파주시 광탄면 부흥로 596','37.80606609','126.9080435','20000','031-941-8675','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'광탄낚시터','경기도 파주시 광탄면 부흥로 194-24','37.80224978','126.8674305','20000','031-941-8513','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'임진낚시캠핑','경기도 파주시 문산읍 임진나루길 178-68','37.88809785','126.7928557','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자유로레저낚시터','경기도 파주시 탄현면 엘지로717번길 2-114','37.83697823','126.7299072','20000','','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'썸피싱카페낚시터','경기도 파주시 금정18길 20','37.76092367','126.7749272','20000','031-942-1385','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금곡낚시터','경기도 파주시 법원읍 술이홀로1372번길 347','37.89267479','126.8926452','30000','031-958-2503','메기+붕어+잉어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용주골낚시터','경기도 화성시 황계남길 15','37.21157743','127.0086725','25000','031-236-6063','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'기천낚시터','경기도 화성시 봉담읍 건달산로 309-33','37.19629691','126.9117052','25000','031-227-3223','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남전낚시터','경기도 화성시 비봉면 남이로132번길 79-13','37.23857033','126.8347166','25000','031-366-8695','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'관리낚시터','경기도 화성시 향남읍 동오리 545-1 외 3필지','37.13297478','126.9457119','30000','031-353-9232','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'버들낚시터','경기도 화성시 장안면 버들안길 3','37.12872541','126.8353876','20000','031-358-6346','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어천낚시터','경기도 화성시 매송면 어사로 47','37.25528976','126.9144635','15000','031-291-3665','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새봉낚시터','경기도 화성시 정남면 세자로303번길 46','37.1947972','126.9760645','30000','031-352-3833','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신촌낚시터','경기도 화성시 매송면 매송북길 179','37.28422966','126.9017887','15000','031-295-9949','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조암낚시터','경기도 화성시 우정읍 한뿌리1길 157-25','37.09650621','126.8021179','10000','031-351-1385','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송라낚시터','경기도 화성시 매송면 매송북길 179','37.28422966','126.9017887','15000','031-295-9949','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동방낚시터','경기도 화성시 팔탄면 노하길116번길 198','37.15153123','126.8634678','15000','031-354-9516','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'안석낚시터','경기도 화성시 남양읍 활초길 214-17','37.16005343','126.8344179','25000','031-356-6435','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은수포낚시터','경기도 화성시 서신면 은수포길 194','37.19982403','126.6914026','20000','031-357-3423','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕우낚시터','경기도 화성시 봉담읍 삼천병마로 709','37.17108351','126.9358869','15000','031-298-9116','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'초당낚시터','경기도 화성시 봉담읍 주석로 891-21','37.20057681','126.911655','15000','031-227-0387','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성지골낚시터','경기도 화성시 서신면 장외리 214-2 외 4필지','37.17196949','126.6702362','20000','031-357-4722','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양석낚시터','경기도 화성시 향남읍 하길리 504-1 외 2필지','37.10886824','126.9240506','20000','031-353-8514','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'스타바다좌대낚시터','경기도 화성시 서신면 송교리 405-1 외 1필지','37.1705191','126.6577333','60000','031-357-5538','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서신레저바다낚시터','경기도 화성시 서신면 화남공단로 79','37.16170633','126.6814562','70000','031-357-9366','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'국화도좌대낚시터','경기도 화성시 우정읍 국화길 2','37.06090765','126.5593612','20000','031-356-9975','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청춘바다낚시터','경기도 화성시 우정읍 국화리 산 4','37.10525104','126.5398058','70000','031-357-4422','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매송낚시터','경기도 화성시 매송면 매송로330번길 50','37.26439417','126.8864237','50000','000-0000-0000','메기+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'죠스실내낚시카페','경기도 화성시 효행로 1051','37.21465039','127.0417616','9000','031-292-3766','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화성락실내바다낚시터','경기도 화성시 봉담읍 하가등리 379-12','37.14559335','126.9308477','33000','031-292-3855','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월문낚시터','경기도 남양주시 와부읍 수레로661번안길 95','37.6247','127.2759','20000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남양낚시터','경기도 남양주시 와부읍 석실로592번길 60','37.6155','127.2162','15000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'창포연못낚시터','경기도 남양주시 진건우회로120번길 82-2','37.6454','127.1834','15000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'경춘낚시터','경기도 남양주시 경춘로답내1길 122','37.6626','127.3377','20000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'헤라낚시터','경기도 남양주시 별내면 청학로54번길 83','37.7126','127.1251','15000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수동그린낚시터','경기도 남양주시 수동면 지둔로 71-27','37.7015','127.3186','20000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'천지연낚시터','경기도 남양주시 고래산로 274','37.5988','127.2874','20000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'늘푸른낚시터','경기도 남양주시 별내면 청학로48번길 29-13','37.7059','127.1238','15000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'숲속낚시터','경기도 남양주시 식송1로 254-72','37.6619','127.1085','15000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'초원 낚시터','경기도 남양주시 석실로408번길 142','37.6132','127.2203','10000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남양주 실내 바다낚시터','경기도 남양주시 진접읍 금강로 1857','37.7500','127.2097','55000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남양주 락 실내바다 낚시터','경기도 남양주시 고재로 143','37.6351','127.1784','55000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실내바다낚시터','경기도 남양주시 진접읍 경복대로 485','37.7383','127.2151','55000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'왕골낚시터','경기도 시흥시 조남동 492-1, 492-2','37.36567','126.85757','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신천자연 낚시터','경기도 시흥시 두문로71번길 18-5','37.43211','126.78494','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'시흥드림바다 낚시터','경기도 시흥시 황고개로293번길 7','37.35766','126.78533','2시간 33,000원+ 4시간 55,000원','','광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새미 낚시터','경기도 시흥시 조남동 299','37.37363','126.86493','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'달월사계절 낚시터','경기도 시흥시 군자로 125-5','37.37326','126.76863','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'까치 낚시터','경기도 시흥시 수인로2107번길 146','37.36734','126.86603','1일 10000원','031-480-7760','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산정 낚시터','경기도 시흥시 피울길 173','37.36794','126.82918','1일 10000원','031-485-7280','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'군자 낚시터','경기도 시흥시 시흥대로216-18','37.35995','123.80808','1일 10000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능곡 낚시터','경기도 시흥시 시흥대로268번길 50-28','37.36146','126.81064','(평일)10000원+(휴일)20000원','031-318-3638','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'쉼터 낚시터','경기도 시흥시 하중로 281','37.38821','126.80687','(평일)10000원+(휴일)15000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'계수 낚시터','경기도 시흥시 구미1길 33','37.4516','126.80476','1일 10000원','031-311-9508','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'약수 낚시터','경기도 시흥시 동서로 989-32','37.38157','126.85253','(평일)10000원+(휴일)20000원','031-405-6252','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한탄강 낚시터','경기도 시흥시 수인로 2495-1','37.3995','126.85366','1일 20000원','031-402-8182','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'샘골 낚시터','경기도 시흥시 신흥마을5길 32-21','37.43943','126.77225','1일 15000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'칠리제 낚시터','경기도 시흥시 수인로 2564-8','37.40337','126.84862','1일 30000원','031-314-8366','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'달월 낚시터','경기도 시흥시 군자로 125-39','37.37245','126.77062','1일 (손맛터)20000원+(잡이터)30000원','031-498-9300','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청용 낚시터','경기도 시흥시 청룡저수지길 216','37.42252','126.76005','1일 30000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'뒷방울 낚시터','경기도 시흥시 뒷방울길 147','37.37137','126.74866','1일 30000원+(겨울)20000원','031-498-0737','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금이 낚시터','경기도 시흥시 금이진말길 159','37.39915','126.8295','1일 30000원','031-315-9459','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'과림 낚시터','경기도 시흥시 과림저수지길 79','37.45313','126.82729','1일 30000원','02-2616-3858','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한샘청수낚시터','경기도 시흥시 수인로2107번길35','37.37045','126.87239','(평일) 20,000원 (휴일)30,000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'방산 낚시터','경기도 시흥시 구수미1길127-14','37.42303','126.77788','30,000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'밤밭','경기도 포천시 가산면 포천로 912번길 143-94','37.84250079','127.2136439','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가산낚시터','경기도 포천시 가산면 우금길 13-32','37.82549928','127.2125165','(노지)30,000+(1인 수상방갈로)50,000+(2인수상방갈로)100,000+(4인수상방갈로)170,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중리테마파크','경기도 포천시 관인면 지장산길 65','38.10167638','127.1992908','(잔교좌대)30,000+(손맛터)20,000+(2인방갈로)평일100,000,주말120,000+(3인방갈로)평일120,000,주말150,000+(5인방갈로)평일180,000,주말230,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금주','경기도 포천시 영중면 물안길 135','37.97376415','127.2701662','(2인방갈로)80,000+(4인방갈로)180,000+(6인방갈로)250,000+(8인방갈로)300,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'지청','경기도 포천시 일동면 청지로 150-41','37.95845374','127.3300224','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'마전','경기도 포천시 가산면 마전길 129-1','37.84907203','127.2139254','(육상방갈로,노지)30,000+(1인방갈로)50,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용담대물','경기도 포천시 관인면 사정리 384-3','38.13744071','127.2617286','(2인방갈로)평일80,000,주말100,000+(6인방갈로)평일100,000,주말120,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'직두리','경기도 포천시 군내면 진구자리1길 14','37.87725794','127.2300427','(평일)20,000+(주말)30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새마을','경기도 포천시 군내면 좌의길 79','37.86264904','127.2152827','10,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'무네미','경기도 포천시 군내면 유교리 88번길 43','37.86690636','127.1949493','(노지)30,000+(1인방갈로)토제외40,000,토50,000+(2인방갈로)100,000+(4인방갈로)200,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'내촌','경기도 포천시 내촌면 내진로 30번길 64','37.7872828','127.2235448','10,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동교','경기도 포천시 동교동 670-3','37.85092126','127.1224802','(2인방갈로)100,000+(3인방갈로)140,000+(4인방갈로)170,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수목원레저','경기도 포천시 소흘읍 직동길 28','37.76563953','127.1700127','50,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황금연못','경기도 포천시 신북면 포천로 2371','37.96116913','127.1933304','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'태산','경기도 포천시 영북면 호국로 3421번길 8','38.04295578','127.2655168','30,000','','붕어+뱀장어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'초원','경기도 포천시 자작동 자작로3길85','37.87683209','127.1691193','(노지)30,000+(2인방갈로)50,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우금','경기도 포천시 가산면 우금6길 43-44','37.84002891','127.2164266','(노지)30,000+(방갈로)평일80,000,주말100,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'밤밭실내낚시터','경기도 포천시 가산면 포천로 912번길 143-94','37.84250079','127.2136439','(평일 2시간)40,000+(평일 3시간)60,000+(주말 야간)70,000','','뱀장어+바닷가재');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동교실내','경기도 포천시 동교동 원동교길 268','37.85123047','127.1226637','10,000','','붕어+뱀장어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수목원','경기도 포천시 소흘읍 직동리 80-4','37.76614895','127.1690342','30,000','','뱀장어+바닷가재');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금강','경기도 포천시 일동면 새낭로 66','37.98426442','127.3346887','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고일','경기도 포천시 신북면 포천로 2721번길 157','37.97524619','127.1728453','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'길명','경기도 포천시 일동면 영일로 316','37.94734418','127.2596293','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'운천낚시공원','경기도 포천시 영북면 호국로 4350번길 136-204','38.09911938','127.2972835','30,000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'노진낚시터','경기도 화성시 장안면 노진리 1467 외 2필지','37.02226239','126.8152478','25000','031-351-3412','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대성낚시터','경기도 화성시 팔탄면 녹막말길9번길 199','37.17188889','126.8660989','15000','031-352-7935','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용주골낚시터','경기도 화성시 황계남길 15','37.21157743','127.0086725','25000','031-236-6063','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'기천낚시터','경기도 화성시 봉담읍 건달산로 309-33','37.19629691','126.9117052','25000','031-227-3223','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남전낚시터','경기도 화성시 비봉면 남이로132번길 79-13','37.23857033','126.8347166','25000','031-366-8695','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'관리낚시터','경기도 화성시 향남읍 동오리 545-1 외 3필지','37.13297478','126.9457119','30000','031-353-9232','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'버들낚시터','경기도 화성시 장안면 버들안길 3','37.12872541','126.8353876','20000','031-358-6346','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어천낚시터','경기도 화성시 매송면 어사로 47','37.25528976','126.9144635','15000','031-291-3665','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새봉낚시터','경기도 화성시 정남면 세자로303번길 46','37.1947972','126.9760645','30000','031-352-3833','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신촌낚시터','경기도 화성시 매송면 매송북길 179','37.28422966','126.9017887','15000','031-295-9949','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조암낚시터','경기도 화성시 우정읍 한뿌리1길 157-25','37.09650621','126.8021179','10000','031-351-1385','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송라낚시터','경기도 화성시 매송면 매송북길 179','37.28422966','126.9017887','15000','031-295-9949','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동방낚시터','경기도 화성시 팔탄면 노하길116번길 198','37.15153123','126.8634678','15000','031-354-9516','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'안석낚시터','경기도 화성시 남양읍 활초길 214-17','37.16005343','126.8344179','25000','031-356-6435','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은수포낚시터','경기도 화성시 서신면 은수포길 194','37.19982403','126.6914026','20000','031-357-3423','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕우낚시터','경기도 화성시 봉담읍 삼천병마로 709','37.17108351','126.9358869','15000','031-298-9116','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'당골낚시터','경기도 화성시 장안면 장안리 35 외 6필지','37.05532018','126.8664096','25000','031-351-2881','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화성대어낚시터','경기도 화성시 비봉면 비봉로528번길 40','37.26042685','126.8529977','20000','031-355-7350','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'초당낚시터','경기도 화성시 봉담읍 주석로 891-21','37.20057681','126.911655','15000','031-227-0387','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성지골낚시터','경기도 화성시 서신면 장외리 214-2 외 4필지','37.17196949','126.6702362','20000','031-357-4722','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양석낚시터','경기도 화성시 향남읍 하길리 504-1 외 2필지','37.10886824','126.9240506','20000','031-353-8514','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'스타바다좌대낚시터','경기도 화성시 서신면 송교리 405-1 외 1필지','37.1705191','126.6577333','60000','031-357-5538','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서신레저바다낚시터','경기도 화성시 서신면 화남공단로 79','37.16170633','126.6814562','70000','031-357-9366','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'국화리해상좌대낚시터','경기도 화성시 우정읍 국화길 2','37.06090765','126.5593612','20000','031-356-9975','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청춘낚시터','경기도 화성시 우정읍 국화리 산 4','37.10525104','126.5398058','70000','031-357-4422','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매송낚시터','경기도 화성시 매송면 매송로330번길 50','37.26439417','126.8864237','50000','000-000-0000','메기+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'죠스실내낚시카페','경기도 화성시 효행로 1051','37.21465039','127.0417616','9000','031-292-3766','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화성락실내바다낚시터','경기도 화성시 봉담읍 하가등리 379-12','37.14559335','126.9308477','33000','031-292-3855','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송라손맛터','경기도 화성시 매송면 송라리 380-1 외 2필지','37.281175','126.895676','10000','031-295-9223','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'시화힐링낚시터','경기도 화성시 안녕남로58번길 4','37.196444','126.989738','20000','031-223-4617','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'루피실내바다낚시터','경기도 화성시 향남읍 포승향남로 3864','37.082231','126.922736','40000','031-352-3930','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'뚜루실내바다낚시터','경기도 화성시 비봉면 쌍학길 75','37.242891','126.897376','40000','000-000-0000','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화도낚시터','경기도 남양주시 화도읍 경춘로2414번길 50-14','37.6553','127.3600','20000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'배양낚시터','경기도 남양주시 진건읍 고재로191번길 64-17','37.6389','127.1871','25000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'솟골낚시터','경기도 남양주시 진건읍 사릉로620번길 44-31','37.6716','127.1695','25000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'진벌낚시공원','경기도 남양주시 진접읍 진벌리 324','37.7346','127.2275','15000','','-');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'추곡낚시터','경기도 광주시 도척면 추곡길 91','37.280897','127.285867','30000','031-762-1269','붕어+향어+잉어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양벌낚시터','경기도 광주시 양촌길 218','37.369619','127.258023','30000','031-766-2539','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유정낚시터','경기도 광주시 도척면 도척로 951','37.2848107','127.306073','30000','031-762-5185','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'진우낚시터','경기도 광주시 도척면 저수지길 182','37.311647','127.351043','30000','031-762-7913','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한일낚시터','경기도 광주시 도척면 옛진말길 63-1','37.326982','127.329585','30000','031-762-7887','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'반제','경기도 안성시 원곡면 반제리 114-2 외','37.026444','127.165384','1일 30,000원','031-652-6369','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월향','경기도 안성시 고삼면 월향리 596 외','37.085938','127.272579','1일 30,000원','031-673-6399','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'미산','경기도 안성시 양성면 미산리 343외','37.129984','127.257803','1일 5,000원','031-674-6969','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장계','경기도 안성시 죽산면 장계리 868 외','37.040644','127.406525','1일 20,000원','031-674-9111','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'연못','경기도 안성시 고삼면 월향리 44-1 외','37.094849','127.289617','1일 15,000원','031-672-3870','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청월','경기도 안성시 고삼면 월향리 411-1 외','37.085688','127.277025','1일 30,000원','031-672-7072','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고삼','경기도 안성시 고삼면 월향리 20번지 외','37.093261','127.289348','1일 35,000원','031-672-3481','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕산','경기도 안성시 삼죽면 배태리 95 외','37.076725','127.366471','1일 20,000원','031-672-4527','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'농촌지','경기도 안성시 발화동 118 외','36.983539','127.284644','1일 20,000원','031-673-3436','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'노곡','경기도 안성시 양성면 노곡리 254-1 외','37.106131','127.253152','1일 20,000원','031-672-2131','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용설','경기도 안성시 죽산면 용설리 560 외','37.057744','127.444983','1일 20,000원','031-676-5518','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'두메','경기도 안성시 죽산면 두교리 451번지 일원','37.008264','127.428955','1일 25,000원','031-672-7838','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'마둔','경기도 안성시 금광면 장죽리 216번지 일원','36.974239','127.314235','1일 30,000원','031-675-9229','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신미골','경기도 안성시 삼죽면 미장리 40-1','37.038116','127.377075','1일 10,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'만정','경기도 안성시 공도읍 만정리 58','37.018111','127.183264','1일 30,000원','031-658-5006','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금광호수','경기도 안성시 금광면 금광리 345-1','36.9898764','127.329794','1일 30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'개나리낚시공원','경기도 안성시 삼죽면 진촌리 18-2일원','37.050525','127.372127','1일 45,000원','031-674-8799','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'참샘','경기도 안성시 원곡면 지문리 303-4','37.067592','127.151253','1일 10,000원','031-656-1051','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명인','경기도 안성시 원곡면 내가천리 203-1','37.036038','127.112249','1일 25,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'회암','경기도 안성시 삼죽면 내강리 519','37.0624896','127.3630405','1일 30,000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'거청','경기도 안성시 대덕면 모산리 423 외','37.026031','127.240801','1일 25,000원','031-677-1191','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'칠곡','경기도 안성시 원곡면 칠곡리 379-2 외','37.047548','127.155988','1일 30,000원','031-652-7745','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산우물','경기도 안성시 보개면 신안리 199-4 일원','37.060386','127.315883','1일 30,000원','031-676-1707','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도곡','경기도 안성시 양성면 도곡리 35-1 외','37.088009','127.216608','1일 30,000원','031-672-4643','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성은','경기도 안성시 원곡면 성은리 406 일원','37.071231','127.166836','1일 20,000원','031-655-6507','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'독정','경기도 안성시 원곡면 칠곡리 728번지일원','37.039837','127.160231','1일 20,000원','031-675-0842','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'설동','경기도 안성시 죽산면 용설리 8 일원','37.051469','127.460886','1일 30,000원','031-675-0842','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조일','경기도 안성시 양성면 조일리 97 일원','37.071219','127.212307','1일 20,000원','031-673-7440','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장광','경기도 안성시 죽산면 매산리 683 일원','37.097851','127.429726','1일 30,000원','031-672-6677','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상지','경기도 안성시 원곡면 지문리 269 일원','37.061062','127.144169','1일 20,000원','031-656-4610','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동신곡','경기도 안성시 금광면 신양복리 61 외','37.009422','127.331959','1일 30,000원','031-674-9933','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕봉','경기도 안성시 양성면 덕봉리 8 외','37.052709','127.187296','1일 20,000원','031-673-4529','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성주리','경기도 안성시 원곡면 성주리 46-3 외','37.083137','127.175901','1일 30,000원','031-656-4923','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'꼴미','경기도 안성시 고삼면 봉산리 175 외','37.076432','127.288986','1일 25,000원','031-674-0757','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'88실내바다낚시터','경기도 고양시 덕양구 고골길116번길 14-67(관산동)','37.71074','126.86322','30000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'퐁퐁실내낚시터','경기도 고양시 일산동구 탄중로 429 성지프라자 지하1층 102호(중산동)','37.69076','126.77767','10000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백두산낚시터','경기도 고양시 덕양구 서리골길36번길 158-7(선유동)','37.68858','126.9114','10000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백용낚시터','경기도 고양시 일산동구 감내길 73(성석동)','37.71391','126.78215','20000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문봉낚시터','경기도 고양시 일산동구 성현로268번길 153(문봉동)','37.70112','126.81428','10000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'보물섬낚시터','경기도 고양시 덕양구 대곡길 31-8(내곡동)','37.64341','126.80289','15000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉림낚시터','경기도 고양시 덕양구 호국로1595번길 25(대자동)','37.69295','126.89947','10000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'123실내낚시터','경기도 고양시 덕양구 호국로 770, 지하1층(성사동)','37.65533','126.83501','25000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'뚜루실내낚시놀이터','경기도 고양시 일산동구 견달산로225번길 26-44, 나동(식사동)','37.68912','126.81875','33000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고산낚시터','강원도 원주시 호저면 호저로 1140','37.466789','127.918048','30,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서곡낚시터','강원도 원주시 판부면 백운정길 46','37.298324','127.932703','10,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백운낚시터','강원도 원주시 판부면 내남송길 35-64','37.317055','127.945855','10,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'이무기낚시터','강원도 원주시 소초면 신양선녀길 99','37.413059','127.972658','10,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'단강낚시터','강원도 원주시 부론면 섬뜰작실길 26-59','37.156403','127.790081','30,000원','','향어+메기+뱀장어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'취병낚시터','강원도 원주시 문막읍 취병리 731','37.325026','127.785414','20,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'샘골낚시터','강원도 원주시 호저면 광학로 177','37.462663','127.939202','20,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신선낚시터','강원도 원주시 한가터길 100','37.328381','128.001653','10,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도곡낚시터','강원도 원주시 소초면 장수1로 191','37.396068','127.976141','20,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'호저낚시터','강원도 원주시 호저면 평천1길 21','37.422080','127.921589','10,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'주주실내낚시클럽','강원도 원주시 일산로 7-13','37.350671','127.947142','10,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'물고기마을','강원도 원주시 흥업면 사제리 92-1','37.332017','127.894424','30,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'탑전낚시터','강원도 원주시 문막읍 동화리 1282-7','37.332365','127.828872','10,000원','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'승안낚시터','강원도 원주시 흥업면 돼니길 32-39','37.314986','127.875357','20,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'돌모루낚시터','강원도 원주시 소초면 흥양리 1649-3','37.381465','127.975253','15,000원','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산내들낚시터','강원도 철원군 김화읍 연동길33','38.2358501','127.3635403','30000원/일','033-458-0809','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'금천가든낚시터','강원도 태백시 금천길 159, 금천가든낚시터 (금천동)','37.094038','128.994978','20,000','','붕어류, 이스라엘잉어, 잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'혈리낚시터','강원도 태백시 사내골길 117, 혈리낚시터 (혈동)','37.129695','128.925167','20,000','033-553-6777','붕어류, 이스라엘잉어, 잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도깨비낚시터','강원도 횡성군 우천면 백달리 8','37.44348486','128.0719036','30000','033-344-5513','붕어,잉어,향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새말낚시터','강원도 횡성군 우천면 문암리 229','37.467563','128.0436703','10000','033-342-3424','붕어,잉어,향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대영낚시터','강원도 횡성군 공근면 부창리 546-2','37.585641','127.9945217','30000','033-343-2528','붕어,잉어,향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'현천낚시터','강원도 횡성군 둔내면 현천리 821-2','37.48341109','128.175495','30000','033-344-1500','붕어,잉어,향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백달낚시터','강원도 횡성군 우천면 백달리 180','37.439543','128.064043','20000','033-343-8448','붕어,잉어,향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'굴운낚시터','강원도 홍천군 화촌면 굴운로 296-18','37.7232946','127.9663362','30,000원','033-435-6888','붕어+향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'모곡낚시터','강원도 홍천군 서면 장락동길24번길 21','37.6958432','127.574143','30,000원','033-434-3831','붕어+향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'시동유정낚시터','강원도 홍천군 남면 시동안로 148','37.5928136','127.8244436','30,000원','033-432-3637','붕어+향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'샘골낚시터','강원도 춘천시 서면  방동샘골길 35','37.9109353379','127.6682808536','30,000원','','향어,메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하늘낚시공원낚시터','강원도 춘천시 서면 당숲안길 61','37.8363222975','127.6066043081','평일 160,000원 금요일 180,000원 토요일 200,000원  (성인 2인)','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은행나무하우스낚시터','강원도 춘천시 신동면 경춘로 1773','37.8228853588','127.6968574887','10,000원','','붕어,향어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'춘천실내낚시터','강원도 춘천시 공지로 210','37.8626041785','127.7402414926','10,000원','','향어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'소양계곡낚시터','강원도 춘천시 서면 율장길 266','37.8608315164','127.5830549645','30,000원','','향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'말고개낚시터','강원도 춘천시 사북면 말고개길 307','38.0134708495','127.6263902594','40,000원','','향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'팔미리낚시터','강원도 춘천시 신동면 경춘로 1817','37.8210165363','127.7008514045','20,000원','','잉어,향어,붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은파정낚시터','강원도 춘천시 동산면 영서로 287-17','37.7558263058','127.8117096475','40,000원','','향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'추곡터널낚시터','강원도 춘천시 북산면 춘양로 1452','38.0337618623','127.8763567730','40,000원','','향어, 메기, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'강촌체험낚시터','강원도 춘천시 남면 박암관천길 511-55','37.7212312787','127.5391075122','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'거두리낚시터','강원도 춘천시 동내면 거두길 282-8','37.8604434283','127.7888513667','노지 : 40,000원 / 하우스 : 10,000원','','붕어,향어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유포리낚시터','강원도 춘천시 신북읍 맥국3길 15-28','37.9467657079','127.7748379271','40,000원','','향어,메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'소금강가족낚시터','강원도 강릉시 연곡면 신왕길 388-64','37.83101752','128.7704452','손맛터-20,000원 메기 잡이터-35,000원 장비대여-10,000원 지렁이-5,000원 떡밥1덩이-2,000원','','붕어, 잉어, 향어, 메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'천동낚시','강원도 평창군 평창읍 천동길 163','37.334102','128.380508','30,000','033-334-3661','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'평창낚시','강원도 평창군 평창읍 등강길 44-1','37.348940','128.379776','30,000','','붕어+향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'단봉낚시터','강원도 동해시 봉정2길 95-9','37.46989535','129.1218004','1일 10000원','033-522-0099','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용곡낚시터','충청북도 청주시 상당구 미원면 미원초정로 685-26','36.683613','127.636857','20000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황청낚시터','충청북도 청주시 상당구 남일면 황청리길 119','36.594752','127.555039','25000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한계리낚시터','충청북도 청주시 상당구 가덕면 한계1길 170','36.606594','127.562466','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중리낚시터','충청북도 청주시 상당구 미원면 쌍이운교로 262','36.669118','127.665454','25000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'이정골낚시터','충청북도 청주시 상당구 용정동 23-1','36.636061','127.523977','20000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장자골낚시터','충청북도 청주시 상당구 문의면 남계1길 3','36.535554','127.503843','25000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'척산낚시터','충청북도 청주시 서원구 남이면 척산리 176-2','36.559086','127.453531','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'일신낚시터','충청북도 청주시 청원구 오창읍 일신길 34-27','36.756746','127.470374','15000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유호정낚시터','충청북도 청주시 청원구 내수읍 우산2길 65','36.710498','127.412345','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'부연낚시터','충청북도 청주시 청원구 북이면 신기초정로 335','36.736716','127.573571','20000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'초정낚시터','충청북도 청주시 청원구 내수읍 세교초정로 369','36.714903','127.599766','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'비상낚시터','충청북도 청주시 청원구 내수읍 비상길 22-58','36.704427','127.580032','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송말낚시터','충청북도 청주시 흥덕구 지동로75번길 39 (지동동)','36.642624','127.412433','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'소로낚시터','충청북도 청주시 흥덕구 옥산면 소로2길 148','36.697368','127.401441','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'호암낚시터','충청북도 청주시 흥덕구 서부로 988-194 (석곡동)','36.606843','127.418748','15000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'공북낚시터','충청북도 청주시 흥덕구 오송읍 정중연제로 651-84','36.652114','127.312772','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성화낚시터','충청북도 청주시 서원구 성화로 43-9 (성화동)','36.608749','127.446669','10000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'주성낚시터','충청북도 청주시 청원구 내수읍 도원세교로 124-88, 주성낚시터','36.700498','127.536579','15000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'옥산낚시터','충청북도 청주시 흥덕구 신촌동 413-9','36.653982','127.386549','15000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'연정낚시터','충청북도 청주시 흥덕구 강내면 연정1길 26','36.581306','127.380048','30000원','','붕어+잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백야낚시터','음성군 금왕읍 백야로 320','39.967806','127.603211','15,000~20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'내곡낚시터','음성군 금왕읍 마루택길29번길 63','37.01744','127.53839','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사계지낚시터','음성군 금왕읍 보습길 77','37.020711','127.551423','25000','043-878-8819','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'주봉낚시터','음성군 원남면 주봉로 141','36.866529','127.675445','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'마이제낚시터','음성군 삼성면 덕정로65번길 102','37.027938','127.494112','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'맹동낚시터','음성군 맹동면 군자길 1492','36.894167','127.571429','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중부낚시터','음성군 삼성면 용성로5번길 86-24','37.001845','127.47583','25000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양덕낚시터','음성군 삼성면 금일로 1064-6','37.026576','127.484692','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상곡낚시터','음성군 삼성면 점골길 51','37.013504','127.450467','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'차평낚시터','음성군 생극면 차생로 618-20','37.049326','127.622166','30000','043-877-2178','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰골낚시터','음성군 감곡면 대학길190번길 59','37.138054','127.648323','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오궁낚시터','음성군 감곡면 오궁리 124-2','37.111463','127.672462','10000','043-877-6787','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'거일낚시터','음성군 감곡면 거일길 156','37.108528','127.657346','30000','043-881-9181','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉낚시터','음성군 소이면 충갑길 196','36.88901','127.74706','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'감곡낚시터','음성군 감곡면 감노로 67-18','37.076491','127.627197','20000','043-878-0789','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용대리낚시터','음성군 삼성면 덕호로 360','37.044544','127.514314','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'제수리낚시터','음성군 금왕읍 금일로284번길 100-4','37.010817','127.554459','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'생극낚시터','음성군 생극면 오신로 399-16','37.025839','127.623314','50000','043-878-2594','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'복상골낚시터','음성군 감곡면 사곡길 279','37.095607','127.669018','30000','043-882-7066','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰손낚시카페','음성군 맹동면 원중로 1434(2층)','36.90955','127.541023','5000~7000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'힐링낚시터','음성군 맹동면 대하2가길 11(지하1층)','36.908066','127.54274','5000~7000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매전','충청북도 괴산군 감물면 매전리 362','36.81828245','127.8860133','15000','051-365-2782','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신흥','충청북도 괴산군 불정면 신흥리 701-3','36.87440983','127.7893156','15000','043-833-4500','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문광','충청북도 괴산군 문광면 양곡리 3-4','36.769021','127.7466789','20000','043-834-4456','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'박달산','충청북도 괴산군 장연면 추점리 58','36.84527458','127.9539078','30000','043-832-8791','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'추산','충청북도 괴산군 불정면 추산리 105','36.90966566','127.8198779','15000','043-833-7866','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어의곡낚시터','충청북도 단양군 매포읍 단양로 1317-8','37.0','128.3','30,000원','043-422-5693','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오동낚시터','충청북도 보은군 회인면 오동4길 89','36.5226','127.5813','30,000원','','향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'입큰붕어낚시터','충청북도 옥천군 동이면 세산2길 10','36.2707834','127.6026089','25,000','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'비야골낚시터','충청북도 옥천군 군북면 비야대정로 282-94, 낚시터','36.3532041','127.5250911','20000','043-731-0235','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오룡낚시터','충청북도 옥천군 이원면 백지길 169-1, 주택','36.2282367','127.6764916','25000','043-731-1320','붕어류, 기타내수면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'의평낚시터','충청북도 옥천군 이원면 의평길 76, 주택','36.2111008','127.6231871','25000','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백지리낚시터','충청북도 옥천군 이원면 백지1길 38-12','36.2341709','127.6762404','25000','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'방아실낚시터','충청북도 옥천군 군북면 비야대정로 821, 창고','36.3864965','127.532302','25000','','붕어류, 기타내수면류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은행리낚시터','충청북도 옥천군 군서면 곤룡로 428-31','36.2687414','127.5033369','20,000','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'군서낚시터(구,장령산)','충청북도 옥천군 군서면 동평2길 12-24, 주택','36.2761886','127.5288594','20,000','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대밖낚시터','충청북도 옥천군 이원면 대흥2길 32','36.2446326','127.6219535','30,000','','기타 내수면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대박실내낚시터','충청북도 옥천군 이원면 대흥2길 28, 대박낚시터','36.2462321','127.6222385','30,000','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중해레저낚시터','충청북도 옥천군 동이면 금강로 17-8','36.2954288','127.6135057','40,000','','참돔,우럭,기타해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'톨게이트 낚시터','충청북도 진천군 진천읍 상신2길 53','36.8662','127.4749','낚시터 문의','','붕어, 향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'구수리 낚시터','충청북도 진천군 백곡면 안구수길 34-28, 구수리낚시터','36.8870','127.3606','낚시터 문의','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'개미낚시터','충청북도 진천군 덕산읍 구산리 713-6','36.8762','127.5123','낚시터 문의','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'초평낚시터','충청북도 진천군 초평면 평화로 482, 초평호 다목적 광장','36.8103','127.5115','낚시터 문의','','메기, 붕어, 베스, 동자개');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백곡낚시터','충청북도 진천군 진천읍 백곡로 1140-14, 초원','36.8710','127.3983','낚시터 문의','','메기, 붕어, 베스');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'극동낚시터','음성군 감곡면 성주로 362-17','37.14878','127.64593','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰손낚시카페','음성군 맹동면 원중로 1434(2층)','36.90955','127.541023','9000 ~ 10000/시간','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'복상골낚시터','음성군 감곡면 사곡길 279','37.095607','127.669018','40000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'생극낚시터','음성군 생극면 오신로 399-16','37.025839','127.623314','55000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'제수리낚시터','음성군 금왕읍 금일로284번길 100-4','37.010817','127.554459','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용대리낚시터','음성군 삼성면 덕호로 360','37.044544','127.514314','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'감곡낚시터','음성군 감곡면 감노로 67-18','37.076491','127.627197','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉낚시터','음성군 소이면 충갑길 196','36.88901','127.74706','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'거일낚시터','음성군 감곡면 거일길 156','37.108528','127.657346','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오궁낚시터','음성군 감곡면 오궁리 124-2','37.111463','127.672462','25000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰골낚시터','음성군 감곡면 대학길190번길 59','37.138054','127.648323','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'차평낚시터','음성군 생극면 차생로 618-20','37.049326','127.622166','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상곡낚시터','음성군 삼성면 점골길 51','37.013504','127.450467','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼성지낚시터','음성군 삼성면 금일로 1064-6','37.026576','127.484692','20000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중부낚시터','음성군 삼성면 용성로5번길 86-24','37.001845','127.47583','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'맹동낚시터','음성군 맹동면 군자길 1492','36.894167','127.571429','25000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'마이제낚시터','음성군 삼성면 덕정로65번길 102','37.027938','127.494112','25000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'주봉낚시터','음성군 원남면 주봉로 141','36.866529','127.675445','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사계지낚시터','음성군 금왕읍 보습길 77','37.020711','127.551423','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'내곡낚시터','음성군 금왕읍 마루택길29번길 63','37.01744','127.53839','25000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백야낚시터','음성군 금왕읍 백야로 320','39.967806','127.603211','30000','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'선고낚시터','충청북도 제천시 약초로16길 65','36.890815','128.195143','50,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명지낚시터','충청북도 제천시 무지동길56','37.104747','128.192859','30,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'연론낚시터(짱가네, 돌감)','충청북도 제천시 연론리 573-2번지 외 28필지','36.974681','128.127429','60,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가마실낚시터','충청북도 제천시 자작동 13','37.121795','128.297684','10,000원(캠핑이용시 무료)','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리곡낚시터','충청북도 제천시 청풍면 실리곡리 산7-1번지 외 8필지','36.975227','128.172761','60,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오산낚시터','충청북도 제천시 청풍면 오산리 209-1번지 외 17필지','37.005337','128.090962','60,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신리낚시터','충청북도 제천시 청풍면 신리 233-1번지 외 14필지','36.995289','128.152191','60,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대류한버들낚시터','충청북도 제천시 청풍면 대류리 90번지 외 27필지','36.993111','128.142743','60,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'후산낚시터','충청북도 제천시 청풍면 후산리 154번지 외 31필지','37.0296435','128.1225532','60,000원','','향어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'쌍용낚시터','충청북도 제천시 송학면 삽둔로 93','37.2034563','128.328410','60,000원','','향어+붕어+메기+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'은성낚시공원','충청북도 제천시 봉양읍 논골로 242, (삼거리)','37.1056988','128.130098','30,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'단리낚시터','충청북도 제천시 청풍면 단리 245번지 외 6필지','36.9822596','128.144141','50,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백야낚시터','음성군 금왕읍 백야로 320','39.967806','127.603211','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'내곡낚시터','음성군 금왕읍 마루택길29번길 63','37.01744','127.53839','25,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사계지낚시터','음성군 금왕읍 보습길 77','37.020711','127.551423','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'주봉낚시터','음성군 원남면 주봉로 141','36.866529','127.675445','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'마이제낚시터','음성군 삼성면 덕정로65번길 102','37.027938','127.494112','25,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'맹동낚시터','음성군 맹동면 군자길 1492','36.894167','127.571429','25,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중부낚시터','음성군 삼성면 용성로5번길 86-24','37.001845','127.47583','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼성지낚시터','음성군 삼성면 금일로 1064-6','37.026576','127.484692','25,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'상곡낚시터','음성군 삼성면 점골길 51','37.013504','127.450467','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'차평낚시터','음성군 생극면 차생로 618-20','37.049326','127.622166','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰골낚시터','음성군 감곡면 대학길190번길 59','37.138054','127.648323','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오궁낚시터','음성군 감곡면 오궁리 124-2','37.111463','127.672462','25,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'거일낚시터','음성군 감곡면 거일길 156','37.108528','127.657346','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉낚시터','음성군 소이면 충갑길 196','36.88901','127.74706','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'감곡낚시터','음성군 감곡면 감노로 67-18','37.076491','127.627197','20,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용대리낚시터','음성군 삼성면 덕호로 360','37.044544','127.514314','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'제수리낚시터','음성군 금왕읍 금일로284번길 100-4','37.010817','127.554459','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'생극낚시터','음성군 생극면 오신로 399-16','37.025839','127.623314','55,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'복상골낚시터','음성군 감곡면 사곡길 279','37.095607','127.669018','40,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'극동낚시터','음성군 감곡면 성주로 362-17','37.14878','127.64593','30,000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'늘푸른','충주시 살미면 월악로 745-40','36.918487','128.034754','60000','043-852-4582','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'병호','충주시 살미면 내사6길 30','36.910801','128.020763','60000','043-851-1478','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'문골','충주시 살미면 월악로 621','36.919744','128.025544','60000','','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'윤','충주시 살미면 월악로 473','36.911502','128.017363','60000','043-851-6200','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'제일','충주시 살미면 내사리 568-2','36.908522','128.012356','60000','043-851-0052','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신매','충주시 살미면 충주호수로 2707','36.919276','128.020149','60000','043-851-7987','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하천','충주시 동량면 하천1길 26','37.027482','128.044072','60000','043-851-0025','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명서','충주시 산척면 정암산책길 140-1','37.058406','128.042049','60000','043-852-9520','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'목벌','충주시 목벌길 111','36.967967','128.001411','60000','','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'입석','충주시 중앙탑면 감노로 2301','37.026011','127.845269','70000','043-855-4688','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'꽃바위','충청북도 충주시 동량 화암 319 외 22필지','36.977308','128.018005','60000','','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서운','충주시 동량면 지등로 1758','36.970944','128.049841','60000','043-851-4803','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'솔','충청북도 충주시 동량 서운 353외 14필지','36.974192','128.051902','60000','043-851-4278','붕어, 잉어, 뱀장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'종점','충주시 동량면 지등로 2003','36.979865','128.056105','60000','043-852-9627','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중산','충주시 수안보면 중산길 185','36.870547','128.010504','30000','043-847-1924','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용원','충주시 신니면 신덕로 523','37.002766','127.709915','70000','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대덕','충주시 노은면 대덕길 119','37.058787','127.709089','70000','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'모점','충주시 앙성면 모점1길 128','37.156326','127.738208','60000','043-855-8822','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실로암','충주시 주덕읍 충청대로 2350','36.963004','127.781525','30000','043-851-3648','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화곡','충주시 주덕읍 화곡1길 531','37.011374','127.806688','80000','043-845-6971','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'태고','충주시 금가면 금병길 55','37.057673','127.912283','20000','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'털보','충주시 금가면 장대산길 14','37.015584','127.876401','80000','043-853-0847','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월상','충주시 더덕길 47','37.041286','127.866814','30000','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도장골','충주시 대가주2길 23','36.94402093','127.9250683','30000','043-855-4448','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가주','충주시 연수동 국원대로 184','36.93248882','127.8915027','30000','043-851-2221','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'죠스실내낚시카페','충주시 금봉대로 343','36.98800803','127.9286064','10000','','잉어, 향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오가리','충청북도 괴산군 장연면 오가리 569-8','36.815782','127.951453','30000','043-833-2002','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새골낚시터','충청북도 보은군 탄부면 평각1길 62','36.4663','127.7541','30,000원','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사오단돈낚시터(사오,단돈)','충청북도 제천시 청풍면 호반로 2686','37.0394019','128.110997','10,000원, 60,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'국사봉낚시터','충청북도 제천시 봉양읍 구곡로 173-1','37.0717077','128.108623','30,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'양평낚시터','충청북도 제천시 청풍면 양평리 432','36.9900474','128.103821','10,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕곡낚시터','충청북도 제천시 한수면 봉화재11길 24-41','36.945013','128.111496','60,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서창낚시터','충청북도 제천시 한수면 봉화재길 819-2','36.9517671','128.111061','60,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명암낚시터','충청북도 제천시 봉양읍 명암로 243','37.1675804','128.126267','30,000원','','향어+붕어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용곡낚시터(김기호낚시터)','충청북도 제천시 청풍면 용곡리 산 36','36.9843910','28.122833','60,000원','','향어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'계룡 낚시터','충청남도 공주시 계룡면 하대리 485-1(계룡저수지)','36.36086703','127.1576725','20000','041-857-8104','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'정안 낚시터','충청남도 공주시 정안면 운궁리 327-4','36.5804523','127.110813','20000','041-855-5755','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능애 낚시터','충청남도 공주시 정안면 평정리 529-1(평정저수지)','36.55407334','127.083822','20000','041-854-3664','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월곡 낚시터','충청남도 공주시 의당면 월곡리 4-3(월곡저수지)','36.53973952','127.162541','20000','041-852-0191','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'경천 낚시터','충청남도 공주시 계룡면 양화리(경천저수지)','36.3339378','127.1718409','20000','041-855-0921','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'행복 낚시터','충청남도 공주시 의당면 두만리 28(요룡저수지)','36.54898473','127.1448196','20000','041-854-9506','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우목 낚시터','충청남도 공주시 우성면 용봉리 700(우목저수지)','36.4405707','127.009396','20000','041-855-4818','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중흥 낚시터','충청남도 공주시 의당면 도신리 487(중흥저수지)','36.57675859','127.1725335','20000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고성 낚시터','충청남도 공주시 정안면 고성리(고성저수지)','36.58824678','127.0916593','20000','041-858-4600','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명곡 낚시터','충청남도 공주시 유구읍 명곡리 436-3(명곡저수지)','36.59894926','126.9385268','20000','041-841-6929','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰목길낚시터','충청남도 공주시 공주시 옥룡동 상왕통286','36.47066341','127.0771193','25000','041-858-6900','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자연농원','충청남도 공주시 공주시 정안면 광정리200-5','36.47066341','127.0771193','25000','041-858-1438','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우성낚시터','충청남도 공주시 공주시 우성면 상서리114-2','36.47066341','127.0771193','25000','041-853-8400','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'훼미리낚시터','충청남도 공주시 공주시 상왕동 779-7','36.47066341','127.0771193','25000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린 낚시터','충청남도 공주시 계룡면 중장리 101','36.37153325','127.1686461','25000','041-857-5244','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'반산낚시터','충청남도 부여군 규암면 수목리 12-2','36.270867','126.839653','1일 5000원','041-835-1997','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린 낚시터','충청남도 공주시 계룡면 중장리 101','36.37153325','127.1686461','25000','041-857-5244','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'훼미리낚시터','충청남도 공주시 공주시 상왕동 779-7','36.47066341','127.0771193','25000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우성낚시터','충청남도 공주시 공주시 우성면 상서리114-2','36.47066341','127.0771193','25000','041-853-8400','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자연농원','충청남도 공주시 공주시 정안면 광정리200-5','36.47066341','127.0771193','25000','041-858-1438','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰목길낚시터','충청남도 공주시 공주시 옥룡동 상왕통286','36.47066341','127.0771193','25000','041-858-6900','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명곡 낚시터','충청남도 공주시 유구읍 명곡리 436-3(명곡저수지)','36.59894926','126.9385268','20000','041-841-6929','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고성 낚시터','충청남도 공주시 정안면 고성리(고성저수지)','36.58824678','127.0916593','20000','041-858-4600','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중흥 낚시터','충청남도 공주시 의당면 도신리 487(중흥저수지)','36.57675859','127.1725335','20000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우목 낚시터','충청남도 공주시 우성면 용봉리 700(우목저수지)','36.4405707','127.009396','20000','041-855-4818','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'행복 낚시터','충청남도 공주시 의당면 두만리 28(요룡저수지)','36.54898473','127.1448196','20000','041-854-9506','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'경천 낚시터','충청남도 공주시 계룡면 양화리(경천저수지)','36.3339378','127.1718409','20000','041-855-0921','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월곡 낚시터','충청남도 공주시 의당면 월곡리 4-3(월곡저수지)','36.53973952','127.162541','20000','041-852-0191','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능애 낚시터','충청남도 공주시 정안면 평정리 529-1(평정저수지)','36.55407334','127.083822','20000','041-854-3664','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'정안 낚시터','충청남도 공주시 정안면 운궁리 327-4','36.5804523','127.110813','20000','041-855-5755','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'계룡 낚시터','충청남도 공주시 계룡면 하대리 485-1(계룡저수지)','36.36086703','127.1576725','20000','041-857-8104','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'왜목해맞이 좌대낚시터','충청남도 당진시 석문면 왜목길 30','37.20','126.32','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'왜목마을 좌대낚시터','충청남도 당진시 석문면 왜목길 15-5','37.20','126.32','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼성호 좌대낚시터','충청남도 당진시 석문면 왜목길 30','37.2','126.32','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린좌대2 낚시터','충청남도 당진시 석문면 장고항로 334-48','37.20','126.33','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린좌대1 낚시터','충청남도 당진시 석문면 장고항로 334-48','37.20','126.33','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'돌고래 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'스카이 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장고항바다 좌대낚시터','충청남도 당진시 석문면 장고항로 334-48','37.20','126.33','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아쿠아 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.01','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'부흥호 가두리 낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낚시타운 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'와따 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'미리내2호 가두리낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'미리내 가두리낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'난지섬 해상낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕진호 좌대낚시터','충청남도 당진시 석문면 장고항로 334-48','37.20','126.33','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'훼미리호 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해성2호 좌대낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'무기수산 좌대 낚시터','충청남도 당진시 석문면 난지3길 12','37.00','126.27','50,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서해대교바다낚시터','충청남도 당진시 신평면 샛터길 117-121','37.00','126.27','60,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'병기호 좌대낚시터','충청남도 당진시 석문면 왜목길 30','37.20','126.32','30,000원','','우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'추정실내낚시터','충청남도 금산군 추부면 추동2길 91','36.1712002','127.4647171','1일 20,000원','041-754-6660','붕어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'배내미낚시터','충청남도 금산군 복수면 배내미로 107','36.15089','127.40153','1일 20,000원','041-751-2032','붕어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수정낚시터','충청남도 금산군 군북면 군북로 1057','36.1973735','127.5203','1일 20,000원','041-752-2191','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'계룡 낚시터','충청남도 공주시 계룡면 하대리 485-1(계룡저수지)','36.36086703','127.1576725','20000','041-857-8104','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월선 낚시터','충남 아산시 영인면 아산로1233번길 54','36.873699','126.931875','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신왕지낚시터','충남 아산시 둔포면 이화동길115번길 50','36.9142133','127.0875782','30000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오목낚시터','충남 아산시 신창면 서부남로675번길 48','36.7955718','126.933069','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송악 낚시터','충남 아산시 송악면 송악로 560','36.7214327','126.9898213','10000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산들 낚시터','충남 아산시 배방읍 고불로 229','36.725676','127.0596219','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'냉정 낚시터','충남 아산시 인주면 서해로548번길 158','36.868245','126.904669','15000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월랑 낚시터','충남 아산시 음봉면 월랑길 15-10','36.8436697','127.0804385','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대동 낚시터','충남 아산시 음봉면 송촌리 34','36.847840','127.046914','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신수 낚시터','충남 아산시 음봉면 신수리 51-1','36.843918','126.998310','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'염치 낚시터','충남 아산시 염치읍 동정길 159-4','36.821763','126.993657','15000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신휴 낚시터','충남 아산시 음봉면 신휴길122','36.8910242','127.0704905','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉재 낚시터','충남 아산시 둔포면 충무로 1258-32','36.883092','127.032207','25000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'안골 낚시터','충남 아산시 영인면 고룡산로 448','36.8789658','126.9878422','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'죽산 낚시터','충남 아산시 선장면 서부남로 344','36.7857711','126.8978959','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신봉 낚시터','충청남도 아산시 영인면 윤보선로211','36.8943151','127.0039684','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'영인 낚시터','충남 아산시 영인면 영인로 159-20','36.8627459','126.9487696','20000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'잔실 낚시터','충남 아산시 음봉면 신정리 397','36.8735582','127.0167286','10000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삽교천 낚시터','충남 아산시 인주면 아산만로1363','36.8526333','126.8545664','10000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동암 낚시터','충남 아산시 음봉면 음봉로447번길 50','36.8469204','127.0604064','10000','','붕어,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낭만물고기실내낚시카페','충남 아산시 배방읍 배방로13번길 23, 2층','36.775944','127.056904','10000','','메기,잉어,향어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아산락실내바다낚시터','충남 아산시 염치읍 백암길 148-1','36.8058557','127.0359602','40000','','참돔,활점농어,바닷가재 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서부낚시터','충청남도 서천군 종천면 대백제로 1458','36.12103723','126.692348','1일 60000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'배다리낚시터','충청남도 서천군 서면 주원로 10-3','36.15600648','126.572178','1일 60000원','','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실내바다낚시터','충청남도 서산시 서령로 3, 지하1층 (동문동)','36.78402','126.452','20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'창리해상낚시터','충청남도 서산시 부석면 창리 지선','36.369181','126.224581','50000','','우럭+숭어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕송지낚시터','충청남도 서산시 팔봉면 덕송리 842-5','36.835062','126.339584','80000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대요낚시터','충청남도 서산시 지곡면 대요리 713','36.886992','126.428141','60000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'계룡 낚시터','충청남도 공주시 계룡면 하대리 485-1(계룡저수지)','36.36086703','127.1576725','20000','041-857-8104','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'정안 낚시터','충청남도 공주시 정안면 운궁리 327-4','36.5804523','127.110813','20000','041-855-5755','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능애 낚시터','충청남도 공주시 정안면 평정리 529-1(평정저수지)','36.55407334','127.083822','20000','041-854-3664','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월곡 낚시터','충청남도 공주시 의당면 월곡리 4-3(월곡저수지)','36.53973952','127.162541','20000','041-852-0191','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'경천 낚시터','충청남도 공주시 계룡면 양화리(경천저수지)','36.3339378','127.1718409','20000','041-855-0921','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'행복 낚시터','충청남도 공주시 의당면 두만리 28(요룡저수지)','36.54898473','127.1448196','20000','041-854-9506','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우목 낚시터','충청남도 공주시 우성면 용봉리 700(우목저수지)','36.4405707','127.009396','20000','041-855-4818','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중흥 낚시터','충청남도 공주시 의당면 도신리 487(중흥저수지)','36.57675859','127.1725335','20000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고성 낚시터','충청남도 공주시 정안면 고성리(고성저수지)','36.58824678','127.0916593','20000','041-858-4600','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명곡 낚시터','충청남도 공주시 유구읍 명곡리 436-3(명곡저수지)','36.59894926','126.9385268','20000','041-841-6929','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰목길낚시터','충청남도 공주시 공주시 옥룡동 상왕통286','36.47066341','127.0771193','25000','041-858-6900','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자연농원','충청남도 공주시 공주시 정안면 광정리200-5','36.47066341','127.0771193','25000','041-858-1438','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우성낚시터','충청남도 공주시 공주시 우성면 상서리114-2','36.47066341','127.0771193','25000','041-853-8400','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'훼미리낚시터','충청남도 공주시 공주시 상왕동 779-7','36.47066341','127.0771193','25000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린 낚시터','충청남도 공주시 계룡면 중장리 101','36.37153325','127.1686461','25000','041-857-5244','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린 낚시터','충청남도 공주시 계룡면 중장리 101','36.37153325','127.1686461','25000','041-857-5244','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'훼미리낚시터','충청남도 공주시 공주시 상왕동 779-7','36.47066341','127.0771193','25000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우성낚시터','충청남도 공주시 공주시 우성면 상서리114-2','36.47066341','127.0771193','25000','041-853-8400','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자연농원','충청남도 공주시 공주시 정안면 광정리200-5','36.47066341','127.0771193','25000','041-858-1438','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'큰목길낚시터','충청남도 공주시 공주시 옥룡동 상왕통286','36.47066341','127.0771193','25000','041-858-6900','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명곡 낚시터','충청남도 공주시 유구읍 명곡리 436-3(명곡저수지)','36.59894926','126.9385268','20000','041-841-6929','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고성 낚시터','충청남도 공주시 정안면 고성리(고성저수지)','36.58824678','127.0916593','20000','041-858-4600','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중흥 낚시터','충청남도 공주시 의당면 도신리 487(중흥저수지)','36.57675859','127.1725335','20000','000-000-0000','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우목 낚시터','충청남도 공주시 우성면 용봉리 700(우목저수지)','36.4405707','127.009396','20000','041-855-4818','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'행복 낚시터','충청남도 공주시 의당면 두만리 28(요룡저수지)','36.54898473','127.1448196','20000','041-854-9506','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'경천 낚시터','충청남도 공주시 계룡면 양화리(경천저수지)','36.3339378','127.1718409','20000','041-855-0921','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월곡 낚시터','충청남도 공주시 의당면 월곡리 4-3(월곡저수지)','36.53973952','127.162541','20000','041-852-0191','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능애 낚시터','충청남도 공주시 정안면 평정리 529-1(평정저수지)','36.55407334','127.083822','20000','041-854-3664','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'정안 낚시터','충청남도 공주시 정안면 운궁리 327-4','36.5804523','127.110813','20000','041-855-5755','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'죽도해상낚시터','충청남도 홍성군 서부면 남당항로','36.519993','126.435763','40,000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수신낚시터','충청남도 천안시 동남구 수신면 발산리 451','36.71158316','127.2940376','1일 20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'마정낚시터','충청남도 천안시 서북구 직산읍 금곡로 176','36.87443248','127.0999291','1일 20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남창낚시터','충청남도 천안시 서북구 성거읍 송남리 92','36.86121783','127.1990668','1일 30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'무네미낚시터','충청남도 천안시 동남구 동면 장송죽계길 40','36.78076246','127.3704271','1일 30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'부대낚시터','충청남도 천안시 서북구 부대동 40-19','36.84090025','127.1590725','1일 20000','','붕어,잉어,향어,메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신월낚시터','충청남도 천안시 서북구 성거읍 신월리 82','36.86809119','127.1646074','1일 15000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'석곡낚시터','충청남도 천안시 서북구 성환읍 율금리 730-8','36.89071113','127.1028245','1일 20000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕성낚시터','충청남도 천안시 동남구 동면 덕성1길 52','36.80984881','127.3697076','1일 10000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'방축낚시터','충청남도 천안시 서북구 직산읍 군동리 33','36.89959299','127.1693812','1일 10000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'지산낚시터','충청남도 천안시 동남구 목천읍 교천지산길 301','36.79394042','127.1929426','1일 30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신당낚시터','충청남도 천안시 서북구 신당새터1길 102','36.85083257','127.1631241','1일 30000','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'천북 해양낚시터','충청남도 보령시 천북면 장은리 굴단지 앞 해상','36.50629','126.48156','20,000원','','조피볼락 등 어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원산도 선촌 해양낚시터','충청남도 보령시 원산도리 540지선','36.385009','126.42969','20,000원','','조피볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'숲속애바다실내낚시터','충청남도 보령시 통나무1길 80','36.329072','126.52855','기본 78,000원, 짬낚시(1회 4시간) 40,000원','041-931-1502','돔류+조피볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'포인트낚시터','충청남도 예산군 광시면 광시동로 105-6','36.5512335','126.7836066','7~15만원','041-332-0334','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'붕어나라낚시터','충청남도 예산군 광시면 동산리 80','36.583353','126.798536','7~15만원','041-333-1110','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'애플낚시터','충청남도 예산군 광시면 동산리 91-2','36.584366','126.796354','7~15만원','041-332-0440','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장전정자나무낚시터','충청남도 예산군 광시면 예당남로 41','36.58614175','126.7983663','7~15만원','041-332-0356','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'숲속낚시터','충청남도 예산군 광시면 서초정2길 106-25','36.58751042','126.8190405','7~15만원','041-332-0294','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'평촌낚시터','충청남도 예산군 광시면 예당남로 110-10','36.58894344','126.8057143','7~15만원','041-332-0005','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장전낚시터','충청남도 예산군 광시면 예당남로 203','36.59355949','126.8112912','7~15만원','041-332-0334','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'예당저수지연안낚시터','충청남도 예산군 대흥면 예당로 874','36.59488','126.795895','7~15만원','041-333-0545','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오리장낚시터','충청남도 예산군 광시면 장전리 613','36.595285','126.796931','7~15만원','041-332-0392','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도덕골낚시터','충청남도 예산군 광시면 예당남로 224-14','36.59536057','126.8132112','7~15만원','041-332-0321','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낚시여행낚시터','충청남도 예산군 대흥면 송지리 73','36.600009','126.812147','7~15만원','041-333-2550','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'임존성낚시터','충청남도 예산군 대흥면 상중리 26','36.602548','126.794878','7~15만원','041-333-2606','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'예당임존성낚시터','충청남도 예산군 대흥면 상중리 26','36.602548','126.794878','7~15만원','041-333-2606','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'예당낚시터','충청남도 예산군 대흥면 예당로 832-9','36.60288989','126.7934516','7~15만원','041-332-0176','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린낚시터','충청남도 예산군 대흥면 예당로 836','36.60380705','126.793591','7~15만원','041-332-1077','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'피쉬뱅크낚시터','충청남도 예산군 대흥면 상중리 2','36.606861','126.794082','7~15만원','041-333-1330','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'연안낚시터','충청남도 예산군 대흥면 예당로 874','36.60715312','126.7929425','7000원','041-333-0545','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대양낚시터','충청남도 예산군 대흥면 동서리 182','36.609295','126.791431','7~15만원','041-332-3311','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'2박3일낚시터','충청남도 예산군 대흥면 하탄방리 154-1','36.611772','126.820533','7~15만원','','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낚시회관낚시터','충청남도 예산군 대흥면 동서리 245','36.612138','126.792641','7~15만원','041-332-0020','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'인천낚시터','충청남도 예산군 대흥면 대야리 86','36.615188','126.808158','7~15만원','041-334-4779','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새물낚시터','충청남도 예산군 신양면 무봉리 295','36.617006','126.824655','7~15만원','041-335-3187','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'만수낚시터','충청남도 예산군 대흥면 교촌리 317','36.617511','126.790705','7~15만원','041-332-0043','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'교촌낚시터','충청남도 예산군 대흥면 교촌리 301','36.620048','126.788601','7~15만원','041-332-3222','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'검은솔밭낚시터','충청남도 예산군 대흥면 신속대야로 245-29','36.62033248','126.806525','7~15만원','041-334-5466','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'정자낚시터','충청남도 예산군 대흥면 금마로 776','36.62139332','126.7762188','7~15만원','041-332-0003','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'하와이낚시터','충청남도 예산군 대흥면 신속대야로 294','36.62530884','126.8089246','7~15만원','041-335-4581','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'월척낚시터','충청남도 예산군 응봉면 신리 46','36.626387','126.793371','7~15만원','041-333-4146','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'진수낚시터','충청남도 예산군 응봉면 예당로 1131','36.62775911','126.7898603','7~15만원','041-332-0164','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'무지개낚시터','충청남도 예산군 대흥면 신속대야로 356','36.62829339','126.8136337','7~15만원','041-335-5772','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한믈낚시터','충청남도 예산군 응봉면 후사리 33','36.6395509','126.801398','7~15만원','041-331-5117','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'방산낚시터','충청남도 예산군 대술면 방산리 143-2','36.65966566','126.936771','9~13만원','041-332-6630','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용봉낚시터','충청남도 예산군 덕산면 둔리 504-9','36.66508767','126.6466247','9~13만원','041-336-2915','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송석낚시터','충청남도 예산군 대술면 대술동로 387-10','36.68755801','126.946816','2~13만원','041-333-7959','붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'의항리해상공원','충청남도 태안군 소원면 송의로 698','36.82964098','126.1616348','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'호포유어','충청남도 태안군 안면읍 여수해길 126-139','36.55435297','126.3724757','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수평선좌대','충청남도 태안군 고남면 옷점길 147-46','36.41310226','126.400991','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'그린바다','충청남도 태안군 고남면 젓개길 274-3','36.435815','126.4307282','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매일좌대','충청남도 태안군 고남면 빗독2길 2','36.423297','126.409575','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오형제','충청남도 태안군 고남면 젓개길 276-1','36.43592403','126.430585','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'달빛좌대','충청남도 태안군 안면읍 안면대로 2984-4','36.51129018','126.347753','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'오뚜기','충청남도 태안군 고남면 젓개길 276-1','36.43592403','126.430585','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'순정좌대','충청남도 태안군 고남면 구매길 41-36','36.42707357','126.430339','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수진좌대','충청남도 태안군 고남면 누동로 21-23','36.43325976','126.4046197','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용성좌대','충청남도 태안군 고남면 발화지길 254-8','36.44021872','126.4196768','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'인어좌대','충청남도 태안군 고남면 구매길 41-1','36.42553196','126.426836','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'형제','충청남도 태안군 고남면 젓개길 276-1','36.43592403','126.430585','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남일수산좌대','충청남도 태안군 안면읍 장터로 254-11','36.528999','126.348326','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'킹콩좌대','충청남도 태안군 고남면 빗독2길6','36.42351821','126.409325','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'소망좌대','충청남도 태안군 고남면 구매길 67','36.424694','126.4293151','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수진좌대2','충청남도 태안군 고남면 누동로 21-23','36.43325976','126.4046197','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'태안바다','충청남도 태안군 태안읍 중앙로 187','36.749468','126.308131','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'갈음이 해상낚시공원','충청남도 태안군 근흥면 갈음이길 105-1','36.69441068','126.159344','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해성좌대','충청남도 태안군 남면 한바위길 6-24','36.62142778','126.347343','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성호1좌대','충청남도 태안군 남면 한바위길 10-17','36.655894','126.302754','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'성호좌대','충청남도 태안군 남면 한바위길 10-17','36.655894','126.302754','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'만길호좌대','충청남도 태안군 남면 한바위길 36-9','36.62075219','126.3536715','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'태극호좌대','충청남도 태안군 남면 한바위길 10-1','36.62123687','126.350006','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'남용호좌대','충청남도 태안군 남면 당암리 1-12','36.619672','126.354366','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대원호좌대','충청남도 태안군 남면 한바위길 54-10','36.621556','126.3543847','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'수성호좌대','충청남도 태안군 남면 한바위길 54-12','36.62135688','126.354174','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해인호좌대','충청남도 태안군 남면 한바위길 36-21','36.62031491','126.354128','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황금좌대','충청남도 태안군 남면 천수만로 340-7','36.621423','126.3467617','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신진좌대','충청남도 태안군 남면 한바위길 36-7','36.62086745','126.353658','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'힐링호좌대','충청남도 태안군 남면 한바위길 54-16','36.62094968','126.3541975','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중앙호좌대','충청남도 태안군 남면 한바위길 61','36.62279643','126.354434','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'태극호좌대','충청남도 태안군 남면 한바위길 10-11','36.621567','126.348669','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백호좌대','충청남도 태안군 남면 천수만로 340-54','36.619584','126.3479666','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'토도수산','충청남도 태안군 안면읍 대야로 323-45','36.46592426','126.4154688','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'어성','충청남도 태안군 안면읍 대야로 323-7','36.4654124','126.414806','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'여정수산','충청남도 태안군 안면읍 응지마을길 20-7','36.51758799','126.345242','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'천우수산','충청남도 태안군 안면읍 대야로 304-41','36.46427427','126.4163916','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대박','충청남도 태안군 고남면 안면대로 4407-239','36.4182042','126.428521','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'미조리','충청남도 태안군 고남면 월고지길 49-7','36.39971346','126.4263766','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대일','충청남도 태안군 고남면 고남리 125','36.407639','126.42209','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'안면도영목항','충청남도 태안군 고남면 안면대로 4558','36.400055','126.426424','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'영목수산좌대','충청남도 태안군 고남면 월고지길 53','36.399587','126.4265487','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'경남수산','충청남도 태안군 고남면 탄개길 33','36.40810295','126.422973','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'강남호','충청남도 태안군 고남면 안면대로 4439','36.408243','126.419369','100000','','우럭');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자바라','전라북도 전주시 완산구 평화로 69','35.7830203','127.1331617','1일 10000원','063-228-5557','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송현낚시터','전라북도 완주군 고산면 남봉로 5-98, 송현낚시터','35.9679','127.1867','20,000원','','붕어, 송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산외 강현낚시터','전라북도 정읍시 산외면 상두1길 11-17','35.6315183','127.0596968','08시~22시 / 25,000원08시~익일 08시 / 50,000원','063-532-1112','붕어,잉어,기타 내수면어종');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우정낚시터','전라북도 정읍시 소성면 소성상평로 238','35.5603433','126.8053888','1일 15000원','063-533-1322','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백화낚시터','전라북도 진안군 안천면 진무로 3206','35.9014400360','127.5741779962','1일 20,000원','063-432-5449','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'낚GO먹GO','전라북도 군산시 수송로 17, 수리야 (나운동)','35.9682711144','126.6987552799','25,000원/시간','063-466-7959','광어, 우럭 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신시도 유료낚시터','전라북도 군산시 옥도면 신시도길 40','35.8181250898','126.4490188990','20,000원','','우럭, 도미 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'자연을닮은사람들','전라북도 임실군 관촌면 용산리 176-6 자연을닮은사람들','35.645866','127.286135','35000원','','향어류, 잉어류, 붕어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'호암낚시터','전라북도 임실군 신평면 호암3길 1-20, 호암사계절낚시터','35.654754','127.24716','20000원','','붕어류, 잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'땅끝낚시터','전라남도 해남군 송지면 갈산길 93, 땅끝낚시터','34.305560','126.516116','','061-536-1234','돔류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해남바다낚시터','전라남도 해남군 화원면 영호길 42-18, 구성리 지선','','','','','갈치');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'가우도 복합낚시공원','전라남도 강진군 도암면 가우도길 2-13','','','-성인 1인 : 10,000원 -청소년 1인 : 5,000원','','강성돔, 농어, 붕장어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'서중어촌체험마을','전라남도 강진군 마량면 까막섬로 75-7','','','1박2일 숙박 기준 -8명 : 250,000원 -6명 : 180,000원 -4명 : 150,000원 -2명 : 100,000원','','장어, 돔 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'정남진 해양낚시공원','전라남도 장흥군 회진면 해양낚시길 135','34.4706335','126.9740566','성인 20,000원, 청소년 10,000원','061-867-0555','감성돔+광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대물낚시터','전라남도 화순군 청풍면 차풍로 369','34.906923','126.978714','10000','061-373-1911','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'앵남낚시터','전라남도 화순군 화순읍 앵무동1길 132','35.05032669','126.924278','15000','061-374-9554','잉어+향어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청풍낚시터','전라남도 화순군 청풍면 차풍로 370','34.90460529','126.9802482','20000','061-373-9808','잉어+붕어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'거금해양낚시공원','전라남도 고흥군 금산면 신촌내동길 18-132','34.46942797','127.104524','성인20,000원,청소년10,000원','061-843-6060','감성돔, 노래미');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'홍길동낚시터','전라남도 장성군 삼서면 영장로 2103','35.2346229','126.701275','10000','061-392-2738','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황룡강낚시터','전라남도 장성군 장성읍 강변안길 18','35.297111','126.775019','10000','061-394-0023','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'청풍낚시터','전라남도 화순군 청풍면 차풍로 370','34.90460529','126.9802482','20000','061-373-9808','잉어+붕어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'앵남낚시터','전라남도 화순군 화순읍 앵무동1길 132','35.05032669','126.924278','15000','061-374-9554','잉어+향어+메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'소경어촌계낚시터','전라남도 여수시 소경도1길 15-1','34.70848891','127.707826','5인150000원','','감성돔+농어+우럭+노래미');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'외동어촌계낚시터','전라남도 여수시 대경도4길 41-1','34.71856636','127.729462','4인130000원','','볼락+감성돔+농어+노래미');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'돌산해양낚시공원낚시터','전라남도 여수시 돌산읍 우두1길 12-13','34.727104','127.73669','4인130000원','','볼락+감성돔+농어+노래미');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'여수가족생활낚시터','전라남도 여수시 신월1길 42 1층 신월슈퍼','34.4258515','127.4255849','1인30000원','','도다리+감성돔+농어+노래미');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대물낚시터','전라남도 화순군 청풍면 차풍로 369','34.906923','126.978714','10000','061-373-1911','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신안낚시터','전라남도 신안군 압해읍 복룡로 688-6, 복룡횟집','34.9053327468','126.3383432945','1인당 25000원','','돔+장어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'나룻가낚시터','전라남도 신안군 압해읍 복룡로 669-4','34.9069290705','126.3383241426','1인당 25000원','','돔+장어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'콜낚시','전라남도 신안군 압해읍 장감길 220','34.8190416552','126.3346096405','1인당 25000원','','돔+장어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'새마을낚시터','경상북도 경주시 내남면 내남로 393-20','35.78205433','129.1865307','10,000원/일','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼괴정낚시터','경상북도 경주시 강동면 다산길 117','36.04980649','129.2594352','30,000원/일','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동산낚시터','경상북도 경주시 천북면 천강로 123-5','35.90181187','129.275109','30,000원/일','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕방낚시터','경상북도 경주시 외동읍 덕방지길 19-38','35.70590206','129.297816','30,000원/일','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'인동낚시터','경상북도 경주시 강동면 인좌안길 6-1','35.98661005','129.2624603','10,000원/일','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'광지낚시터','경상북도 경주시 건천읍 천포방내길 98-9','35.83813866','129.0986789','25,000원/일','','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'매전낚시터','경상북도 청도군 매전면 온장길 142','35.637162','128.851936','1일 15000원','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'구봉낚시터','경상북도 칠곡군 지천면 낙산로5길 144-55','35.942340','128.511751','30,000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'호암지낚시터','경상북도 칠곡군 약목면 남계리 1046','36.024887','128.355128','10,000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도속지낚시터','경상북도 칠곡군 북삼읍 오평리 1381','36.055072','128.368072','10,000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'천평지낚시터','경상북도 칠곡군 가산면 금화리 36외 25필지','36.076021','128.549696','25,000원','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봇또랑낚시터','경상북도 칠곡군 북삼읍 율리 549-5,551-2,551-3,553-5,549-5','36.054527','128.340378','10,000원','','잉어+붕어+송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'지동낚시터','경상북도 안동시 임동면 고천지촌로 1061','36.5068753324','128.9941228709','2023년 4월 1일 까지 휴업','','쏘가리, 붕어, 잉어, 메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장기낚시터','경상북도 안동시 북후면 북평로 697-16','36.6699333568','128.7024187730','1일 20,000원','054-859-5229','붕어, 잉어, 메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'선어대낚시터','경상북도 안동시 남선면 기느리길 252','36.5444531618','128.7738989775','1일 10,000원','','붕어, 잉어, 메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'평은낚시터','경상북도 영주시 평은면 강동로410번길 24','36.71467002','128.6879693','30,000원','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'파지낚시터','경상북도 영주시 장수면 장수로 827, 파지리낚시터','36.8021328','128.5475622','15,000원','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'귀내낚시터','경상북도 영주시 고현동 412-50','36.837674','128.6173471','20,000원 30,000원(장비 대여시)','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'이천낚시터','경상북도 상주시 외서면 이천2길83','36.47767421','128.1395139','10,000원','054-531-0313','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'세천낚시터','경상북도 상주시 외서면 서당골길 28','36.46930111','128.1652661','5,000원','054-532-7048','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대박낚시터','경상북도 상주시 낙상동 832','36.4570463','128.200855','20,000원','054-535-5857','장어,바다가재,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'평사낚시터','경상북도 경산시 진량읍 평사리 42-2','35.885324','128.868753','20,000원','053-810-6708','잉어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'두메낚시터','경상북도 경산시 남천면 신방길 39','35.7604994','128.7755026','30000원','053-813-7980','메기+붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'명포낚시터','경상북도 성주군 선남면 명포리 15','35.882386','128.331951','평일 10,000, 주말 15,000','051-365-2782','붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'나곡바다낚시공원','경상북도 울진군 북면 석호1길 46-62, 나곡바다낚시공원 종합관','37.11825867','129.3768916','5000','054-781-8037','광어,우럭,강도다리');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'울진시범바다목장해상낚시','경상북도 울진군 평해읍 울진대게로 521-2','36.69906644','129.4756391','5000','054-788-3911','강도다리');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대물낚시터','경상북도 포항시 북구 기계면 봉좌로383번길 32-2','36.08236536','129.1615819','30,000원','','붕어,메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'봉곡낚시터','경상북도 김천시 농소면 봉곡리 67-3','36.0708872','128.1857889','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'조마낚시터','경상북도 김천시 조마면 강곡리 622-1','36.0356454','128.087775','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아포사계절낚시터','경상북도 김천시 아포읍 제석리 1431-7','36.1464838','128.2202','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아포과수원낚시터','경상북도 김천시 아포읍 국사리 155-1','36.1582056','128.2494965','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'배시네낚시터','경상북도 김천시 아포읍 의리 121-1','36.1888737','128.2321408','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'복강유료낚시터','경상북도 김천시 대항면 복전리 188-2','36.131298','128.0231607','10000','','잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'삼사낚시터','경상북도 영천시 고경면 추곡길 215-12','35.98685782','129.0239398','10,000원','054-337-0734','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'강태공낚시터','경상북도 칠곡군 왜관읍 애국동산로 150','36.004523','128.411958','','','붕어,잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'신동지낚시터','경상북도 구미시 인동가산로 590','36.09708','128.4749','(일반) 13000원 + (고등학생이하 및 여성) 10000원','054-472-4071','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'물만난고기','경상북도 구미시 인동중앙로 42','36.10867','128.4229','10,000원/일','054-471-4809','메기+송어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'다산나정','경상북도 고령군 다산면 나선로 312-27','35.83044575','128.3995484','10,000원','','붕어류,잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'개나리','경상북도 고령군 대가야읍 정정골길 67-39','35.741599','128.257505','20,000원','054-956-4804','붕어류,잉어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'역돔낚시터','경상북도 문경시 문경읍 새재로 623','36.55211','128.232232','30000','','틸리피아');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'돌다리낚시터','경상북도 문경시 마성면 은성길 173','36.540228','128.232232','25000','','잉어 외');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'우지낚시터','경상북도 문경시 갈밭길 7-13','36.540228','128.232232','20000','','메기');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'암반수낚시터','경상북도 의성군 다인면 서부로 3018','36.46624748','128.3384845','12시간당 30,000원','','송어 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황금빛노을바다 낚시터','경상남도 사천시 대방동 759번지 지선 해역','34.933943','128.048855','200,000원/1일','','볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'황금빛노을바다 낚시터 2호','경상남도 사천시 실안동 1129번지 지선 해역','34.952388','128.03372','200,000/1일','','볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산분령 유료 낚시터','경상남도 사천시 실안동 산31-2','34.95224','128.03386','150,000~200,000원/좌대:15,000~25,000원','055-833-4404','볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대포황토펜션 낚시터','경상남도 사천시 대포동 457번지선','34.99046','128.04114','150,000~250,000원/좌대: 20,000원','','볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산으로 간 낚시꾼','경상남도 사천시 해안관광로 68-20(실안동)','34.947804','128.040302','79,000원/12시간, 시간추가 15,000원','','감성돔');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'갈천유료낚시터','경상남도 고성군 대가면 갈천로 310','','','30,000원','','잉어, 향어, 붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (황금)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (순찬)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (재영)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (쌍둥이2)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (뱃머리)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (쌍둥이1)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (용마)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (삼성)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (백마)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (금양)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (선창2)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (한마음1)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (한마음2)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (바다)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (반야1)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (반야2)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (가고파)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (천수)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (성용)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'시락어촌계낚시터(3동)','경상남도 창원시 마산합포구 진전면 회진로 1123-25','35.04','128.26','150,000원/동당','','도다리,돔류,기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (선창)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (강민)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (대봉)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (삼정)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (조선)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (태양)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (태진)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (혜주)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'니모실내낚시카페','경남 창녕군 창녕읍 종로15, B01호(낙원빌라)','35.53866','128.4977488','10,000원','051-365-2782','잉어+붕어+향어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'달창유로낚시터','경남 창녕군 성산면 방리 1067-14, 1067-44','35.6091748','128.5156706','25,000원','055-532-4561','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (용마)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (쌍둥이1)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (뱃머리)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'시방어촌계낚시터','경상남도 거제시 장목면 시방리 지선','34.9641','128.7135','150,000원/1동','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장승포어촌계낚시터','경상남도 거제시 장승포동 산11-4, 산2번지 지선','34.8642','128.7387','150,000원/1동','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'선창해상낚시터','경상남도 거제시 일운면 지세포해안로 240','34.8347','128.7156','12,000원/인당','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도장포낚시터','경상남도 거제시 남부면 도장포3길 지선','34.7450','128.6663','평균2만원','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유호어촌계낚시터','경상남도 거제시 장목면 유호리 지선','35.0280','128.7168','평균2만원','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'덕포어촌계낚시터','경상남도 거제시 덕포동 38-6번지 지선','34.9107','128.7164','150,000원/1동','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'창외어촌계낚시터','경상남도 거제시 사등면 창호리 지선','34.9269','128.5215','150,000원/1동','','참돔, 우럭, 도다리 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (쌍둥이2)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (재영)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (순찬)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (황금)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (바다)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (천수)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (가고파)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (혜주)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (태진)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (태양)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (조선)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (삼정)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (대봉)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (강민)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (선창)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (반야2)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (반야1)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (한마음2)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (한마음1)낚시터','경상남도 창원시 마산합포구 구산면 실리섬길 3','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (선창2)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (금양)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'실리도 어촌계 (백마)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.04','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'원전어촌계 (삼성)낚시터','경상남도 창원시 마산합포구 구산면 이순신로 644','35.03','128.38','20,000원/인당','','도다리, 돔류, 볼락류,  장어류, 기타 해면어류 등');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'고고실내바다낚시','양산시 하북면 용연로 109-1','35.44907046','129.0739858','44000원/3시간','055-375-8850','광어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'해적낚시까페','양산시 물금읍 야리로 129, 402호','35.312878','129.009007','10000원/1시간','055-366-8889','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'힐링낚시까페','양산시 북정서길 16 세롬성원네오파트 상가동 B101호','35.35965485','129.042319','10000원/1시간','055-388-7839','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화제낚시터','경상남도 양산시 원동로 715-33','35.341618','128.969791','10000원/1일','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용연낚시터','경상남도 양산시 하북면 삼리길 62-10','35.444533','129.079991','10000원/1일','055-374-9908','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'산천낚시터','경상남도 양산시 하북면 백록로 123','35.459104','129.085365','10000원/1일','','붕어, 잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중화어촌계낚시터','경상남도 통영시 산양읍 연화리 산 228','34.780811','128.379185','1일 20,000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'도동 낚시터','경상남도 통영시 욕지면 욕지일주로 896-104','34.679583','128.253251','1일 20,000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'용머리낚시터','경상남도 통영시 욕지면 연화리 산 13','34.65714676','128.3469023','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동영낚시터','경상남도 통영시 욕지면 연화리 산 145-1','34.64936942','128.3490952','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'능양유료낚시터','경상남도 통영시 사량면 양지리 산 94','34.80872192','128.2405895','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'유동낚시터','경상남도 통영시 욕지면 서산리 117-1 마을회관','34.80872192','128.2405895','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'한마음낚시터','경상남도 통영시 욕지면 노대리 44-1','34.66611518','128.2483465','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'통영등대낚시공원','경상남도 통영시 산양읍 영운리 72-12','34.81074538','128.441055','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'제2유동낚시터','경상남도 통영시 욕지면 서산리 산33','34.61695055','128.2325726','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'중화어촌계낚시터','경상남도 통영시 산양읍 연화리 산228','34.77924079','128.3789691','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'외지유료낚시터','경상남도 통영시 사량면 양지리 677-6','34.81235844','128.2147933','1일 100000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'옥동산내어촌계 유료낚시터','경상남도 통영시 욕지면 동항리 183-4','34.63404947','128.2808186','1일 15000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'백학어촌계 유료낚시터','경상남도 통영시 사량면 양지리 산 88-1','34.80861114','128.2550604','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사량도 바다낚시터','경상남도 통영시 사량면 금평리 247-10','34.84478654','128.223943','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'탄항좌대낚시터','경상남도 통영시 욕지면 노대리 산14-6','34.679583','128.253251','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동두좌대낚시터','경상남도 통영시 욕지면 연화리 산2-45','34.642713','128.369739','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'장촌낚시터','경상남도 통영시 산양읍 풍화리 343-1','34.817821','128.37093','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'동머리낚시터','경상남도 통영시 욕지면 연화리 산2-46','34.642236','128.370198','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'노대조은낚시터','경상남도 통영시 욕지면 노대리 산15-24','34.669446','128.251937','1일 20000원','','해수어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'합천손맛낚시터','경상남도 합천군 대양면 아천길 47-36','35.541587','128.172937','1일 10000원','055-932-0595','잉어+붕어+메기+동자개');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'지정낚시터','경상남도 의령군 지정면 함의로 1360-17','35.37455951','128.402504','1일 30000원','055-572-1231','붕어+잉어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'설리바다낚시터','경상남도 남해군 미조면 미송로303번안길 8-13','34.704381','128.027913','1인 20,000원','055-867-9001','참돔+볼락');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'설리 낚시터','경상남도 남해군 미조면 미송로303번안길 8-13','34.706407','128.024712','3인 120,000원','055-867-9001','감성돔+볼락+문어+도다리');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사항제2낚시터','경상남도 남해군 미조면 미조로 212','34.708829','128.058231','1인 25,000원','055-867-6514','감성돔+볼락+문어+도다리');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'사항어촌계 낚시터','경상남도 남해군 미조면 미조로 212','34.70905674','128.0482496','1인 25,000원','055-867-6514','감성돔+볼락+문어+도다리');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'필봉정낚시터','경상남도 김해시 대동면 괴정리 311-3번지','35.2613093237','128.9836764184','15000','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'화현낚시터','경상남도 김해시 상동면 감노리 17번지','35.3355934311','128.9393673144','20000','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'아빠와 고래','경상남도 김해시 함박로 121','35.2341349765','128.8680469508','10000','','광어+도다리');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'다낚아 낚시터','경상남도 김해시 함박로 119번길 17','35.2336358319','128.8672616006','10000','','잉어+붕어');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대치유료낚시터','경상남도 하동군 금남면 장환길 104-132, 대치유료낚시터','34.957336','127.897285','좌대 20,000원 방갈로 30,000원','','해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'대도유료낚시터','경상남도 하동군 금남면 대도길 117, 대도복지회관','34.932254','127.832022','좌대 15,000원 방갈로 25,000원','','해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'송문유료낚시터','경상남도 하동군 금남면 미법마을길 40-5','34.951171','127.855957','방갈로 30,000원','','해면어류');
insert into `FISHING`(`FISHING_NO`,`fishing_Nm`,`addr`,`latitude`,`longitude`,`useCharge`,`phone`,`species`) values(0,'바지선 선상낚시','제주특별자치도 서귀포시 토평동 516 남측 450m 지선','33.24568966369','126.5775384632','성인40000원+초등학생30000원','','자리돔+어랭이+청복+용치놀래기');

insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','바싹 불고기','소고기를 직화로 구워 만든 바싹 불고기 레시피입니다.','https://terms.naver.com/entry.naver?cid=42785&docId=5679245&categoryId=62795','https://post-phinf.pstatic.net/MjAxODA5MjFfMTA1/MDAxNTM3NTE0NDM3ODQ4.LIgP1IUlUk-wXXKLip74nf0T02SDpbDAQ7IKyLdJh5Ag.fc1adF4U3onqoNJoWHRXwxACO9hWk2ovamkww1dECXYg.PNG/image.png?type=w1200');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','해물라면','국물이 시원하고 해물의 깊은 맛이 우러나와 라면을 더욱 고급스럽게 만들어주는 레시피입니다.','https://bongja-workroom.tistory.com/226','https://blog.kakaocdn.net/dn/lmzBH/btqC0K6Omu1/lIwpxaLB36bU8icupyqc91/img.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','차돌박이 된장찌개','차돌박이가 들어가 더욱 고소한 된장찌개','https://terms.naver.com/entry.naver?cid=42785&docId=5667337&categoryId=62795','https://post-phinf.pstatic.net/MjAxODA4MDdfMjkz/MDAxNTMzNjQ5ODIyNTk4.YRl8xH5MJ2-eEqgrKuMWkiSWr4tuwAE8TIu_ciR5iEMg.SLufGu_9LcbaQPXYtgqabI-tnxFPIlkeEVgKkxaWlLog.JPEG/%EC%B0%A8%EB%8F%8C%EB%B0%95%EC%9D%B4%EB%90%9C%EC%9E%A5%EC%B0%8C%EA%B0%9C.JPG?type=w1200');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','한우채끝살 짜파구리','영화에서 나온 그 음식!','https://www.10000recipe.com/recipe/6914201','https://recipe1.ezmember.co.kr/cache/recipe/2019/06/17/b917464857b8f621bce0460aa237de981.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','차돌박이찜','만들기도 너무쉽고 모양도 예뻐서 추천하는 메뉴!','https://www.10000recipe.com/recipe/6881099','https://recipe1.ezmember.co.kr/cache/recipe/2017/12/18/58dd1a9a0d0ef8ff0c60dc35965ea09d1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','고추장삼겹살','허연 밥과 소주를 부르면서 한국인의 마음을 루팡하는 고추장삼겹살 입니다.','https://www.10000recipe.com/recipe/6980995','https://recipe1.ezmember.co.kr/cache/recipe/2022/06/09/a9433667f78726385f769db7f632040c1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','목살간장조림','고기가 정말 부드럽습니다.','https://www.10000recipe.com/recipe/6997013','https://recipe1.ezmember.co.kr/cache/recipe/2023/02/14/de0e0faa4d36531bbee18577c6ade4011.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','동파육','미국 최대 블로그인 "미씨USA"에 올려 대박난 레시피입니다.','https://www.10000recipe.com/recipe/6867023','https://recipe1.ezmember.co.kr/cache/recipe/2017/03/17/5555cd2751c3676f5507f60b2a3d10141.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','피카츄돈까스','치킨너겟으로 재현한 피카츄돈까스','https://www.10000recipe.com/recipe/6861562','https://recipe1.ezmember.co.kr/cache/recipe/2016/11/24/b965ca40798d07748deefbb065df11b01.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','목살 스테이크','서가앤쿡 목살 스테이크를 재현한 레시피','https://www.10000recipe.com/recipe/6861235','https://recipe1.ezmember.co.kr/cache/recipe/2016/11/18/7ea05a5097295b3692d85c68b40b2c7e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','닭고기 냉채','더워서 입맛 없을 때 무조건 이 메뉴!','https://www.10000recipe.com/recipe/6959420','https://recipe1.ezmember.co.kr/cache/recipe/2021/05/20/e8b97435ea177a627fc46312cd6c9f501.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','치킨너겟 간장치킨','간편함과 맛을 동시에 잡은 치킨너겟 간장치킨 레시피','https://www.10000recipe.com/recipe/6868389','https://recipe1.ezmember.co.kr/cache/recipe/2017/04/13/4189762e499329b82d174ef4af984b4d1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','치킨 스테이크','굽네가 부럽지 않은 치킨 스테이크 레시피','https://www.10000recipe.com/recipe/6922190','https://recipe1.ezmember.co.kr/cache/recipe/2019/11/15/fb1f1dcc68197ad1fb89b5a355fb830e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','유린기','누구나 좋아할만한 깔끔한 닭가슴살 튀김요리','https://www.10000recipe.com/recipe/6899911','https://recipe1.ezmember.co.kr/cache/recipe/2018/11/10/d0881f710b5d7f5c2ce3343b654ce7a01.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','꿀마늘 닭강정','아이들의 단골메뉴!','https://www.10000recipe.com/recipe/6897374','https://recipe1.ezmember.co.kr/cache/recipe/2018/10/07/da4e0452ac3bd20bb0528f4abc1211881.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','칠리새우','간단하게 칠리새우를 만드는 레시피','https://www.10000recipe.com/recipe/6881815','https://recipe1.ezmember.co.kr/cache/recipe/2018/01/05/67596a71e2225af39cc9139a4736133e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','갈릭마요새우','술안주나 아이들 간식으로도 너무 좋아요','https://www.10000recipe.com/recipe/6872474','https://recipe1.ezmember.co.kr/cache/recipe/2017/07/10/092788fb72da830f79991bde7d9c68831.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','명란두부찌개','진짜 시원하고 깔끔한 국물 맛에 반하게 되실거에요','https://www.10000recipe.com/recipe/6935659','https://recipe1.ezmember.co.kr/cache/recipe/2020/07/03/a13eb720de006df8bc1097fbd99fe1a61.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'채소','','고추된장박이','아삭아삭 밥도둑','https://www.10000recipe.com/recipe/4030952','https://recipe1.ezmember.co.kr/cache/recipe/2015/04/22/7bbb01b214f42db7ef1e65edb5afc0391.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'채소','','파채무침','어디에든 어울리는 파채무침 레시피','https://www.10000recipe.com/recipe/6992063','https://recipe1.ezmember.co.kr/cache/recipe/2022/11/15/9e01753c1b0f35315692fd5c984db4be1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'채소','','오이미역냉채','다이어트 요리로 좋아요','https://www.10000recipe.com/recipe/6974604','https://recipe1.ezmember.co.kr/cache/recipe/2022/02/15/bc13526ccc72f348d3a944e38d2c2b991.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'칵테일','','샤크어택칵테일','살얼음위에 달달한 딸기시럽까지 ★ 보는맛이 꿀잼 ★','https://www.10000recipe.com/recipe/6912966','https://recipe1.ezmember.co.kr/cache/recipe/2019/05/29/49321338c90cf44166e7de5f1ed2e2831.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','대패삼겹살 영양부추 샐러드','영양부추샐러드는 보통 차돌박이를 많이 이용해서 샐러드를 만드는데요~ 대패삼결살을 이용해 만들어봤어요.','https://www.10000recipe.com/recipe/6828951','https://recipe1.ezmember.co.kr/cache/recipe/2015/06/17/1cea014584e2bf483dfe132faceda22b1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','돈까스김치나베','간단 든든 한끼식사 돈까스김치나베','https://www.10000recipe.com/recipe/6919305','https://recipe1.ezmember.co.kr/cache/recipe/2019/09/17/e89c82b5021b89a91b3c37396ccbdd5c1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','삼겹깐풍덮밥','실패없는 깐풍소스로 덮밥만들기','https://www.10000recipe.com/recipe/6935331','https://recipe1.ezmember.co.kr/cache/recipe/2020/06/30/d77f639c047a6cf6d5afb463d9d210ce1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','대패삼겹우동볶음','출출한밤, 냉동대패삼겹과 우동사리로 단짠단짠 초스피드 초간단 술안주만들기~!','https://www.10000recipe.com/recipe/6896826','https://recipe1.ezmember.co.kr/cache/recipe/2018/09/30/104e88e71700a7e9bdcb7f5b2bf9a3bd1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','스테이크파스타','고기사랑 면사랑이 남다른 아이에게 해주었더니 폭풍 감동한 메뉴','https://www.10000recipe.com/recipe/6864277','https://recipe1.ezmember.co.kr/cache/recipe/2017/01/24/b7a8bbd5cb7feb2391d344994635053e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','이연복 차돌짬뽕','쉐프 이연복님의 레시피','https://www.10000recipe.com/recipe/6939293','https://recipe1.ezmember.co.kr/cache/recipe/2020/08/07/76d0e9152a3accae2edaed394fc73f121.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','소고기카레우동','소고기와 양파만 있으면 쉽고 간단하게 만들어요','https://www.10000recipe.com/recipe/6929257','https://recipe1.ezmember.co.kr/cache/recipe/2020/03/24/8a718cbc538dabd42ef83a3588bac1861.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','새우굴소스파스타','처음보는 비주얼에 처음 느껴보는맛!','https://www.10000recipe.com/recipe/6890570','https://recipe1.ezmember.co.kr/cache/recipe/2018/06/09/c9cff4f20768f0ec00f2f7e8e6d9ab9c1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','봉골레 스파게티','바지락이 들어가 짭쪼름하니 감칠맛돌고 너무 맛있는 스파게티랍니다~!!','https://www.10000recipe.com/recipe/6907622','https://recipe1.ezmember.co.kr/cache/recipe/2019/03/03/55c3670f880c841f455f0ea7be3383d61.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'칵테일','','스프리처','화이트 와인을 이용한 칵테일 입니다.','https://www.10000recipe.com/recipe/6923989','https://recipe1.ezmember.co.kr/cache/recipe/2019/12/21/aa74528d83a29c304177a65d99582e161.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'칵테일','','미도리 스플라이스','색만큼 달콤하고 부드러운 향과 맛이 특징인 칵테일이에요','https://www.10000recipe.com/recipe/6896955','https://media-cdn.tripadvisor.com/media/photo-p/12/76/dd/ff/midori-splice.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'칵테일','','백종원의 깻잎모히또','소유진님을 반하게 만든 백종원님의 치트키!','https://www.10000recipe.com/recipe/6911204','https://recipe1.ezmember.co.kr/cache/recipe/2019/04/24/42431ffed84bf173e9f1a6bf655edbea1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','안동찜닭','특별한 날 여럿이서 푸짐하게','https://www.10000recipe.com/recipe/1027697','https://recipe1.ezmember.co.kr/cache/recipe/2015/09/30/e022f525b887ea6c07b70a77d0119e591.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','닭도리탕','매콤하고 맛있는 닭도리탕 레시피를 소개합니다!','https://www.10000recipe.com/recipe/1176470','https://recipe1.ezmember.co.kr/cache/recipe/2015/06/09/af4bf472ae5721034987da95d80b6caa.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','버팔로 윙','주말 특별간식','https://www.10000recipe.com/recipe/1709870','https://recipe1.ezmember.co.kr/cache/recipe/2015/09/29/b571c0b445c10dc005852e5183ac1560.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'채소','','콩나물무침','아삭아삭 식감에 칼칼한 맛이 매력적인 매콤 콩나물무침!','https://www.10000recipe.com/recipe/6867256','https://recipe1.ezmember.co.kr/cache/recipe/2017/03/22/93dd58483544283879abe07cb3ca75961.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','백종원 떡볶이','분식점에서 파는 맛 나는 계란이 들어간 백주부님 떡볶이!','https://www.10000recipe.com/recipe/6894096','https://recipe1.ezmember.co.kr/cache/recipe/2018/08/13/3233d427883d15239f297aeeaf1775531.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','소고기무국','만들기도 간단하면서 고소하고 시원한 맛이 매력적인 소고기무국','https://www.10000recipe.com/recipe/6845113','https://recipe1.ezmember.co.kr/cache/recipe/2016/03/22/43e159ab210354fe02af14641d5c622c1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','제육볶음','밥과 함께 먹으면 제일 맛있는 제육볶음 황금레시피','https://www.10000recipe.com/recipe/6905743','https://recipe1.ezmember.co.kr/cache/recipe/2019/01/31/e8cab950076b23a80f16dd7858dd514e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','마파두부덮밥','두반장 따윈 필요없어요!! 냉장고에 있는 재료로 후다닥! 맛있게~ 마파두부를 만들 수 있는 방법을 알려드릴께요~','https://www.10000recipe.com/recipe/6881454','https://recipe1.ezmember.co.kr/cache/recipe/2017/12/27/81d7bf7713e7b538b97d521d1485ec421.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'닭고기','','폭탄 계란찜','식당에서 먹던 맛과 비주얼 그대로','https://www.10000recipe.com/recipe/6872350','https://recipe1.ezmember.co.kr/cache/recipe/2017/07/06/c807784ab41809f624a6a4a7466cd5bd1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','백종원 감자짜글이','감자와 스팸이 들어간 백종원 레시피','https://www.10000recipe.com/recipe/6891652','https://recipe1.ezmember.co.kr/cache/recipe/2018/06/28/aafe715cb61dcd794662060f4cc618391.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','부대찌개','​밖에서 파는 맛처럼 맛있는 부대찌개 양념 만드는 법!','https://www.10000recipe.com/recipe/6884636','https://recipe1.ezmember.co.kr/cache/recipe/2018/02/27/b5806f01ccb6f6d5d9aa94bdd6f4287e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'소고기','','소고기 미역국','세상에서 가장 맛있는 미역국은 울 엄마표 소고기미역국','https://www.10000recipe.com/recipe/6873683','https://recipe1.ezmember.co.kr/cache/recipe/2017/07/28/860484b80033e84a3584a366ae903a0d1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'해산물','','멸치볶음','마지막 한 젓가락까지 바삭하고 고소한 간장 멸치볶음','https://www.10000recipe.com/recipe/6891816','https://recipe1.ezmember.co.kr/cache/recipe/2018/07/02/760e92406112f6a0ad98d84844cbfc7e1.jpg');
insert into `RECIPE`(`RECIPE_NO`,`CATEGORY1`,`CATEGORY2`,`TITLE`,`CONTENT`,`URL`,`IMAGEURL`) values(0,'돼지고기','','소세지야채볶음','쏘야 맛있게만들기','https://www.10000recipe.com/recipe/6872975','https://recipe1.ezmember.co.kr/cache/recipe/2017/07/19/907c4662b413b0cdbc4e9ea088935ba21.jpg');

insert into `MEMBER`(`USER_NO`,`ID`,`PASSWORD`,`ROLE`,`BIRTHYEAR`,`NICKNAME`,`PHONE`,`EMAIL1`,`EMAIL2`,`ADDRESS`,`KAKAOTOKEN`,`STATUS`,`ENROLL_DATE`,`MODIFY_DATE`,`PROFILE_IMAGE`,`RENAMED_PROFILEIMAGE`) values('1', 'admin', '$2a$10$ez/mkHzzDuxXVdFjQFnUMOtVohF2Mqe1TZ08aWEfxdF3qTsSc9HnS', 'ROLE_ADMIN', '1970', '관리자', '01011111111', 'aaaaa', ' google.com', '서울', NULL, 'Y', '2023-02-21 10:23:17', '2023-02-21 10:23:17', '0', '0');

SELECT*FROM `MEMBER`;
SELECT*FROM `BOARD`;
SELECT*FROM `BOARD_REPLY`;
SELECT*FROM `CAMPING_CONTENTS`;
SELECT*FROM `CAMPING_CONTENTS_REPLY`;
SELECT*FROM `FESTIVAL_CONTENTS`;
SELECT*FROM `MEETING`;
SELECT*FROM `BOOKMARK`;
SELECT*FROM `SHOP`;
SELECT*FROM `RENT`;
SELECT*FROM `RECIPE`;
SELECT*FROM `MEETINGMEMBER`;
SELECT*FROM `FISHING`;
SELECT*FROM `MOUNTAINISLAND`;
SELECT*FROM `BUS_TICKET`;
SELECT*FROM `TRAIN_TICKET`;

----------------------------------- DDL 끝-------------------------------------------

-- MEMBER DML

-- 유저 조회
-- SELECT * FROM `MEMBER` WHERE ID=? AND STATUS='Y'

-- 유저 추가
/*
INSERT INTO `MEMBER`(
`USER_NO`,`ID`,`PASSWORD`, `ROLE`, `BIRTHYEAR`, `NICKNAME`, 
`PHONE`, `EMAIL1`, `EMAIL2`, `ADDRESS`, `KAKAOTOKEN`, 
`STATUS`, `ENROLL_DATE`,`MODIFY_DATE`)
 VALUES(0, ?, ?, DEFAULT, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)
*/

-- 유저 수정               
-- UPDATE `MEMBER` SET `NICKNAME`=?, `EMAIL1`=?, `EMAIL2`=?, `PHONE`=? WHERE `USER_NO`=?

-- 유저 패스워드 변경
-- UPDATE `MEMBER` SET `PASSWORD`=? WHERE `USER_NO`=?

-- 유저 삭제
-- UPDATE `MEMBER` SET STATUS='N' WHERE `USER_NO`=?



-- BOARD DML


-- 총 게시글 갯수
-- SELECT COUNT(*) FROM `BOARD` WHERE STATUS='Y'

-- 조회수 증가
-- UPDATE `BOARD` SET READCOUNT=? WHERE `BOARD_NO`=?

-- 게시글 작성
/*
INSERT INTO `BOARD` (`BOARD_NO`, `USER_NO`, `TITLE`, `CONTENT`, `ORIGINAL_FILENAME`, `RENAME_FILENAME`, `STATUS`, `CREATE_DATE`, `READCOUNT`, `TYPE`) 
VALUES (0, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?)
TYPE = NOTICE, FREE, QUESTION 중 하나
*/

-- 게시글 수정
/*
UPDATE `BOARD` 
SET TITLE=?, CONTENT=?, ORIGINAL_FILENAME=?, RENAMED_FILENAME=? 
WHERE `BOARD_NO`=?
*/

-- 게시글 삭제
-- UPDATE `BOARD` SET STATUS='N' WHERE `BOARD_NO`=?


-- 상세 조회
/*
SELECT  B.BOARD_NO, B.TITLE, M.NICKNAME, B.READCOUNT, B.ORIGINAL_FILENAME, B.RENAMED_FILENAME, B.CONTENT, B.CREATE_DATE 
FROM `BOARD` B
JOIN `MEMBER` M ON(B.USER_NO = M.USER_NO)
WHERE B.STATUS = 'Y' AND B.BOARD_NO=?
*/


-- 목록 조회(페이징) 쿼리
/*
SELECT  B.BOARD_NO, B.TITLE, M.NICKNAME, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS 
FROM `BOARD` B JOIN `MEMBER` M ON(B.USER_NO = M.USER_NO) 
WHERE B.STATUS = 'Y' 
ORDER BY B.BOARD_NO DESC LIMIT ? OFFSET 0
*/


-- 리플 작성
-- INSERT INTO `BOARD_REPLY`(`REPLY_NO`, `BOARD_NO`, `USER_NO`, `CONTENT`, `STATUS`, `CREATE_DATE`) VALUES(0, ?, ?, ?, DEFAULT, DEFAULT)

-- 리플 삭제
-- UPDATE `BOARD_REPLY` SET STATUS='N' WHERE `REPLY_NO`=?

-- 댓글 리스트 조회용 쿼리문
/*
SELECT R.REPLY_NO, R.BOARD_NO, R.CONTENT, M.NICKNAME, R.CREATE_DATE, R.MODIFY_DATE 
FROM `BOARD_REPLY` R 
JOIN `MEMBER` M ON(R.USER_NO = M.USER_NO) 
WHERE R.STATUS='Y' AND BOARD_NO= ? 
ORDER BY R.REPLY_NO DESC;
*/

-- 댓글 페이징처리 쿼리문
/*
SELECT R.REPLY_NO, R.BOARD_NO, R.CONTENT, M.NICKNAME, R.CREATE_DATE, R.MODIFY_DATE 
FROM `BOARD_REPLY` R 
JOIN `MEMBER` M ON(R.USER_NO = M.USER_NO) 
WHERE R.STATUS='Y' AND BOARD_NO= ? 
ORDER BY R.REPLY_NO DESC LIMIT ? OFFSET 0;
*/

-- 검색 + 쿼리문
/*
SELECT  B.BOARD_NO, B.TITLE, M.NICKNAME, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS
FROM `BOARD` B JOIN `MEMBER` M ON(B.USER_NO = M.USER_NO) 
WHERE B.STATUS = 'Y'
AND U.NICKNAME LIKE '%닉네임%' 
AND B.TITLE LIKE '%제목%' 
AND B.CONTENT LIKE '%글내용%' 
ORDER BY B.BOARD_NO DESC LIMIT ? OFFSET ?;
*/




-- DEALBOARD DML


-- 총 게시글 갯수
-- SELECT COUNT(*) FROM `DEALBOARD` WHERE STATUS='Y'

-- 조회수 증가
-- UPDATE `DEALBOARD` SET READCOUNT=? WHERE `DEAL_NO`=?

-- 게시글 작성
/*
INSERT INTO `DEALBOARD` (`DEAL_NO`, `USER_NO`, `TITLE`, `CONTENT`, `ORIGINAL_FILENAME`, `RENAME_FILENAME`, `STATUS`, `CREATE_DATE`, `READCOUNT`, `PRICE`, `CATECORY`, `LOCATION`) 
VALUES (0, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, ?, ?)
*/

-- 게시글 수정
/*
UPDATE `DEALBOARD` 
SET TITLE=?, CONTENT=?, ORIGINAL_FILENAME=?, RENAMED_FILENAME=?, PRICE=?, CATEGORY=?, LOCATION=? 
WHERE `DEAL_NO`=?
*/

-- 게시글 삭제
-- UPDATE `BOARD` SET STATUS='N' WHERE `DEAL_NO`=?


-- 상세 조회
/*
SELECT  B.DEAL_NO, B.TITLE, M.NICKNAME, B.READCOUNT, B.ORIGINAL_FILENAME, B.RENAMED_FILENAME, B.CONTENT, B.CREATE_DATE, B.PRICE, B.CATEGORY, B.LOCATION 
FROM `DEALBOARD` B
JOIN `MEMBER` M ON(B.USER_NO = M.USER_NO)
WHERE B.STATUS = 'Y' AND B.DEAL_NO=?
*/


-- 목록 조회(페이징) 쿼리
/*
SELECT  B.DEAL_NO, B.TITLE, M.NICKNAME, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS, B.PRICE, B.CATEGORY, B.LOCATION 
FROM `DEALBOARD` B JOIN `MEMBER` M ON(B.USER_NO = M.USER_NO) 
WHERE B.STATUS = 'Y' 
ORDER BY B.DEAL_NO DESC LIMIT ? OFFSET 0
*/

-- 리플 작성
-- INSERT INTO `DEALBOARD_REPLY`(`REPLY_NO`, `DEAL_NO`, `USER_NO`, `CONTENT`, `STATUS`, `CREATE_DATE`) VALUES(0, ?, ?, ?, DEFAULT, DEFAULT)

-- 리플 삭제
-- UPDATE `DEALBOARD_REPLY` SET STATUS='N' WHERE `REPLY_NO`=?


-- 댓글 리스트 조회용 쿼리문
/*
SELECT R.REPLY_NO, R.BOARD_NO, R.CONTENT, M.NICKNAME, R.CREATE_DATE, R.MODIFY_DATE 
FROM `DEALBOARD_REPLY` R 
JOIN `MEMBER` M ON(R.USER_NO = M.USER_NO) 
WHERE R.STATUS='Y' AND BOARD_NO= ? 
ORDER BY R.REPLY_NO DESC;
*/

-- 댓글 페이징처리 쿼리문
/*
SELECT R.REPLY_NO, R.BOARD_NO, R.CONTENT, M.NICKNAME, R.CREATE_DATE, R.MODIFY_DATE 
FROM `DEALBOARD_REPLY` R 
JOIN `MEMBER` M ON(R.USER_NO = M.USER_NO) 
WHERE R.STATUS='Y' AND BOARD_NO= ? 
ORDER BY R.REPLY_NO DESC LIMIT ? OFFSET 0;
*/

-- 검색 + 쿼리문
/*
SELECT  B.DEAL_NO, B.TITLE, M.NICKNAME, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS, B.PRICE, B.CATEGORY, B.LOCATION 
FROM `DEALBOARD` B JOIN `MEMBER` M ON(B.USER_NO = M.USER_NO) 
WHERE B.STATUS = 'Y'
AND U.NICKNAME LIKE '%닉네임%' 
AND B.TITLE LIKE '%제목%' 
AND B.CONTENT LIKE '%글내용%' 
AND B.CATEGORY LIKE '%종류%' 
AND B.LOCATION LIKE '%지역%' 
ORDER BY B.BOARD_NO DESC LIMIT ? OFFSET ?;
*/



-- CONTENT DML

-- CAMPING 삽입
/*
INSERT INTO `CAMPING_CONTENTS`(
`CONTENTID`, `FACLTNM`, `LINEINTRO`, `INTRO`, `MANAGESTTUS`, 
`FEATURENM`, `INDUTY`, `LCTCL`, `DONM`, `SIGUNGUNM`, `ZIPCODE`, 
`ADDR1`, `ADDR2`, `MAPX`, `MAPY`,`DIRECTION`,`TEL`,`HOMEPAGE`,
`RESVECL`,`GNRLSITECO`,`AUTOSITECO`,`GLAMPSITECO`,`CARAVSITECO`,
`INDVDLCARAVSITECO`,`TOOLTIP`,`GLAMPINNERFCLTY`,`CARAVINNERFCLTY`,
`OPERDECL`,`TOILETCO`,`SWRMCO`,`WTRPLCO`,`BRAZIERCL`,`SBRSCL`,
`POSBLFCLTYCL`,`THEMAENVRNCL`,`EQPMNLENDCL`,`ANIMALCMGCL`,
`FIRSTIMAGEURL`) 
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
*/

-- FESTIVAL 삽입
/*
INSERT INTO `FESTIVAL_CONTENTS` (
`CONTENTID`,`CONTENTTYPEID`,`TITLE`,`EVENTSTARTDATE`,
`EVENTENDDATE`,`AREACODE`,`MAPX`,`MAPY`,
`FIRSTIMAGE`,`FIRSTIMAGE2`,`ADDR1`) 
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
*/

-- MOUNTAINISLAND 삽입
/*
INSERT INTO `MOUNTAINISLAND` (
`CONTENTID`,`TITLE`,`CAT3`,`FIRSTIMAGE`,
`MAPX`,`MAPY`,`ADDR1`,`ADDR2`,`READCOUNT`) 
VALUES(?, ?, ?, ?, ?, ?, ?, ?, 0)
*/

-- MOUNTAIN 정보
/*    * 대신 원하는 정보들만 넣어서 해당 값만 뽑아올 수 있음.
SELECT*FROM `MOUNTAINISLAND` WHERE CAT3 = 'A01010400'
*/

-- ISLAND 정보
/*    * 대신 원하는 정보들만 넣어서 해당 값만 뽑아올 수 있음.
SELECT*FROM `MOUNTAINISLAND` WHERE CAT3 = 'A01011300'
*/

-- RENT 삽입
/*
INSERT INTO `RENT` (
`RENT_NO`,`ENTRPSNM`,`RDNMADR`,`LATITUDE`,
`LONGITUDE`,`PHONENUMBER`,`HOMEPAGEURL`) 
VALUES(0, ?, ?, ?, ?, ?, ?)
*/

