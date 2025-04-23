-- Compara el total de la última factura de cada cliente con el total de su factura anterior.
select i.invoice_id, c.first_name, c.last_name, total, total - lag(total) over (partition by i.customer_id order by i.invoice_date) as diferencia_total
from invoice i
left join customer c on i.customer_id = c.customer_id
order by i.customer_id;

