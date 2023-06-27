/***************************************************
// useCircle.js
// 3.3 NodeJS. Gestión de módulos
// transparencia 29 del tema 2. ejemplo ampliado.
***************************************************/

const fig = require('./Circle.js')

console.log("Área círculo de radio 5: " + fig.area(5))

for (let i = 1; i < 11; i++)
    console.log("Radio " + i
        + " \tPerimeter = " + fig.circumference(i)
        + " \tArea = " + fig.area(i))         