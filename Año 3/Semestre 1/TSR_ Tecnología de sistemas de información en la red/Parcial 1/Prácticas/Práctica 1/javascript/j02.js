
// Clausuras de variables y funciones.

function f(y) {
	var x = 100;
	function g() {
		x++;
		console.log("incremento de x:  " + x);
		return x;
	}
	return function () {
		y++;
		console.log("y: " + y);
		console.log("y+g(): ", y + g());
		return y;
	}
}

z = f(-100); // inicializa f(), con x = 100
z() // ejecuta ambas funciones internas
z() // ejecuta ambas funciones internas
z() // ejecuta ambas funciones internas