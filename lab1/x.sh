#!/bin/bash

man bash | grep -E -o "[[:alnum:]]+{4}" | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | head --lines=3
