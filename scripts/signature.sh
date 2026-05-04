#!/bin/bash
echo "==========================="
echo "Name: Elias Karlström"
echo "Timestamp:   $(date '+%Y-%m-%d %H:%M:%S')"
echo "Hostname: $(hostname)"
echo "IP:          $(hostname -I | awk '{print $1}')"
echo "==========================="
