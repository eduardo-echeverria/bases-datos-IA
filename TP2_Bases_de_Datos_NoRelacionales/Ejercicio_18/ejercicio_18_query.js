// 18. En base a la localidad de los clientes, obtener el total
// facturado por localidad.

db.facturas.aggregate([
  {
    $unwind: "$item"
  },
  {
    $group: {
      _id: "$cliente.region",
      totalFacturado: { 
				$sum: { $multiply: [ "$item.precio", "$item.cantidad" ] } 
			},
		cantidadFacturas: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
			region: "$_id",
			totalFacturado: 1
    }
  },
  {
		$sort: { totalFacturado: -1}
	}
])