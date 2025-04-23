-- Encuentra al artista con el mayor número de pistas para cada género.
with tracks_per_genre as (
	select a2.name as nombre_artista, 
		   g.name as genero, 
		   count(t.track_id) as numero_pistas
	from track t 
	right join album a on t.album_id = a.album_id
	right join artist a2 on a2.artist_id = a.artist_id 
	right join genre g on g.genre_id = t.genre_id
	group by a2.name, g.name 
)
select nombre_artista, genero, numero_pistas
from tracks_per_genre tpg
where (tpg.genero, tpg.numero_pistas) in (
	select genero, max(numero_pistas)
	from tracks_per_genre 
	group by genero
)
order by genero, numero_pistas desc;

