#!/bin/bash

find /var/log -type f -name "*\.log*" 2>/dev/null | wc -l 
