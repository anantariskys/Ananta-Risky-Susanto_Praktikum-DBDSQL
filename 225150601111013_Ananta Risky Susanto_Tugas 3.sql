create schema akademik
use akademik

create table FAKULTAS (
	ID_FAKULTAS smallint not null primary key,
	FAKULTAS VARCHAR(45)
)

create table JURUSAN (
	ID_JURUSAN smallint not null primary key,
	ID_FAKULTAS smallint references FAKULTAS(ID_FAKULTAS),
	JURUSAN VARCHAR(45)
)

create table STRATA (
	ID_STRATA smallint not null primary key,
	SINGKAT VARCHAR(10),
	STRATA VARCHAR(45)
)

create table PROGRAM_STUDI (
	ID_PROGRAM_STUDI smallint not null primary key,
	ID_STRATA smallint references STRATA(ID_STRATA),
	ID_JURUSAN smallint references JURUSAN(ID_JURUSAN),
	PROGRAM_STUDI VARCHAR(60)
)

create table SELEKSI_MASUK(
	ID_SELEKSI_MASUK smallint not null primary key,
	SINGKAT VARCHAR(12),
	SELEKSI_MASUK VARCHAR(60)
)


create table MAHASISWA(
	NIM VARCHAR(15),
	ID_SELEKSI_MASUK smallint references SELEKSI_MASUK(ID_SELEKSI_MASUK),
	ID_PROGRAM_STUDI smallint references PROGRAM_STUDI(ID_PROGRAM_STUDI),
	NAMA VARCHAR(45),
	ANGKATAN smallint,
	TGL_LAHIR DATE,
	KOTA_LAHIR VARCHAR(60),
	JENIS_KELAMIN CHAR(1)
)




insert into fakultas (ID_FAKULTAS,FAKULTAS) values (1,'Ekonomi & Bisnis');
insert into fakultas (ID_FAKULTAS,FAKULTAS) values (2,'Ilmu Komputer');
select * from fakultas 

insert into jurusan (ID_JURUSAN,ID_FAKULTAS ,JURUSAN) values (21,2,'Informatika');
insert into jurusan (ID_JURUSAN,ID_FAKULTAS ,JURUSAN) values (22,2,'Sistem Informasi');
insert into jurusan (ID_JURUSAN,ID_FAKULTAS ,JURUSAN) values (23,2,'Teknik Komputer');
select * from jurusan 

insert  into strata (ID_STRATA,SINGKAT,STRATA) values (1,'D1','Diploma');
insert  into strata (ID_STRATA,SINGKAT,STRATA) values (2,'S1','Sarjana');
insert  into strata (ID_STRATA,SINGKAT,STRATA) values (3,'S2','Magister');
select * from strata 


insert  into program_studi  (ID_PROGRAM_STUDI,ID_STRATA ,ID_JURUSAN ,PROGRAM_STUDI) values (211,2,21,'Teknik Informatika');
insert  into program_studi  (ID_PROGRAM_STUDI,ID_STRATA ,ID_JURUSAN ,PROGRAM_STUDI) values (212,2,21,'Teknik Komputer');
insert  into program_studi  (ID_PROGRAM_STUDI,ID_STRATA ,ID_JURUSAN ,PROGRAM_STUDI) values (219,3,21,'Magister Ilmu Komputer');
select * from program_studi 

insert into seleksi_masuk (ID_SELEKSI_MASUK,SINGKAT,SELEKSI_MASUK) values (1,'SNMPTN','SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI NEGERI');
insert into seleksi_masuk (ID_SELEKSI_MASUK,SINGKAT,SELEKSI_MASUK) values (2,'SBMPTN','SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI NEGERI');
select * from seleksi_masuk 

insert into  mahasiswa (NIM,ID_SELEKSI_MASUK,ID_PROGRAM_STUDI,NAMA,ANGKATAN,TGL_LAHIR,KOTA_LAHIR ,JENIS_KELAMIN) values ('155150400',1,211,'JONI',2015,1/1/1997,'Malang','W');
insert into  mahasiswa (NIM,ID_SELEKSI_MASUK,ID_PROGRAM_STUDI,NAMA,ANGKATAN,TGL_LAHIR,KOTA_LAHIR ,JENIS_KELAMIN) values ('155150401',2,212,'JON0',2015,2/10/1997,'Situbondo','P');
select * from mahasiswa