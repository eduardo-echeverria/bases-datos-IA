// 4. Se requiere obtener un reporte que contenga la siguiente información, 
// nro. cuit, apellido y nombre y región y cantidad de facturas, ordenado por apellido.

db.facturas.aggregate([
  {
		$group: {
			_id: {
				apellido: "$cliente.apellido",
				nombre: "$cliente.nombre",
				region: "$cliente.region",
				cuit: "$cliente.cuit"
			},
			cantFacturas: {
				$sum: 1
			}
		}
	},
  {
		$project: {
			apellido: "$_id.apellido",
			nombre: "$_id.nombre",
			region: "$_id.region",
			cuit: "$_id.cuit",
			cantFacturas: 1,
			_id: 0
		}
	}
])
