/***************************************************
// events1.js
// 2.6 JS. Eventos
// transparencia 23 del tema 2. ejemplo ampliado.
***************************************************/

function fibo(n) {
   return (n<2) ? 1 : fibo(n-2) + fibo(n-1)
}

function otroMensaje(m, u) {
   console.log(m + ": El resultado es: " + u)
}

console.log("Iniciando ejecución...")

// Espera 10 ms para escribir un mensaje (Genera evento)
setTimeout(function() { console.log("M1: Quiero escribir esto...") }, 10)

// Más de 5 segs. para ejecutar fibo(40)
let j = fibo(40)

// M2 se escribe antes que M1 porque el hilo "principal" no se suspende...
otroMensaje("M2", j)

// M3 ya escribe tras M1 (es otro evento a ejecutar tras 1 ms)
// el mensaje M4 se escribe tras M1 y M3
setTimeout(function() { console.log("M4: Quiero escribir esto otro...") }, 10)
setTimeout(function() { otroMensaje("M3", j) }, 1)

console.log("Terminando ejecución...")