const z = require('./z')

var s = z.sub()

z.asub(s, 8000, ['a', 'A'], (m) => { 
    console.log(m + '') 
})