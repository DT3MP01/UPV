function upto(n) {
    for (let c = 1; c <= n; c++) {
        console.log(c)
    }

    process.exit(0)
}

setInterval(upto(5), 2000)
