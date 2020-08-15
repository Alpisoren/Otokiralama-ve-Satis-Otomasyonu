CREATE DATABASE [Parodi_Oto_Kiralama] CONTAINMENT=NONE
ON PRIMARY
(NAME ='Parodi_Oto_Kiralama',FILENAME='C:\Parodi\Parodi_Oto_Kiralama.mdf',
SIZE=10240KB,MAXSIZE=51200KB,
FILEGROWTH=5120KB)
LOG ON
(NAME ='Parodi_Oto_Kiralama_Satis',
FILENAME='C:\Parodi\Parodi_Oto_Kiralama_Satis.ldf',
SIZE= 768KB ,MAXSIZE=UNLIMITED,
FILEGROWTH=10%)       /*mdf ve ldf dosyasý oluþturuk*/
GO

USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Musteri_Kimlik_Bilgileri (
Musteri_TcNo varchar(11) primary key,
Musteri_adi varchar(50),
Musteri_Soyadi varchar(50),
Musteri_Dtarih datetime,
Musteri_DYeri_ID int,
Musteri_CiltNo varchar(5),
Musteri_SiraNo varchar(5),
Musteri_AnneAdi varchar(50),
Musteri_BabaAdi varchar(50)
 )
 

 USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_Ehliyetler (
Ehliyet_ID  int identity(1,1) primary key,
Ehliyet_Sinifi varchar(2),
Ehliyet_BelgeNo varchar(6)
 )
 USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_Kapsam (
 KapsamID  int identity(1,1) primary key,
 Kapsam_adi varchar(3)
 )

 USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_Ehliyet_Kapsam (
EhliyetKapsam_ID int identity(1,1) primary key,
Ehliyet_ID int FOREIGN KEY REFERENCES Tbl_Ehliyetler(Ehliyet_ID),
Kapsam_ID int FOREIGN KEY REFERENCES Tbl_Kapsam(KapsamID)
)
 USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_iller (
il_ID int identity(1,1) primary key,
il_adi varchar(30)
)
USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_ilceler (
ilce_ID int identity(1,1) primary key,
ilce_adi varchar(30),
Ýl_ID int  FOREIGN KEY REFERENCES Tbl_iller(il_ID),
)
USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_Adresler (
Adres_ID int identity(1,1) primary key,
Ýlce_ID int  FOREIGN KEY REFERENCES Tbl_ilceler(ilce_ID),
Mahalle_Adi varchar(100),
Cadde_Adi varchar(100),
Sokak_Adi varchar(100),
Apartman_No varchar(4),
Kat_No varchar(3),
Daire_No varchar(4),
)
USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_iletisim (
iletisim_ID int identity(1,1) primary key,
Cep_TelNo varchar(11),
Ev_TelNo varchar(11),
Email varchar(50),
Adres_ID int  FOREIGN KEY REFERENCES Tbl_Adresler(Adres_ID),
Posta_Kodu varchar(5)
)
USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_Musteri_Bilgileri (
Musteri_ID int identity(1,1) primary key,
Musteri_TcNo varchar(11),
Musteri_iletisimID int FOREIGN KEY REFERENCES Tbl_iletisim(iletisim_ID ),
Musteri_EhliyetID int 
 )
USE [Parodi_Oto_Kiralama]
 CREATE TABLE Tbl_MusteriveEhliyet (
MusteriEhliyet_ID int identity(1,1) primary key,
Musteri_ID int  FOREIGN KEY REFERENCES Tbl_Musteri_Bilgileri(Musteri_ID),
Ehliyet_ID int FOREIGN KEY REFERENCES Tbl_Ehliyetler(Ehliyet_ID)
 )
 USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Personel_Kimlik_Bilgileri (
Personel_Tc_No varchar(11) primary key not null,
Personel_adi varchar(50),
Personel_Soyadi varchar(50),
Personel_Dtarih datetime,
Personel_DYeri_ID int FOREIGN KEY REFERENCES Tbl_iller(il_ID),
Personel_CiltNo varchar(5),
Personel_SiraNo varchar(5)
 )
  USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Personel_Gorev (
Gorev_ID int identity(1,1) primary key,
Gorev_adi varchar(50),
Maas money
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Subeler (
Sube_ID int identity(1,1) primary key,
Sube_Adi varchar(50),
Ýletisim_ID int FOREIGN KEY REFERENCES Tbl_iletisim(iletisim_ID )
)
  USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Personel_Bilgileri (
PersonelID  int identity(1,1) primary key,
Personel_TcNo varchar(11) FOREIGN KEY REFERENCES Tbl_Personel_Kimlik_Bilgileri(Personel_Tc_No),
Personel_iletilisimID int FOREIGN KEY REFERENCES Tbl_iletisim(iletisim_ID ),
Personel_GorevID int FOREIGN KEY REFERENCES Tbl_Personel_Gorev(Gorev_ID ),
Sube_ID int  FOREIGN KEY REFERENCES Tbl_Subeler(Sube_ID )
)


USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Araba_Markalarý (
Marka_ID int identity(1,1) primary key,
Marka_adi varchar(50)
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Araba_Modelleri (
Model_ID int identity(1,1) primary key,
Model_adi varchar(50),
Marka_ID int  FOREIGN KEY REFERENCES  Tbl_Araba_Markalarý(Marka_ID )
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Vites_Tur (
Vites_Tur_ID int identity(1,1) primary key,
VitesTur_Adi varchar(15)
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_ArabaHasar_Turleri (
Hasar_ID int identity(1,1) primary key,
Hasar_adi varchar(50),
Hasar_Ucret money

)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Araba_Siniflari  (
Sinif_ID  int identity(1,1) primary key,
Sinif_adi varchar(20)
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Kiralik_Araclar (
Plaka_No varchar(10) primary key not null,
Model_ID int   FOREIGN KEY REFERENCES  Tbl_Araba_Modelleri(Model_ID ),
Arac_Yili datetime,
Renk varchar(15),
Kasa_Tipi varchar(15),
Yakit_Türü varchar(10),
Vites_TurID int FOREIGN KEY REFERENCES  Tbl_Vites_Tur(Vites_Tur_ID ),
Motor_Hacmi varchar(10),
Motor_Gucu varchar(10),
Km_bilgisi varchar(10),
Hasar_Durumu bit,
Koltuk_Sayisi varchar(2),
Gunluk_Ucret money,
Sigorta_BitisTarihi datetime,
Muayene_BitisTarihi datetime,
Kasko_BitisTarihi datetime,
Araba_SinifID int FOREIGN KEY REFERENCES  Tbl_Araba_Siniflari(Sinif_ID ),
Sube_ID int FOREIGN KEY REFERENCES Tbl_Subeler(Sube_ID )
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_EkSurucu  (
EkSurucu_ID  int identity(1,1) primary key,
EkSurucu_TcNO varchar(11),
EkSurucu_adi varchar(50),
EkSurucu_Soyadi varchar(50),
Musteri_ID int FOREIGN KEY REFERENCES Tbl_Musteri_Bilgileri(Musteri_ID)
)

USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Arac_Kiralama  (
Kira_ID  int identity(1,1) primary key,
Arac_PlakaNo varchar(10) FOREIGN KEY REFERENCES Tbl_Kiralik_Araclar(Plaka_No),
KiraBaslangicGun date,
TeslimEdilenGun date,
TeslimEdenPersonel_ID int,
Musteri_Kefil_ID int FOREIGN KEY REFERENCES Tbl_Kefil_Bilgileri(kefil_ID),
TeslimEdilenSube_ID int FOREIGN KEY REFERENCES Tbl_Subeler(Sube_ID ),
EkSurucu_ID int FOREIGN KEY REFERENCES Tbl_EkSurucu(EkSurucu_ID ),
AlinanDepozito_Ucreti money
)



USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Kefil_Bilgileri  (
Kefil_ID int identity(1,1) primary key,
Kefil_TcNo varchar(11),
Kefil_Adi varchar(50),
Kefil_Soyadi  varchar(50),
Kefil_Tel varchar(11)
)

USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_ArabaveHasar (
Arac_Hasar_ID int identity(1,1) primary key,
KiraID int FOREIGN KEY REFERENCES Tbl_Arac_Kiralama(Kira_ID ),
Hasar_ID int FOREIGN KEY REFERENCES  Tbl_ArabaHasar_Turleri(Hasar_ID)
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Donanimlar (
Donanim_ID int identity(1,1) primary key,
Donanim_adi varchar(50)
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_AracDonanimlar (
AracDonanim_ID int identity(1,1) primary key,
Donanim_ID int FOREIGN KEY REFERENCES  Tbl_Donanimlar(Donanim_ID),
Plaka_No varchar(10) FOREIGN KEY REFERENCES  Tbl_Kiralik_Araclar(Plaka_No)
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Arac_Extralar (
Extra_ID  int identity(1,1) primary key,
Extra_adi varchar(50),
Extra_ucret money
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Extra_islemler  (
Extra_islemID int identity(1,1) primary key,
Kiralik_ID int  FOREIGN KEY REFERENCES  Tbl_Arac_Kiralama(Kira_ID),
Extra_ID int  FOREIGN KEY REFERENCES  Tbl_Arac_Extralar(Extra_ID )
)



USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Satilik_Araclar  (
SatilikPlaka_No varchar(10) primary key not null,
Model_ID int FOREIGN KEY REFERENCES  Tbl_Araba_Modelleri(Model_ID ),
Arac_Yili varchar(4),
Renk varchar(15),
Kasa_Tipi varchar(15),
Yakit_Türü varchar(15),
Vites_TurID int FOREIGN KEY REFERENCES  Tbl_Vites_Tur(Vites_Tur_ID ),
Motor_Hacmi varchar(15),
Motor_Gucu varchar(15),
Koltuk_Sayisi varchar(2),
Fiyat money,
Durumu bit,
Sube_ID int FOREIGN KEY REFERENCES Tbl_Subeler(Sube_ID ),
Araba_SinifID int FOREIGN KEY REFERENCES  Tbl_Araba_Siniflari(Sinif_ID),

)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Kiralik_ArabaStok (
KiralikStok_ID int identity(1,1) primary key,
Plaka_No varchar(10) FOREIGN KEY REFERENCES Tbl_Kiralik_Araclar(Plaka_No),
Durum bit
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_ArabaSat (
SatilanAraba_ID int identity(1,1) primary key,
SatilikPlaka_No varchar(10) FOREIGN KEY REFERENCES Tbl_Satilik_Araclar(SatilikPlaka_No),
TeslimEdenPersonel_ID int FOREIGN KEY REFERENCES Tbl_Personel_Bilgileri(PersonelID),
Satis_Tarihi datetime,
Musteri_ID int FOREIGN KEY REFERENCES Tbl_Musteri_Bilgileri(Musteri_ID)

)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Satilik_ArabaStok (
SatilikStok_ID int identity(1,1) primary key,
SatilikPlaka_No varchar(10) FOREIGN KEY REFERENCES Tbl_Satilik_Araclar(SatilikPlaka_No),
Durum bit
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Fatura (
Fatura_ID int identity(1,1) primary key,
Fatura_Tarih datetime,
Odeme_Tur varchar(10),
Musteri_ID int FOREIGN KEY REFERENCES Tbl_Musteri_Bilgileri(Musteri_ID),
Kira_ID int FOREIGN KEY REFERENCES Tbl_Arac_Kiralama(Kira_ID),
Extra_islemID int,
ArabaHasar_UcretID int,
Gecikme_cezaUcret money,
Toplam_Ucret money,
TeslimAlinanSube_ID int FOREIGN KEY REFERENCES Tbl_Subeler(Sube_ID )
)
USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Rezervasyon(
Rezarvasyon_ID int identity(1,1) primary key,
Musteri_ID int FOREIGN KEY REFERENCES Tbl_Musteri_Bilgileri(Musteri_ID),
Rezerve_AracID int FOREIGN KEY REFERENCES  Tbl_Arac_Kiralama(Kira_ID),
Rezerve_Tarih date,
Rezerve_Saati time,
RezerveAlanPersonel_ID int FOREIGN KEY REFERENCES Tbl_Personel_Bilgileri(PersonelID)

)

USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Personel_GirisCikis(
PTakip_ID int identity(1,1) primary key,
Personel_ID int,
IseGelisTarihi date,
IseGelisSaati time,
IstenCikisSaati time
)

USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_FaturaOdeme(
Odenen_ID int identity(1,1) primary key,
KiralýkFatura_ID int FOREIGN KEY REFERENCES Tbl_Arac_Kiralama(Kira_ID),
Durum bit,
Tarih date
)


USE [Parodi_Oto_Kiralama]
CREATE TABLE Tbl_Odeme_Turleri (
Odeme_Tur_ID int identity(1,1) primary key,
Odeme_Tur_Adi varchar(10)
)
ALTER TABLE Tbl_Arac_Kiralama ADD  Musteri_ID int
ALTER TABLE Tbl_Arac_Kiralama ADD FOREIGN KEY(Musteri_ID) REFERENCES Tbl_Musteri_Bilgileri(Musteri_ID)
ALTER TABLE Tbl_Fatura DROP COLUMN Musteri_ID
ALTER TABLE Tbl_Fatura ADD FOREIGN KEY (ArabaHasar_UcretID) REFERENCES Tbl_ArabaveHasar(Arac_Hasar_ID)
ALTER TABLE Tbl_Musteri_Bilgileri DROP COLUMN Musteri_EhliyetID
ALTER TABLE Tbl_Satilik_Araclar DROP COLUMN Durumu
DROP TABLE Tbl_Satilik_ArabaStok
ALTER TABLE Tbl_Satilik_Araclar ADD  Durum bit
ALTER TABLE Tbl_Kiralik_Araclar ADD  Durum bit
DROP TABLE Tbl_Kiralik_ArabaStok
ALTER TABLE Tbl_ArabaSat ADD Odeme_Tur_ID int
ALTER TABLE Tbl_ArabaSat ADD FOREIGN KEY (Odeme_Tur_ID) REFERENCES Tbl_Odeme_Turleri(Odeme_Tur_ID)
ALTER TABLE Tbl_Arac_Kiralama ALTER COLUMN TeslimEdilenGun datetime
ALTER TABLE Tbl_Arac_Kiralama ALTER COLUMN KiraBaslangicGun datetime
ALTER TABLE Tbl_Fatura ALTER COLUMN Extra_islemID money
ALTER TABLE Tbl_Fatura DROP COLUMN ArabaHasar_UcretID
ALTER TABLE Tbl_Fatura  ADD  ArabaHasar_Ucret money
ALTER TABLE Tbl_Musteri_Kimlik_Bilgileri ADD FOREIGN KEY (Musteri_DYeri_ID) REFERENCES Tbl_iller(il_ID)
ALTER TABLE Tbl_Musteri_Bilgileri ADD FOREIGN KEY (Musteri_TcNo) REFERENCES Tbl_Musteri_Kimlik_Bilgileri (Musteri_TcNo)
ALTER TABLE Tbl_ArabaveHasar ADD FOREIGN KEY (KiraID) REFERENCES Tbl_Arac_Kiralama (Kira_ID)
ALTER TABLE Tbl_Arac_Kiralama ADD FOREIGN KEY (TeslimEdenPersonel_ID) REFERENCES Tbl_Personel_Bilgileri(PersonelID)
ALTER TABLE Tbl_Arac_Kiralama  DROP COLUMN TeslimEdenPersonel_ID
ALTER TABLE Tbl_Arac_Kiralama  ADD  TeslimEdenPersonel_ID int
ALTER TABLE Tbl_Extra_islemler ADD FOREIGN KEY (Kiralik_ID) REFERENCES Tbl_Arac_Kiralama(Kira_ID)
ALTER TABLE Tbl_Fatura ALTER COLUMN Odeme_Tur int
ALTER TABLE Tbl_Fatura ADD FOREIGN KEY (Odeme_Tur) REFERENCES Tbl_Odeme_Turleri(Odeme_Tur_ID)
ALTER TABLE Tbl_Fatura ADD FOREIGN KEY (Kira_ID) REFERENCES Tbl_Arac_Kiralama (Kira_ID)
ALTER TABLE Tbl_FaturaOdeme ADD FOREIGN KEY (Fatura_ID) REFERENCES  Tbl_Fatura(Fatura_ID)
ALTER TABLE Tbl_iletisim DROP COLUMN Adres_ID
ALTER TABLE Tbl_iletisim ADD Adres_ID int
ALTER TABLE Tbl_iletisim ADD FOREIGN KEY (Adres_ID) REFERENCES  Tbl_Adresler(Adres_ID)
ALTER TABLE Tbl_Personel_GirisCikis ADD FOREIGN KEY (Personel_ID) REFERENCES  Tbl_Personel_Bilgileri(PersonelID)
ALTER TABLE Tbl_Rezervasyon DROP COLUMN RezerveAlanPersonel_ID
ALTER TABLE Tbl_Rezervasyon ADD RezerveAlanPersonel_ID int
ALTER TABLE Tbl_Rezervasyon ADD FOREIGN KEY (RezerveAlanPersonel_ID) REFERENCES  Tbl_Personel_Bilgileri(PersonelID)
ALTER TABLE Tbl_EkSurucu  ADD  Ehliyet_ID int
ALTER TABLE Tbl_EkSurucu ADD FOREIGN KEY ( Ehliyet_ID) REFERENCES  Tbl_Ehliyetler(Ehliyet_ID)
ALTER TABLE Tbl_EkSurucu  ADD  iletisim_ID int
ALTER TABLE Tbl_EkSurucu ADD FOREIGN KEY ( iletisim_ID) REFERENCES  Tbl_iletisim(iletisim_ID)
ALTER TABLE Tbl_Kefil_Bilgileri  ADD  iletisim_ID int
ALTER TABLE Tbl_Kefil_Bilgileri ADD FOREIGN KEY ( iletisim_ID) REFERENCES  Tbl_iletisim(iletisim_ID)
ALTER TABLE Tbl_Kefil_Bilgileri DROP COLUMN Kefil_Tel
ALTER TABLE Tbl_Personel_GirisCikis  ADD  Durum bit
ALTER TABLE Tbl_Rezervasyon  ADD Rezerve_AracPlakaNo varchar(10)
ALTER TABLE Tbl_Rezervasyon ADD FOREIGN KEY ( Rezerve_AracPlakaNo) REFERENCES  Tbl_Kiralik_Araclar(Plaka_No)
ALTER TABLE Tbl_Rezervasyon ALTER COLUMN Rezerve_Tarih datetime
ALTER TABLE Tbl_Fatura DROP COLUMN Toplam_Ucret
ALTER TABLE Tbl_Fatura ADD Toplam_Ucret money

