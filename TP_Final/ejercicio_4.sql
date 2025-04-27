-- 4. Identifica cuáles fueron las temáticas de sets más populares durante la década de los 2000.

select t.name as tematica, count(s.set_num ) as cantidad_sets
from themes t
left join sets s on s.theme_id  = t.id
where s.year between 2000 and 2009
group by t.name
order by cantidad_sets desc;