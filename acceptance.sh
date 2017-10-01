#!/bin/bash

if service dnsmasq status | grep "not running" > /dev/null; then
    echo service offline
    echo FAILED
    exit
else
    echo service online
fi

if nslookup umbc.edu; then
    echo dns responding
else
    echo dns failed
    echo FAILED
    exit
fi

ALICE=$(dig +short alice.com)
BOB=$(dig +short bob.com)

if [ "$ALICE" == "1.2.3.4" ]; then
    echo Alice.com is 1.2.3.4
else
    echo alice.com is not 1.2.3.4
    echo FAILED
    exit
fi
if [ "$BOB" == "1.2.3.4" ]; then
    echo bob.com is 1.2.3.4
else
    echo bob.com is not 1.2.3.4
    echo FAILED
    exit
fi

echo PASSED

