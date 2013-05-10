#! /usr/bin/lua

function generador(var)
   var = var:gsub(".+", string.lower)
   n = {}

   for i in string.gmatch(var, "%w+") do
      table.insert(n, i)
   end

   nombre = n[1]
   apellido = n[2]
   inombre = nombre:match("^%w")
   iapellido = apellido:match("^%w")

   print(inombre .. apellido) --napellido
   print(apellido .. inombre) --apellidon
   print(nombre .. iapellido)  --nombrea
   print(iapellido .. nombre) --anombre
   print(nombre .. apellido) --nombreapellido
   print(apellido .. nombre) --apellidonombre
   print(nombre .. "." .. apellido) --nombre.apellido
   print(apellido .. "." .. nombre) --apellido.nombre
   print(inombre .. "." .. apellido) --n.apellido
   print(apellido .. "." .. inombre) --apellido.n
   print(nombre .. "." ..  iapellido)  --nombre.a
   print(iapellido .. "." .. nombre) --a.nombre

end

if not arg[1] then
   print("----\nPara cargar lista de nombres correr de la siguiente forma:\n   script lista.txt\n----")
   print("Escriba Nombre y Apellido separado por un espacio: ")
   nya = io.read()
   generador(nya)
else

   arch, err = io.open(arg[1])

   if err then
      print("Error cargando archivo, verifique el nombre y permisos")
      return
   end

   while true do
      linea = arch:read()

      if not linea then
         break
      else
         generador(linea)
      end
   end

end
