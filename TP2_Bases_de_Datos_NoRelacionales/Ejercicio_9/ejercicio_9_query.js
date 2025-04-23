// 9. Idem el punto anterior, ordenar por ingresos en forma ascendente,
// saltear el 1ro y mostrar 2do y 3ro.

db.facturas.aggregate([
  {
		$unwind: "$item"
	},
	{
		$group: {
			_id: "$item.producto",
			totalAmount: { $sum: "$item.cantidad" },
			totalIncome: { $sum: { $multiply: [ "$item.precio", "$item.cantidad" ] } }
			}
	},
	{
		$project: {
			producto: "$_id",
			totalAmount: 1,
			totalIncome: 1,
			_id: 0
		}
	},
  {
		$sort: { totalIncome: 1 }
	},
  {
		$skip: 1
	},
  {
		$limit: 2
	}
])
