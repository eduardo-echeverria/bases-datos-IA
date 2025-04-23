// 3. Basado en la consulta del punto 1, mostrar sólo las regiones que tengan una cantidad 
// de productos vendidos superior a 10000 (300 para el caso de la base de datos para el TP).

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
	$match: {
		total: {
			$gt: 300
		}
	}
}
])
