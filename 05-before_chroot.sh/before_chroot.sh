#!/bin/bash

rfkill unblock all

iwconfig
ip link set wlan0 up
iwlist wlan0 scan

iwctl station wlan0 scan
iwctl station wlan0 connect WIFI-Name

systemctl start dhcpcd
systemctl enable dhcpcd

rmmod pcspkr
