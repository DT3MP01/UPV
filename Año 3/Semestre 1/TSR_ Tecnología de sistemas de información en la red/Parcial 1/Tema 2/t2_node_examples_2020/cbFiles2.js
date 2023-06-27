/***************************************************
// cbFiles2.js
// 2.5 JS. Callbacks
// transparencia 19 del tema 2. ejemplo modificado.
***************************************************/

const fs = require('fs')
let fileName = "Circle2.js" // change value to test the program

fs.access(fileName, function (err) {
  if (err) {
    console.log(fileName + " does not exists")
  } else {
    fs.stat(fileName, function (error, stats) {
      fs.open(fileName, "r", function (error, fd) {
        let buffer = Buffer.alloc(stats.size)
        fs.read(fd, buffer, 0, buffer.length, null, function (error, bytesRead, buffer) {
          let data = buffer.toString("utf8", 0, buffer.length)
          console.log(data)
          //fs.closeSync(fd)
          fs.close(fd, function (er) { if (er) console.error(er) })
        })
      })
    })
  }
})