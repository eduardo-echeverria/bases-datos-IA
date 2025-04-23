// 17. Obtener la información de los clientes que hayan gastado
// 100000 en una orden junto con el número de orden.

db.facturas.aggregate([
  {
    $project: {
      cliente: 1,
      nroFactura: 1,
      total: {
        $sum: {
          $map: {
            input: "$item",
            as: "i",
            in: { $multiply: ["$$i.cantidad", "$$i.precio"] }
          }
        }
      }
    }
  },
  {
    $match: {
      total: { $gt: 1000 }
    }
  },
  {
    $project: {
      _id: 0,
      nombre: "$cliente.nombre",
      apellido: "$cliente.apellido",
      nroFactura: 1,
      total: 1
    }
  }
])

