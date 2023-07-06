from spade import agent, quit_spade

class DummyAgent(agent.Agent):
    async def setup(self):
        print(f"Hello World! I'm agent {str(self.jid)}")

dummy = DummyAgent("your_jid@your_xmpp_server","your_password")

dummy.start()
dummy.stop()

quit_spade()