let arithmeticOperations = [
    function (a, b) { return a * b },
    function (a, b) { return a + b },
    function (a, b) { return a - b }
]

function doWithNFirstNumbers(n, op, op2) {
    res = 0;
    if (op2[0]) {
        for (i = 1; i <= n; i++) {
            res += i * i;
        }
    } else if (op2[1]) {
        for (i = 1; i <= n; i++) {
            res += i + i;
        }
    } else if (op2[2]) {
        for (i = 1; i <= n; i++) {
            res += i - i;
        }
    }
    console.log(res)
}

doWithNFirstNumbers(4, x => x * x, arithmeticOperations[1])

// Revisar