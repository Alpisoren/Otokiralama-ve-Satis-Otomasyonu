

/*MÜÞTERÝ EKLEME*/
Insert into Tbl_Musteri_Kimlik_Bilgileri(Musteri_TcNo,Musteri_adi,Musteri_Soyadi,Musteri_Dtarih,Musteri_DYeri_ID,Musteri_CiltNo,Musteri_SiraNo,Musteri_AnneAdi,Musteri_BabaAdi,Musteri_Kan_grubu_id) VALUES ('12345678912','Muhammet','Sarý','1997-05-09',34,0056,0045,'Ayþe','Ramazan',1)
/*Müþteri ekleme*/

Insert into Tbl_Musteri_Bilgileri(Musteri_TcNo,Musteri_iletisimID,Musteri_EhliyetID) values ('12345678912',1,4)

------------------------------------------------

/*MÜÞTERÝ BÝLGÝLERÝ LÝSTELEME*/
select Tbl_Musteri_Kimlik_Bilgileri.*,Musteri_ID,Musteri_iletisimID,Musteri_EhliyetID from Tbl_Musteri_Bilgileri,Tbl_Musteri_Kimlik_Bilgileri

/*MÜÞTERÝ ADRES BÝLGÝLERÝ LÝSTELER*/
SELECT Musteri_ID,Musteri_TcNo,Tbl_Adresler.Adres_ID,Ýl_ID,Ýlce_ID,Mahalle_Adi,Cadde_Adi,Sokak_Adi,Apartman_No,Kat_No,Daire_No from Tbl_Musteri_Bilgileri JOIN Tbl_iletisim on Tbl_Musteri_Bilgileri.Musteri_iletisimID=Tbl_iletisim.Adres_ID JOIN Tbl_Adresler on Tbl_iletisim.Adres_ID=Tbl_Adresler.Adres_ID

/*MÜÞTERÝ ADRES GÜNCELLE*/
UPDATE Tbl_Adresler set Mahalle_Adi='Cumhuriyet Mahallesi' where Adres_ID=1
 
 /*MÜÞTERÝ EHLÝYET */
SELECT Musteri_ID,Ehliyet_ID from Tbl_MusteriveEhliyet

/*MÜÞTERÝ EHLÝYET BÝLGÝLERÝ GÜNCELLEME*/
UPDATE Tbl_Musteri_Bilgileri set Musteri_EhliyetID=4 where Musteri_ID=5

/*BÝRDEN FAZLA EHLÝYETE SAHÝP MÜÞTERÝ*/
SELECT * FROM Tbl_MusteriveEhliyet 

/*Musteri kan grubu listeleme*/
select Musteri_TcNo,Musteri_adi,Musteri_Soyadi,Musteri_Kan_grubu_id From Tbl_Musteri_Kimlik_Bilgileri

/*Araba marka ekleme*/
Insert INTO Tbl_Araba_Markalarý(Marka_adi) values ('Audi')

/*Araba model ekleme*/
Insert INTO Tbl_Araba_Modelleri(Model_adi,Marka_ID) values ('Q7',1)

/*Arçalarý donaným özelliklerine göre listeleme*/
select  Tbl_AracDonanimlar.Donanim_ID,Donanim_adi,Plaka_No from Tbl_AracDonanimlar JOIN Tbl_Donanimlar on Tbl_AracDonanimlar.Donanim_ID=Tbl_Donanimlar.Donanim_ID

/*VALUES GÝRÝLMEMÝÞ HAL---KÝRALIK ARAÇ EKLE*/
Insert into Tbl_Kiralik_Araclar(Plaka_No,Model_ID,Arac_Yili,Renk,Kasa_Tipi,Yakit_Türü,Vites_TurID,Motor_Hacmi,Motor_Gucu,Km_bilgisi,Hasar_Durumu,Koltuk_Sayisi,Gunluk_Ucret,Sigorta_BitisTarihi,Muayene_BitisTarihi,Kasko_BitisTarihi,Araba_SinifID,Sube_ID) values ('34FS96',1,'2006','Sarý','Sedan','Dizel',1,'1598','105','6000',0,'5','200','2018-08-09','2018-08-09','2018-08-09',1,2)
Insert into Tbl_Kiralik_ArabaStok(Plaka_No,Durum) Values ('34FS96',0)

/*VALUES GÝRÝLMEMÝÞ HAL---SATILIK ARAÇ EKLE */
Insert into Tbl_Satilik_Araclar(SatilikPlaka_No,Model_ID,Arac_Yili,Renk,Kasa_Tipi,Yakit_Türü,Vites_TurID,Motor_Hacmi,Motor_Gucu,Koltuk_Sayisi,Fiyat,Durumu,Sube_ID,Araba_SinifID) values ('41JOH97',1,'2005','Sarý','Sedan','Dizel',1,'1598','105','4','55000',0,1,2)
Insert into Tbl_Satilik_ArabaStok(SatilikPlaka_No,Durum) Values ('41JOH97',0)

/* Kiralanan ve satýlan araçlarýn durumunu güncelleme*/ 
UPDATE  Tbl_Kiralik_ArabaStok SET Durum=1  WHERE Plaka_No='34FS96'

UPDATE  Tbl_Satilik_ArabaStok SET Durum=1  WHERE SatilikPlaka_No='41JOH97'

/* Kiralanan ve satýlan araçlarýn durumunu listeleme*/ 
SELECT *  FROM  Tbl_Kiralik_ArabaStok 

SELECT *  FROM  Tbl_Satilik_ArabaStok 

/*	Muayene süresi yaklaþan ve biten araçlarý listeleme */
 SELECT * FROM Tbl_Kiralik_Araclar WHERE GETDATE()-Muayene_BitisTarihi>=0
  SELECT * FROM Tbl_Kiralik_Araclar WHERE Muayene_BitisTarihi<=GETDATE()
 /*Hasarlý araç listele*/
  SELECT * FROM Tbl_Kiralik_Araclar WHERE Hasar_Durumu=1

/*Yeni hasar kaydý ekleme*/
  Insert into Tbl_ArabaveHasar(KiraID,Hasar_ID) Values (1,1)

  /*Araçlarýn baðlý olduklarý kiralama noktasýnýn adres ve telefonunu listeleme*/
  
  select Plaka_No,Tbl_Adresler.*,Cep_TelNo,Ev_TelNo from Tbl_iletisim,Tbl_Adresler,Tbl_Subeler JOIN Tbl_Kiralik_Araclar on Tbl_Kiralik_Araclar.Sube_ID= Tbl_Subeler.Sube_ID

  
  /*Rezervasyon ekleme*/
  Insert into Tbl_Rezervasyon (Musteri_ID,Rezerve_AracID,Rezerve_Tarih,Rezerve_Saati,RezerveAlanPersonel_ID)values (2,1,'2018-03-04','10:00',1)

  /*Ek sürücü ekleme*/
  Insert into Tbl_EkSurucu (EkSurucu_TcNO,EkSurucu_adi,EkSurucu_Soyadi,Musteri_ID) values ('11111111116','Murat','Yalçýn',1)

  /*Rezervayon güncelleme*/
  Update Tbl_Rezervasyon set Rezerve_Saati='11:00', Rezerve_Tarih='2018-03-04' where Musteri_ID=2

  /*Satýlan araçlarý listeleme  1=satýlan/0=satýlmayan*/
    SELECT * FROM Tbl_Satilik_Araclar WHERE Durumu=1

  /* Personel ekleme*/
  Insert into Tbl_Personel_Kimlik_Bilgileri(Personel_Tc_No,Personel_adi,Personel_Soyadi,Personel_Dtarih,Personel_DYeri_ID,Personel_CiltNo,Personel_SiraNo)Values ('11123641115','Mahmut','Yýldýrým','1990-05-05',1,'03','653')
  Insert into Tbl_Personel_Bilgileri(Personel_TcNo,Personel_iletilisimID,Personel_GorevID,Sube_ID)Values ('11123641115',1,1,1)
   
  /*Personeli çalýþtýðý þubeye göre listeleme*/
  select Tbl_Personel_Bilgileri.PersonelID,Tbl_Personel_Bilgileri.Pesonel_TcNo,Tbl_Subeler.Sube_Adi from  Tbl_Personel_Bilgileri JOIN Tbl_Subeler ON Tbl_Personel_Bilgileri.Sube_ID=Tbl_Subeler.Sube_ID 

   /*Kiralanmayan araçlarý listeler*/
    SELECT Tbl_Kiralik_Araclar.* FROM Tbl_Kiralik_Araclar,Tbl_Kiralik_ArabaStok WHERE Tbl_Kiralik_Araclar.Plaka_No=Tbl_Kiralik_ArabaStok.Plaka_No AND Durum=0
	
   
   /* Araba marka ve modelleri göre sýralama*/
	Select Tbl_Araba_Markalarý.Marka_ID,Marka_adi,Tbl_Araba_Modelleri.Model_adi from  Tbl_Araba_Markalarý,Tbl_Araba_Modelleri 

	/*Personel iletiþim bilgilerini güncelleme*/
	Update Tbl_iletisim set Cep_TelNo='11111111111', Ev_TelNo='11111111111',Email='abc@gmail.com' where iletisim_ID=(SELECT Personel_iletilisimID From Tbl_Personel_Bilgileri WHERE Pesonel_TcNo=1 )
	
	/*Personel bilgilerini listeleme*/
	SELECT * FROM Tbl_Personel_Bilgileri perbil JOIN Tbl_Personel_Kimlik_Bilgileri perkimbil ON perbil.Pesonel_TcNo=perkimbil.Personel_Tc_No

	/* Kiralanan aracýn teslim tarihini güncelleme*/

	Update Tbl_Arac_Kiralama set TeslimEdilenGun='2018-03-04' Where Arac_PlakaNo=1

	/*Araçlarýn  plaka numaralarý, marka, model ile bulunduklarý þubeleri listeleme*/

	SELECT ar.Plaka_No ,su.Sube_Adi FROM Tbl_Kiralik_Araclar ar ,Tbl_Subeler su  WHERE ar.Sube_ID=su.Sube_ID

	/*Bir günde kiralanan arabalarý listele(17.03.2018 tarihinde kiralanan arabalar*/
	SELECT Tbl_Kiralik_Araclar.* FROM Tbl_Arac_Kiralama,Tbl_Kiralik_Araclar WHERE Tbl_Arac_Kiralama.Arac_PlakaNo=Tbl_Kiralik_Araclar.Plaka_No AND Tbl_Arac_Kiralama.KiraBaslangicGun='2018-03-17'

	/*Halen kirada olan araçlarý listeleme*/
	SELECT kira.* FROM Tbl_Kiralik_Araclar kira ,Tbl_Kiralik_ArabaStok kirastok WHERE kira.Plaka_No=kirastok.Plaka_No AND kirastok.Durum=1

	/*Kiralama bedeli bakýmýndan en pahalý araçlarý listeleme */

	SELECT * FROM Tbl_Kiralik_Araclar ORDER BY Gunluk_Ucret

	/*Kasko süresi bitmiþ araçlarý listeleme*/
	
	SELECT * FROM Tbl_Kiralik_Araclar WHERE Kasko_BitisTarihi<GETDATE()
	/*Ýþten çýkan personeli silme*/

	DELETE FROM Tbl_Personel_Bilgileri WHERE Pesonel_TcNo=12345
	DELETE FROM Tbl_Personel_Kimlik_Bilgileri WHERE Personel_Tc_No=12345

	/* Ödenen faturalarý listeleme */
	SELECT * FROM Tbl_Fatura,Tbl_FaturaOdeme WHERE Tbl_FaturaOdeme.KiralýkFatura_ID=Tbl_Fatura.Fatura_ID AND Tbl_FaturaOdeme.Durum=1

	/*Müþterinin fatura bilgileri listeleme*/

	SELECT Tbl_Fatura.*,Tbl_Musteri_Bilgileri.Musteri_TcNo FROM Tbl_Fatura,Tbl_Musteri_Bilgileri WHERE Tbl_Fatura.Musteri_ID=Tbl_Musteri_Bilgileri.Musteri_ID 

	SELECT Tbl_Fatura.*,Tbl_Musteri_Bilgileri.Musteri_TcNo FROM Tbl_Fatura,Tbl_Musteri_Bilgileri WHERE Tbl_Fatura.Musteri_ID=Tbl_Musteri_Bilgileri.Musteri_ID AND Tbl_Musteri_Bilgileri.Musteri_TcNo=123

	/*Henüz geri getirilmeyen araçlarý, kiralayan müþteri bilgilerini listeleme.*/

	SELECT m.* FROM Tbl_Musteri_Bilgileri m,Tbl_Kiralik_ArabaStok arstok,Tbl_Fatura kira WHERE  arstok.Durum=1 AND kira.Musteri_ID=m.Musteri_ID 

	/*Arabalarý marka ve sýnýflarýna göre listeleme */
	 SELECT ka.*, amarka.Marka_adi FROM Tbl_Kiralik_Araclar ka,Tbl_Araba_Modelleri amodel,Tbl_Araba_Markalarý amarka WHERE ka.Araba_SinifID=1 AND amodel.Marka_ID=amarka.Marka_ID AND amodel.Model_ID=1
	/* Arabalarý marka ve modellerine göre listeleme*/
	 	 SELECT ka.*, amarka.Marka_adi ,amodel.Model_adi FROM Tbl_Kiralik_Araclar ka,Tbl_Araba_Modelleri amodel,Tbl_Araba_Markalarý amarka WHERE amodel.Marka_ID=amarka.Marka_ID AND amodel.Model_ID=1

	/*Sube_ID ‘si 3 olan yerden hali hazýrda kiralanmýþ durumda bulunan  Mercedes marka araçlarýn sayýsýný listeleme */
	 SELECT ka.* FROM Tbl_Kiralik_Araclar ka,Tbl_Kiralik_ArabaStok st,Tbl_Araba_Modelleri amodel,Tbl_Araba_Markalarý amarka WHERE st.Durum=1 AND ka.Sube_ID=3 AND amodel.Marka_ID=amarka.Marka_ID AND amarka.Marka_adi='Mercedes Benz'

	 /*Þu ana kadar en fazla hangi marka aracýn kaç defa kiralandýðýný listeleme*/
	 SELECT COUNT(arkira.Kira_ID) FROM Tbl_Arac_Kiralama arkira ,Tbl_Kiralik_Araclar ar , Tbl_Araba_Modelleri amod,Tbl_Araba_Markalarý amar  WHERE amod.Marka_ID=amar.Marka_ID AND amar.Marka_adi='Mercedes Benz'

	/*Günlük kazancý listeleme*/
	SELECT SUM(ar.Gunluk_Ucret) FROM Tbl_Arac_Kiralama arkira ,Tbl_Kiralik_Araclar ar WHERE arkira.Arac_PlakaNo=ar.Plaka_No AND arkira.KiraBaslangicGun=GETDATE()
	/*Haftalýk kazancý listeleme*/
	SELECT SUM(ar.Gunluk_Ucret) FROM Tbl_Arac_Kiralama arkira ,Tbl_Kiralik_Araclar ar WHERE arkira.Arac_PlakaNo=ar.Plaka_No AND arkira.TeslimEdilenGun<=GETDATE()+7 AND arkira.KiraBaslangicGun=GETDATE()
	/*Aylýk kazancý listeleme*/
	SELECT SUM(ar.Gunluk_Ucret) FROM Tbl_Arac_Kiralama arkira ,Tbl_Kiralik_Araclar ar WHERE arkira.Arac_PlakaNo=ar.Plaka_No AND MONTH(arkira.TeslimEdilenGun)=MONTH(GETDATE())
	/*Yýllýk kazancý listeleme*/
	SELECT SUM(ar.Gunluk_Ucret) FROM Tbl_Arac_Kiralama arkira ,Tbl_Kiralik_Araclar ar WHERE arkira.Arac_PlakaNo=ar.Plaka_No AND YEAR(arkira.TeslimEdilenGun)=YEAR(GETDATE())