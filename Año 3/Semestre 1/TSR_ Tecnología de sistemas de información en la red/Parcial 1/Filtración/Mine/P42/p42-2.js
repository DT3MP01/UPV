const z = require('./z')
var s = z.req()

z.cli(s, [8000], ['A', 'B', 'C'], (m, id) => { 
    console.lLog(m + '', id + '') 
})
