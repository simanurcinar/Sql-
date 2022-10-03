select * from [dbo].[screentime]

-- telefonu en çok kullandýðý tarihten en az kullandýðý tarihe göre sýralamasý
select Total_Usage,Date_ from screentime
Group by Total_Usage,Date_
Order by Total_Usage desc

--istagramdan en çok bildirim aldýðý tarihten en az bildirim aldýðý tarih sýralamasý
select App_1,Usage_1,Date_ from screentime
Group by App_1,Usage_1,Date_
Order by Usage_1 desc

--whatsappta en çok bildirim aldýðý tarihten en az bildirim aldýðý tarih sýralamasý
select App_2,Usage_2,Date_ from screentime
Group by App_2,Usage_2,Date_
Order by Usage_2 desc

-- telefonu en çok kullandýðýnda aldýðý bildirim sayýsý
select max(Total_Usage)from screentime

select All_Notifications,Date_,Total_Usage from screentime 
Where Total_Usage=376


--300 bildirimden fazla 
select All_Notifications, max(Total_Usage) as Total_Usage, Date_ from screentime 
Group by All_Notifications, Date_
having max(Total_Usage)>300

-- 1. kullanýlan uygulama kaç kere whatsapp seçilmiþtir
select Rank_1, Date_ from screentime
Where Rank_1= 'Whatsapp'

--kilit açma sayýsýyla bildirim alma sayýsýnýn arasýnda bir iliþki olabilir mi?
select Unlocks, All_Notifications from screentime
Order by Unlocks desc
-- az sayýlý veride gözle inceleyip iliþki olduðunu söyleyebiliriz. Çok verili bir projede çýkan sonuç tablosunu excele dökerek bir grafik oluþturup yorum yapýlabilir.

--tüm bildirimler içerisinde 2022-09-04 tarihinde kaç tanesi instagram bildirimleridir?
select Date_, All_Notifications,Notifications_1 from screentime
where Date_='2022-09-04'

-- instagramý en az kullandýðý gün en çok kullandýðý program hangisidir?
select Usage_1, Date_, Rank_1 from screentime 
Group by Usage_1,Date_,Rank_1

-- instagramýn en çok kullanýlan olduðu günlerde usage_1 kaçtýr?
select Rank_1,Date_,Usage_1 from screentime
where Rank_1='Instagram'

--instagram en çok hangi sýrada kullanýlmýþtýr?
select Rank_1 from screentime
Where Rank_1='Instagram' --3

select Rank_2 from screentime
Where Rank_2='Instagram' --8

select Rank_3 from screentime
Where Rank_3='Instagram' --5

--oplam kullanýma göre sýralarsak instagram instagram kullanýmý whatsapp kullanýmýna oranla nasýldýr?

select Total_Usage, Usage_1, Usage_2, Date_ from screentime
group by Total_Usage, Usage_1, Usage_2, Date_
Order by Total_Usage desc

--other_Usage diye bir sütun oluþturursak, sütunun verilerini Total_Usage-(Usage_1+Usage_2) oluþturur, bu deðer de diðer uygulamalarý kullaýmýný gösterir
Update screentime
set Other_Usage= Total_Usage-(Usage_1+Usage_2)

select * from screentime 

--instagram ve whatsapp dýþýndaki uygulamalardan gelen bildirim sayýsý
update screentime
set Other_Notifications= All_Notifications-(Notifications_1+Notifications_2)

-- telefonu en az kulladýðý günde gelen bildirim sayýsý - bildirim sayýsý ile telefon kullanýmý arasýnda bir iliþki var mý?
select Date_,Total_Usage, All_Notifications from screentime
group by Total_Usage, Date_, All_Notifications
order by Total_Usage
