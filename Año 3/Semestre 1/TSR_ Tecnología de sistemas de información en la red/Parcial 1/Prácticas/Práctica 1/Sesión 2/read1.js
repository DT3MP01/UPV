const fs = require('fs');

fs.readFile('read1.js', 'utf8', function (err, data) {
    if (err) {
        return console.log(err);
    }
    console.log(data);
});