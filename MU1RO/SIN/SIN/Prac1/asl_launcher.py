import argparse

from spade import quit_spade

from spade_bdi.bdi import BDIAgent

parser = argparse.ArgumentParser(description='spade bdi launcher example')
parser.add_argument('--login', "-l", type=str, default="luialza1", help='your UPV login.')
parser.add_argument('--server',"-s", type=str, default="gtirouter.dsic.upv.es", help='XMPP server address.')
parser.add_argument('--password',"-p", type=str, default="bdipassword", help='XMPP password for the agents.')
parser.add_argument('--asl',"-a", type=str, default="default.asl", help='asl file with JASON code.')
parser.add_argument('--time',"-t", type=int, default=20, help='duration time (in seconds) of the execution.')
args = parser.parse_args()

a = BDIAgent("Agent_{}@{}".format(args.login,args.server), args.password, args.asl)

a.start()

#version web
a.web.start(hostname="127.0.0.1",port="10000")

import time
time.sleep(args.time)

a.stop().result()

quit_spade()