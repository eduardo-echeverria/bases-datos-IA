-- Para cada artista, encuentra el álbum con más pistas y clasifica a los artistas por este número.
select a.name, b.title, count(c.*) q_tracks, rank() over(partition by a.name order by count (c.*) desc)
from artist a
left join album b on a.artist_id =b.artist_id 
left join track c on c.album_id=b.album_id
group by a.name, b.title
order by a.name

