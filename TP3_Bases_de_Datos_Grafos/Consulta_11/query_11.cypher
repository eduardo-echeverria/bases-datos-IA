// 11. Crear un nodo para Verónica Mendez.

merge (p:Persona {nombre: "Veronica", apellido: "Mendez"})
on create set p.email = "veronica.mendez@gmail.com", p.fechanac = "21/04/1980", p.pais = "Argentina"
return p;