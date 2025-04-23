-- Encuentra la longitud promedio de la pista para cada género.
select a.name, avg(b.milliseconds)
from genre a
left join track b on a.genre_id=b.genre_id
group by a.name
order by avg(b.milliseconds) desc;

