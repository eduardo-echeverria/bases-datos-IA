-- Calcula el porcentaje del total de la factura que representa cada factura.
with facturacion_total as (select sum(total) q_facturado from invoice),
total_cliente as (select sum(total) total_cliente, customer_id from invoice group by customer_id),
porcentaje as (select customer_id, total_cliente/q_facturado * 100 from total_cliente left join facturacion_total on 1=1)
select * from porcentaje;

