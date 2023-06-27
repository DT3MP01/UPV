function computeTable(n, fn) {
    for (let c = 1; c < 11; c++) {
        fn(n * c)
    }
}

computeTable(2, function (v) { console.log(v) })

// computeTable(2, v => console.log(v))