const http = require('http')

exports.server = function (port, txt) {
	http.createServer((req, res) => {
		res.writeHead(200, { 
			'Content-Type': 'text/html' 
		})
		res.end(txt)
	}).listen(port)
}