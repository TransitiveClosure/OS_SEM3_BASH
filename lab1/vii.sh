#!/bin/bash

grep -E -o -a -s -h -r "[[:alnum:]%\-\_\.]+@[[:alnum:]\-\_\.]+\.([[:alpha:]]+)" /etc | tr "\n" ", " > emails.lst

