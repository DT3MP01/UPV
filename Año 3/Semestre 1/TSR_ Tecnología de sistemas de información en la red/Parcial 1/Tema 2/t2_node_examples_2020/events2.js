/***************************************************
// events2.js
// 3.4 NodeJS. Módulo events (ej.)
// transparencia 31 del tema 2. 
***************************************************/

const ev = require('events')
const emitter = new ev.EventEmitter() 	// DON’T FORGET NEW OPERATOR !!!!!

// const emitter = new (require('events')).EventEmitter()

const e1 = "print", e2 = "read" // Names of the events.
let num1 = 0, num2 = 0			// Auxiliary variables.

// Listener functions are registered in the event emitter.
emitter.on(e1, function () {
    console.log("Event " + e1 + " has happened " + ++num1 + " times.")
})

emitter.on(e2, function () {
    console.log("Event " + e2 + " has happened " + ++num2 + " times.")
})

// There might be more than one listener for the same event.
emitter.on(e1, function () {
    console.log("Something has been printed!!")
})

// Generate the events periodically...
setInterval(function () { // First event generated every 2s
    emitter.emit(e1)
}, 2000)

setInterval(function () { // Second event generated every 3s
    emitter.emit(e2)
}, 3000) 