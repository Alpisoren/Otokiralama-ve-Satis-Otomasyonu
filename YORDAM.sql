/* MÜÞTERÝ KÝMLÝK BÝLGÝLERÝNÝ EKLEME*/

Create Proc sp_Musteri_Kimlik_Ekleme
(
@Musteri_TcNo varchar(11),
@Musteri_adi varchar(50),
@Musteri_Soyadi varchar(50),
@Musteri_Dtarih datetime,
@Musteri_DyerID int,
@Musteri_CiltNo varchar(5),
@Musteri_SiraNo varchar(5),
@Musteri_AnneAdi varchar(50),
@Musteri_BabaAdi varchar(50)
)
As
Begin
Insert into Tbl_Musteri_Kimlik_Bilgileri(Musteri_TcNo,Musteri_adi,Musteri_Soyadi,Musteri_Dtarih,Musteri_DYeri_ID,
Musteri_CiltNo,Musteri_SiraNo,Musteri_AnneAdi,Musteri_BabaAdi)
Values(@Musteri_TcNo,@Musteri_adi,@Musteri_Soyadi,@Musteri_Dtarih,@Musteri_DyerID,@Musteri_CiltNo,@Musteri_SiraNo,
@Musteri_AnneAdi,@Musteri_BabaAdi)
End

Exec sp_Musteri_Kimlik_Ekleme '47725254742','Ahmet','Gülgeli','10-10-1997','18','0036','00054','Rukiye','Remzi';

/*MÜÞTERÝ BÝLGÝLERÝNÝ EKLEME*/

Create Proc sp_Musteri_Bilgileri
(
@Musteri_TcNo varchar(11),
@Musteri_iletisimID int
)
As
Begin
Insert into Tbl_Musteri_Bilgileri(Musteri_TcNo,Musteri_iletisimID)
Values(@Musteri_TcNo,@Musteri_iletisimID)
End

Exec sp_Musteri_Bilgileri '47725254742','1'

/*AYNI ANDA HEM MÜÞTERÝ KÝMLÝK BÝLGÝLERÝNÝ EKLEME HEM DE MÜÞTERÝ BÝLGÝLERÝNÝ EKLEME */

Create Proc sp_Musteri
(
@Musteri_TcNo varchar(11),
@Musteri_adi varchar(50),
@Musteri_Soyadi varchar(50),
@Musteri_Dtarih datetime,
@Musteri_DyerID int,
@Musteri_CiltNo varchar(5),
@Musteri_SiraNo varchar(5),
@Musteri_AnneAdi varchar(50),
@Musteri_BabaAdi varchar(50),
@Musteri_iletisimID int
)
As
Begin
Insert into Tbl_Musteri_Kimlik_Bilgileri(Musteri_TcNo,Musteri_adi,Musteri_Soyadi,Musteri_Dtarih,Musteri_DYeri_ID,
Musteri_CiltNo,Musteri_SiraNo,Musteri_AnneAdi,Musteri_BabaAdi)
Values(@Musteri_TcNo,@Musteri_adi,@Musteri_Soyadi,@Musteri_Dtarih,@Musteri_DyerID,@Musteri_CiltNo,@Musteri_SiraNo,
@Musteri_AnneAdi,@Musteri_BabaAdi)
Insert into Tbl_Musteri_Bilgileri(Musteri_TcNo,Musteri_iletisimID)
Values(@Musteri_TcNo,@Musteri_iletisimID)
End

Exec sp_Musteri '47625854742','Mehmet','Yýldýz','05-23-1990','32','00214','00216','Yeþim','Bülent','2'
Exec sp_Musteri '37625854740','Hamdi','Pamuk','10-23-1990','35','00314','00116','Hülya','Mustafa','3'

/* MÜÞTERÝLERÝN ADINI, SOYADINI, TC, CEPTEL VE EMAÝL BÝLGÝLERÝNÝ LÝSTELEME*/

Create Proc sp_Musteri_iletisim_Listeleme
As
Begin


select Tbl_Musteri_Kimlik_Bilgileri.Musteri_adi,Musteri_Soyadi,Tbl_Musteri_Kimlik_Bilgileri.Musteri_TcNo,Tbl_iletisim.Cep_TelNo,Email 
from Tbl_Musteri_Bilgileri,Tbl_Musteri_Kimlik_Bilgileri,Tbl_iletisim 
Where Tbl_Musteri_Bilgileri.Musteri_TcNo=Tbl_Musteri_Kimlik_Bilgileri.Musteri_TcNo AND Tbl_iletisim.iletisim_ID=Tbl_Musteri_Bilgileri.Musteri_iletisimID
end

/* BÝR MÜÞTERÝNÝN ADINI, SOYADINI, TC, CEPTEL VE EMAÝL BÝLGÝLERÝNÝ LÝSTELEME*/

Create Proc sp_Bir_Musterinin_iletisim_Bilgileri

(
@Musteri_TcNo varchar(11)
)
As
Begin


select Tbl_Musteri_Kimlik_Bilgileri.Musteri_adi,Musteri_Soyadi,Tbl_Musteri_Kimlik_Bilgileri.Musteri_TcNo,Tbl_iletisim.Cep_TelNo,Email 
from  Tbl_Musteri_Kimlik_Bilgileri JOIN Tbl_Musteri_Bilgileri ON Tbl_Musteri_Bilgileri.Musteri_TcNo=Tbl_Musteri_Kimlik_Bilgileri.Musteri_TcNo
JOIN Tbl_iletisim ON Tbl_iletisim.iletisim_ID=Tbl_Musteri_Bilgileri.Musteri_iletisimID 
Where Tbl_Musteri_Kimlik_Bilgileri.Musteri_TcNo=@Musteri_TcNo
end

 /*ARABA MARKASI EKLEME*/

 Create Proc sp_Araba_Markasi_Ekleme

(
@Marka_adi varchar(50)
)
As
Begin
Insert INTO Tbl_Araba_Markalarý(Marka_adi) values (@Marka_adi)
end

/*ADRES BÝLGÝLERÝNÝ EKLEME*/

 Create Proc sp_Adres_Ekleme
 
(
@ilce_ID int,
@Mahalle_Adi varchar(100),
@Cadde_Adi varchar(100),
@Sokak_Adi varchar(100),
@Apartman_No varchar(4),
@Kat_No varchar(3),
@Daire_No varchar(4)
)
As
Begin
Insert INTO Tbl_Adresler(Ýlce_ID,Mahalle_Adi,Cadde_Adi,Sokak_Adi,Apartman_No,Kat_No,Daire_No) values (@ilce_ID,@Mahalle_Adi,@Cadde_Adi,
@Sokak_Adi,@Apartman_No,@Kat_No,@Daire_No)
end

/*ARABA MODELLERÝ EKLEME*/

Create Proc sp_Araba_Modelleri_Ekleme
(
@Model_adi varchar(50),
@Marka_ID int 
)
As
Begin
Insert INTO Tbl_Araba_Modelleri(Model_adi,Marka_ID) values(@Model_adi,@Marka_ID)
end

/*ARABA SINIFI EKLEME*/

Create Proc sp_Araba_Siniflari_Ekleme
(
@Sinif_adi varchar(20)

)
As
Begin
Insert INTO Tbl_Araba_Siniflari(Sinif_adi) values(@Sinif_adi)
end

/*ARABA HASAR TÜRLERÝNÝ EKLEME*/

Create Proc sp_Araba_Hasar_Turu_Ekleme
(
@Hasar_adi varchar(50),
@Hasar_Ucret money

)
As
Begin
Insert INTO Tbl_ArabaHasar_Turleri(Hasar_adi,Hasar_Ucret) values(@Hasar_adi,@Hasar_Ucret)
end

/*ARAÇ EXTRA ÖZELLÝK EKLEME*/

Create Proc sp_Arac_Extralar_Ekleme
(
@Extra_adi varchar(50),
@Extra_Ucret money

)
As
Begin
Insert INTO Tbl_Arac_Extralar(Extra_adi,Extra_ucret) values(@Extra_adi,@Extra_Ucret)
end

/*ARAÇLARA DONANIM EKLEME*/

Create Proc sp_Araclara_Donanim_Ekleme
(
@Donanim_ID int,
@Plaka_No varchar(10)

)
As
Begin
Insert INTO Tbl_AracDonanimlar(Donanim_ID,Plaka_No) values(@Donanim_ID,@Plaka_No)
end

/*EHLÝYET KAPSAMI EKLEME*/

Create Proc sp_Ehliyet_Kapsami_Ekleme
(
@Ehliyet_ID int,
@Kapsam_ID varchar(10)

)
As
Begin
Insert INTO Tbl_Ehliyet_Kapsam(Ehliyet_ID,Kapsam_ID) values(@Ehliyet_ID,@Kapsam_ID)
end

/*EK SÜRÜCÜ EKLEME*/

Create Proc sp_EK_Surucu_Ekleme
(
@EkSurucu_TcNo varchar(11),
@EkSurucu_adi varchar(50),
@EkSurucu_Soyadi varchar(50),
@Musteri_ID int,
@Ehliyet_ID int,
@iletisim_ID int

)
As
Begin
Insert INTO Tbl_EkSurucu(EkSurucu_TcNO,EkSurucu_adi,EkSurucu_Soyadi,Musteri_ID,Ehliyet_ID,iletisim_ID)
 values(@EkSurucu_TcNo,@EkSurucu_adi,@EkSurucu_Soyadi,@Musteri_ID,@Ehliyet_ID,@iletisim_ID)
end

/*KÝRALANACAK OLAN ARACA EXTRA DONANIM EKLEME*/

Create Proc sp_Kiralanan_Araca_Extra_Ekleme
(
@Kiralik_ID int,
@Extra_ID int
)
As
Begin
Insert INTO Tbl_Extra_islemler(Kiralik_ID,Extra_ID)
 values(@Kiralik_ID,@Extra_ID)
end

/*ÝLETÝÞÝM BÝLGÝLERÝNE KAYIT EKLEME */

Create Proc sp_Ýletisim_Bilgilerini_Ekleme
(
@Cep_TelNo varchar(11),
@Ev_TelNo varchar(11),
@Email varchar(50),
@Posta_Kodu varchar(5),
@Adres_ID int
)
As
Begin
Insert into Tbl_iletisim(Cep_TelNo,Ev_TelNo,Email,Posta_Kodu,Adres_ID) 
Values(@Cep_TelNo,@Ev_TelNo,@Email,@Posta_Kodu,@Adres_ID)
End

/*KEFÝL BÝLGÝLERÝNE KAYIT EKLEME */

Create Proc sp_Kefil_Bilgilerini_Ekleme
(
@Kefil_TcNo varchar(11),
@Kefil_Adi varchar(50),
@Kefil_Soyadi varchar(50),
@iletisim_ID int
)
As
Begin
Insert into Tbl_Kefil_Bilgileri(Kefil_TcNo,Kefil_Adi,Kefil_Soyadi,iletisim_ID) 
Values(@Kefil_TcNo,@Kefil_Adi,@Kefil_Soyadi,@iletisim_ID)
End

/*BÝR MÜÞTERÝ BÝRDEN FAZLA EHLÝYETE SAHÝP OLABÝLECEÐÝNDEN DOLAYI FARKLI EHLÝYET EKLEME */

Create Proc sp_Musteri_Ehliyet_Ekleme
(
@Musteri_ID int,
@Ehliyet_ID int
)
As
Begin
Insert into Tbl_MusteriveEhliyet(Musteri_ID,Ehliyet_ID) 
Values(@Musteri_ID,@Ehliyet_ID)
End


/*PERSONEL BÝLGÝLEÝRÝNÝ EKLEME */

Create Proc sp_Personel_Bilgilerini_Ekleme
(
@Personel_TcNo varchar(11),
@Personel_adi varchar(50),
@Personel_Soyadi varchar(50),
@Personel_Dtarih datetime,
@personel_DYeri_ID int,
@personel_CiltNo varchar(5),
@Personel_SiraNo varchar(5),
@Personel_iletisimID int,
@Personel_GorevID int,
@Sube_ID int
)
As
Begin
Insert into Tbl_Personel_Kimlik_Bilgileri(Personel_adi,Personel_Soyadi,Personel_Dtarih,Personel_DYeri_ID,Personel_CiltNo,Personel_SiraNo) 
Values(@Personel_adi,@Personel_Soyadi,@Personel_Dtarih,@personel_DYeri_ID,@personel_CiltNo,@Personel_SiraNo)
Insert into Tbl_Personel_Bilgileri(Personel_TcNo,Personel_iletilisimID,Personel_GorevID,Sube_ID) 
values(@Personel_TcNo,@Personel_iletisimID,@Personel_GorevID,@Sube_ID)
End

/*PERSONELÝN ÝÞE GELÝÞ ÝÞTEN ÇIKIÞ BÝLGÝLERÝNÝ EKLEME */

Create Proc sp_Personel_Ise_GelisCikis_Ekleme
(
@Personel_ID int,
@IseGelisTarihi date,
@IseGelisSaati time,
@IstenCikisSaati time,
@Durum bit
)
As
Begin
Insert into Tbl_Personel_GirisCikis(Personel_ID,IseGelisTarihi,IseGelisSaati,IstenCikisSaati,Durum) 
Values(@Personel_ID,@IseGelisTarihi,@IseGelisSaati,@IstenCikisSaati,@Durum)
End

/*KÝRALIK ARAÇ EKLEME */

Create Proc sp_Kiralik_Arac_Ekleme
(
@Plaka_No int,
@Model_ID int,
@Arac_yili datetime,
@Renk varchar(15),
@Kasa_Tipi varchar(15),
@Yakit_turu varchar(10),
@Vites_TurID int,
@Motor_Hacmi varchar(10),
@Motor_Gucu varchar(10),
@Km_bilgisi varchar(10),
@Hasar_Durumu bit,
@Koltuk_Sayisi varchar(2),
@Gunluk_Ucret money,
@Sigorta_BitisTarihi datetime,
@Muayene_BitisTarihi datetime,
@Kasko_BitisTarihi datetime,
@Araba_SinifID int,
@Sube_ID int,
@Durum bit
)
As
Begin
Insert into Tbl_Kiralik_Araclar(Plaka_No,Model_ID,Arac_Yili,Renk,Kasa_Tipi,Yakit_Türü,Vites_TurID,Motor_Hacmi,Motor_Gucu,Km_bilgisi,Hasar_Durumu,Koltuk_Sayisi,Gunluk_Ucret,Sigorta_BitisTarihi,Muayene_BitisTarihi,Kasko_BitisTarihi,Araba_SinifID,Sube_ID,Durum) 
Values(@Plaka_No,@Model_ID,@Arac_yili,@Renk,@Kasa_Tipi,@Yakit_turu,@Vites_TurID,@Motor_Hacmi,@Motor_Gucu,@Km_bilgisi,@Hasar_Durumu
,@Koltuk_Sayisi,@Gunluk_Ucret,@Sigorta_BitisTarihi,@Muayene_BitisTarihi,@Kasko_BitisTarihi,@Araba_SinifID,@Sube_ID,@Durum)
End

/*SATILIK ARAÇ EKLEME */

Create Proc sp_Satilik_Arac_Ekleme
(
@Plaka_No int,
@Model_ID int,
@Arac_yili datetime,
@Renk varchar(15),
@Kasa_Tipi varchar(15),
@Yakit_turu varchar(10),
@Vites_TurID int,
@Motor_Hacmi varchar(10),
@Motor_Gucu varchar(10),
@Koltuk_Sayisi varchar(2),
@Fiyat money,
@Sube_ID int,
@Araba_SinifID int,
@Durum bit
)
As
Begin
Insert into Tbl_Satilik_Araclar(SatilikPlaka_No,Model_ID,Arac_Yili,Renk,Kasa_Tipi,Yakit_Türü,Vites_TurID,Motor_Hacmi,Motor_Gucu,Koltuk_Sayisi,Fiyat,Sube_ID,Araba_SinifID,Durum) 
Values(@Plaka_No,@Model_ID,@Arac_yili,@Renk,@Kasa_Tipi,@Yakit_turu,@Vites_TurID,@Motor_Hacmi,@Motor_Gucu,@Koltuk_Sayisi,@Fiyat,@Araba_SinifID,@Sube_ID,@Durum)
End


/*KÝRALIK ARAÇ REZERVASYON KAYDI EKLEME */

Create Proc sp_Rezervasyon_Ekleme
(
@Musteri_ID int,
@Rezerve_Tarih datetime,
@Rezerve_Saati time,
@RezerveAlanPersonel_ID int,
@Rezerve_AracPlakaNo varchar(10)
)
As
Begin
Insert into Tbl_Rezervasyon(Musteri_ID,Rezerve_Tarih,Rezerve_Saati,RezerveAlanPersonel_ID,Rezerve_AracPlakaNo) 
Values(@Musteri_ID,@Rezerve_Tarih,@Rezerve_Saati,@RezerveAlanPersonel_ID,@Rezerve_AracPlakaNo)
update Tbl_Kiralik_Araclar set Durum='R' where Plaka_No=@Rezerve_AracPlakaNo
End /* sýkýntýlýýýýýý*/


/*ARAÇLARIN PLAKA NUMARASINI VE BAÐLI OLDUKLARI KÝRALAMA NOKTASININ ADRES VE TELEFONU LÝSTELEME */


Create Proc sp_Araçlarin_Bagli_Olduklari_Þube_ve_iletisim_Bilgilerini_Listeleme

As
Begin
select K.Plaka_No,Adres.*,I.Cep_TelNo,I.Ev_TelNo from Tbl_Kiralik_Araclar K JOIN Tbl_Subeler S ON S.Sube_ID=K.Sube_ID join
Tbl_iletisim I on S.Ýletisim_ID=I.iletisim_ID JOIN Tbl_Adresler Adres ON I.Adres_ID=Adres.Adres_ID
end

/* BÝR ARACIN PLAKA NUMARASINA GÖRE VE BAÐLI OLDUKLARI KÝRALAMA NOKTASININ ADRES VE TELEFONU LÝSTELEME */


Create Proc sp_Bir_Aracýn_Bagli_Olduklari_Þube_ve_iletisim_Bilgilerini_Listeleme
(
@plaka_No varchar(10)
)
As
Begin
select K.Plaka_No,Adres.*,I.Cep_TelNo,I.Ev_TelNo from Tbl_Kiralik_Araclar K JOIN Tbl_Subeler S ON S.Sube_ID=K.Sube_ID join
Tbl_iletisim I on S.Ýletisim_ID=I.iletisim_ID JOIN Tbl_Adresler Adres ON I.Adres_ID=Adres.Adres_ID
where K.Plaka_No=@plaka_No
end


/* KÝRA SÜRESÝ BÝTMÝÞ VE GERÝ GETÝRÝLMEYEN ARAÇLARI, KÝRALAYAN MÜÞTERÝ ÝLE VEREN LÝSTE */


Create Proc sp_Kira_Suresi_Bitmis_Geri_Getirilmeyen_Araclar_ve_Musteri_Listeleme

As
Begin
select K.Arac_PlakaNo,MK.Musteri_adi,MK.Musteri_Soyadi,I.Cep_TelNo,K.KiraBaslangicGun,K.TeslimEdilenGun 
from Tbl_Arac_Kiralama K JOIN Tbl_Musteri_Bilgileri M 
ON K.Musteri_ID=M.Musteri_ID JOIN Tbl_Musteri_Kimlik_Bilgileri MK 
ON M.Musteri_TcNo=MK.Musteri_TcNo JOIN Tbl_iletisim I
ON M.Musteri_iletisimID=I.iletisim_ID JOIN Tbl_Kiralik_Araclar KA
ON K.Arac_PlakaNo=KA.Plaka_No
WHERE K.TeslimEdilenGun<GETDATE() AND KA.Durum='True'
end

/* BELÝRTÝLEN TARÝH ARALIKLARINDA OLAN KÝRA SÖZLEÞMELERÝ, KÝRALAYAN MÜÞTERÝ ÝLE VEREN LÝSTE */


Create Proc sp_Belirtilen_Aralikta_Olan_Kira_Sozlesmelerini_Veren_Liste

(
@KirayaVerilenTarih datetime,
@KiraBitiþTarih datetime
)
As
Begin
select K.Arac_PlakaNo,MK.Musteri_adi,MK.Musteri_Soyadi,I.Cep_TelNo,K.KiraBaslangicGun,K.TeslimEdilenGun 
from Tbl_Arac_Kiralama K JOIN Tbl_Musteri_Bilgileri M 
ON K.Musteri_ID=M.Musteri_ID JOIN Tbl_Musteri_Kimlik_Bilgileri MK 
ON M.Musteri_TcNo=MK.Musteri_TcNo JOIN Tbl_iletisim I
ON M.Musteri_iletisimID=I.iletisim_ID
WHERE K.KiraBaslangicGun >=@KirayaVerilenTarih AND K.TeslimEdilenGun<=@KiraBitiþTarih
end






/*ARABA SATMA VE SATILMA DURUMUNU GÜNCELLEME*/
Create Proc sp_Araba_Sat
(
@SatilikPlaka_No varchar(50),
@TeslimEdenPersonel_ID int,
@Satis_Tarihi datetime,
@Musteri_ID int,
@Odeme_Tur_ID int

)
As
Begin
Insert INTO Tbl_ArabaSat(SatilikPlaka_No,TeslimEdenPersonel_ID,Satis_Tarihi,Musteri_ID,Odeme_Tur_ID) values(@SatilikPlaka_No,@TeslimEdenPersonel_ID,@Satis_Tarihi,@Musteri_ID,@Odeme_Tur_ID)
update Tbl_Satilik_Araclar set Durum='True' where SatilikPlaka_No=@SatilikPlaka_No
end


/*ARABA KÝRALAMA VE KÝRALAMA DURUMUNU GÜNCELLEME*/
Create Proc sp_Araba_Kirala
(
@Arac_PlakaNo varchar(10),
@KiraBaslanginGun datetime,
@TeslimEdilenGun datetime,
@Musteri_Kefil_ID int,
@TeslimEdenSube_ID int,
@EkSurucu_ID int,
@AlinanDepozito_Ucreti money,
@Musteri_ID int,
@TeslimEdenPersonel_ID int

)
As
Begin
SET NOCOUNT ON;
DECLARE 
@Mevcut_Durum  bit


Insert INTO Tbl_Arac_Kiralama(Arac_PlakaNo,KiraBaslangicGun,TeslimEdilenGun,Musteri_Kefil_ID,TeslimEdilenSube_ID,EkSurucu_ID,AlinanDepozito_Ucreti,Musteri_ID,TeslimEdenPersonel_ID)
 values(@Arac_PlakaNo,@KiraBaslanginGun,@TeslimEdilenGun,@Musteri_Kefil_ID,@TeslimEdenSube_ID,@EkSurucu_ID,@AlinanDepozito_Ucreti,@Musteri_ID,@TeslimEdenPersonel_ID)
update Tbl_Kiralik_Araclar set Durum='True' where @Arac_PlakaNo=Plaka_No
end



/*KÝRALIK ARABA FATURA OLUÞTURMA*/
Create Proc sp_Kiralik_Araba_Fatura_Kesme
(
@Kira_ID int,
@OdemeTur_ID int,
@TeslimEdilenSube int

)
As
Begin
SET NOCOUNT ON;
DECLARE 

@Toplam_Ucret money,
@Extra_islemUcret money,
@GecikenGun int,
@Gecikme_CezaUcret money,
@ArabaHasar_Ucret money,
@Kiralanan_Gun int,
@Kira_Ucret money,
@Kira_Gunluk_Ucret money,
@Kira_Depozito money,
@Brut_Ucret money



SET @Toplam_Ucret=0
SET @Extra_islemUcret=0
SET @ArabaHasar_Ucret=0
SET @GecikenGun=(SELECT DATEDIFF(DAY,TeslimEdilenGun,GETDATE()) FROM Tbl_Arac_Kiralama where TeslimEdilenGun<=GETDATE() AND Kira_ID=@Kira_ID ) 
SET @Kiralanan_Gun=(SELECT DATEDIFF(DAY,KiraBaslangicGun,TeslimEdilenGun) FROM Tbl_Arac_Kiralama where Kira_ID=@Kira_ID)
IF @GecikenGun>0 BEGIN SET  @Gecikme_CezaUcret=(@GecikenGun+1)*50 END ELSE BEGIN SET @Gecikme_CezaUcret=0  END;


SET @Kira_Gunluk_Ucret=(Select Gunluk_Ucret from Tbl_Kiralik_Araclar KA JOIN Tbl_Arac_Kiralama AK 
ON KA.Plaka_No=AK.Arac_PlakaNo where AK.Kira_ID=@Kira_ID)
SET @Kira_Ucret=(@Kiralanan_Gun+1)*@Kira_Gunluk_Ucret

SET @Extra_islemUcret=(select SUM( E.Extra_ucret) from Tbl_Extra_islemler Ei JOIN Tbl_Arac_Extralar E ON Ei.Extra_ID = E.Extra_ID WHERE Ei.Kiralik_ID=@Kira_ID)
IF @Extra_islemUcret>0 BEGIN  SET @Extra_islemUcret=@Extra_islemUcret END ELSE BEGIN SET @Extra_islemUcret=0 END;


SET @ArabaHasar_Ucret=(select SUM (HT.Hasar_Ucret) from Tbl_ArabaHasar_Turleri HT JOIN Tbl_ArabaveHasar AH ON HT.Hasar_ID = AH.Hasar_ID WHERE AH.KiraID=@Kira_ID)
IF @ArabaHasar_Ucret>0 BEGIN  SET @ArabaHasar_Ucret=@ArabaHasar_Ucret END ELSE BEGIN SET @ArabaHasar_Ucret=0 END;

SET @Kira_Depozito=(Select AlinanDepozito_Ucreti from Tbl_Kiralik_Araclar KA JOIN Tbl_Arac_Kiralama AK 
ON KA.Plaka_No=AK.Arac_PlakaNo where AK.Kira_ID=@Kira_ID)

SET @Toplam_Ucret=(@Gecikme_CezaUcret+@Extra_islemUcret+@ArabaHasar_Ucret+@Kira_Ucret)-@Kira_Depozito


Insert INTO Tbl_Fatura(Fatura_Tarih,Odeme_Tur,Kira_ID,Extra_islem,Gecikme_cezaUcret,TeslimAlinanSube_ID,ArabaHasar_Ucret,Toplam_Ucret)
 values(GETDATE(),@OdemeTur_ID,@Kira_ID,@Extra_islemUcret,@Gecikme_CezaUcret,@TeslimEdilenSube,@ArabaHasar_Ucret,@Toplam_Ucret)
update Tbl_Kiralik_Araclar set Durum='False' where Plaka_No=(Select Arac_plakaNo From Tbl_Arac_Kiralama Where Kira_ID=@Kira_ID)
end

/*GÜNLÜK KAZANCI LÝSTELEME*/

Create Proc sp_Gunluk_Kazanci_Listeleme

As
Begin

SELECT SUM(Toplam_Ucret) from Tbl_Fatura 
Where convert(varchar, Fatura_Tarih, 102)= convert(varchar, getdate(), 102)
end

/*AYLIK KAZANCI LÝSTELEME*/

Create Proc sp_Aylik_Kazanci_Listeleme

As
Begin

SELECT SUM(Toplam_Ucret) from Tbl_Fatura 
Where Month( Fatura_Tarih)=Month(Getdate()) AND YEAR(Fatura_Tarih)=YEAR(Getdate())
end

/*YILLIK KAZANCI LÝSTELEME*/

Create Proc sp_Yillik_Kazanci_Listeleme

As
Begin

SELECT SUM(Toplam_Ucret) from Tbl_Fatura 
Where  YEAR(Fatura_Tarih)=YEAR(Getdate())
end

/*YILLIK KAZANCI LÝSTELEME*/

Create Proc sp_Girilen_Tarihe_Gore_Kazanci_Listeleme
(
@Yil datetime
)
As
Begin

SELECT SUM(Toplam_Ucret) from Tbl_Fatura 
Where  YEAR(Fatura_Tarih)=YEAR(@yil)
end



Create Proc sp_Araba_kiralik_suresi_uzatma
(
@kira_ID int,
@yeni_arac_teslim_tarihi datetime
)
As
Begin
SET NOCOUNT ON;
DECLARE @faturakontrol int
SET @faturakontrol=(SELECT COUNT(f.Fatura_ID) FROM Tbl_Fatura f WHERE f.Kira_ID=@kira_ID)
 IF @faturakontrol>0 BEGIN  
 PRINT 'Kiralýk süresini uzatmaya çalýþtýðýnzý sözleþmeye fatura kesilmiþ ve sonlandýrýlmýþtýr.'

END ELSE 
BEGIN 
update Tbl_Arac_Kiralama set TeslimEdilenGun=@yeni_arac_teslim_tarihi where Kira_ID=@kira_ID
Select * FROM Tbl_Arac_Kiralama Where Kira_ID=@kira_ID  END
end


 

 Create Proc sp_RezKontrol
 (@rezID int )
As
Begin
SET NOCOUNT ON;
DECLARE @rezkontrol datetime,
@plaka varchar(10)
SET @rezkontrol=(SELECT rez.Rezerve_Tarih FROM Tbl_Rezervasyon rez WHERE rez.Rezarvasyon_ID=@rezID)
SET @plaka=(Select Rezerve_AracPlakaNo FROM Tbl_Rezervasyon WHERE Rezarvasyon_ID=@rezID)
 IF @rezkontrol-(GETDATE())<0 BEGIN  
update Tbl_Kiralik_Araclar set Rez_Durum='False' where Plaka_No=@plaka
SElECT * From Tbl_Kiralik_Araclar Where Plaka_No=@plaka
PRINT 'Rezerve Süresi Sona Ermiþtir.'
END ELSE 
BEGIN 
PRINT 'Rezerve Süresi Devam etmektedir.' END
end