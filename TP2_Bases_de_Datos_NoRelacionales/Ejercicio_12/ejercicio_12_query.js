// 12. Obtener el total gastado por persona y mostrar solo los que gastaron
// más de 3100000. Los documentos devueltos deben tener el nombre completo
// del cliente y el total gastado: {cliente:”<nombreCompleto>”,total:<num>}

db.facturas.aggregate([
  {
    $unwind: "$item"
  },
  {
    $group: {
      _id: {
        nombre: "$cliente.nombre",
        apellido: "$cliente.apellido"
      },
      totalGastado: { $sum: { $multiply: [ "$item.precio", "$item.cantidad" ] } }
    }
  },
  {
    $match: { totalGastado: { $gt: 31000 } }
  },
  {
    $project: {
      _id: 0,
      cliente: { $concat: [ "$_id.nombre", " ", "$_id.apellido" ] },
      totalGastado: 1
    }
  }
])

