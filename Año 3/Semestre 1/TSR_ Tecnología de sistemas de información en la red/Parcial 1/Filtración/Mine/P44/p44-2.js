const z = require('./z')

var a = z.pull()
var b = z.push()

z.chain(a, b, 8001, 8004, (m) => { 
    b.send(m + ' uno') 
})
