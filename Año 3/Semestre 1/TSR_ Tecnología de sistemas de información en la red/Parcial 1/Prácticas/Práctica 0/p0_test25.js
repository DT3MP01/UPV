function computeResults(x) {
    let y = formatResults()
    console.log(gl1 + " " + y)
    function formatResults() {
        return String(x)
    }
}

var gl1 = "GlobaContext1"
computeResults(10)