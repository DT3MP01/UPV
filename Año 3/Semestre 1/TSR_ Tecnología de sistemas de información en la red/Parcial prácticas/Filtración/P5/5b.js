v = [2, 3, 6, 7, 0]

for (let n = 0; n < 2 * v.length; n++) {
    console.log(n + 1, v[n % v.length], 1 + Math.trunc(n / v.length))
}