setInterval((c) => {
    console.log(++c)

    if (c == 5) {
        process.exit(0)
    }
}, 2000)