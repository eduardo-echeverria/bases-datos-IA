// 13. Obtener el promedio de gasto por factura por cada región.

db.facturas.aggregate([
  {
    $unwind: "$item"
  },
  {
    $group: {
      _id: "$cliente.region",
      totalGastado: { 
				$sum: { $multiply: [ "$item.precio", "$item.cantidad" ] } 
			},
		cantidadFacturas: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
			region: "$_id",
			promedioGastado: { 
				$round: [
          { $divide: ["$totalGastado", "$cantidadFacturas"]},
					2
				]
			}
    }
  },
  {
		$sort: { promedioGastado: -1}
	}
])

