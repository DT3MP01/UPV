/***************************************************
// closures3.js
// 2.4.3 JS.  Clausuras
// transparencia 16 del tema 2. ejemplo ampliado.
***************************************************/

function writing(p, x) {
    console.log(p + "---Writing after " + x + " seconds")
}
 
function writingClosure(p, x) {
    return function() {
       console.log(p + "---Writing after " + x + " seconds")
    }
}

let x = 6
setTimeout(function() { writing("A [after 6 s.]: ", x) }, x * 1000)
x = 7
setTimeout(() => { writing("B [after 7 s.]: ", x) }, x * 1000)
x = 3
setTimeout(writing, x * 1000) // "C [after 3 s.]: "
x = 4
setTimeout(writingClosure("D [after 4 s.]: ", x) , x * 1000)
x = 3
console.log("root("+x+") =", Math.sqrt(x)) 