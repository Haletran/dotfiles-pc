#!/bin/bash

# Get current layout
layout=$(setxkbmap -query | grep layout | awk '{print $2}')
echo "$layout"
