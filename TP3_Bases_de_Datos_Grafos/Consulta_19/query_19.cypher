// 19. Listar todos los nodos y sus relaciones

match (n)-[r]->(m)
return n, r, m;