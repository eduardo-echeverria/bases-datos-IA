-- Calcula el porcentaje de pistas que representa cada género.
with total as (select count(*) tracks_totales from track)
select g.name, 1.0*count(t.*)/ta.tracks_totales from genre g 
left join track t on g.genre_id = t.genre_id
left join total ta on 1=1
group by g.name, ta.tracks_totales;

