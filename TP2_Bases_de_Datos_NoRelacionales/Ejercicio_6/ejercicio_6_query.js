// 6. Basados en la consulta del punto 5 informar solamente la cantidad de
// clientes que cumplen con esta condición.

db.facturas.aggregate([
  {
    $match: {
      "cliente.cuit": { $gt: 2.7e+09 }
    }
  },
  {
    $group: {
      _id: "$cliente.cuit"  
    }
  },
  {
    $count: "totalClientes"  
  }
])
