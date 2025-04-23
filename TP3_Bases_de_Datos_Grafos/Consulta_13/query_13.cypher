// 13. Actualizar o crear el nodo de Analía Martinelli con fecha de nacimiento 30/06/1968.

match (p:Persona {nombre: "Analia", apellido: "Martinelli"})
set p.fechanac = "30/06/1968"
return p;
