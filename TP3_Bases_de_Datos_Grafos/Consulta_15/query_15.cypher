// 15. Eliminar la fecha de nacimiento y la etiqueta Persona de Analía.

match (p:Persona {nombre: "Analia", apellido: "Martinelli"})
remove p.fechanac
remove p:Persona
return p;
