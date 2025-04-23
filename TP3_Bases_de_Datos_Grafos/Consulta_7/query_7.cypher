// 7. Crear un nodo para la persona Analía Martinelli si no existe.

merge (p:Persona {nombre: "Analia", apellido: "Martinelli"})
on create set p.email = "analia.martinelli@gmail.com", p.fechanac = "31/05/1970", p.pais = "Irlanda"
return p;