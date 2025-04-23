// 27. Listar los caminos de relaciones de un camino determinado.

match (a:Persona {nombre: "Gustavo"}), (b:Persona {nombre: "Mario"})
match path = (a)-[:CONOCE_A*1..9]->(b)
with path
unwind relationships(path) as rel
return path, 
       type(rel) as TipoRelacion,
       startNode(rel).nombre + " " + startNode(rel).apellido as Desde,
       endNode(rel).nombre + " " + endNode(rel).apellido as Hacia,
       rel.motivo as Motivo,
       rel.fechad as Fecha
