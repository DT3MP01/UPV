const web = require('./web')
const socket = require('./socket')

web.server('Server 1', 8080)
socket.proxy(8000, 8080)

console.log('proxy')