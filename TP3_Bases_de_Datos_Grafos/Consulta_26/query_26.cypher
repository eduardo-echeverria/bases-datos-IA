// 26. Obtener el camino más corto entre Gustavo y Mario en la relación CONOCE_A.

MATCH (a:Persona {nombre: "Gustavo"}), (b:Persona {nombre: "Mario"})
MATCH path = shortestPath((a)-[:CONOCE_A*..9]->(b))
RETURN path