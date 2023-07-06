from receiver import ReceiverAgent
from sender import SenderAgent
import time

receiveragent = ReceiverAgent("gtirouter.dsic.upv.es", "prueba12345")
receiveragent.start()
time.sleep(2) # wait for receiver agent to be prepared
senderagent = SenderAgent("gtirouter.dsic.upv.es", "prueba12345")
senderagent.start()
while receiveragent.is_alive():
    try:
        time.sleep(1)
    except KeyboardInterrupt:
        senderagent.stop()
        receiveragent.stop()
        break