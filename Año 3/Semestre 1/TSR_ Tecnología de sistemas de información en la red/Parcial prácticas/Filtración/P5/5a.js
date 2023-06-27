v = [2, 3, 6, 7, 0]

for (let ne = 1; ne <= 2; ne++) {
    for (let e = 0; e < v.length; e++) {
        console.log(((ne - 1) * v.length) + (e + 1), v[e], ne)
    }
}