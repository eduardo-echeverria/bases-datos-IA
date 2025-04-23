// 2. Obtener el nombre y fecha de nacimiento de la persona de apellido Domínguez.

match (a:Persona {apellido: "Dominguez"}) return a.nombre as Nombre, a.apellido as Apellido, a.fechanac as FechaDeNacimiento