// 18. Contar los tipos de relaciones.

// Existen dos maneras de contar los tipos de relaciones
// Opcion A

match ()-[r]->()
return type(r) as TiposRelaciones, count(*) as Total
order by Total desc;

// Opcion B

match ()-[r]->()
with type(r) as relType, count(*) as total
CALL apoc.create.vNode(['RelTypeCount'], {type: relType, total: total}) yield node
return node;
