// 8. Obtener la cantidad total comprada así como también los ingresos totales
// para cada producto.

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
	}
])
