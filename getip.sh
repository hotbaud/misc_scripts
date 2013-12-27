#!/bin/bash

# Get the IP address from which the internet sees requests from this machine emanating.  Tested
# on Mac OX 10.6.8, 10.9.1.

curl -s http://checkip.dyndns.org | awk '{print $6}' | awk ' BEGIN { FS = "<" } { print $1 } '
