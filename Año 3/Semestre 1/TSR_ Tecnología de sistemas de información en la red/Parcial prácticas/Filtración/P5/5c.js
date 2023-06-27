v = [2, 3, 6, 7, 0]

for (let ne = 1; ne <= 2; ne++) {
    for (let e = 0; e < v.length; e++) {
        let elem = v.shift() // elimina el primer elemento de un array y lo devuelve
        v.push(elem) // Pone elem al final y devuelve longitud de array
        console.log(ne * (e + 1), elem, ne)
    }
}