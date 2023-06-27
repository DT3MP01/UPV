/***************************************************
// aridad.js
// 2.4.1 JS. Funciones (aridad)
// transparencia 13 del tema 2. ejemplo ampliado.
***************************************************/

function saluda() {
  for (let i = 0; i < arguments.length; i++) {
    console.log("Hola, " + arguments[i])
  }
}

saluda("Ana", "Juan", "Isabel")
console.log("..........")

// en las siguientes líneas,
// ¿qué sucede si se cambia "saluda2" por "saluda"?
// -> Que se redefine la función y todas las líneas utilizarán el saluda() redefinido
function saluda2(x = "Ana", y = "Juan") {
  console.log("Hola, " + x)
  console.log("Hola, " + y)
}

saluda2("Isabel")
console.log("..........")
saluda2(undefined, "Jordi", "Pepe")

function saluda3(x = "Ana", y = "Juan", ...z) {
  console.log("Hola, " + x)
  console.log("Hola, " + y)
  if (z.length > 0) {
    for (let i = 0; i < z.length; i++) {
      console.log("Hola, " + z[i])

    }
  }
}

console.log("..........")
saluda3(undefined, "Jordi", "Pepe", "Paco", "Eva")