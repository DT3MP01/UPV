let person = {
    name: "Peter",
    age: 25,
    address: {
        city: "Valencia",
        street: "Tres Cruces",
        number: 12
    }
}

for (let i in person) {
    console.log("Property " + i + ": " + person[i])
}