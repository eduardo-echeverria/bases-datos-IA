// 14. Agregarle la etiqueta "Empleado" y el país Argentina a Analía.

MATCH (p:Persona {nombre: "Analia", apellido: "Martinelli"}) - [t:TRABAJO] -> (e:Empresa)
SET p.pais = "Argentina", t.puesto = "Empleado"
RETURN p, t, e;
