// 1. Realizar una consulta que devuelva la siguiente información: 
// Región y cantidad total de productos vendidos a clientes de esa Región.

db.facturas.aggregate([{
	$unwind: "$item"
},
{
	$group: {
		_id: "$cliente.region",
		total: {
			$sum: "$item.cantidad"
		}
	}
},
{
	$project: {
		region: "$_id",
		total: 1,
		_id: 0
	}
}
])