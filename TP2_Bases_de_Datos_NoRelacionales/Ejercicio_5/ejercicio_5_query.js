// 5. Basados en la consulta del punto 4 informar sólo los clientes con número
// de CUIT mayor a 27000000000.


db.facturas.aggregate([
  {
    $match: {
      "cliente.cuit": { $gt: 2.7e+09 }
    }
  },
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
