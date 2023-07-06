from spade.agent import Agent
from spade.behaviour import OneShotBehaviour
from spade.message import Message



class SenderAgent(Agent):
    class InformBehav(OneShotBehaviour):
        async def run(self):
            print("InformBehav running")
            msg = Message(to="gtirouter.dsic.upv.es")
            msg.set_metadata("performative", "inform")
            msg.body = "Hello World"
            await self.send(msg)
            print("Message sent!")
            # stop agent from behaviour
            await self.agent.stop()
        
    async def setup(self):
        print("SenderAgent started")
        self.b = self.InformBehav()
        self.add_behaviour(self.b)