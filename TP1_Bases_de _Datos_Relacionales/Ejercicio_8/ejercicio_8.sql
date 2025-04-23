-- Para cada país, encuentra la cantidad total gastada por los clientes.
select billing_country, sum(total) as total
from invoice
group by billing_country 
order by sum(total) desc;

