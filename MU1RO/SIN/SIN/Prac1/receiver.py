from spade.agent import Agent
from spade.behaviour import OneShotBehaviour
from spade.template import Template



class ReceiverAgent(Agent):
    class RecvBehav(OneShotBehaviour):
        async def run(self):
            print("RecvBehav running")
            msg = await self.receive(timeout=10)
            if msg:
                print(f"Message received {msg.body}")
            else:
                print("No message after 10 seconds")
            await self.agent.stop()

    
    async def setup(self):
        print("ReceiverAgent started")
        b = self.RecvBehav()
        template = Template()
        template.set_metadata("performative","inform")
        self.add_behaviour(b, template)

