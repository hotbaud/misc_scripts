#!/bin/bash

# Get the IP address from which the internet sees requests from this machine emanating.

curl -s http://checkip.dyndns.org | awk '{print $6}' | awk ' BEGIN { FS = "<" } { print $1 } '
