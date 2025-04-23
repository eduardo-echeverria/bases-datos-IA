// 15. Obtener a los clientes indicando cuánto fue lo que más gastó
// en una única factura.

db.facturas.aggregate([
  {
    $unwind: "$item"
  },
  {
    $group: {
      _id: {
				nroFactura: "$nroFactura",
				cliente: {
					nombre: "$cliente.nombre",
        	apellido: "$cliente.apellido"
        }
			},
      totalGastado: { 
				$sum: { $multiply: [ "$item.precio", "$item.cantidad" ] } 
			}
    }
  },
  {
		$sort: { 
			totalGastado: -1
		}
	},
	{ 
    $group: {
      _id: "$_id.cliente",
      maxTotalGastado: { 
        $max: "$totalGastado"
      }
    }
  },
  { 
    $sort: { 
      maxTotalGastado: -1 
    }
  },
	{
    $project: {
      _id: 0,
			cliente: "$_id",
			maxTotalGastado: 1
    }
  }
])

