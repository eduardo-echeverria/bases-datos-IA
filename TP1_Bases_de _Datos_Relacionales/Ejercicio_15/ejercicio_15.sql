-- Para cada cliente, compara su gasto total con el del cliente que gastó más.
with max_gasto as (
    select customer_id, 
           sum(total) as gasto, 
           rank() over (order by sum(total) desc) as rnk
    from invoice
    group by customer_id
)
select c.first_name, c.last_name, i.customer_id, 
       sum(i.total) / (select gasto from max_gasto where rnk = 1) AS gasto_cliente
from invoice i
left join customer c on i.customer_id = c.customer_id
group by c.first_name, c.last_name, i.customer_id;

