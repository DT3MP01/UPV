function doCheckPasswd(input, correctPassword, func) {
    if (input == correctPassword)
        func()
}

function func() {
    console.log("Hey, I'm here")
}

doCheckPasswd("Erroneous", "Correct", function() { console.log("access granted") })

doCheckPasswd("Correct", "Correct", function() { console.log("sending data") })