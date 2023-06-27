var c = 0

setInterval(() => {
    console.log(++c)
    
    if (c == 5) {
        return
    }
}, 2000)