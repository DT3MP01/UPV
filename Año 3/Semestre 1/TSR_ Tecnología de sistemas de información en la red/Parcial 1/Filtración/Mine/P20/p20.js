var fs = require("fs")

var x = 0
var fich = "prueba"

for (var i = 1; i <= 3; i++) {
	fs.readFile(fich + i, 'utf-8', function (err, data) {
		console.log("Azúcar")
		fs.writeFile("nuevo_" + fich + i, data, 'utf-8', function () {
			x = i
		})
		
		console.log("Sal " + x)
	})
}

console.log("Pimienta")