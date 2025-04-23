// 28. Verificar si una persona trabajó o trabajó en empresas que otro determinado profesional trabajo, para sugerir contactos.

match path = (p1:Persona {nombre: "Analia", apellido: "Diaz"})-[:TRABAJO]->(e:Empresa)<-[:TRABAJO]-(p2:Persona)
where p1 <> p2
return path, 
       p2.nombre + " " + p2.apellido AS ContactoSugerido,
       e.nombre as Empresa
