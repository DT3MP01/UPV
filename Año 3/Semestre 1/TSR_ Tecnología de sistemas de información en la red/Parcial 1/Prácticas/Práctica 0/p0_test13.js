let person = {}
person.name = "Peter"
person.age = 25
console.log(person.district)

function princtDistrict(who) {
    console.log("District: " + who.district)
}

let person2 = {
    name: "Peter",
    age: 25,
    address: {
        city: "Valencia",
        street: "Tres Cruces",
        number: 12
    }
}

princtDistrict(person2)