// 24. Contar la cantidad de personas que estudiaron una carrera en cualquier estado.

match (p:Persona)-[:ESTUDIO]->(c:Carrera)
return count(distinct p) as NumeroDePersonas;
