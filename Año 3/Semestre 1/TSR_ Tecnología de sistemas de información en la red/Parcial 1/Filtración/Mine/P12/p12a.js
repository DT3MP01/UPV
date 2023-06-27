const fs = require('fs')
const path = process.argv[2] || '.'

fs.readdir(path, function (err, files) {
    if (err) {
        return
    }

    let count = files.length
    let size = 0

    files.forEach(function (filename) {
        fs.readFile(path + "/" + filename, function (err, data) {
            // COMPLETAR
            size += data.length
            console.log('Directory size is ' + size)
            // console.log("He mirado el documento " + filename)
        })
    })

    // console.log("\n" + "Hay " + count + " documentos" + "\n")
    // console.log("Estoy en el directorio " + path  + "\n")
})