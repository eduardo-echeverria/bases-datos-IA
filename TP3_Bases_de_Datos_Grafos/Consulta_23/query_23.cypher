// 23. Usar UNWIND para transformar una colección en filas individuales.

match (p:Persona)-[:ESTUDIO]->(c:Carrera)
unwind labels(c) as label
return p.nombre as PersonaNombre, p.apellido as PersonaApellido, c.nombre as CarreraNombre, label