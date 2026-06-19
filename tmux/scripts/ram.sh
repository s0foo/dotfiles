#!/bin/bash
read -r total used <<< $(free -m | awk '/^Mem:/ { print $2, $3 }')
echo "${used}/${total} MB"
