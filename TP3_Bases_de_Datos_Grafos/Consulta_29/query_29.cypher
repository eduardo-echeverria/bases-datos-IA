// 29. Obtener los conocimientos más compartidos en cada carrera.


match (c:Carrera)<-[:ESTUDIO]-(p:Persona)-[:POSEE]->(con:Conocimiento)
with c, con, count(*) as frecuencia
with c, collect({conocimiento: con, frecuencia: frecuencia}) as conocimientoData
with c, conocimientoData,
     reduce(maxFreq = 0, x in conocimientoData | case when x.frecuencia > maxFreq then x.frecuencia else maxFreq end) as maxFrecuencia
unwind conocimientoData as data
with c, data
where data.frecuencia = maxFrecuencia
return c, data.conocimiento, data.frecuencia
