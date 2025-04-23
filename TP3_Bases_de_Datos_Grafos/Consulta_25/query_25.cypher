// 25. Identificar si puede llegarse directa o indirectamente
// desde Mario López hasta Jorge Lupis mediante la relación CONOCE_A.

match (a:Persona {nombre: "Jorge", apellido: "Lupis"}),
      (b:Persona {nombre: "Mario", apellido: "Lopez"})
match path = (a)-[:CONOCE_A*1..9]->(b)
return path

