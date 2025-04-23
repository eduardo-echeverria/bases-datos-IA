// 4. Obtener la lista de personas que estudiaron carreras que no 
// son de nivel “Universitario” y los nombres de las carreras.

match (p:Persona)-[e:ESTUDIO]->(c:Carrera)
where c.nivel <> "Universitario"
return p, e, c;