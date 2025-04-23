// 3. Obtener la lista de empresas en las que trabajó Domínguez.

match (p:Persona {apellido: "Dominguez"})-[t:TRABAJO]->(e:Empresa) return p, t, e;