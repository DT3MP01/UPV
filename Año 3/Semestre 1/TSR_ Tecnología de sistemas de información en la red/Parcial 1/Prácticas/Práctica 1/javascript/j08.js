// Uso de operaciones asíncronas, aquí modeladas con la función setTimeout.
// Note el valor de i asociado a las ejecuciones de las temporizaciones.
// Uso de la sentencia let.

for (let i = 0; i < 10; i++)
  setTimeout(function (x) { return function () { console.log(x) } }(i), i * 1000);

// ¿Cuál es el resultado de la ejecución de la sentencia
// console.log("i= ",i); // da error, ya que la i es una variable solo de bloque (para el for) y fuera de él no existe
// ?

console.log("Terminado codigo script");