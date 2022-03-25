#!/bin/bash

# install httrack
sudo apt install httrack

# create directory for the websites
mkdir ~/websites

# download hacktricks
httrack https://book.hacktricks.xyz/ -O ~/websites

