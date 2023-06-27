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
            if (err) {
                return
            }

            size += data.length

            if (--count <= 0) {
                console.log('Directory size is ' + size)
                // console.log("He mirado el documento " + filename)
            }
        })
    })
})