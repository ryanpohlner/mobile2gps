#!/bin/bash
# Title: mobile2gps
# Description: Use your mobile phone as the Pager's GPS.
# Author: Ryan Pohlner
# Version: 1.0
# Category: General

# Make sure the Go binary is executable
chmod +x ./mobile2gps

choice=$(NUMBER_PICKER "1=Start 2=Stop 3=Help" "1")

if [ "$choice" = 1 ]; then
  killall mobile2gps
  LOG "Starting..."
  ./mobile2gps &
  LOG "Started!"
  LOG "\n1. Connect to the Management AP on your device\n2. Open your device's browser\n3. Go to https://172.16.52.1:1993\n4. Tap Start and check Pager's GPS"
elif [ "$choice" = 2 ]; then
  LOG "Stopping..."
  killall mobile2gps
  LOG "Stopped!"
elif [ "$choice" = 3 ]; then
  LOG "1. Enable the Pager's Management AP\n2. Connect to the Management AP on your device\n3. Start mobile2gps\n4. Open your device's browser\n5. Go to https://172.16.52.1:1993\n6. Tap Start and check Pager's GPS\n\nYour device's screen must be awake to send updates. Enable Precise Location in your browser's privacy/location settings. Accuracy must be within 100m to be valid."
else
  LOG "Invalid option, exiting."
fi