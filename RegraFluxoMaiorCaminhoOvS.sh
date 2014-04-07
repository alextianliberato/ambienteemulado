#!/bin/bash
for sw in s1 s2 s3 s4; do
    sudo ovs-vsctl set bridge $sw \
                    protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13
done
# ida e volda S1
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6634 "in_port=1,actions=output:2"
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6634 "in_port=2,actions=output=1"

# ida e volda S2
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6635 "in_port=1,actions=output=2"
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6635 "in_port=1,actions=output=2"

# ida e volda S3
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6636 "in_port=1,actions=output=2"
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6636 "in_port=1,actions=output=2"

# ida e volda S4
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6637 "in_port=2,actions=output=3"
ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6637 "in_port=3,actions=output=2"


