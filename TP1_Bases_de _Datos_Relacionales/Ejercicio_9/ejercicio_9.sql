-- Clasifica a los clientes en cada país por la cantidad total que han gastado.
select a.first_name, a.last_name, b.billing_country, sum(b.total) as total
from invoice b
left join customer a on a.customer_id=b.customer_id
group by a.first_name, a.last_name, b.billing_country
order by sum(b.total) desc;

