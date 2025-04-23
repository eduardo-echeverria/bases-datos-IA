// 10. Crear una relación ESTUDIO para Analía Martinelli con la carrera "Lic en Sist de Inf", estado "En curso".

merge (p:Persona {nombre: "Analia", apellido: "Martinelli"})
merge (c:Carrera {nombre:"Lic en Sist de Inf"})
merge (p)-[:ESTUDIO {estado: "En Curso"}]->(c)
return p, c;