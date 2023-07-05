const fs = require('fs').promises
let ficheros = process.argv.slice(2) // pasamos lista de ficheros como argumento en linea comandos
let talla = []
for (i in ficheros) talla.push(0) // tantos ceros como ficheros

async function leerTodos(fichero) {
    return Promise.all(fichero.map(tallaFichero))
}
async function tallaFichero(f) {
    fs.readFile(ficheros).then(data => data.length)
}

function resumen(talla) {
    console.log(talla)
    let total = 0
    for (i in ficheros) {
        console.log(`Fichero: ${ficheros[i]} talla: ${talla[i]}`)
        total += talla[i]
    }
    console.log(`Talla total: ${total}`)
}

leerTodos(ficheros).then(resumen);
// guarda el tamaño de cada fichero en la posición correspondiente del vector talla
	// debe leer los datos con readFile y devolver el atributo length
// debe invocar resumen(talla) cuando corresponda