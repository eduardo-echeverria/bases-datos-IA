// 16. Eliminar el nodo de Analía y todas sus relaciones.

match (p)
where p.nombre = "Analia" and p.apellido = "Martinelli"
detach delete p;

// Para verificar que el nodo y sus relaciones se borraron efectivamente ejecutamos:

match (p)
where p.nombre = "Analia" and p.apellido = "Martinelli"
return p, labels(p), properties(p);

// Este ultimo comando en efecto retorna:
// (no changes, no records)
// Lo que indica que el nodo y sus relaciones fueron eliminadas exitosamente.