var res = ''

let fun = (x) => {
	for (var i = 1; i <= x; i++) {
		setTimeout(() => {
			res += i
			// console.log(parseInt(res))
		}, 1000)
	}
}

fun(3)

setTimeout(() => {
	console.log("resultado: " + res / 2)
}, 1200)