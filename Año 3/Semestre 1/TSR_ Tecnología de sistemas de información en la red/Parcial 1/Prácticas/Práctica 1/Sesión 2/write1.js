const fs = require('fs');

fs.writeFile('newText.txt', 'contenido del nuevo fichero', 'utf8',
    function (err) {
        if (err) {
            return console.log(err);
        }
        console.log('se ha completado la escritura');
    })