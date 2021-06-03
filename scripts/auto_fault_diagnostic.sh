#!/bin/bash

ping_count=5

res=($(ping -c $ping_count 127.0.0.1 | grep transmitted))
received_packet=${res[3]}
if [ $received_packet > 0 ]
then    
    echo ""