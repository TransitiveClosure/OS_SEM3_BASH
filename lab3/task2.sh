#!/bin/bash

at now + 2 minutes -f ./task1.sh 2>/dev/null

tail -f ~/report &