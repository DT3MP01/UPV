// Uso de operaciones asíncronas, aquí modeladas con la función setTimeout.
// Note el valor de i asociado a las ejecuciones de las temporizaciones.
// Uso de la sentencia let.

let i = 0;

// Primero se hace el código fuera de las funciones, por lo que la i valdrá 10 en todas, ya que la i es global

do {
	setTimeout(function () { console.log(i) }, i * 1000);
	i++;
} while (i < 10);

console.log("Terminado codigo script  valor actual de i: ", i);
