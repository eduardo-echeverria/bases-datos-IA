// 10. Obtener todos productos junto con un array de las personas que
// lo compraron. En este array deberá haber solo strings con el nombre 
// completo de la persona. Los documentos entregados como resultado
// deberán tener la siguiente forma: {producto: “<nombre>”, personas:[“…”, …]}

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
			personas: 1
		}
	}
])

