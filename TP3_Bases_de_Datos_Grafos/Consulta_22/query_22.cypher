// 22. Verificar las etiquetas de la carrera en la relación ESTUDIO.

match (:Persona)-[:ESTUDIO]->(c)
return distinct labels(c) as CarreraLabels;
