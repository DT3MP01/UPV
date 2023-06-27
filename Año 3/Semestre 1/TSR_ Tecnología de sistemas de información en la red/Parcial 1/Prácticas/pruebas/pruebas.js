const st = require('./Circle.js')
console.log("Radius of the circle: ")
process.stdin.resume() // Needed for initiating the reads from stdin.
process.stdin.setEncoding("utf8") // … for reading strings instead of “Buffers”.
// Endless loop. Every time we read a radius its circumference is printed and a new radius is requested
process.stdin.on("data", function (str) {
    // The string that has been read is “str”. Remove its trailing endline.
    let rd = str.slice(0, str.length - 2)
    console.log("Circumference for radius " + rd + " is " + st.circumference(rd))
    console.log(" ")
    console.log("Radius of the circle: ")
})
// The “end” event is generated when STDIN is closed. [Ctrl]+[D] in UNIX.
process.stdin.on("end", function () { console.log("Terminating...") })
