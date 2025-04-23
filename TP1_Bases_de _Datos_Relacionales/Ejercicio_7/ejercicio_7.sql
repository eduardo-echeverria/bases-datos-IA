-- Para cada cliente, encuentra la cantidad total que han gastado.
select a.first_name, a.last_name, sum(b.total) as total
from invoice b
left join customer a on a.customer_id=b.customer_id
group by a.first_name, a.last_name
order by sum(b.total) desc;

