// 2. Basado en la consulta del punto 1, mostrar sólo la región que tenga el menor ingreso.

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
},
{
	$sort: {limit: 1}
},
{
	$limit: 1
}
])

