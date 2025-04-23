-- Lista los 10 álbumes con más pistas.
select a.title, count(b.*)
from album a
left join track b on a.album_id=b.album_id
group by a.title
order by count(b.*) desc
limit 10;

