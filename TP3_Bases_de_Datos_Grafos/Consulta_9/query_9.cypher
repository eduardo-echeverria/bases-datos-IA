// 9. Verificar si se creó duplicado del conocimiento "Cálculo".

match (c:Conocimiento)
where c.nombre = "Calculo"
return c;