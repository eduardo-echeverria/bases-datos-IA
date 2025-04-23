// 20. Obtener los nombres y rubros de las empresas registradas, reemplazando el rubro "Telefonía" por IT.

match (e:Empresa)
with e,
  case
    when e.rubro = "Telefonia" then "IT"
    else e.rubro
  end as RubroModificado
return e, RubroModificado;