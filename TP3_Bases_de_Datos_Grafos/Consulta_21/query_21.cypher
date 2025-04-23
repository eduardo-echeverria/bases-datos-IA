// 21. Determinar qué etiquetas tienen los nodos que son destino de la relación ESTUDIO.

match ()-[:ESTUDIO]->(dest)
with distinct labels(dest) as etiquetas
unwind etiquetas as label
call apoc.create.vNode(["ResumenEtiquetas"], {label: label}) yield node
return node;

