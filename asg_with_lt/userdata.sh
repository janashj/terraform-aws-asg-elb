#!/bin/bash
sudo apt update
sudo apt-get install telnet apache2 -y
systemctl start apache2 