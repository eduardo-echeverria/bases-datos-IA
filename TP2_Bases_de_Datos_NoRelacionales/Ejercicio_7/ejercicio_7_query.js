// 7. Se requiere realizar una consulta que devuelva la siguiente información:
// producto y cantidad de facturas en las que lo compraron, ordenado por cantidad
// de facturas descendente.

db.facturas.aggregate([
  {
		$unwind: "$item"
	},
	{
		$group: {
			_id: "$item.producto",
			cantFacturas: { $sum: 1}
			}
	},
	{
		$project: {
			producto: "$_id",
			cantFacturas: 1,
			_id: 0
		}
	},
  {
		$sort: { cantFacturas: -1 }
	}
])

