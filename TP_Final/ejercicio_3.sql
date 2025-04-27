-- 3. Analiza cómo ha evolucionado la cantidad de piezas incluidas en los sets de LEGO a través del tiempo.

select s.year, 
       count(distinct s.set_num) as numero_sets,
       sum(ip.quantity) as piezas_totales,
       round(sum(ip.quantity) * 1.0 / count(distinct s.set_num), 2) as promedio_piezas_set
from sets s
join inventories i on s.set_num = i.set_num
join inventory_parts ip on i.id = ip.inventory_id
group by s.year
order by s.year;

