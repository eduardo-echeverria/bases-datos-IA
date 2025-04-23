-- Para cada factura, calcula la diferencia en el gasto total entre ella y la factura anterior.
select invoice_id, total, total - lag(total) over (order by invoice_date) as diferencia_total
from invoice
order by invoice_date;

