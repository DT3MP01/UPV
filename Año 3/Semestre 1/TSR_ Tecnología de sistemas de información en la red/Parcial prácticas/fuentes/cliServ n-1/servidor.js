const zmq = require('zeromq')

let s = zmq.socket('rep')

s.bind('tcp://*:9998')

s.on('message', (n) => {
  console.log('Serv1, ' + n)
  switch (n.toString()) {
    case 'uno':
      s.send('one');
      break
    case 'dos':
      s.send('two');
      break
    default:
      s.send('mmm... no sé')
  }
})
