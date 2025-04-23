// 8. Asociar un conocimiento "Cálculo" a Analía Martinelli si no lo posee.

merge (p:Persona {nombre: "Analia", apellido: "Martinelli"})
merge (c:Conocimiento {nombre: "Calculo"})
merge (p)-[:POSEE]->(c) 
return p, c;




