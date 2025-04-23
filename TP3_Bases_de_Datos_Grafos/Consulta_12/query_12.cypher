// 12. Crear una relación CONOCE_A entre Analía y Verónica, asegurando que solo se cree una vez.

merge (a:Persona {nombre: "Veronica", apellido: "Mendez"})
merge (b:Persona {nombre: "Analia", apellido: "Martinelli"})
merge (a)-[:CONOCE_A]->(b)
return a, b;