/***************************************************
// events3.js
// 3.4 NodeJS. Módulo events (ej.)
// transparencia 31 del tema 2. ejemplo modificado.
***************************************************/

// DON’T FORGET NEW OPERATOR !!!!!
const emitter = new (require('events')).EventEmitter()
const e = ["print", "read", "send"] // Names of the events.
let n = [0, 0, 0]			        // Counters.
let d = [2000, 3000, 5000]          // Delays.
let timer = []
let msg1 = "Something has been printed!!"
let msg2 = "Too much printed - No more ink!!!"
let info = (e, n) => { // aux function.
    console.log("Event", e, "has happened", n, "times.")
}

// Listener functions are registered in the event emitter.
for (let i = 0; i < e.length; i++)
    emitter.on(e[i], () => { ++n[i]; info(e[i], n[i]) })

// There might be more than one listener for the same event.
emitter.on(e[0], () => {
    if (n[0] < 10) console.log(msg1)
    else { clearInterval(timer[0]); console.log(msg2) }
})

// Generate the events periodically...
for (let i = 0; i < e.length; i++)
    timer[i] = setInterval(() => emitter.emit(e[i]), d[i]) 