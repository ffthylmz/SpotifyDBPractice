--create database Spotify

create table Kullanici
(
KullaniciAdi nvarchar(20) primary key,
KullaniciEmail nvarchar(40) unique not null,
Sifre char(8)  not null,
DogumTarihi date not null
)

create table UyelikTipi
(
UyelikTipiID int identity(1,1) primary key,
UyelikTipiAdi nvarchar(30) not null,
Tutar int not null,
UyelikSuresi int not null,
ReklamVarMi bit not null
)

create table Hesap
(
HesapID int identity(1,1) primary key,
KullaniciAdi nvarchar(20) foreign key references Kullanici(KullaniciAdi),
UyelikTipiID int foreign key references UyelikTipi(UyelikTipiID),
)

create table Playlist
(
PlaylistID int identity(1,1) primary key,
Ad nvarchar(20) not null,
SarkiSayisi int not null,
Suresi int not null,
BegeniSayisi int not null,
DinlenmeSayisi int not null,
HesapID int foreign key references Hesap(HesapID),
KullaniciAdi nvarchar(20) foreign key references Kullanici(KullaniciAdi)
)
create table Sarkici
(
SarkiciID int identity(1,1) primary key,
Ad nvarchar(20) not null,
Soyad nvarchar(20) not null,
DogumTarihi date not null,
Cinsiyet char(1) not null,
)
create table PodCastTuru
(
PodCastTuruID int identity(1,1) primary key,
TurAdi nvarchar(20) not null
)

create table PodCast
(
PodCastID int identity(1,1) primary key,
KullaniciAdi nvarchar(20) foreign key references Kullanici(KullaniciAdi),
PodCastTuruID int foreign key references PodCastTuru(PodCastTuruID),
Suresi int not null,
KonukVarMi bit not null
)

create table Sarki
(
SarkiID int identity(1,1) primary key,
SozYazanKisi nvarchar(30) not null,
MuzigiYapanKisi nvarchar(30) not null,
SarkiciID int foreign key references Sarkici(SarkiciID),
Ad nvarchar(20) not null,
Yýl char(4) not null,
Suresi int not null,
DinlenmeSayisi int not null,
BegeniSayisi int not null
)

create table PlaylistToSarki
(
PlaylistToSarkiID int identity(1,1) primary key,
PlaylistID int foreign key references Playlist(PlaylistID),
SarkiID int foreign key references Sarki(SarkiID),
)


create Table MuzikTuru
(
MuzikTuruID nvarchar(10) primary key,
Ad nvarchar(20) not null
)

create table Album
(
AlbumID int identity(1,1) primary key,
AlbumAdi nvarchar(20) not null,
AlbumYili char(4) not null,
SarkiSayisi int not null,
DinlenmeSayisi int not null,
BegeniSayisi int not null
)

create table AlbumToMuzikTuru
(
AlbumToMuzikTuru int identity(1,1) primary key,
AlbumID int foreign key references Album(AlbumID),
MuzikTuruID nvarchar(10) foreign key references MuzikTuru(MuzikTuruID)
)

create table AlbumToSarkici
(
AlbumToSarkici int identity(1,1) primary key,
AlbumID int foreign key references Album(AlbumID),
SarkiciID int foreign key references Sarkici(SarkiciID),
)

create table AlbumToSarki
(
AlbumToSarki int identity(1,1) primary key,
AlbumID int foreign key references Album(AlbumID),
SarkiID int foreign key references Sarki(SarkiID),
)

create table SarkiciToAlbum
(
SarkiciToAlbumID INT identity(1,1) primary key,
SarkiciID int foreign key references Sarkici(SarkiciID),
AlbumID int foreign key references Album(AlbumID)
)

create table SarkiciToSarki
(
SarkiciToSarkiID INT identity(1,1) primary key,
SarkiciID int foreign key references Sarkici(SarkiciID),
SarkýID int foreign key references Sarki(SarkiID)
)

create table SarkiToPlaylist
(
SarkiToPlaylist int identity(1,1) primary key,
SarkiID int foreign key references Sarki(SarkiID),
PlaylistID int foreign key references Playlist(PlaylistID)
)

create table MuzikModu
(
MuzikModuID int identity(1,1) primary key,
MuzikModuAdi nvarchar(20) not null
)
create table SarkiToMuzikModu
(
SarkiToMuzikModuID int identity(1,1) primary key,
SarkiID int foreign key references Sarki(SarkiID),
MuzikModuID int foreign key references MuzikModu(MuzikModuID),
)

create table SarkiToAlbum
(
SarkiToAlbumID int identity(1,1) primary key,
SarkiID int foreign key references Sarki(SarkiID),
AlbumID int foreign key references Album(AlbumID)
)


create table MuzikTuruToSarki
(
MuzikTuruToSarkiID INT identity(1,1) primary key,
SarkiID int foreign key references Sarki(SarkiID),
MuzikTuruID nvarchar(10) foreign key references MuzikTuru(MuzikTuruID)
)



