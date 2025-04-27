-- 2. Determina la cantidad de colores que son únicos en toda la base de datos.

select c.name as nombre_color, s.name as nombre_set, s.set_num
from colors c
join (
    select ip.color_id, i.set_num
    from inventory_parts ip
    join inventories i on ip.inventory_id = i.id
    group by ip.color_id, i.set_num
) conjunto_color_set on c.id = conjunto_color_set.color_id
join sets s on s.set_num = conjunto_color_set.set_num
group by c.name, s.name, s.set_num
having COUNT(*) = 1
order by c.name;


