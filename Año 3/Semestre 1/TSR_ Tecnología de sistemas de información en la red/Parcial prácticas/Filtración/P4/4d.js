function upto(n) {
    let c = 0;
    
    return () => {
        console.log(++c)
        
        if (c == n) {
            process.exit(0)
        }
    }
}

setInterval(upto(5), 2000)