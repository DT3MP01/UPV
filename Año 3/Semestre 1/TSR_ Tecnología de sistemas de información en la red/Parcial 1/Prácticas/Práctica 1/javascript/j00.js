
// Uso de funciones, objetos, cláusula this y función bind().

console.log("\n");

function g() { return this.valor; }

var obj01 = {
	valor: -5 * 2, // en la línea 35 de código, este valor cambiará
	fun: function () {
		var gg = g.bind(this);
		return gg;
	}
}

console.log("obj01.valor:  ", obj01.valor); // devuleve -10
console.log("obj01.fun()():  ", obj01.fun()()); // It means that the first function ($filter) returns another function and then that returned function is called immediately.

console.log("__________________________________________________________\n");

fx1 = obj01.fun();
console.log("fx1():  ", fx1()); // equivalente a obj01.fun()()

var obj02 = {
	valor: "fun no me referencia",
	fun: fx1,
	fan: g
}

console.log("obj02.valor:  ", obj02.valor);
console.log("obj02.fun():  ", obj02.fun()); // equivalente a obj01.fun()()
console.log("obj02.fan():  ", obj02.fan()); // devuelve valor de línea 25

console.log("__________________________________________________________\n");

obj01.valor = "nuevo valor";
console.log("obj01.valor:  ", obj01.valor); // línea 36
console.log("obj02.fun():  ", obj02.fun()); // equivalente a obj01.fun()()
console.log("obj02.fan():  ", obj02.fan());