create schema PenjualanDVD
-- 225150601111013 || Ananta Risky Susanto
use penjualanDVD
create table GENRE(
	ID_GENRE smallint not null primary key,
	GENRE VARCHAR(45)
)
create table MOVIE(
	KODE_DVD VARCHAR(10) not null primary key,
	JUDUL VARCHAR(60),
	HARGA_SEWA DOUBLE,
	DENDA DOUBLE,
	TAHUN_RILIS smallint
)
create table GENRE_MOVIE(
	ID_GENRE smallint  references GENRE (ID_GENRE),
	KODE_DVD VARCHAR(10) references MOVIE (KODE_DVD)
)

alter table MOVIE modify  TAHUN_RILIS year(4)
create table KECAMATAN(
	ID_KECAMATAN smallint not null primary key,
	KECAMATAN VARCHAR(45)
)
create table KELURAHAN(
	ID_KELURAHAN smallint not null primary key,
	ID_KECAMATAN smallint references KECAMATAN(ID_KECAMATAN),
	KELURAHAN VARCHAR(45)
)
create table PELANGGAN(
	KODE_PELANGGAN VARCHAR(10) not null primary key,
	ID_KELURAHAN smallint references KELURAHAN(ID_KELURAHAN),
	NAMA VARCHAR(45),
	ALAMAT VARCHAR(60),
	JENIS_KELAMIN CHAR(1),
	constraint KELAMIN_CHECK check (JENIS_KELAMIN in ('P','L'))	
)
create table TRANSAKSI(
	KODE_DVD VARCHAR(10) references movie (KODE_DVD),
	KODE_PELANGGAN VARCHAR(10) references PELANGGAN(KODE_PELANGGAN),
	TANGGAL_SEWA DATE not null primary key,
	TANGGAL_WAJIB_KEMBALI DATE,
	TANGGAL_REALISASI_KEMBALI DATE
)
create table KONTAK_PELANGGAN(
	NO_HP VARCHAR(25) unique ,
	KODE_PELANGGAN VARCHAR(10) references PELANGGAN(KODE_PELANGGAN)

)


	

