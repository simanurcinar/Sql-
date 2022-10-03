select * from [dbo].[screentime]

-- telefonu en �ok kulland��� tarihten en az kulland��� tarihe g�re s�ralamas�
select Total_Usage,Date_ from screentime
Group by Total_Usage,Date_
Order by Total_Usage desc

--istagramdan en �ok bildirim ald��� tarihten en az bildirim ald��� tarih s�ralamas�
select App_1,Usage_1,Date_ from screentime
Group by App_1,Usage_1,Date_
Order by Usage_1 desc

--whatsappta en �ok bildirim ald��� tarihten en az bildirim ald��� tarih s�ralamas�
select App_2,Usage_2,Date_ from screentime
Group by App_2,Usage_2,Date_
Order by Usage_2 desc

-- telefonu en �ok kulland���nda ald��� bildirim say�s�
select max(Total_Usage)from screentime

select All_Notifications,Date_,Total_Usage from screentime 
Where Total_Usage=376


--300 bildirimden fazla 
select All_Notifications, max(Total_Usage) as Total_Usage, Date_ from screentime 
Group by All_Notifications, Date_
having max(Total_Usage)>300

-- 1. kullan�lan uygulama ka� kere whatsapp se�ilmi�tir
select Rank_1, Date_ from screentime
Where Rank_1= 'Whatsapp'

--kilit a�ma say�s�yla bildirim alma say�s�n�n aras�nda bir ili�ki olabilir mi?
select Unlocks, All_Notifications from screentime
Order by Unlocks desc
-- az say�l� veride g�zle inceleyip ili�ki oldu�unu s�yleyebiliriz. �ok verili bir projede ��kan sonu� tablosunu excele d�kerek bir grafik olu�turup yorum yap�labilir.

--t�m bildirimler i�erisinde 2022-09-04 tarihinde ka� tanesi instagram bildirimleridir?
select Date_, All_Notifications,Notifications_1 from screentime
where Date_='2022-09-04'

-- instagram� en az kulland��� g�n en �ok kulland��� program hangisidir?
select Usage_1, Date_, Rank_1 from screentime 
Group by Usage_1,Date_,Rank_1

-- instagram�n en �ok kullan�lan oldu�u g�nlerde usage_1 ka�t�r?
select Rank_1,Date_,Usage_1 from screentime
where Rank_1='Instagram'

--instagram en �ok hangi s�rada kullan�lm��t�r?
select Rank_1 from screentime
Where Rank_1='Instagram' --3

select Rank_2 from screentime
Where Rank_2='Instagram' --8

select Rank_3 from screentime
Where Rank_3='Instagram' --5

--oplam kullan�ma g�re s�ralarsak instagram instagram kullan�m� whatsapp kullan�m�na oranla nas�ld�r?

select Total_Usage, Usage_1, Usage_2, Date_ from screentime
group by Total_Usage, Usage_1, Usage_2, Date_
Order by Total_Usage desc

--other_Usage diye bir s�tun olu�turursak, s�tunun verilerini Total_Usage-(Usage_1+Usage_2) olu�turur, bu de�er de di�er uygulamalar� kulla�m�n� g�sterir
Update screentime
set Other_Usage= Total_Usage-(Usage_1+Usage_2)

select * from screentime 

--instagram ve whatsapp d���ndaki uygulamalardan gelen bildirim say�s�
update screentime
set Other_Notifications= All_Notifications-(Notifications_1+Notifications_2)

-- telefonu en az kullad��� g�nde gelen bildirim say�s� - bildirim say�s� ile telefon kullan�m� aras�nda bir ili�ki var m�?
select Date_,Total_Usage, All_Notifications from screentime
group by Total_Usage, Date_, All_Notifications
order by Total_Usage
