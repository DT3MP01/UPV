
// Clausuras de variables y funciones.

var gety;

function main(y) {

	var traza = "inicio";
	gety = getY;
	return f(y);

	//   - - - - - - - - - - - - - - - - - - - - - - - - - -

	function getY() { return y; }

	function f(y) {
		var x = 100 + y;

		console.log("\ttraza: ", traza);

		if (x % 2) return g0; // x % 2, si es par dará 0, y 0 en bool es false
		else return g1;

		function g0() {
			traza += "-g0";
			x++;
			console.log("g0: incremento de x:  " + x);
			return f(++y);
		}

		function g1() {
			traza += "-g1";
			y++;
			console.log("g1: incremento de y:  " + y);
			return f(y);
		}
	}
}

var z = main(-100);

for (var i = 0; i < 10; i++) z = z();

// ¿Cuál es el resultado de la ejecución de la sentencia
// console.log(gety()); // línea 9 -> gety = getY y getY devuelve y, que es el parámetro de main, en este caso, -100
// ?
