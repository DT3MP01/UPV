const z = require('./z')
var s = z.req()

z.cli(s, [8000], ['a', 'b', 'c'], (m, id) => { 
    console.log(m + '', id + '') 
})
