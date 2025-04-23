-- Encuentra cuántas pistas de más de 3 minutos tiene cada álbum.
select a.title, count(*) as numero_pistas
from track t
left join album a on a.album_id = t.album_id and t.milliseconds > 180000
group by a.title
order by a.title;