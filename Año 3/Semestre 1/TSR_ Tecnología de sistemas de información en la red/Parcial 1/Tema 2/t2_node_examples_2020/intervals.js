// setInterval: repeat with the interval of 2 seconds

//setInterval(() => console.log('tick'), 2000)
let timerId = setInterval(() => console.log('tick'), 2000)

// clearInterval: after 7 seconds stop

setTimeout(() => { clearInterval(timerId); console.log('stop') }, 7000)

let delay = 5000
let x = 1

// Nested setTimeout
let timer2 = setTimeout(function request() {
    console.log('request', x++, delay)
    if (x % 3 == 0) delay += 2000    
    if (delay > 10000) clearTimeout(timer2)
    else timer2 = setTimeout(request, delay)
}, delay)