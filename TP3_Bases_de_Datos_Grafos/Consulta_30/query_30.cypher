// 30. Ranking de los primeros 2 conocimientos de la carrera "Ing en Sistemas de Información".

match (car:Carrera {nombre: "Ing en Sistemas de Informacion"})<-[:ESTUDIO]-(p:Persona)-[:POSEE]->(c:Conocimiento)
with c, car, COUNT(*) as frecuencia
order by frecuencia desc
limit 2
return car, c, frecuencia
