const z = require('./z')

var s = z.rep()

function procesa(m) { setTimeout(() => { 
    s.send([m, 'uno']) }, 4000) 
}

z.srv(s, 8000, procesa)
