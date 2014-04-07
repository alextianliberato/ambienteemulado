#!/bin/bash

#regras do s1 ida e volta
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.1 apply:output=1
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.2 apply:output=2
dpctl tcp:127.0.0.1:6634 flow-mod cmd=add,table=0 eth_type=0x800,ip_dst=10.0.0.2 apply:output=2
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add in_port=2 apply:output=1

#regra do s2 ida e volta
dpctl tcp:127.0.0.1:6635 flow-mod table=0,cmd=add in_port=1 apply:output=2
dpctl tcp:127.0.0.1:6635 flow-mod table=0,cmd=add in_port=2 apply:output=1

#regra do s3 ida e volta
dpctl tcp:127.0.0.1:6636 flow-mod table=0,cmd=add in_port=1 apply:output=2
dpctl tcp:127.0.0.1:6636 flow-mod table=0,cmd=add in_port=2 apply:output=1

#regras do s4 ida e volta..
dpctl tcp:127.0.0.1:6637 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.1 apply:output=2
dpctl tcp:127.0.0.1:6637 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.2 apply:output=3
dpctl tcp:127.0.0.1:6637 flow-mod table=0,cmd=add eth_type=0x800,ip_dst=10.0.0.1 apply:output=2
dpctl tcp:127.0.0.1:6637 flow-mod table=0,cmd=add eth_type=0x800,ip_dst=10.0.0.2 apply:output=3
