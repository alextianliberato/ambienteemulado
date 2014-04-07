import pdb
from mininet.topo import Topo
from mininet.net import Mininet
from mininet.link import TCLink
from mininet.util import irange,dumpNodeConnections
from mininet.log import setLogLevel
from mininet.cli import CLI

from mininet.node import UserSwitch, OVSKernelSwitch

class CustomTopo(Topo):
    def __init__(self,linkopts1,linkopts2, **opts):
        Topo.__init__(self, **opts)

        self.addTree(linkopts1, linkopts2)

    def addTree( self, linkopts1, linkopts2):

        # Add hosts and switches
        HostA = self.addHost( 'h1' )
        HostB = self.addHost( 'h2' )
        s1 = self.addSwitch( 's1', listenPort=6634 )
        s2 = self.addSwitch( 's2', listenPort=6635 )
        s3 = self.addSwitch( 's3', listenPort=6636 )
        s4 = self.addSwitch( 's4', listenPort=6637 )
        

        # Add links
        self.addLink( HostA, s1, **linkopts1 )
        self.addLink( s1, s2, **linkopts2 )
        self.addLink( s1, s4, **linkopts1 )
        self.addLink( s2, s3, **linkopts2 )
        self.addLink( s3, s4, **linkopts1 )
        self.addLink( s4, HostB, **linkopts1 )


def simpleTeste():

        link1 = dict(bw=1000, delay='0ms')
        link2 = dict(bw=100, delay='0ms')
        topo = CustomTopo(link1,link2)
        net = Mininet(topo,link=TCLink,switch=UserSwitch)
        net.start()
        CLI(net)


if __name__ == '__main__':
   setLogLevel('info')
   simpleTeste()

topos = { 'custom': ( lambda: CustomTopo() ) }


