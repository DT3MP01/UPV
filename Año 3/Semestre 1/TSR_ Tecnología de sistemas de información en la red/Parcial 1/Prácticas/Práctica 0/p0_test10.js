let users = ["Chloe", "Martin", "Adrian", "Danae"]
let newUsers = users
newUsers[2] = "Maria"
console.log(users[2]) // ¡También se modifica, ya que se ha copiado la referencia!
console.log(newUsers[2])

// SOLUCIÓN: Utilizar slice()

// let newUsers2 = users.slice()
// console.log(newUsers2)