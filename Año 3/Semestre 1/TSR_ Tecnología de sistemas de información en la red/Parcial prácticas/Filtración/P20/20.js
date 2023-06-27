let total = 0;
let totalW = {}

setInterval(() => {
    console.log("Total peticiones: " + total)
    for (let w in totalW) {
        console.log("Total del worker " + w + " : " + totalW[w])
    }
}, 5000)