const z = require('./z')
var s = z.rep()

z.srv(s, 8000, (m) => { 
    s.send([m, 'resp']) 
})
