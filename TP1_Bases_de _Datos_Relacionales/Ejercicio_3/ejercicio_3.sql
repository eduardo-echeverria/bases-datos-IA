-- Cuenta el número de pistas por género.
select b.name, count(a.*)
from track a
left join genre b on b.genre_id=a.genre_id
group by b.name 
order by count (*)

