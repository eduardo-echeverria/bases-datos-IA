// 6. Obtener los nodos de todas las personas con nombre terminado en a.

match (p:Persona) where p.nombre ends with "a" return p;