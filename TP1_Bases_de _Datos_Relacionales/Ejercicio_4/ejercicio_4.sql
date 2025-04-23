-- Encuentra la longitud total (en milisegundos) de todas las pistas para cada álbum.
select a.title, sum(b.milliseconds)
from album a
left join track b on a.album_id =b.album_id 
group by a.title
order by sum(b.milliseconds) desc

