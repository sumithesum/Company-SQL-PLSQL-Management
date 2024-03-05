--4
CREATE TABLE ANGAJATI (
  COD_ANGAJAT number,
  NUME varchar2(25),
  PRENUME varchar2(25),
  EMAIL varchar2(225),
  DATA_NASTERE date,
  DATA_ANGAJARE date,
  TELEFON number,
  COD_MANAGER number,
  salariu number,
  PRIMARY KEY (COD_ANGAJAT)
);

CREATE TABLE DEPARTAMENT_DEZVOLTARE (
  COD_ANGAJAT number,
  COD_MANAGER number,
  PRIMARY KEY (COD_ANGAJAT),
    FOREIGN KEY (COD_ANGAJAT) REFERENCES ANGAJATI(COD_ANGAJAT)
);

CREATE TABLE CAZURI (
  COD_CAZ number,
  TIP_CAZ varchar2(25),
  STARE varchar2(25),
  PRIMARY KEY (COD_CAZ)
);


CREATE TABLE DEPARTAMENT_JURIDIC (
  COD_ANGAJAT number,
  COD_CAZ number,
  COD_MANAGER number,
  PRIMARY KEY (COD_ANGAJAT, COD_CAZ),
  FOREIGN KEY (COD_ANGAJAT) REFERENCES ANGAJATI(COD_ANGAJAT),
  FOREIGN KEY (COD_CAZ) REFERENCES CAZURI(COD_CAZ)
);

CREATE TABLE JOCURI (
  COD_JOC number,
  NUME varchar2(25),
  DATA_INCEPUT date,
  DATA_PUBLICARE date,
  PRET number,
  PRIMARY KEY (COD_JOC)
);

CREATE TABLE SOFTWARE (
  COD_SOFTWARE number,
  NUME varchar2(25),
  UTILIZARE varchar2(225),
  PRIMARY KEY (COD_SOFTWARE)
);



CREATE TABLE SERVERE (
  COD_SERVER number,
  REGIUNE varchar2(25),
  CAPACITATE_MAXIMA number,
  COD_JOC number,
  PRIMARY KEY (COD_SERVER),
  FOREIGN KEY (COD_JOC) REFERENCES JOCURI(COD_JOC)
);

CREATE TABLE PLATFORME (
  COD_PLATFORMA number,
  ADRESA varchar2(125),
  DATA_INCEPUT date,
  PRIMARY KEY (COD_PLATFORMA)
);



CREATE TABLE DEPARTAMENT_TESTARE (
  COD_ANGAJAT number,
  COD_MANGER number,
  NR_TESTE number,
  PRIMARY KEY (COD_ANGAJAT),
  FOREIGN KEY (COD_ANGAJAT) REFERENCES ANGAJATI(COD_ANGAJAT)
);


CREATE TABLE REZULTATE_TESTE (
  COD_TEST number,
  COD_JOC number,
  COD_ANGAJAT number,
  DATA_TEST date,
  NOTA_TEST number,
  DESCRIERE_PROBLEME varchar2(225),
  PRIMARY KEY (COD_TEST),
  FOREIGN KEY (COD_JOC) REFERENCES JOCURI(COD_JOC),
  FOREIGN KEY (COD_ANGAJAT) REFERENCES DEPARTAMENT_TESTARE(COD_ANGAJAT)
);



CREATE TABLE LOCATI_STOCARE (
  COD_LOCATIE number,
  NR_JOCURI number,
  ORAS varchar2(25),
  TARA varchar2(25),
  JUDET_SECTOR varchar2(25),
  STRADA varchar2(25),
  PRIMARY KEY (COD_LOCATIE)
);



CREATE TABLE DEPARTAMENT_VANZARI (
  COD_ANGAJAT number,
  COD_LOCATIE number,
  COD_PLATFORMA number,
  NUME_CAMPANIE varchar2(225),
  COD_MANAGER number,
  PRIMARY KEY (COD_ANGAJAT, COD_LOCATIE, COD_PLATFORMA),
  FOREIGN KEY (COD_ANGAJAT) REFERENCES ANGAJATI(COD_ANGAJAT),
  FOREIGN KEY (COD_LOCATIE) REFERENCES LOCATI_STOCARE(COD_LOCATIE),
  FOREIGN KEY (COD_PLATFORMA) REFERENCES PLATFORME(COD_PLATFORMA)
);

CREATE TABLE RESURSE_UMANE (
  COD_ANGAJAT number,
  NR_TICHETE number,
  COD_MANAGER number,
  PRIMARY KEY (COD_ANGAJAT),
  FOREIGN KEY (COD_ANGAJAT) REFERENCES ANGAJATI(COD_ANGAJAT)
);

CREATE TABLE TICHETE (
  COD_TICHET number,
  COD_ANGAJAT number,
  STARE varchar2(10),
  NUME varchar2(125),
  PRIMARY KEY (COD_TICHET, COD_ANGAJAT),
  FOREIGN KEY (COD_ANGAJAT) REFERENCES RESURSE_UMANE(COD_ANGAJAT)
);

CREATE TABLE DEZVOLTARE (
  COD_ANGAJAT number,
  COD_JOC number,
  COD_SOFTWARE number,
  PRIMARY KEY (COD_ANGAJAT,COD_JOC,COD_SOFTWARE),
  FOREIGN KEY (COD_ANGAJAT )REFERENCES DEPARTAMENT_DEZVOLTARE(COD_ANGAJAT),
  FOREIGN KEY (COD_JOC) REFERENCES JOCURI(COD_JOC),
  FOREIGN KEY (COD_SOFTWARE)  REFERENCES SOFTWARE(COD_SOFTWARE)
);



--5

create sequence salary
    start with 10000
    increment by 200
    MINvalue 1
    maxvalue 100000
    nocycle;
    
create sequence cod
    start with 1
    increment by 1
    MINvalue 1
    maxvalue 100
    nocycle;

insert into angajati values (0,'SUMURDUC','ALEXANDRU','sumurduc2003@gmail.com' , '23-JUL-1981','23-MAY-1999',0773320197,null,100000);

insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'ESAR','MIHAI','10-JUL-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'MILAN','ANDREI','02-JUN-2013',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'CICAR','GIGEL','03-MAY-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'MAJOR','MITICA','20-MAR-2000',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'TRIM','LAZAR','23-JAN-2001',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'DIG','PIT','23-SEP-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'PORET','GASU','23-OCT-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'CASU','CASHU','23-NOV-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SAVAR','LARY','23-DEC-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SALBA','MITICA','14-MAR-2014',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'FAR','MIHAI','7-DEC-2007',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'ELAN','STEFAN','15-JAN-2007',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'JARD','DARIUS','12-FEB-2008',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'CORSO','ALEXANDRU','01-APR-2008',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'OLOF','SEBI','23-MAY-2009',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'ANDRO','LAURENTIU','23-JUN-2007',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'MITRA','NICHITA','20-JUL-2011',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'PRADAR','TALU','03-SEP-2012',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SAHAR','KING','03-OCT-2013',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SAMAU','COSMIN','11-NOV-2011',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'CARE','VICTOR','12-DEC-2012',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SOLE','COSICI','22-JUL-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SAINT','CANIC','23-JUN-2012',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'SINT','SILIAN','23-JUN-2003',25);
insert into angajati(cod_angajat , nume ,prenume , data_angajare ,cod_manager) values (cod.nextval,'NICHITA','PITICA','23-MAR-2003',0);


insert into angajati values (cod.nextval ,'LAZAR','ANDREI','2003@gmail.com','23-MAY-1987','23-MAY-2009',31312312312 , 29,salary.nextval);
insert into angajati values (cod.nextval ,'SAMANTEAN','MARIUS','cazur@gmail.com','12-MAY-1987','23-JUN-2003',31231231231 ,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'PAR','COSTEL','stefi@gmail.com','04-JUN-1977','01-APR-2008', 32321314,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'FALU','LUCIAN','tare@gmail.com','03-JUL-1981','23-SEP-2003',513123123 ,0,salary.nextval);
insert into angajati values (cod.nextval ,'ZAHAR','C`OMINA','galati@gmail.com','30-NOV-1980','23-JUN-2003', 4124124,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'CEZART','ANDREA','stardust@gmail.com','01-DEC-1977','23-SEP-2003',14124124 ,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'ANDREI','ANDREI','lorean@gmail.com','17-OCT-1982','23-JUN-2003', 2412412,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'LUCEAF','STEFAN','lordofthecode@gmail.com','15-MAR-1967','23-SEP-2003',1414214 ,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'CARAI','PAUL','thelastcoder@gmail.com','22-APR-1977','23-SEP-2003',41241241 ,29 ,salary.nextval);
insert into angajati values (cod.nextval ,'GHERG','LUCA','nimer@gmail.com','02-MAY-1984','23-SEP-2003',4141414 ,29 ,salary.nextval);



insert into angajati values (cod.nextval ,'CEZART','ANDREI','2002@gmail.com','24-MAY-1987','23-MAY-2007',51312312312 , 0,salary.nextval);
insert into angajati values (cod.nextval ,'FALU','PAUL','ctur@gmail.com','13-MAY-1987','22-JUl-2003',31221231231 ,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'NICHITAAR','COSTEL','stoii@gmail.com','05-JUN-1977','02-APR-2009', 12321314,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'FALU','SOLE','tarus@gmail.com','07-JUL-1981','20-SEP-2004',513123423 ,0,salary.nextval);
insert into angajati values (cod.nextval ,'ZAHAR','C`OMINA','galati_braila@gmail.com','22-NOV-1981','23-JUN-2003', 4324124,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'CEZART','ANDREA','star@gmail.com','05-DEC-1977','23-OCT-2003',142124124 ,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'CARAI','STEFAN','loreanNus@gmail.com','18-OCT-1982','23-MAR-2003', 2414412,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'PITICA','STEFAN','stefan@gmail.com','19-MAR-1967','23-SEP-2003',1514214 ,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'CARAI','PAUL','coderoftheabyys@gmail.com','23-APR-1977','23-SEP-2003',412241 ,37 ,salary.nextval);
insert into angajati values (cod.nextval ,'SAMAU','VICTOR','miner@gmail.com','04-MAY-1984','23-SEP-2003',5141414 ,37 ,salary.nextval);


insert into angajati values (cod.nextval,'LAZARUT','MATEI','1@gmail.com','21-AUG-1992','23-SEP-2003',31231 ,0,salary.nextval );
insert into angajati values (cod.nextval,'ZAHAR','OLAF','2@gmail.com','22-NOV-1982','23-SEP-2003', 31231,47,salary.nextval );
insert into angajati values (cod.nextval,'CRIT','QUATAR','3@gmail.com','24-SEP-1982','23-SEP-2003',313131 ,47,salary.nextval );
insert into angajati values (cod.nextval,'EDGE','CALAR','4@gmail.com','15-NOV-1972','23-SEP-2003',2313123 ,47,salary.nextval );
insert into angajati values (cod.nextval,'CLIFF','CARAT','5@gmail.com','16-OCT-1992','23-SEP-2003', 312312,47,salary.nextval );
insert into angajati values (cod.nextval,'HIMILTON','ZACAR','6@gmail.com','03-JUN-1979','23-SEP-2003', 13123,47,salary.nextval );
insert into angajati values (cod.nextval,'WINTER','ZATAR','7@gmail.com','02-JUL-1982','23-SEP-2003',312312 ,47,salary.nextval );
insert into angajati values (cod.nextval,'CARCAS','ROAMAN','8@gmail.com','20-MAR-1977','23-SEP-2003',3131 ,47,salary.nextval );
insert into angajati values (cod.nextval,'MARIT','MATEI','9@gmail.com','11-MAR-1983','23-SEP-2003', 312312,47,salary.nextval );
insert into angajati values (cod.nextval,'SALAR','GETA','11@gmail.com','12-SEP-1987','23-SEP-2003', 3131,47,salary.nextval );
insert into angajati values (cod.nextval,'CAZAR','GHEORGHE','12@gmail.com','19-NOV-1992','23-SEP-2003',31311 ,47,salary.nextval );
insert into angajati values (cod.nextval,'TRAZAT','DANA','13@gmail.com','27-OCT-1952','23-SEP-2003', 3131,47,salary.nextval );
insert into angajati values (cod.nextval,'FARAR','COSTIN','14@gmail.com','28-MAR-1992','23-SEP-2003',3131 ,47,salary.nextval );
insert into angajati values (cod.nextval,'TRAMAR','IULIA','15@gmail.com','30-JUL-1952','23-SEP-2003', 31313,47,salary.nextval );
insert into angajati values (cod.nextval,'CAZAT','ANDREI','16@gmail.com','01-SEP-1972','23-SEP-2003', 31313,47,salary.nextval );


insert into angajati values (cod.nextval,'COST','MATEI','matei1@gmail.com','25-DEC-1990','23-SEP-2003',31231 ,0,salary.nextval );
insert into angajati values (cod.nextval,'TRAHAR','STEFAN','trhar123@gmail.com','27-AUG-1991','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'MATRUS','MARIA','mary@gmail.com','08-JUN-1992','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'DLOOD','MARTI','maart1@gmail.com','11-JUL-1992','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'VERTA','STEFANIA','stefV@gmail.com','21-SEP-1989','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'CAZUR','ALEXANDRA','alexi@gmail.com','20-MAY-1988','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'TRANT','MAYTREI','maytr1@gmail.com','09-MAR-1987','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'LAZARUT','STEFANIA','lazarPit@gmail.com','01-SEP-1986','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'CORN','ALEXANDRU','corn@gmail.com','1-JUL-1985','23-SEP-2003',31231 ,62,salary.nextval );
insert into angajati values (cod.nextval,'ZORO','DOREL','ZORO@gmail.com','21-AUG-1990','23-SEP-2003',31231 ,62,salary.nextval );


insert into platforme values (10,'www.steam.us',sysdate);
insert into platforme values (9,'www.amazon.org',sysdate);
insert into platforme values (8,'www.shops.ru',sysdate);
insert into platforme values (7,'www.cracked.ro','11-MAR-1999');
insert into platforme values (6,'www.safari.rt','17-JUL-2000');
insert into platforme values (5,'www.zajar.jp','21-JAN-1999');
insert into platforme values (4,'www.grass.mp','22-APR-2002');
insert into platforme values (3,'www.games.ds',sysdate);
insert into platforme values (2,'www.jocurifun.ro','23-MAR-2002');
insert into platforme values (1,'www.mathgames.rr',sysdate);


insert into locati_stocare values(1,20,'BUCURESTI','ROMANIA','SECTORUL 3','IDEPEDENTEI 1');
insert into locati_stocare values(2,19,'NEY YORK','USA',NULL,'Park Avenue');
insert into locati_stocare values(3,18,'NEW YORK','USA',NULL,'Canal Street');
insert into locati_stocare values(4,22,'LONDON','UK',NULL,'Fleet Street');
insert into locati_stocare values(5,23,'PARIS','FRANCE',NULL,'Rue de Rivoli');
insert into locati_stocare values(6,4,'PARIS','FRANCE',NULL,'Avenue de la République');
insert into locati_stocare values(7,11,'LONDON','UK',NULL,'Oxford Street');
insert into locati_stocare values(8,19,'TIMISOARA','ROMANIA','TIMISOARA','UNIRI');
insert into locati_stocare values(9,21,'BUCURESTI','ROMANIA','SECTORUL 2','LEONIDA 2');
insert into locati_stocare values(10,20,'Galati','ROMAANIA','GALATI','GHEORGHE DOJA 1');


insert into departament_vanzari values( 1, 1, 2,'vanzari_maxime',25 ); 
insert into departament_vanzari values( 2, 1, 1,'crestere_opinie',25 ); 
insert into departament_vanzari values( 3, 2, 2,'crestere_opinie', 25); 
insert into departament_vanzari values( 4, 3, 2,'vanzari_maxime',25 ); 
insert into departament_vanzari values( 5, 3, 5,'crestere_opinie',25 ); 
insert into departament_vanzari values( 6, 1, 3,'crestere_opinie',25 ); 
insert into departament_vanzari values( 7, 4, 6,'crestere_opinie',25 ); 
insert into departament_vanzari values( 8, 7, 4,'dezvoltare_piata',25 ); 
insert into departament_vanzari values( 9, 5, 1,'dezvoltare_piata', 25); 
insert into departament_vanzari values( 10, 10,5 ,'dezvoltare_piata',25 ); 
insert into departament_vanzari values( 11, 6, 8,'dezvoltare_piata', 25); 
insert into departament_vanzari values( 12, 6, 6,'vanzari_maxime',25 ); 
insert into departament_vanzari values( 13, 7, 1,'crestere_opinie', 25); 
insert into departament_vanzari values( 14, 1, 7,'crestere_opinie', 25); 
insert into departament_vanzari values( 15, 8, 2,'crestere_opinie', 25); 
insert into departament_vanzari values( 16, 3, 8,'vanzari_maxime',25 ); 
insert into departament_vanzari values( 17, 9, 5,'dezvoltare_piata', 25); 
insert into departament_vanzari values( 18, 2, 9,'vanzari_maxime',25 ); 
insert into departament_vanzari values( 19, 10,4 ,'vanzari_maxime', 25); 
insert into departament_vanzari values( 20, 1, 10,'vanzari_maxime', 25); 
insert into departament_vanzari values( 21, 10,1 ,'crestere_opinie', 25); 
insert into departament_vanzari values( 22, 2,5 ,'crestere_opinie', 25); 
insert into departament_vanzari values( 23, 3,7 ,'crestere_opinie', 25); 
insert into departament_vanzari values( 24, 4,8 ,'crestere_opinie', 25);
insert into departament_vanzari values( 25, 5,8 ,'crestere_opinie', 25);

insert into cazuri values(10,'copyright1','inceput');
insert into cazuri values(9,'violenta_injoc1','inceput');
insert into cazuri values(8,'copyright2','termint');
insert into cazuri values(7,'violenta_injoc4','termint');
insert into cazuri values(6,'copyright3','termint');
insert into cazuri values(5,'copyright4','inceput');
insert into cazuri values(4,'violenta_injoc2','termint');
insert into cazuri values(3,'violenta_injoc3','neinceput');
insert into cazuri values(2,'copyright5','neinceput');
insert into cazuri values(1,'copyright6','neinceput');

insert into departament_juridic values( 46, 1, 47);
insert into departament_juridic values( 47, 2, 47);
insert into departament_juridic values( 48, 3, 47);
insert into departament_juridic values( 49, 4, 47);
insert into departament_juridic values( 50, 5, 47);
insert into departament_juridic values( 51, 6, 47);
insert into departament_juridic values( 52, 7, 47);
insert into departament_juridic values( 53, 8, 47);
insert into departament_juridic values( 54, 9, 47);
insert into departament_juridic values( 55, 3, 47);
insert into departament_juridic values( 56, 4, 47);
insert into departament_juridic values( 57, 5, 47);
insert into departament_juridic values( 58, 7, 47);
insert into departament_juridic values( 59, 3, 47);
insert into departament_juridic values( 60, 9, 47);


insert into resurse_umane values(61,24,62);
insert into resurse_umane values(62,22,62);
insert into resurse_umane values(63,18,62);
insert into resurse_umane values(64,17,62);
insert into resurse_umane values(65,14,62);
insert into resurse_umane values(66,9,62);
insert into resurse_umane values(67,20,62);
insert into resurse_umane values(68,7,62);
insert into resurse_umane values(69,12,62);
insert into resurse_umane values(70,10,62);


insert into tichete values(19,61 , 'neinceput','probleme_graphica');
insert into tichete values(18, 62, 'abordat','probleme_graphica');
insert into tichete values(17, 63, 'abordat','blue_screen');
insert into tichete values(16, 64, 'abordat','probleme_graphica');
insert into tichete values(15, 61, 'rezolvat','blue_screen');
insert into tichete values(13, 63, 'neinceput','blue_screen');
insert into tichete values(14, 65, 'abordat','probleme_graphica');
insert into tichete values(12, 66, 'abordat','blue_screen');
insert into tichete values(11, 67, 'neinceput','probleme_graphica');
insert into tichete values(10, 70, 'abandonat','blue_screen');


insert into software values(6,'UNITY','game_software');
insert into software values(5,'AAA','game_software');
insert into software values(4,'DESIM','design');
insert into software values(3,'CREATE','modelare_3d');
insert into software values(2,'GRAH','graphica');
insert into software values(1,'STORLINE','story');
insert into software values(7,'AI','non player characters');
insert into software values(8,'MPA','map power acents');
insert into software values(9,'CREATE','AUTOMIZATION');
insert into software values(10,'DEVELOPE','developer console');


insert into jocuri (cod_joc , NUME ) values(10,'WORLD_OF_TANKS');
insert into jocuri (cod_joc , NUME ) values(9,'WORLD_OF_MAGIC');
insert into jocuri (cod_joc , NUME ) values(8,'SAMURAI_BACK');
insert into jocuri (cod_joc , NUME ) values(7,'RETURN');
insert into jocuri (cod_joc , NUME ) values(6,'FIVE_WEEKS');
insert into jocuri (cod_joc , NUME ) values(5,'NOCH');
insert into jocuri (cod_joc , NUME ) values(4,'HE');
insert into jocuri (cod_joc , NUME ) values(3,'SHE');
insert into jocuri (cod_joc , NUME ) values(2,'THEY');
insert into jocuri (cod_joc , NUME ) values(1,'ORIGINS');


insert into servere values(1,'EUROPA',100000,1);
insert into servere values(2,'EUROPA',100000,2);
insert into servere values(3,'EUROPA',100000,3);
insert into servere values(4,'EUROPA',100000,4);
insert into servere values(5,'EUROPA',100000,5);
insert into servere values(6,'EUROPA',100000,6);
insert into servere values(7,'EUROPA',100000,7);
insert into servere values(9,'EUROPA',100000,8);
insert into servere values(10,'EUROPA',100000,10);
insert into servere values(11,'ASIA',100000,1);
insert into servere values(12,'ASIA',100000,2);
insert into servere values(13,'ASIA',100000,3);
insert into servere values(14,'ASIA',100000,4);
insert into servere values(15,'ASIA',100000,5);
insert into servere values(16,'ASIA',100000,6);
insert into servere values(17,'AMERICA',100000,7);
insert into servere values(18,'AMERICA',100000,8);
insert into servere values(19,'AMERICA',100000,9);
insert into servere values(20,'AMERICA',100000,10);


insert into departament_dezvoltare values (26,29);
insert into departament_dezvoltare values (27,29);
insert into departament_dezvoltare values (28,29);
insert into departament_dezvoltare values (29,29);
insert into departament_dezvoltare values (30,29);
insert into departament_dezvoltare values (31,29);
insert into departament_dezvoltare values (32,29);
insert into departament_dezvoltare values (33,29);
insert into departament_dezvoltare values (34,29);
insert into departament_dezvoltare values (35,29);


insert into dezvoltare values(26,1,1);
insert into dezvoltare values(27,2,2);
insert into dezvoltare values(26,3,1);
insert into dezvoltare values(30,4,3);
insert into dezvoltare values(29,5,5);
insert into dezvoltare values(31,1,4);
insert into dezvoltare values(28,2,6);
insert into dezvoltare values(32,3,1);
insert into dezvoltare values(33,6,2);
insert into dezvoltare values(35,7,4);
insert into dezvoltare values(34,8,5);


insert into departament_testare values(37,1,37);
insert into departament_testare values(38,2,37);
insert into departament_testare values(39,4,37);
insert into departament_testare values(40,3,37);
insert into departament_testare values(41,5,37);
insert into departament_testare values(42,6,37);
insert into departament_testare values(43,7,37);
insert into departament_testare values(44,8,37);
insert into departament_testare values(45,9,37);
insert into departament_testare values(46,10,37);


insert into rezultate_teste values(1, 1,37, sysdate, 7, 'greseli gramaatica + probleme de randare');
insert into rezultate_teste values(2,2,38,sysdate,8,'meniu neintuitiv');
insert into rezultate_teste values(3,3,39,sysdate,9,'meniu neintuitiv');
insert into rezultate_teste values(4,4,39,sysdate,10,'');
insert into rezultate_teste values(5,5,40,sysdate,10,'');
insert into rezultate_teste values(6,1,41,sysdate,6,'eori + crashuri');
insert into rezultate_teste values(7,2,42,sysdate,9,'meniu neintuitiv');
insert into rezultate_teste values(8,4,43,sysdate,1,'literalmente a sters os');
insert into rezultate_teste values(9,5,44,sysdate,3,'greseli gramaatica + probleme de randare');
insert into rezultate_teste values(10,6,45,sysdate,6,' nu se salveasa progresul');

--6
CREATE OR REPLACE PROCEDURE afisare (id_joc JOCURI.COD_JOC%TYPE) AS 
    
    TYPE ServereIndexate IS TABLE OF SERVERE%ROWTYPE INDEX BY PLS_INTEGER;
    v_servere_indexate ServereIndexate;

    TYPE TesteImbatabile IS TABLE OF REZULTATE_TESTE%ROWTYPE INDEX BY PLS_INTEGER;
    v_teste_imbatabile TesteImbatabile;

    TYPE SoftwareVector IS VARRAY(100) OF DEZVOLTARE.COD_SOFTWARE%TYPE;
    v_software_vector SoftwareVector := SoftwareVector();

    contor NUMBER := 1;
    
    nume software.nume%type;
    
BEGIN

    select nume into nume from jocuri where cod_joc = id_joc;
    
    DBMS_OUTPUT.PUT_LINE('Jocul este: ' || '' || nume);
    
    FOR server_rec IN (SELECT * FROM SERVERE WHERE COD_JOC = id_joc) LOOP
        v_servere_indexate(contor) := server_rec;
        contor := contor + 1;
    END LOOP;
    
 
    contor := 1;
    FOR teste_rec IN (SELECT * FROM REZULTATE_TESTE WHERE COD_JOC = id_joc) LOOP
        v_teste_imbatabile(contor) := teste_rec;
        contor := contor + 1;
    END LOOP;

   
    contor := 1;
    FOR software_rec IN (SELECT DISTINCT COD_SOFTWARE FROM DEZVOLTARE WHERE COD_JOC = id_joc) LOOP
        v_software_vector.EXTEND;
        v_software_vector(contor) := software_rec.COD_SOFTWARE;
        contor := contor + 1;
    END LOOP;
    

    DBMS_OUTPUT.PUT_LINE('Servere in tabel indexat: ');
    FOR i IN 1..v_servere_indexate.COUNT  LOOP
        DBMS_OUTPUT.PUT_LINE(v_servere_indexate(i).COD_SERVER || ' - ' || v_servere_indexate(i).REGIUNE || ' - ' ||  v_servere_indexate(i).CAPACITATE_MAXIMA);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Teste in tabel indexat:');
    FOR i IN 1..v_teste_imbatabile.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_teste_imbatabile(i).COD_TEST || ' - ' || v_teste_imbatabile(i).NOTA_TEST);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Software in vector:' );
    FOR i IN 1..v_software_vector.COUNT LOOP
        select nume into nume from software where cod_software = v_software_vector(i);
        DBMS_OUTPUT.PUT_LINE(v_software_vector(i) || ' - ' || nume);
    END LOOP;
        
END;
/


EXEC afisare(1);


--7

CREATE OR REPLACE PROCEDURE GestionareEchipeDezvoltare (COD_JOC_IN IN JOCURI.COD_JOC%TYPE) AS
   
    CURSOR CurAngajati IS
        SELECT A.COD_ANGAJAT, A.NUME, A.PRENUME, D.COD_JOC, D.COD_SOFTWARE
        FROM ANGAJATI A
        JOIN DEZVOLTARE D ON A.COD_ANGAJAT = D.COD_ANGAJAT
        WHERE D.COD_JOC = COD_JOC_IN;

  
    CURSOR CurSoftware (COD_SOFTWARE_IN IN SOFTWARE.COD_SOFTWARE%TYPE) IS
        SELECT NUME, UTILIZARE
        FROM SOFTWARE
        WHERE COD_SOFTWARE = COD_SOFTWARE_IN;

   
    nume_ANGAJAT ANGAJATI.NUME%TYPE;
    prenume_ANGAJAT ANGAJATI.PRENUME%TYPE;
    nume_SOFTWARE SOFTWARE.NUME%TYPE;
    V_UTILIZARE_SOFTWARE SOFTWARE.UTILIZARE%TYPE;

BEGIN
   
    FOR RecAngajat IN CurAngajati LOOP
       
        nume_ANGAJAT := RecAngajat.NUME;
        prenume_ANGAJAT := RecAngajat.PRENUME;

     
        FOR RecSoftware IN CurSoftware(RecAngajat.COD_SOFTWARE) LOOP
         
            nume_SOFTWARE := RecSoftware.NUME;
            V_UTILIZARE_SOFTWARE := RecSoftware.UTILIZARE;

          
            DBMS_OUTPUT.PUT_LINE('Angajat: ' || nume_ANGAJAT || ' ' || prenume_ANGAJAT);
            DBMS_OUTPUT.PUT_LINE('Software Utilizat: ' || nume_SOFTWARE || ' - ' || V_UTILIZARE_SOFTWARE);
            DBMS_OUTPUT.PUT_LINE('---');
        END LOOP;
    END LOOP;

END GestionareEchipeDezvoltare;
/

EXEC GestionareEchipeDezvoltare(1);


--8

CREATE OR REPLACE FUNCTION f1(
    numes SOFTWARE.NUME%TYPE
) RETURN ANGAJATI.NUME%TYPE
IS
    nume ANGAJATI.NUME%TYPE;
    
    AngajatNotFound EXCEPTION;
    PRAGMA EXCEPTION_INIT(AngajatNotFound, -20101);

    SoftwareInUse EXCEPTION;
    PRAGMA EXCEPTION_INIT(SoftwareInUse, -20102);
BEGIN
    SELECT A.NUME
    INTO nume
    FROM ANGAJATI A
    JOIN DEZVOLTARE D ON D.COD_ANGAJAT = A.COD_ANGAJAT
    JOIN SOFTWARE S ON S.COD_SOFTWARE = D.COD_SOFTWARE
    WHERE LOWER(S.NUME) = LOWER(numes);

    RETURN nume;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20101, 'Angajatul nu a fost gasit sau nu exista software cu numele acesta');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20102, 'Sunt mai multi angajati care folosesc acest software.');
END f1;
/

-- no data found
select f1('Minecraft') from dual;


--bun
select f1('Unity') from dual;

--TOO MANY ROWS
select f1('STORLINE') from dual;


--9

CREATE OR REPLACE PROCEDURE primul (
  p_regiune IN servere.regiune%TYPE,
  p_nume_software IN software.nume%TYPE
) AS
  nume angajati.nume%TYPE;
  prenume angajati.prenume%TYPE;
  salariu angajati.salariu%TYPE;
  nume_joc jocuri.nume%TYPE;
BEGIN
  SELECT a.nume, a.prenume, a.salariu, j.nume
  INTO nume, prenume, salariu, nume_joc
  FROM jocuri j
  JOIN dezvoltare d ON d.cod_joc = j.cod_joc
  JOIN angajati a ON a.cod_angajat = d.cod_angajat
  JOIN software s ON s.cod_software = d.cod_software
  JOIN servere se ON se.cod_joc = j.cod_joc
  WHERE LOWER(se.regiune) = LOWER(p_regiune)
    AND LOWER(s.nume) = LOWER(p_nume_software)
  ORDER BY a.salariu DESC;


  DBMS_OUTPUT.PUT_LINE('Nume: ' || nume);
  DBMS_OUTPUT.PUT_LINE('Prenume: ' || prenume);
  DBMS_OUTPUT.PUT_LINE('Salariu: ' || salariu);
  DBMS_OUTPUT.PUT_LINE('Nume Joc: ' || nume_joc);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nu s-au gasit date pentru regiunea si software-ul specificate.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Exista mai multe inregistrari decat era de asteptat.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('O eroare neasteptata a aparut: ' || SQLERRM);
END primul;
/
------no data
begin
    primul('europa','storyline');
end; 
/
--Exista mai multe inregistrari
begin
    primul('europa','storline');
end; 
/
--bun
begin
    primul('europa','unity');
end; 
/


--10

CREATE OR REPLACE TRIGGER limitare_departament_juridic
BEFORE INSERT ON departament_juridic
DECLARE 
    nr NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO nr
    FROM departament_juridic;
    
    IF nr >= 15 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numarul maxim de inregistrari in tabelul DEPARTAMENT_JURIDIC a fost atins.');
    END IF;
END;
/

DECLARE

BEGIN
 
    INSERT INTO departament_juridic (COD_ANGAJAT, COD_CAZ, COD_MANAGER)
    VALUES (0,3, 0);


    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: ' || SQLERRM);
        ROLLBACK;
END;
/

drop trigger limitare_departament_juridic;



--11
CREATE OR REPLACE TRIGGER limita_salariu
BEFORE INSERT ON ANGAJATI
FOR EACH ROW
DECLARE
    v_limita_salariu NUMBER := 10000; -- Setati limita salariului aici
BEGIN
    IF :NEW.salariu > v_limita_salariu THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salariul nu poate depasi ' || v_limita_salariu || '.');
    END IF;
END;
/



INSERT INTO ANGAJATI (COD_ANGAJAT, NUME, PRENUME, EMAIL, DATA_NASTERE, DATA_ANGAJARE, TELEFON, COD_MANAGER, salariu)
VALUES (1000, 'Nume1', 'Prenume1', 'email1@example.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'), SYSDATE, '123456789', 987, 15000);

drop trigger limita_salariu;


--12
CREATE OR REPLACE TRIGGER trg_stergere_creare_tabele
BEFORE CREATE OR DROP ON DATABASE
DECLARE
    v_username VARCHAR2(30);
BEGIN
   
    SELECT SYS_CONTEXT('USERENV', 'CURRENT_USER') INTO v_username FROM DUAL;


    IF v_username = 'C##ALEX' THEN
    
        RAISE_APPLICATION_ERROR(-20001, 'Nu aveti permisiunea sa creati sau sa stergeti tabele in baza de date.');
    END IF;
END trg_stergere_creare_tabele;
/


CREATE TABLE TestTable (
    ID NUMBER,
    NAME VARCHAR2(50)
);

drop trigger trg_stergere_creare_tabele;


--13

create or replace PACKAGE p13 as

--6
PROCEDURE afisare (id_joc JOCURI.COD_JOC%TYPE);

--7
PROCEDURE GestionareEchipeDezvoltare (COD_JOC_IN IN JOCURI.COD_JOC%TYPE);

--8
FUNCTION f1(numes software.nume%type) return angajati.nume%type;

--9 
PROCEDURE primul (p_regiune IN servere.regiune%TYPE,p_nume_software IN software.nume%TYPE);


 
end p13;
/


create or replace PACKAGE BODY p13 as

--6
PROCEDURE afisare (id_joc JOCURI.COD_JOC%TYPE) AS 
    
    TYPE ServereIndexate IS TABLE OF SERVERE%ROWTYPE INDEX BY PLS_INTEGER;
    v_servere_indexate ServereIndexate;

    TYPE TesteImbatabile IS TABLE OF REZULTATE_TESTE%ROWTYPE INDEX BY PLS_INTEGER;
    v_teste_imbatabile TesteImbatabile;

    TYPE SoftwareVector IS VARRAY(100) OF DEZVOLTARE.COD_SOFTWARE%TYPE;
    v_software_vector SoftwareVector := SoftwareVector();

    contor NUMBER := 1;
    
    nume software.nume%type;
    
BEGIN

    select nume into nume from jocuri where cod_joc = id_joc;
    
    DBMS_OUTPUT.PUT_LINE('Jocul este: ' || '' || nume);
    -- Afi?are ?i salvare servere in tabel indexat
    FOR server_rec IN (SELECT * FROM SERVERE WHERE COD_JOC = id_joc) LOOP
        v_servere_indexate(contor) := server_rec;
        contor := contor + 1;
    END LOOP;
    
    -- Afi?are ?i salvare teste in tabel indexat
    contor := 1;
    FOR teste_rec IN (SELECT * FROM REZULTATE_TESTE WHERE COD_JOC = id_joc) LOOP
        v_teste_imbatabile(contor) := teste_rec;
        contor := contor + 1;
    END LOOP;

    -- Afi?are ?i salvare software in vector
    contor := 1;
    FOR software_rec IN (SELECT DISTINCT COD_SOFTWARE FROM DEZVOLTARE WHERE COD_JOC = id_joc) LOOP
        v_software_vector.EXTEND;
        v_software_vector(contor) := software_rec.COD_SOFTWARE;
        contor := contor + 1;
    END LOOP;
    
    -- Afi?are rezultate
    DBMS_OUTPUT.PUT_LINE('Servere in tabel indexat: ');
    FOR i IN 1..v_servere_indexate.COUNT  LOOP
        DBMS_OUTPUT.PUT_LINE(v_servere_indexate(i).COD_SERVER || ' - ' || v_servere_indexate(i).REGIUNE || ' - ' ||  v_servere_indexate(i).CAPACITATE_MAXIMA);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Teste in tabel indexat:');
    FOR i IN 1..v_teste_imbatabile.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_teste_imbatabile(i).COD_TEST || ' - ' || v_teste_imbatabile(i).NOTA_TEST);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Software in vector:' );
    FOR i IN 1..v_software_vector.COUNT LOOP
        select nume into nume from software where cod_software = v_software_vector(i);
        DBMS_OUTPUT.PUT_LINE(v_software_vector(i) || ' - ' || nume);
    END LOOP;
        
END;

--7
 PROCEDURE GestionareEchipeDezvoltare (COD_JOC_IN IN JOCURI.COD_JOC%TYPE) AS
   
    CURSOR CurAngajati IS
        SELECT A.COD_ANGAJAT, A.NUME, A.PRENUME, D.COD_JOC, D.COD_SOFTWARE
        FROM ANGAJATI A
        JOIN DEZVOLTARE D ON A.COD_ANGAJAT = D.COD_ANGAJAT
        WHERE D.COD_JOC = COD_JOC_IN;

  
    CURSOR CurSoftware (COD_SOFTWARE_IN IN SOFTWARE.COD_SOFTWARE%TYPE) IS
        SELECT NUME, UTILIZARE
        FROM SOFTWARE
        WHERE COD_SOFTWARE = COD_SOFTWARE_IN;

   
    nume_ANGAJAT ANGAJATI.NUME%TYPE;
    prenume_ANGAJAT ANGAJATI.PRENUME%TYPE;
    nume_SOFTWARE SOFTWARE.NUME%TYPE;
    V_UTILIZARE_SOFTWARE SOFTWARE.UTILIZARE%TYPE;

BEGIN
   
    FOR RecAngajat IN CurAngajati LOOP
       
        nume_ANGAJAT := RecAngajat.NUME;
        prenume_ANGAJAT := RecAngajat.PRENUME;

     
        FOR RecSoftware IN CurSoftware(RecAngajat.COD_SOFTWARE) LOOP
         
            nume_SOFTWARE := RecSoftware.NUME;
            V_UTILIZARE_SOFTWARE := RecSoftware.UTILIZARE;

          
            DBMS_OUTPUT.PUT_LINE('Angajat: ' || nume_ANGAJAT || ' ' || prenume_ANGAJAT);
            DBMS_OUTPUT.PUT_LINE('Software Utilizat: ' || nume_SOFTWARE || ' - ' || V_UTILIZARE_SOFTWARE);
            DBMS_OUTPUT.PUT_LINE('---');
        END LOOP;
    END LOOP;

END GestionareEchipeDezvoltare;

--8
 FUNCTION f1(
    numes SOFTWARE.NUME%TYPE
) RETURN ANGAJATI.NUME%TYPE
IS
    nume ANGAJATI.NUME%TYPE;
    
    AngajatNotFound EXCEPTION;
    PRAGMA EXCEPTION_INIT(AngajatNotFound, -20101);

    SoftwareInUse EXCEPTION;
    PRAGMA EXCEPTION_INIT(SoftwareInUse, -20102);
BEGIN
    SELECT A.NUME
    INTO nume
    FROM ANGAJATI A
    JOIN DEZVOLTARE D ON D.COD_ANGAJAT = A.COD_ANGAJAT
    JOIN SOFTWARE S ON S.COD_SOFTWARE = D.COD_SOFTWARE
    WHERE LOWER(S.NUME) = LOWER(numes);

    RETURN nume;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20101, 'Angajatul nu a fost gasit sau nu exista software cu numele acesta');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20102, 'Sunt mai multi angajati care folosesc acest software.');
END f1;

--9
 PROCEDURE primul (
  p_regiune IN servere.regiune%TYPE,
  p_nume_software IN software.nume%TYPE
) AS
  nume angajati.nume%TYPE;
  prenume angajati.prenume%TYPE;
  salariu angajati.salariu%TYPE;
  nume_joc jocuri.nume%TYPE;
BEGIN
  SELECT a.nume, a.prenume, a.salariu, j.nume
  INTO nume, prenume, salariu, nume_joc
  FROM jocuri j
  JOIN dezvoltare d ON d.cod_joc = j.cod_joc
  JOIN angajati a ON a.cod_angajat = d.cod_angajat
  JOIN software s ON s.cod_software = d.cod_software
  JOIN servere se ON se.cod_joc = j.cod_joc
  WHERE LOWER(se.regiune) = LOWER(p_regiune)
    AND LOWER(s.nume) = LOWER(p_nume_software)
  ORDER BY a.salariu DESC;


  DBMS_OUTPUT.PUT_LINE('Nume: ' || nume);
  DBMS_OUTPUT.PUT_LINE('Prenume: ' || prenume);
  DBMS_OUTPUT.PUT_LINE('Salariu: ' || salariu);
  DBMS_OUTPUT.PUT_LINE('Nume Joc: ' || nume_joc);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nu s-au gasit date pentru regiunea si software-ul specificate.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Exista mai multe inregistrari decat era de asteptat.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('O eroare neasteptata a aparut: ' || SQLERRM);
END primul;


end p13;
/

DECLARE
    id_joc JOCURI.COD_JOC%TYPE := 6; 
    cod_joc_gestionare JOCURI.COD_JOC%TYPE := 1;
    nume_software_f1 SOFTWARE.NUME%TYPE := 'Unity';
    regiune_primul SERVERE.REGIUNE%TYPE := 'Regiune1';
    nume_angajat_f1 ANGAJATI.NUME%TYPE;
BEGIN
   
    p13.afisare(id_joc);


    p13.GestionareEchipeDezvoltare(cod_joc_gestionare);

    
      nume_angajat_f1 := p13.f1(nume_software_f1);
      DBMS_OUTPUT.PUT_LINE('Numele angajatului care foloseste ' || nume_software_f1 || ': ' || nume_angajat_f1);

      p13.primul('europa','unity');
END;
/


--14



CREATE OR REPLACE PACKAGE p14 AS
  
    TYPE AngajatType IS RECORD (
        Cod_Angajat NUMBER,
        Nume VARCHAR2(25),
        Prenume VARCHAR2(25),
        Email VARCHAR2(225),
        Data_Nastere DATE,
        Data_Angajare DATE,
        Telefon NUMBER,
        Cod_Manager NUMBER,
        Salariu NUMBER
    );
     TYPE TestType IS RECORD (
    Cod_Test NUMBER,
    Cod_Joc NUMBER,
    Cod_Angajat NUMBER,
    Data_Test DATE,
    Nota_Test NUMBER,
    Descriere_Probleme VARCHAR2(225)
  );

    FUNCTION CalculSalariuMediuRegiune(regiune servere.regiune%type) RETURN NUMBER;
    FUNCTION ObtineAngajat(Cod_Angajats angajati.cod_angajat%type) RETURN AngajatType;

    PROCEDURE ActualizeazaSalariuAngajat(Cod_Angajat angajati.cod_angajat%type, NouSalariu angajati.salariu%type);
    PROCEDURE InregistreazaTest(Test TestType);
END p14;
/




CREATE OR REPLACE PACKAGE BODY p14 AS

 
  FUNCTION CalculSalariuMediuRegiune(regiune servere.regiune%type) RETURN NUMBER IS
    AvgSalariu NUMBER;
  BEGIN
    select avg(a.salariu)
    into  AvgSalariu
    from angajati a
    join dezvoltare d on d.cod_angajat = a.cod_angajat
    join servere s on s.cod_joc = d.cod_joc
    where lower(s.regiune) = lower(regiune);
        
    RETURN AvgSalariu;
  END CalculSalariuMediuRegiune;

  
FUNCTION ObtineAngajat(Cod_Angajats angajati.cod_angajat%type) RETURN AngajatType IS
    Emp AngajatType;
BEGIN
    SELECT COD_ANGAJAT, NUME, PRENUME, EMAIL, DATA_NASTERE, DATA_ANGAJARE, TELEFON, COD_MANAGER, salariu
    INTO Emp.Cod_Angajat, Emp.Nume, Emp.Prenume, Emp.Email, Emp.Data_Nastere, Emp.Data_Angajare, Emp.Telefon, Emp.Cod_Manager, Emp.Salariu
    FROM ANGAJATI
    WHERE COD_ANGAJAT = Cod_Angajats AND ROWNUM = 1;

    RETURN Emp;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Angajatul nu a fost gasit.');
END ObtineAngajat;





PROCEDURE ActualizeazaSalariuAngajat(Cod_Angajat ANGAJATI.COD_ANGAJAT%TYPE, NouSalariu ANGAJATI.salariu%TYPE) IS
BEGIN
  UPDATE ANGAJATI
  SET salariu = NouSalariu
  WHERE COD_ANGAJAT = Cod_Angajat;

  COMMIT; 

END ActualizeazaSalariuAngajat;


 
PROCEDURE InregistreazaTest(Test TestType) IS
BEGIN
 
  INSERT INTO REZULTATE_TESTE (COD_TEST, COD_JOC, COD_ANGAJAT, DATA_TEST, NOTA_TEST, DESCRIERE_PROBLEME)
  VALUES (Test.COD_TEST, Test.COD_JOC, Test.COD_ANGAJAT, Test.DATA_TEST, Test.NOTA_TEST, Test.DESCRIERE_PROBLEME);

  COMMIT; 

END InregistreazaTest;


  
END p14;
/


DECLARE
    avg_salariu NUMBER;
    v_cod_angajat angajati.cod_angajat%TYPE := 13;
    v_angajat p14.AngajatType;
    
    v_cod_angajat_actualizare angajati.cod_angajat%TYPE := 0;
    v_nou_salariu angajati.salariu%TYPE := 5000000; 
    
    v_test p14.TestType;
BEGIN
    avg_salariu := p14.CalculSalariuMediuRegiune('europa');
    DBMS_OUTPUT.PUT_LINE('Salariul mediu in regiunea ' || 'EUROPA' || ': ' || avg_salariu);
    
    
    v_angajat := p14.ObtineAngajat(v_cod_angajat);
    
    DBMS_OUTPUT.PUT_LINE('Nume: ' || v_angajat.Nume || ', Prenume: ' || v_angajat.Prenume || ', Email: ' || v_angajat.Email);
    
    p14.ActualizeazaSalariuAngajat(v_cod_angajat_actualizare, v_nou_salariu);
    DBMS_OUTPUT.PUT_LINE('Salariu actualizat cu succes pentru angajatul cu COD_ANGAJAT ' || v_cod_angajat_actualizare);
    
    v_test.COD_TEST := 11; 
    v_test.COD_JOC := 1; 
    v_test.COD_ANGAJAT := 37; 
    v_test.DATA_TEST := TO_DATE('2024-01-12', 'YYYY-MM-DD'); 
    v_test.NOTA_TEST := 9; 
    v_test.DESCRIERE_PROBLEME := 'Fara probleme dar mai trebuie lucrat la meniu'; 

    p14.InregistreazaTest(v_test);
    DBMS_OUTPUT.PUT_LINE('Test inregistrat cu succes pentru COD_TEST ' || v_test.COD_TEST);


END;
/

DELETE FROM REZULTATE_TESTE
WHERE COD_TEST = 11;