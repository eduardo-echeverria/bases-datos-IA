// 11. Obtener los productos ordenados en forma descendente por la cantidad
// de diferentes personas que los compraron.

db.facturas.aggregate([
  {
		$unwind: "$item"
	},
	{
		$group: {
			_id: "$item.producto",
			personas: {
				$addToSet: {
					$concat: ["$cliente.nombre", " ", "$cliente.apellido"]
				}
			}
    }
	},
	{
		$project: {
			_id: 0,
			producto: "$_id",
			personas: 1,
			cantidadPersonas: { $size: "$personas" }
		}
	},
	{
		$sort: { cantidadPersonas: -1 }
	}
])

