const fs = require('fs')
let ficheros = process.argv.slice(2) // pasamos lista de ficheros como argumento en linea comandos
let talla = [], quedan = ficheros.length
for (i in ficheros) talla.push(0) // tantos ceros como ficheros

function resumen(talla) {
	console.log(talla)
	let total = 0
	for (i in ficheros) {
		console.log(`Fichero: ${ficheros[i]} talla: ${talla[i]}`)
		total += talla[i]
	}
	console.log(`Talla total: ${total}`)
}

ficheros.forEach((valor,indice)=>{
    //callback
    fs.readFile(ficheros,(err, data) =>{
        if (err) {
            talla[indice]=0
        }
        talla[indice] = data.length
        quedan--
        if(quedan==0){
            resumen(talla)
        }
    })
}) 
// guarda el tamaño de cada fichero en la posición correspondiente del vector talla
	// debe leer los datos con readFile y devolver el atributo length
// debe invocar resumen(talla) cuando corresponda