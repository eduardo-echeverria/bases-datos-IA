-- 1. Identifica cuáles son los 10 colores más frecuentemente usados en los sets de LEGO durante la década de los 90.

select c.name as nombre_color, count(*) as frecuencia
from colors c
left join inventory_parts ip on c.id = ip.color_id
left join inventories i on i.id = ip.inventory_id
left join sets s on s.set_num = i.set_num
where s.year between 1990 and 1999
group by c.name
order by frecuencia desc
limit 10;

