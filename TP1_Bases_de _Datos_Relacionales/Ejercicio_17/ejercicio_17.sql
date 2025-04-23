-- Para cada factura, calcula la diferencia en el gasto total entre ella y la próxima factura.
select invoice_id, total, total - lead(total) over (order by invoice_date) as diferencia_total
from invoice
order by invoice_date;

