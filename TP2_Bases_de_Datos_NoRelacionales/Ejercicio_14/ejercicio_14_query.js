// 14. Obtener la factura en la que se haya gastado más. En caso de
// que sean varias obtener la que tenga el número de factura menor.

db.facturas.aggregate([
  {
    $unwind: "$item"
  },
  {
    $group: {
      _id: "$nroFactura",
      totalGastado: { 
				$sum: { $multiply: [ "$item.precio", "$item.cantidad" ] } 
			}
    }
  },
  {
		$sort: { 
			totalGastado: -1,
			_id: 1
		}
	},
  {
		$limit: 1
	},
	{
    $project: {
      _id: 0,
			numeroFactura: "$_id",
			totalGastado: "$totalGastado"
    }
  }
])

