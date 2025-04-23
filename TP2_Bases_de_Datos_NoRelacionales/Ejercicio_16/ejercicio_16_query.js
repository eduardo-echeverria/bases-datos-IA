// 16. Utilizando MapReduce, indicar la cantidad total comprada
// de cada ítem. Comparar el resultado con el ejercicio 8.

db.facturas.mapReduce(
  // Map function
  function () {
    this.item.forEach(function(i) {
      emit(i.producto.trim(), i.cantidad * i.precio);
    });
  },
  // Reduce function
  function(key, values) {
    return Array.sum(values);
  },
  {
    out: "total_purchase_per_item"
  }
)

// Devuelve mensaje de Error:

// DeprecationWarning: Collection.mapReduce() is deprecated. Use an aggregation instead.
// See https://docs.mongodb.com/manual/core/map-reduce for details.
// MongoServerError[AtlasError]: CMD_NOT_ALLOWED: mapReduce

// Entiendo que MapReduce se encuentra deprecado en las versiones recientes de MongoDB en favor del aggregate


